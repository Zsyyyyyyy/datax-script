create table if not exists s_mongo_platform_community_activity_management_activities (
    id string comment '活动id'
    ,activityName string comment '活动名称'
    ,coverUrl string comment '活动封面图'
    ,description string comment '活动描述'
    ,tags string comment '活动标签集合'
    ,activityLocation string comment '活动地址'
    ,startTime string comment '活动开始时间'
    ,endTime string comment '活动结束时间'
    ,quantityLimit string comment '活动人数限制'
    ,quantity string comment '活动参与人数'
    ,badge string comment 'json数组记录'
    ,groupId string comment '冗余的群聊Id'
    ,activityStatus string comment '活动状态 UP_SHELF:上架 UN_SHELF:下架 FINISHED:结束 {@link
    com.meow'
    ,auditStatus string comment '审核状态 PENDING:待审核 REJECTED:审核驳回 SUCCESS:审核通过 {@link
    com.m'
    ,signUpUsers string comment '报名人列表'
    ,sn string comment '排序权重'
    ,activityOwner string comment '创建人信息'
    ,delFlag string comment '逻辑删除标识'
    ,createTime string comment '创建时间'
    ,updateTime string comment '修改时间'
    ,activityObjectStorages string comment '活动图片'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_community_activity_management/activities/full' overwrite into table s_mongo_platform_community_activity_management_activities partition(ds = '$(date)s'); 