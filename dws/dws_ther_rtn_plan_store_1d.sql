create table if not exists dws_ther_rtn_plan_store_1d(
    merchant_id bigint string comment '商家id' 
    ,store_id bigint string comment '门店id' 
    ,rtn_times bigint string comment '回访次数'
    ,rtn_user_cnt bigint string comment '回访人数'
    ,expect_rtn_user_cnt bigint string comment '计划回访人数'
    ,phone_rtn_times bigint string comment '电话回访次数'
    ,phone_rtn_user_cnt bigint string comment '电话回访人数'
    ,wechat_rtn_times bigint string comment '微信回访次数'
    ,wechat_rtn_user_cnt bigint string comment '微信回访人数'
)
partitioned by (ds string comment '日期')
comment '诊疗回访分析表';