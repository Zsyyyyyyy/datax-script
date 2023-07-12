create table if not exists s_mongo_platform_pet_growth_management_pet_event_record (
    id string comment 'None'
    ,userId string comment '用户Id'
    ,petId string comment '宠物Id'
    ,type string comment '类型：提醒-REMIND、日常-DAILY、记账-BILL、病例-CASE、记事-THING'
    ,mark string comment '类目标识字段'
    ,itemId string comment 'item_info主键ID'
    ,title string comment '标题'
    ,desc string comment '描述'
    ,images string comment '图片列表'
    ,recordTime string comment '记录时间'
    ,weight string comment '宠物体重'
    ,healthyInfo string comment '健康信息'
    ,amount string comment '记账金额'
    ,finishStatus string comment '完成状态：0-未完成 1-已完成'
    ,remindStatus string comment '提醒状态：0-待提醒 1-已提醒'
    ,feedId string comment '关联的动态Id'
    ,syncId string comment 't_pet_record 主键Id'
    ,delFlag string comment '删除标识'
    ,finishTime string comment '完成时间'
    ,createTime string comment '创建时间'
    ,updateTime string comment '更新时间'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_pet_growth_management/pet_event_record/full' overwrite into table s_mongo_platform_pet_growth_management_pet_event_record partition(ds = '$(date)s'); 