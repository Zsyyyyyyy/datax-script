create table if not exists s_mysql_meow_mutual_help_om_pet_carer (
    id string comment 'id'
    ,user_id string comment '外键-用户id'
    ,user_address_id string comment '外键-地址id'
    ,pet_carer_no string comment '宠X师编号'
    ,pet_carer_nickname string comment '宠X师昵称'
    ,pet_carer_start_work_time string comment '宠X师开始工作时间'
    ,pet_carer_start_feed_time string comment '宠X师开始养宠物时间'
    ,pet_carer_rate string comment '宠X师评分'
    ,pet_carer_sale string comment '销量'
    ,pet_carer_description string comment '宠X师简介'
    ,pet_carer_telephone string comment '服务者电话'
    ,province_code string comment '省代码'
    ,city_code string comment '市代码'
    ,county_code string comment '区代码'
    ,lon string comment '经度'
    ,lat string comment '纬度'
    ,del_flag string comment '删除表示 1：删除 0：未删除'
    ,create_time string comment '创建时间'
    ,update_time string comment '修改时间'
    ,province string comment '省'
    ,city string comment '市'
    ,county string comment '区县'
    ,address string comment '地址'
    ,service_scope string comment '服务范围(km)'
    ,long_journey_money string comment '远途费金额'
    ,recommend string comment 'nan'
    ,recommend_start_time string comment 'nan'
    ,recommend_effective_distancee string comment 'nan'
    ,recommend_end_time string comment 'nan'
    ,recommend_effective_distance string comment 'nan'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/om_pet_carer/full' overwrite into table s_mysql_meow_mutual_help_om_pet_carer partition(ds = '$(date)s'); 