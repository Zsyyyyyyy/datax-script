#!/usr/bin/python3
# _*_ encoding: utf-8 _*_

import csv
import json
import os
import urllib
import pandas as pd
import javalang
import pymongo



# 从java文件获取表结构信息并写入到csv文件中
def generate_table_column_info(java_class_path, table_name, csv_output_dir):

    f = open(str(java_class_path),"r",encoding="utf-8")
    tree = javalang.parse.parse(f.read())

    lis = tree.children[2][0]

    l = []
    columns=['column_name','column_type','comment']
    for i in range(0,len(lis.body)):
        l1 = []
        if(isinstance(lis.body[i],javalang.tree.FieldDeclaration)):
            if(str(lis.body[i].declarators[0].name) == "id"):
                l1.append("_" + str(lis.body[i].declarators[0].name))
            else:
                l1.append(str(lis.body[i].declarators[0].name))
            l1.append(str(lis.body[i].type.name))
            l1.append(str(lis.body[i].documentation).replace("*","").replace("/","").replace(",","，").strip()[0:60])
            l.append(l1)

    df = pd.DataFrame(l,columns=columns,dtype=str)
    df.to_csv(str(csv_output_dir) + str(table_name) + ".csv",index=0,header=0)
    print("字段已写入csv文件")

# 从csv文件获取需要同步的表的字段信息
def get_table_columns(table_name, csv_output_dir):
    lis = []
    table_schema_info = str(csv_output_dir) + str(table_name) + ".csv"
    with open(table_schema_info,"r",encoding="utf-8") as f:
        csv_f = csv.reader(f)
        for line in csv_f:
            dic = {}
            dic["name"] = line[0]
            dic["type"] = "string"
            lis.append(dic)
    f.close()
    return(lis)

# 获取java类路径
def get_java_class_file_path(database_name,table_name):
    path_1 = "../meow-platform/libs/platform-share-models/src/main/java/"
    # username="emr-test01-bigdata"
    # password=urllib.parse.quote_plus("mbIkMt8hFt%N")

    # mongoClient = pymongo.MongoClient("mongodb://{}:{}@dds-uf6f9fa0422e23b42146-pub.mongodb.rds.aliyuncs.com".format(username,password),3717)

    username="dev02-dev"
    password=urllib.parse.quote_plus("uR@OoUP0OzBu")

    mongoClient = pymongo.MongoClient("mongodb://{}:{}@cn-dev02-mongo-outside.mongodb.rds.aliyuncs.com".format(username,password),3717)

    a = mongoClient.get_database(database_name).get_collection(table_name).find_one()["_class"]
    s = path_1 + str(a).replace(".","/") + ".java"
    return(s)


# 生成datax的json配置文件
def generate_datax_json(table_name, json_output_dir,database_name):
    # datax配置文件模版
    template_path="./mongodb/script/templet.json"
    with open(template_path, "r",encoding="utf-8") as f:
      
        row_data = json.load(f)
        column_reader = row_data.get("job").get("content")[0].get("reader").get("parameter").get("column")
        # 增加reader的字段信息
        reader_columns = get_table_columns(table_name,json_output_dir)
        column_reader.extend(reader_columns)
        column_writer = row_data.get("job").get("content")[0].get("writer").get("parameter").get("column")
        # 增加writer的字段信息
        writer_columns = []
        writer_columns = get_table_columns(table_name,json_output_dir)
        writer_columns[0]["name"] = "id"
        column_writer.extend(writer_columns)
        row_data["job"]["content"][0]["writer"]["parameter"]["fileName"] = str(table_name)
        row_data["job"]["content"][0]["writer"]["parameter"]["path"] = "/cpp_data/mongo/" +str(database_name) + "/" + str(table_name) + "/full/"
        row_data["job"]["content"][0]["reader"]["parameter"]["collectionName"] = str(table_name)
        row_data["job"]["content"][0]["reader"]["parameter"]["dbName"] = str(database_name)

        datax_script_path = str(json_output_dir) + "s_"+ "mongo_" + database_name + "_" + table_name + ".json"
        with open(datax_script_path,"w") as f1:
            json.dump(row_data,f1,indent=4, separators=(',', ': '))
        f1.close()

    f.close()
    print("json配置文件已生成")


# 生成hive的建表语句和加载数据语句
def generate_hive_ods_create_table(table_name, sql_output_dir,database_name):
    create_table_sql_part1 = "create table if not exists s_mongo_{}_{} (".format(database_name,table_name)
    create_table_sql_part2 = ") " + "comment '' \n" +  "stored as parquet" + "\n"
    create_table_sql_part3 = "tblproperties ('parquet.compression' = 'snappy');" + "\n\n"
    load_data_sql = "load data inpath '/cpp_data/mongo/{}/{}/full' overwrite into table s_mongo_{}_{} partition(ds = '$(date)s'); ".format(database_name,table_name,database_name, table_name)
    df = pd.read_csv(str(sql_output_dir) + str(table_name) + ".csv",header=None)

    output_path = str(sql_output_dir) + "s_" + "mongo_" + database_name + "_" + table_name + ".sql"
    with open(output_path,"w") as f:
        f.write(create_table_sql_part1 + "\n")
        for i,row in df.iterrows():
            if (i == 0):
                f.write("    id string " + "comment '" + str(row[2]) + "'" + "\n")
            else:
                f.write("    ," + str(row[0]) + " string " + "comment '" + str(row[2]) + "'" + "\n")
        f.write(create_table_sql_part2)
        f.write(create_table_sql_part3)
        f.write(load_data_sql)
        
    f.close()
    print("建表语句已生成")

if __name__ == '__main__':
    database_name = "platform_core_order"
    table_name = "equity_order_info"
    output_dir="./{}/{}/".format(database_name,table_name)
    
    if (os.path.exists(output_dir) != True):
        os.makedirs(output_dir)
    print(output_dir)

    generate_table_column_info(get_java_class_file_path(database_name,table_name), table_name,output_dir)
    generate_datax_json(table_name,output_dir,database_name)
    generate_hive_ods_create_table(table_name,output_dir,database_name)
