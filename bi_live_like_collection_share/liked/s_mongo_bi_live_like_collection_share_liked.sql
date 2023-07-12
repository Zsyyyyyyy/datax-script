create table if not exists s_mongo_bi_live_like_collection_share_liked (
    id string comment 'None'
    ,sourceType string comment 'None'
    ,sourceId string comment 'None'
    ,likeType string comment 'None'
    ,likedId string comment 'None'
    ,commentLevel string comment 'None'
    ,auditFlag string comment 'None'
    ,oldInfo string comment 'None'
    ,oldId string comment 'None'
    ,createTime string comment 'None'
    ,updateTime string comment 'None'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/bi_live_like_collection_share/liked/full' overwrite into table s_mongo_bi_live_like_collection_share_liked partition(ds = '$(date)s'); 