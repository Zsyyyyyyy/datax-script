create table if not exists s_mongo_platform_feed_management_feed_statistics (
    id string comment 'None'
    ,feedId string comment 'None'
    ,collectCount string comment 'None'
    ,likeCount string comment 'None'
    ,fakeLikeCount string comment 'None'
    ,viewCount string comment 'None'
    ,fakeViewCount string comment 'None'
    ,commentCount string comment 'None'
    ,replyCount string comment 'None'
    ,createTime string comment 'None'
    ,updateTime string comment 'None'
    ,oldId string comment 'None'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_feed_management/feed_statistics/full' overwrite into table s_mongo_platform_feed_management_feed_statistics partition(ds = '$(date)s'); 