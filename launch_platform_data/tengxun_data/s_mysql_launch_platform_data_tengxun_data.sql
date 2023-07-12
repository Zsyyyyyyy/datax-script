create table if not exists s_mysql_launch_platform_data_tengxun_data (
    id string comment '广告主帐号 id，有操作权限的帐号 id，不支持代理商 id'
    ,fund_type string comment '资金账户类型'
    ,time string comment '记录对应的时间（时间戳）'
    ,date string comment '记录对应的时间'
    ,deposit string comment '总存入，单位为分'
    ,paid string comment '总支出，单位为分'
    ,trans_in string comment '总转入，单位为分'
    ,trans_out string comment '总转出，单位为分'
    ,credit_modify string comment '授信调整，单位为分'
    ,balance string comment '日终结余，单位为分。如果无法获取余额则不返回本字段。'
    ,preauth_balance string comment '预授权额度，单位为分。'
    ,ts string comment '数据获取时间'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/launch_platform_data/tengxun_data/full' overwrite into table s_mysql_launch_platform_data_tengxun_data partition(ds = '$(date)s'); 