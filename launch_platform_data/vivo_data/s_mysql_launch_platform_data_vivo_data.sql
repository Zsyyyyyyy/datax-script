create table if not exists s_mysql_launch_platform_data_vivo_data (
    id string comment 'nan'
    ,date string comment '记录产生时间-毫秒级时间戳'
    ,datetime string comment '记录产生时间'
    ,account_type string comment '对应请求参数type，账号类型'
    ,balance string comment '余额-在发生收入/支出后的余额单位为毫分（千分之一分），1元=100000毫分;'
    ,expenses string comment '支出金额单位为毫分（千分之一分），1元=100000毫分;'
    ,income string comment '收入金额单位为毫分（千分之一分），1元=100000毫分;'
    ,ts string comment 'nan'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/launch_platform_data/vivo_data/full' overwrite into table s_mysql_launch_platform_data_vivo_data partition(ds = '$(date)s'); 