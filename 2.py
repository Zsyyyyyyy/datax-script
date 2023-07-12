import pymongo
import urllib
import datetime
import time


def get_java_class_file_path(database_name,table_name):
    # username="bigdata_datax"
    # password=urllib.parse.quote_plus("2aD&3tS8Un9abyHRBh&j")
    # mongoClient = pymongo.MongoClient("mongodb://{}:{}@dds-uf63189e2d0e8e543.mongodb.rds.aliyuncs.com".format(username,password),3717)

    username="bigdata_datax"
    password=urllib.parse.quote_plus("2aD&3tS8Un9abyHRBh&j")
    mongoClient = pymongo.MongoClient("mongodb://{}:{}@dds-uf6fb8c8c75a73d41.mongodb.rds.aliyuncs.com".format(username,password),3717)
    

    a = mongoClient.get_database(database_name).get_collection(table_name).find({'update_time':{'$lt':1654051722}})
    return(list(a)[10])


def getJsonDateTimeStamp(ori_bizdate):
    ori_year = int(str(ori_bizdate)[0:4])
    ori_month = int(str(ori_bizdate)[4:6])
    ori_day = int(str(ori_bizdate)[6:8])
    
    f_ori_bizdate = datetime.datetime(ori_year,ori_month,ori_day,0,0,0)
    # print(f_ori_bizdate)
    delta_day = datetime.timedelta(days=1)
    # delta_hour = datetime.timedelta(hours=8)

    s_ori_bizdate = (f_ori_bizdate + delta_day).strftime("%Y-%m-%d %H:%M:%S")
    date = datetime.datetime.strptime(s_ori_bizdate,"%Y-%m-%d %H:%M:%S")
    result_timestamp = time.mktime(date.timetuple())
    # print(s_ori_bizdate)
    # l = []
    # l.append(int(s_ori_bizdate[0:4]))
    # l.append(int(s_ori_bizdate[4:6]) - 1)
    # l.append(int(s_ori_bizdate[6:8]))
    # l.append(int(s_ori_bizdate[8:10]))
    # print(l)
    # return(l)
    return(result_timestamp)

if __name__ == '__main__':
    # print(get_java_class_file_path("integration_distribution_management","promote_advertising_attribution_data"))
    # print(get_java_class_file_path("platform_product_management","service_product"))
    # date = datetime.strptime("2023-02-13 00:00:00","%Y-%m-%d %H:%M:%S")
    # print(time.mktime(date.timetuple()))

    print(getJsonDateTimeStamp(20230213))                                                                    