create table if not exists s_mysql_launch_platform_data_oppo_data (
    id string comment '财务ID'
    ,cash_bal string comment '现金余额(分)'
    ,cash_lock_bal string comment '现金账户锁定余额(分)'
    ,cash_cost string comment '现金账户消耗(分)'
    ,rebate_bal string comment '返回账户余额(分)'
    ,rebate_cost string comment '返回账户消耗(分)'
    ,vir_bal string comment '虚拟账户金额(分)'
    ,vir_cost string comment '虚拟账号消耗(分)'
    ,acc_day_budget string comment '账户日预算设置，预算单位为分'
    ,budget_type string comment '账户日预算类型，0：额度不限'
    ,tomorrow_budget_type string comment 'nan'
    ,acc_day_budget_limit string comment '账户日预算最低限制(分)'
    ,total_balance string comment '总余额值: virBal[赠送余额] + rebateBal[返货余额] + cashBal[现金余额]'
    ,rule_flag string comment 'nan'
    ,ts string comment 'nan'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/launch_platform_data/oppo_data/full' overwrite into table s_mysql_launch_platform_data_oppo_data partition(ds = '$(date)s'); 