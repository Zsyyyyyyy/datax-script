create table if not exists s_mysql_meow_mutual_help_om_dic_pet_carer_profession (
    id string comment 'id'
    ,alias_name string comment '别名'
    ,profession_name string comment '职业名称'
    ,profession_icon string comment '职业图片'
    ,profession_description string comment '职业描述'
    ,del_flag string comment '删除表示 1：删除 0：未删除'
    ,create_time string comment '创建时间'
    ,update_time string comment '修改时间'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/om_dic_pet_carer_profession/full' overwrite into table s_mysql_meow_mutual_help_om_dic_pet_carer_profession partition(ds = '$(date)s'); 