create table if not exists s_mysql_meow_mutual_help_t_user_login_record (
    id string comment '主键id'
    ,uid string comment '用户id'
    ,date string comment '日期'
    ,lon string comment '登录位置经度'
    ,lat string comment '登录位置维度'
    ,create_time string comment '创建/登录时间'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/t_user_login_record/full' overwrite into table s_mysql_meow_mutual_help_t_user_login_record partition(ds = '$(date)s'); 