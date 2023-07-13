create table if not exists s_mysql_launch_platform_data_baidu_data (
    id string comment 'nan'
    ,balance string comment '余额'
    ,cash string comment '现金余额'
    ,bonus_pure string comment '优惠余额'
    ,compen string comment '补偿余额'
    ,coupon string comment 'nan'
    ,bonus string comment 'nan'
    ,invest string comment 'nan'
    ,orderrow string comment '订单行号，该字段仅KA客户返回'
    ,ts string comment 'nan'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/launch_platform_data/baidu_data/full' overwrite into table s_mysql_launch_platform_data_baidu_data partition(ds = '$(date)s'); 