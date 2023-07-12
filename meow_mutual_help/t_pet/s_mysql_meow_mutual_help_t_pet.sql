create table if not exists s_mysql_meow_mutual_help_t_pet (
    id string comment 'nan'
    ,uid string comment '用户oldUserId'
    ,user_id string comment '用户id'
    ,id_no string comment '宠物身份证号'
    ,nick_name string comment '宠物昵称'
    ,avatar_url string comment '宠物头像url'
    ,sex string comment '1=GG,2=MM,3=绝育GG,4=绝育MM'
    ,birth string comment '宠物生日'
    ,arrival_time string comment '宠物到家日期'
    ,death_time string comment '宠物死亡时间'
    ,sort string comment '排序'
    ,pet_file string comment '宠物文件'
    ,pet_file_type string comment '宠物文件类型  0-视频，1-照片'
    ,category_id string comment '宠物分类'
    ,category_name string comment '宠物分类名称'
    ,pet_status string comment '0=正常,1=找领养,2=被领养,3=已走失,4=找对象,5=回母星'
    ,vaccin_status string comment '疫苗状态:0=未完成,1=已完成'
    ,deworm_status string comment '驱虫状态'
    ,sterilization_status string comment '绝育状态(0-未知;1-未绝育;2-已绝育)'
    ,delete_flag string comment '0=未删除,1=已删除'
    ,create_time string comment '创建时间'
    ,update_time string comment '更新时间'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/t_pet/full' overwrite into table s_mysql_meow_mutual_help_t_pet partition(ds = '$(date)s'); 