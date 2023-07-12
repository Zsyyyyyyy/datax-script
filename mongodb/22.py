import datetime
import json
import time
import pandas as pd
import pymysql
from kafka import KafkaProducer
import pymongo
from pymongo import MongoClient
import urllib
import jmespath
import objectpath
from typing import List, Dict
from itertools import chain
from types import GeneratorType as generator
import re

from bson import json_util
  
templet = """{"dbname": "","tblName": "","dbType": "","timestamp": "","isLast": "", "data": ""}"""


def dict_generator(indict, pre=None):
    pre = pre[:] if pre else []
    if isinstance(indict, dict):
        for key, value in indict.items():
            if isinstance(value, dict):
                if len(value) == 0:
                    yield pre+[key, '{}']
                else:
                    for d in dict_generator(value, pre + [key]):
                        yield d
            elif isinstance(value, list):
                if len(value) == 0:                   
                    yield pre+[key, '[]']
                else:
                    for v in value:
                        for d in dict_generator(v, pre + [key]):
                            yield d
            elif isinstance(value, tuple):
                if len(value) == 0:
                    yield pre+[key, '()']
                else:
                    for v in value:
                        for d in dict_generator(v, pre + [key]):
                            yield d
            else:
                yield pre + [key, value]
    else:
        yield indict


def sendMysqlMessage2Kafka(client, dbName, tblName, producer):
    
    sql_columns = "show columns from {}.{}".format(dbName, tblName)
    sql = "select * from {}.{} limit 10000".format(dbName, tblName)
    cur = client.cursor()
    cur.execute(sql_columns)
    tbl_columns = []
    json_data = []
    for field in cur.fetchall():
        tbl_columns.append(field[0])
    cur.execute(sql)
    pp = cur.fetchall()
    # print(len(pp))
    i=0
    for field in pp:
        # print("iiiiii")
        # print(i)
        i=i+1
        l2=[]
        # 格式化时间字段
        for value in field:
            if isinstance(value, datetime.datetime):
                value = value.strftime('%Y-%m-%d %H:%M:%S')
            l2.append(value)
        # 将字段值和字段名结合
        data_json = dict(zip(tbl_columns,l2))
        templet_json = json.loads(templet)
        templet_json["dbname"] = "{}".format(dbName)
        templet_json["tblName"] = "{}".format(tblName)
        templet_json["dbType"] = "mysql"
        templet_json["timestamp"] = round(datetime.datetime.now().timestamp() * 1000)
        templet_json["data"] = data_json        
        if(i!=len(pp)):
            templet_json["isLast"]="0"
        else:
            templet_json["isLast"]="1"
        json_data.append(templet_json)
        # print(templet_json)
        time.sleep(0.1)

        

        producer.send(topic="mysql-all-meow_mutual_help", value=json.dumps(templet_json,ensure_ascii=False).encode() ,partition=0)
        # producer.send(topic="zsy_test", value=json.dumps(json_data).encode() ,partition=0)
    cur.close()
    # client.close()
    # print(json.dumps(json_data))

def sendMongodb2Kafka(client, dbName, tblName):
    print("mongodb")


# -> (str, List, int)
def parse_json_by_objectpath(res_json: Dict, expr: str) :
    """
    :param res_json: 字典数据
    :param expr: objectpath提取表达式, 
    :return: json提取结果
    """
    tree = objectpath.Tree(res_json)
    extract_content = tree.execute(expr)

    if isinstance(extract_content, (generator, chain)):
        return list(extract_content)
    else:
        return extract_content


def list_dictionary(d, n_tab=-1):
    if isinstance(d, list):
        j = 0
        for i in d:
            j=j+1
            list_dictionary(i, n_tab)
    elif isinstance(d, dict):
        n_tab+=1
        for key, value in d.items():
            print("{}key:{}".format("\t"*n_tab, key))
            list_dictionary(value, n_tab)
    else:
        print("{}{}".format("\t"*n_tab, d))


if __name__ == "__main__":
    producer = KafkaProducer(bootstrap_servers=['test01:9993'])


    # 获取mysql客户端
    # print(datetime.datetime.now())
    # client = pymysql.connect(host="cn-test01-db.mysql.polardb.rds.aliyuncs.com"
    #     ,port=3306
    #     ,user="hhkj"
    #     ,passwd="bfr0crg7UVD7ckj-kbr"
    #     ,charset='utf8')

    # df = pd.read_csv("mongodb/config/1.csv")
    # for index, row in df.iterrows():
    #     sendMysqlMessage2Kafka(client=client, dbName=row["dbName"], tblName=row["tblName"], producer=producer)
    #     print(datetime.datetime.now())
    # client.close()
    

    username="emr-test01-bigdata"
    password=urllib.parse.quote_plus("mbIkMt8hFt%N")

    mongoClient = pymongo.MongoClient("mongodb://{}:{}@dds-uf6f9fa0422e23b42146-pub.mongodb.rds.aliyuncs.com".format(username,password),3717)
    mydb = mongoClient["platform_feed_management"]
    mycol = mydb["feed"]


    # for x in mycol.find():
    #     print(x)
    templet_json = json.loads(templet)
    x = mycol.find_one()
    # print(x["_id"])
    # print(x)
    # json_util.dumps({"datetime_representation":1})
    # json_util.dumps({"datetime_representation":1})
# 
    
    a = json_util.dumps(x, default=json_util.default, separators=(',',':'), ensure_ascii=False,json_options=json_util.LEGACY_JSON_OPTIONS)
    # b = json_util.loads(a)


    ids = re.findall(r'(?:\{"\$oid":("[0-9a-z]+")})', a)
    tmps = re.sub(r'(?:\{"\$oid":"([0-9a-z]+)"})','\t',a)
    # print(cc)
    strs = tmps.split('\t')
    sss= ''
    for i in range(len(strs)):
        if(i+2 < len(strs)):
            sss = sss+strs[i] + ids[i]
    sss = sss + strs[len(strs)-1]
    print(sss)

    dates = re.findall(r'(?:\{"\$date":("[0-9a-z]+")})', sss)
    tmpss = re.sub(r'(?:\{"\$date":"([0-9a-z]+)"})','\t',sss)
    # print(cc)
    strss = tmpss.split('\t')
    ssss= ''
    for i in range(len(strss)):
        if(i+2 < len(strss)):
            ssss = ssss+strss[i] + dates[i]
        else:
            ssss = ssss + strss[i]
    print(ssss)
    
    # print(b['_id'])


    # list_dictionary(b)
    # print(b["_id"])
    


    # for key in b.keys():
    #     print(key,":", b[key])

    # search_name = '$.tagId'
    # res_name = parse_json_by_objectpath(b, '$.."$date"')
    # print(res_name)
    
    # for key in b.keys():
    #     print(b["{}".format(key)])

    # for i in dict_generator(b):
    #     key = '.'.join(i[0:-1])
    #     value = i[-1]
    #     if(key.find('$oid') != -1):
    #         print(key,"oid")
    #     elif(key.find('$date') != -1):
    #         print(key,'date')

            
        # print(len(i))
        # print(i)


# ./kafka-topics.sh --delete --bootstrap-server test01:9092 --topic mysql-all-meow_mutual_help
# ./kafka-topics.sh --bootstrap-server test01:9092 --create --topic mysql-all-meow_mutual_help --replication-factor 1 --partitions 1




    
    # sh kafka-console-consumer.sh --topic mysql-all-meow_mutual_help --from-beginning --bootstrap-server test01:9993


    # sh kafka-topics.sh --list --bootstrap-server test01:9092



    # mysql -uhhkj -p'bfr0crg7UVD7ckj-kbr' -h'cn-test01-db.mysql.polardb.rds.aliyuncs.com'
    # MYSQL_USER = "hhkj"
    # MYSQL_PASSWORD = "bfr0crg7UVD7ckj-kbr"
    # MYSQL_HOST = "cn-test01-db.mysql.polardb.rds.aliyuncs.com"
    # MYSQL_PORT = 3306
    # MYSQL_DB = "meow_mutual_help"

    # engine = create_engine("mysql+pymysql://%s:%s@%s:%s/%s?charset=utf8"
    #                        % (MYSQL_USER, MYSQL_PASSWORD, MYSQL_HOST, MYSQL_PORT, MYSQL_DB))
    # sql = "select * from um_user limit 1"
    # df = pd.read_sql_query(sql, con= engine)
    # pd.set_option("display.unicode.ambiguous_as_wide", True)
    # pd.set_option("display.unicode.east_asian_width", True)