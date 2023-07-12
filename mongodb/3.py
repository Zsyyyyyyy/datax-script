import datetime
import json
import time
import pandas as pd
import pymysql
from kafka import KafkaProducer
import pymongo
# from pymongo import MongoClient
import urllib
from bson import json_util
import re

templet = """{"dbname": "","tblName": "","dbType": "","timestamp": "","isLast": "", "data": ""}"""



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

        

        producer.send(topic="mysql-all-{}".format(dbName), value=json.dumps(templet_json,ensure_ascii=False).encode() ,partition=0)
        # producer.send(topic="zsy_test", value=json.dumps(json_data).encode() ,partition=0)
    cur.close()

def sendMongodb2Kafka(mongoClient, dbName, tblName, producer):
    # 加载json模版
    templet_json = json.loads(templet)
    mydb = mongoClient["{}".format(dbName)]
    mycol = mydb["{}".format(tblName)]
    # 获取数据
    x = mycol.find().limit(1)
    last_row_id = next(mycol.find().sort('_id',-1))["_id"]
    # last_row_id = 'dd'
    print(last_row_id)
    # mongo数据转换为json
    for field in x:
        ori_json = json_util.dumps(field, default=json_util.default, separators=(',',':'), ensure_ascii=False,json_options=json_util.LEGACY_JSON_OPTIONS)
        print(ori_json)
    
        # 处理oid
        ids = re.findall(r'(?:\{"\$oid":("[0-9a-z]+")})', ori_json)
        # print(ids)
        json_without_ids = re.sub(r'(?:\{"\$oid":"([0-9a-z]+)"})','\t',ori_json)
        print("-------")
        print(json_without_ids)
        strs = json_without_ids.split('\t')
        json_tmp1= ''
        i = 0
        for i in range(len(strs)):
            if(i+2 < len(strs)):
                json_tmp1 = json_tmp1+strs[i] + ids[i]
        json_tmp1 = json_tmp1 + strs[len(strs)-1]

        # 处理date格式
        dates = re.findall(r'(?:\{"\$date":([0-9a-z]+)})', json_tmp1)
        tmpss = re.sub(r'(?:\{"\$date":([0-9a-z]+)})','\t',json_tmp1)
        strss = tmpss.split('\t')
        ssss= ''
        i = 0
        for i in range(len(strss)):
            if(i+2 < len(strss)):
                ssss = ssss+strss[i] + dates[i]
            ssss = ssss + strss[len(strss)-1]
        # print(ssss)
        # print("mongodb-all-{}".format(dbName))
        templet_json["dbname"] = "{}".format(dbName)
        templet_json["tblName"] = "{}".format(tblName)
        templet_json["dbType"] = "mongodb"
        templet_json["timestamp"] = round(datetime.datetime.now().timestamp() * 1000)
        templet_json["data"] = ssss        
        if(field["_id"] != last_row_id):
            templet_json["isLast"]="0"
        else:
            templet_json["isLast"]="1"
        # json_data.append(templet_json)
        # print(templet_json)
        time.sleep(0.1)
        # print(templet_json)
        producer.send(topic="mongodb-all-{}".format(dbName), value=json.dumps(templet_json,ensure_ascii=False).encode() ,partition=0)
        # producer.send(topic="mongodb-all-{}".format(dbName), value="ddd".encode() ,partition=0)

    




if __name__ == "__main__":

    s = "123a213"
    ss = s.split("4")
    print(ss)
    # mydb = mongoClient["platform_feed_management"]
    # mycol = mydb["feed"]

# ./kafka-topics.sh --delete --bootstrap-server test01:9092 --topic mysql-all-meow_mutual_help
# ./kafka-topics.sh --bootstrap-server test01:9092 --create --topic mysql-all-meow_mutual_help --replication-factor 1 --partitions 1




    
    # sh kafka-console-consumer.sh --topic mysql-all-meow_mutual_help --from-beginning --bootstrap-server test01:9993


    # sh kafka-console-consumer.sh --topic mongodb-all-platform_feed_management --from-beginning --bootstrap-server test01:9993

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