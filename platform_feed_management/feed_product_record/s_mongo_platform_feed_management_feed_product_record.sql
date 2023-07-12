create table if not exists s_mongo_platform_feed_management_feed_product_record (
    id string comment 'ID'
    ,feedId string comment '动态id'
    ,creatorId string comment '创建者id'
    ,feedProductId string comment '动态商品ID，对应的是 feed_product 表的主键id'
    ,associationStatus string comment '关联状态:关联中，解除关联 {@link FeedProductRecordAssociationStatusEnum}'
    ,createTime string comment '创建时间'
    ,updateTime string comment '更新时间'
    ,delFlag string comment '删除标识'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_feed_management/feed_product_record/full' overwrite into table s_mongo_platform_feed_management_feed_product_record partition(ds = '$(date)s'); 