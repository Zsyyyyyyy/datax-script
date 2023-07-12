create table if not exists s_mysql_meow_mutual_help_om_pet_carer_profession (
    id string comment 'id'
    ,pet_carer_id string comment '宠X师id'
    ,dic_profession_id string comment '外键-字典职业id'
    ,dic_profession_garde_id string comment '外键-字典职业等级id'
    ,profession_garde_type string comment '等级;ORDINARY=普通;SENIOR=高级;SUPER=特级'
    ,auth_status string comment '审核状态;PENDING_AUTH=待审核;AUTH_FAILED=审核未通过;AUTH_PASSED=审核通过'
    ,auth_pass_time string comment '审核通过时间'
    ,effective_status string comment '影响状态'
    ,del_flag string comment '删除表示 1：删除 0：未删除'
    ,create_time string comment '创建时间'
    ,update_time string comment '修改时间'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/om_pet_carer_profession/full' overwrite into table s_mysql_meow_mutual_help_om_pet_carer_profession partition(ds = '$(date)s'); 