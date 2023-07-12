create table if not exists s_mongo_platform_tag_order_mark_tag_record (
    id string comment 'None'
    ,tagId string comment 'None'
    ,businessType string comment '@see com.meow.platform.tag.enums.MarkTagBizTypeEnum'
    ,businessId string comment 'None'
    ,creator string comment 'None'
    ,delFlag string comment 'None'
    ,createTime string comment 'None'
    ,updateTime string comment 'None'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_tag_order/mark_tag_record/full' overwrite into table s_mongo_platform_tag_order_mark_tag_record partition(ds = '$(date)s'); 