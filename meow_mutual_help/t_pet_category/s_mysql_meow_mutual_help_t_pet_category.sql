create table if not exists s_mysql_meow_mutual_help_t_pet_category (
    id string comment '主键ID'
    ,pic string comment '分类图片'
    ,name string comment '分类名称'
    ,initials string comment '分类名称首字母'
    ,parent_id string comment '父级ID'
    ,top string comment 'nan'
    ,start_weight string comment '体重开始'
    ,end_weight string comment '体重结束'
    ,image string comment '品种形象图片'
    ,create_time string comment '创建时间'
    ,update_time string comment '更新时间'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/t_pet_category/full' overwrite into table s_mysql_meow_mutual_help_t_pet_category partition(ds = '$(date)s'); 