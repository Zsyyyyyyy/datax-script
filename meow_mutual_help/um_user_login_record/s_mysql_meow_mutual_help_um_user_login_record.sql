create table if not exists s_mysql_meow_mutual_help_um_user_login_record (
    id string comment 'id'
    ,user_id string comment '用户id'
    ,login_type string comment '登录类型，1 登录  2 唤醒app'
    ,login_day string comment '登录日期  yyyy-MM-dd'
    ,del_flag string comment '删除表示 1：删除 0：未删除'
    ,ip string comment 'ip地址'
    ,attribution_province string comment 'ip省份'
    ,attribution_city string comment 'ip城市'
    ,create_time string comment '创建时间'
    ,update_time string comment '修改时间'
    ,attribution_province_code string comment '省份编码'
    ,attribution_city_code string comment '城市编码'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/um_user_login_record/full' overwrite into table s_mysql_meow_mutual_help_um_user_login_record partition(ds = '$(date)s'); 