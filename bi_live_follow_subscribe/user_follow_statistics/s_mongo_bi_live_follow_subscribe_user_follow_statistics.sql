create table if not exists s_mongo_bi_live_follow_subscribe_user_follow_statistics (
    id string comment 'None'
    ,userId string comment 'None'
    ,followNum string comment 'None'
    ,fansNum string comment 'None'
    ,robotFansNum string comment 'None'
    ,fakeFollowNum string comment 'None'
    ,totalFansNum string comment 'None'
    ,totalFollowNum string comment 'None'
    ,createTime string comment 'None'
    ,updateTime string comment 'None'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/bi_live_follow_subscribe/user_follow_statistics/full' overwrite into table s_mongo_bi_live_follow_subscribe_user_follow_statistics partition(ds = '$(date)s'); 