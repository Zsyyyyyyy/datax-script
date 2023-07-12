create table if not exists s_mongo_platform_community_activity_management_activity_player (
    id string comment '主键ID'
    ,userId string comment '用户ID'
    ,userName string comment '用户昵称'
    ,userAvatar string comment '用户头像'
    ,activityId string comment '参与活动ID'
    ,identityType string comment '用户身份
   
    @see com.meow.platform.enums.community_activity'
    ,delFlag string comment '删除标识'
    ,cancelReason string comment '取消原因'
    ,createTime string comment '创建时间'
    ,updateTime string comment '更新时间'
    ,orderNo string comment '订单号'
    ,isPayment string comment '是否已支付'
    ,verifyType string comment '核销类型 {@link com.meow.platform.enums.order.VerifyMode}'
    ,verifyStatus string comment '核销状态 {@link com.meow.platform.enums.order.VerifyStatus}'
    ,verifyTime string comment '核销时间'
    ,isAffirm string comment '是否已确认'
    ,realName string comment '参与人姓名'
    ,phone string comment '参与人手机号'
    ,channel string comment '报名渠道'
    ,formExtend string comment '表单扩展字段'
    ,skuId string comment 'None'
    ,ticketId string comment 'None'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_community_activity_management/activity_player/full' overwrite into table s_mongo_platform_community_activity_management_activity_player partition(ds = '$(date)s'); 