create table if not exists s_mongo_platform_feed_management_creator (
    id string comment 'ID'
    ,userId string comment '用户ID'
    ,userName string comment '用户昵称'
    ,userPhone string comment '用户手机号'
    ,userType string comment '用户类型， 参考um_user 表 user_type字段'
    ,createTime string comment '通过时间'
    ,totalRevenue string comment '累计收益'
    ,totalRedeemed string comment '已兑换余额'
    ,privilegesStatus string comment '权益状态'
    ,updateTime string comment '更新时间'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_feed_management/creator/full' overwrite into table s_mongo_platform_feed_management_creator partition(ds = '$(date)s'); 