create table if not exists dwd_ther_rtn_plan_df(
    id bigint comment 'id'
    ,status string comment '回访状态'
    ,case_id bigint comment '病例主表id'
    ,expect_return_time string comment '计划回访时间'
    ,return_time string comment '回访时间'
    ,return_receiver_id bigint comment '回访接待人id'
    ,return_type string comment '回访类型'
    ,return_plan_receiver_id bigint comment '计划回访执行人'
    ,merchant_id bigint comment '商家id'
    ,store_id bigint comment '门店id'
    ,member_id bigint comment '会员id'
    ,pet_id bigint comment '宠物id'
    ,return_method string comment '回访方式名称'
    ,return_record string comment '回访记录'
)
partitioned by (ds string comment '日期')
comment '回访表';