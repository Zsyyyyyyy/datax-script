create table if not exists s_mysql_launch_platform_data_uc_data (
    id string comment 'nan'
    ,user_id string comment 'User ID'
    ,user_name string comment '账户名称'
    ,budget string comment '账户每日预算，单位：元'
    ,balance string comment '账户余额'
    ,pay_amount string comment '安心赔付余额，单位：元'
    ,ts string comment 'nan'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/launch_platform_data/uc_data/full' overwrite into table s_mysql_launch_platform_data_uc_data partition(ds = '$(date)s'); 