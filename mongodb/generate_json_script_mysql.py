#!/usr/bin/python3
# _*_ encoding: utf-8 _*_

import csv
import json
import os
import urllib
import pandas as pd
import javalang
import pymongo
import pymysql

def generate_table_column_info_mysql(database_name,table_name,csv_output_dir):
    l = []
    columns=['column_name','column_type','comment']
    client = pymysql.connect(
        host="cn-test01-db.mysql.polardb.rds.aliyuncs.com"
        ,port=3306
        ,user="hhkj"
        ,passwd="bfr0crg7UVD7ckj-kbr"
        ,database=str(database_name))
    cursor = client.cursor()
    sql = "select COLUMN_NAME,COLUMN_TYPE, COLUMN_COMMENT from information_schema.COLUMNS where table_name = '{}';".format(table_name)
    cursor.execute(sql)
    for field in cursor.fetchall():
        l1 = []
        # print(field[0]+"\t"+field[1]+"\t"+field[2])
        l1.append(field[0])
        l1.append(field[1])
        l1.append(field[2])
        l.append(l1)
    cursor.close()
    client.close()
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


# 生成datax的json配置文件
def generate_datax_json(table_name, json_output_dir,database_name):
    # datax配置文件模版
    template_path="./mongodb/script/templet_mysql.json"
    with open(template_path, "r",encoding="utf-8") as f:
      
        row_data = json.load(f)
      
        # 增加reader的字段信息
        l = get_table_columns(table_name, output_dir)

        s = ",".join(str(column["name"]) for column in l)
        s1 = "select " + s + " from $table_name"
        query_sql = []
        query_sql.append(s1)
        print(s1)

        # reader_columns
        querySql = row_data.get("job").get("content")[0].get("reader").get("parameter").get("connection")[0].get("querySql")
        querySql.extend(query_sql)
        # row_data["job"]["content"][0]["reader"]["parameter"]["connection"]["querySql"]
        column_writer = row_data.get("job").get("content")[0].get("writer").get("parameter").get("column")
        # 增加writer的字段信息
        writer_columns = []
        writer_columns = get_table_columns(table_name,json_output_dir)
        # writer_columns[0]["name"] = "id"
        column_writer.extend(writer_columns)
        row_data["job"]["content"][0]["writer"]["parameter"]["fileName"] = str(table_name)
        row_data["job"]["content"][0]["writer"]["parameter"]["path"] = "/cpp_data/mysql/" +str(database_name) + "/" + str(table_name) + "/full/"
        row_data["job"]["content"][0]["reader"]["parameter"]["collectionName"] = str(table_name)
        row_data["job"]["content"][0]["reader"]["parameter"]["dbName"] = str(database_name)

        datax_script_path = str(json_output_dir) + "s_"+ "mysql_" + database_name + "_" + table_name + ".json"
        with open(datax_script_path,"w") as f1:
            json.dump(row_data,f1,indent=4, separators=(',', ': '))
        f1.close()

    f.close()
    print("json配置文件已生成")


# 生成hive的建表语句和加载数据语句
def generate_hive_ods_create_table(table_name, sql_output_dir,database_name):
    create_table_sql_part1 = "create table if not exists s_mysql_{}_{} (".format(database_name,table_name)
    create_table_sql_part2 = ") " + "comment '' \n" + "partitioned by (ds string comment 'yyyyMMdd') \n" +  "stored as parquet" + "\n"
    create_table_sql_part3 = "tblproperties ('parquet.compression' = 'snappy');" + "\n\n"
    load_data_sql = "load data inpath '/cpp_data/mysql/{}/{}/full' overwrite into table s_mysql_{}_{} partition(ds = '$(date)s'); ".format(database_name,table_name,database_name, table_name)
    df = pd.read_csv(str(sql_output_dir) + str(table_name) + ".csv",header=None)

    output_path = str(sql_output_dir) + "s_" + "mysql_" + database_name + "_" + table_name + ".sql"
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
    database_name = "meow_mutual_help"
    table_name = "um_user_certification"
    output_dir="./{}/{}/".format(database_name,table_name)
    
    if (os.path.exists(output_dir) != True):
        os.makedirs(output_dir)
    print(output_dir)

    generate_table_column_info_mysql(database_name,table_name,output_dir)
    generate_datax_json(table_name, output_dir,database_name)
    generate_hive_ods_create_table(table_name, output_dir,database_name)
