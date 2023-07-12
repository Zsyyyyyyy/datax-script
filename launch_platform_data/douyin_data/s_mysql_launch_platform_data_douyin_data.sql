create table if not exists s_mysql_launch_platform_data_douyin_data (
    id string comment '广告主ID'
    ,date string comment '日期'
    ,balance string comment '日终结余(单位元）'
    ,cash_cost string comment '现金支出(单位元)'
    ,cost string comment '总支出(单位元)'
    ,frozen string comment '冻结(单位元)'
    ,income string comment '总存入(单位元)'
    ,reward_cost string comment '赠款支出(单位元)'
    ,shared_wallet_cost string comment '共享钱包支出（单位元）'
    ,transfer_in string comment '总转入(单位元)'
    ,transfer_out string comment '总转出(单位元)'
    ,ts string comment 'nan'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/launch_platform_data/douyin_data/full' overwrite into table s_mysql_launch_platform_data_douyin_data partition(ds = '$(date)s'); 