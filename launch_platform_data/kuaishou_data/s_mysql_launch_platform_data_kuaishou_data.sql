create table if not exists s_mysql_launch_platform_data_kuaishou_data (
    id string comment '广告主ID'
    ,date string comment 'nan'
    ,direct_rebate_real_charged string comment '激励花费(广告主激励账户中余额的消耗，单位：元)'
    ,real_recharged string comment '充值转入(	单位：元)'
    ,contract_rebate_real_charged string comment '框返花费(	年框广告主的框架返点的消耗，单位：元)'
    ,daily_transfer_out string comment '转出(单位：元)'
    ,balance string comment '日终结余(单位：元)'
    ,daily_charge string comment '总花费(单位：元)'
    ,direct_rebate_real_recharged string comment '激励转入(单位：元)'
    ,real_charged string comment '充值花费(广告主的现金消耗和返点消耗，单位：元)'
    ,daily_transfer_in string comment '转入(单位：元)'
    ,contract_rebate_real_recharged string comment '框返转入(	单位：元)'
    ,ts string comment 'nan'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/launch_platform_data/kuaishou_data/full' overwrite into table s_mysql_launch_platform_data_kuaishou_data partition(ds = '$(date)s'); 