create table if not exists s_mongo_platform_tag_order_tag_info (
    id string comment 'None'
    ,tag_name string comment 'None'
    ,tag_icon string comment 'None'
    ,sort string comment 'None'
    ,tag_category_id string comment 'None'
    ,tag_category_name string comment 'None'
    ,release_status string comment 'None'
    ,is_operation string comment 'None'
    ,creator string comment 'None'
    ,del_flag string comment 'None'
    ,create_time string comment 'None'
    ,update_time string comment 'None'
) comment '用户标签表' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_tag_order/tag_info/full' overwrite into table s_mongo_platform_tag_order_tag_info partition(ds = '$(date)s'); 