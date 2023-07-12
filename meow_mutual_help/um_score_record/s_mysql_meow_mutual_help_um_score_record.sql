create table if not exists s_mysql_meow_mutual_help_um_score_record (
    id string comment 'nan'
    ,task_id string comment '任务id'
    ,user_id string comment '用户id'
    ,biz_id string comment '业务id'
    ,task_title string comment '任务名'
    ,score string comment '积分值'
    ,score_status string comment '积分状态 1、待领取  2、已领取  3、积分消费  4、积分退还'
    ,deduct_type string comment '扣除类型  0、非扣除    1、订单'
    ,receive_time_day string comment '领取日 yyyy-MM-dd'
    ,receive_time string comment '领取时间'
    ,del_flag string comment '删除标识 1：删除 0：未删除'
    ,create_time string comment '创建时间'
    ,update_time string comment '修改时间'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/um_score_record/full' overwrite into table s_mysql_meow_mutual_help_um_score_record partition(ds = '$(date)s'); 