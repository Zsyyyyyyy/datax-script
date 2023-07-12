import datetime
import json
import time
import pandas as pd
import pymysql
from kafka import KafkaProducer
import pymongo
import urllib
from bson import json_util
import re

templet = """{"dbname": "","tblName": "","dbType": "","timestamp": "","isLast": "", "data": ""}"""



def sendMysqlMessage2Kafka(client, dbName, tblName, producer):
    
    sql_columns = "show columns from {}.{}".format(dbName, tblName)
    sql = "select * from {}.{}".format(dbName, tblName)
    cur = client.cursor()
    cur.execute(sql_columns)
    tbl_columns = []
    json_data = []
    for field in cur.fetchall():
        tbl_columns.append(field[0])
    cur.execute(sql)
    pp = cur.fetchall()
    i=0
    for field in pp:
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
    cur.close()

def sendMongodb2Kafka(mongoClient, dbName, tblName, producer):
    # 加载json模版
    templet_json = json.loads(templet)
    mydb = mongoClient["{}".format(dbName)]
    mycol = mydb["{}".format(tblName)]
    # 获取数据
    x = mycol.find()
    last_row_id = next(mycol.find().sort('_id',-1))["_id"]
    # last_row_id = 'dd'
    print(last_row_id)
    # mongo数据转换为json
    for field in x:
        ori_json = json_util.dumps(field, default=json_util.default, separators=(',',':'), ensure_ascii=False,json_options=json_util.LEGACY_JSON_OPTIONS)

    
        # 处理oid
        ids = re.findall(r'(?:\{"\$oid":("[0-9a-z]+")})', ori_json)
        json_without_ids = re.sub(r'(?:\{"\$oid":"([0-9a-z]+)"})','\t\t',ori_json)
        strs = json_without_ids.split('\t\t')
        json_tmp1= ''
        i = 0
        if(len(strs) == 1):
            json_tmp1 = strs[0]
        elif(len(strs) == 2):
            json_tmp1 = strs[0] + ids[0] + strs[1]
        else:
            for i in range(len(strs)):
                if(i+2 < len(strs)):
                    json_tmp1 = json_tmp1+strs[i] + ids[i]
            json_tmp1 = json_tmp1 + strs[len(strs)-1]
    

        # 处理date格式
        dates = re.findall(r'(?:\{"\$date":([0-9a-z]+)})', json_tmp1)
        tmpss = re.sub(r'(?:\{"\$date":([0-9a-z]+)})','\t\t',json_tmp1)
        strss = tmpss.split('\t\t')
        ssss= ''
        i = 0
        if(len(strss) == 1):
            ssss = strss[0]
        elif(len(strss) == 2):
            ssss = strss[0] + dates[0] + strss[0]
        else:
            for i in range(len(strss)):
                if(i+2 < len(strss)):
                    ssss = ssss+strss[i] + dates[i]
            ssss = ssss + strss[len(strss)-1]
        templet_json["dbname"] = "{}".format(dbName)
        templet_json["tblName"] = "{}".format(tblName)
        templet_json["dbType"] = "mongodb"
        templet_json["timestamp"] = round(datetime.datetime.now().timestamp() * 1000)
        
        templet_json["data"] = json.loads(ssss)      
        if(field["_id"] != last_row_id):
            templet_json["isLast"]="0"
        else:
            templet_json["isLast"]="1"
        time.sleep(0.1)
        producer.send(topic="mongodb-all-{}".format(dbName), value=json.dumps(templet_json,ensure_ascii=False).encode() ,partition=0)

    




if __name__ == "__main__":
    producer = KafkaProducer(bootstrap_servers=['test01:9993'])


    # 获取mysql客户端
    print(datetime.datetime.now())
    client = pymysql.connect(host="cn-test01-db.mysql.polardb.rds.aliyuncs.com"
        ,port=3306
        ,user="hhkj"
        ,passwd="bfr0crg7UVD7ckj-kbr"
        ,charset='utf8')
    
    # 获取mongdb的客户端
    username="emr-test01-bigdata"
    password=urllib.parse.quote_plus("mbIkMt8hFt%N")
    mongoClient = pymongo.MongoClient("mongodb://{}:{}@dds-uf6f9fa0422e23b42146-pub.mongodb.rds.aliyuncs.com".format(username,password),3717)

    

    df = pd.read_csv("mongodb/config/1.csv")
    for index, row in df.iterrows():
        # print(row["dbName"])
        if(row["dbType"] == "mysql"):
            sendMysqlMessage2Kafka(client=client, dbName=row["dbName"], tblName=row["tblName"], producer=producer)
        elif(row["dbType"] == "mongodb"):
            sendMongodb2Kafka(mongoClient=mongoClient, dbName=row["dbName"], tblName=row["tblName"], producer=producer)
        print(datetime.datetime.now())
    client.close()
    mongoClient.close()




# ./kafka-topics.sh --delete --bootstrap-server test01:9993 --topic mysql-all-meow_mutual_help
# ./kafka-topics.sh --bootstrap-server test01:9993 --create --topic mysql-all-meow_mutual_help --replication-factor 1 --partitions 1




    
    # sh kafka-console-consumer.sh --topic mysql-all-meow_mutual_help --from-beginning --bootstrap-server test01:9993


    # sh kafka-console-consumer.sh --topic mongodb-all-platform_feed_management --from-beginning --bootstrap-server test01:9993

    # sh kafka-topics.sh --list --bootstrap-server test01:9092

