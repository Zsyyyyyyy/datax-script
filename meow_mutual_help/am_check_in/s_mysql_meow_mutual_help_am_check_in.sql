create table if not exists s_mysql_meow_mutual_help_am_check_in (
    id string comment '主键id'
    ,activity_no string comment '活动编号'
    ,user_id string comment '用户id'
    ,day string comment '签到日期 yyyy-MM-dd'
    ,daily_count string comment '连续签到天数'
    ,is_award string comment '是否领取过当前签到的奖励  1领取过  0否'
    ,del_flag string comment '删除表示 1：删除 0：未删除'
    ,create_time string comment '创建时间'
    ,update_time string comment '修改时间'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/am_check_in/full' overwrite into table s_mysql_meow_mutual_help_am_check_in partition(ds = '$(date)s'); 