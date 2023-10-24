create table if not exists dwd_ther_reg_df(
    id bigint comment 'id'
    ,store_id bigint comment '门店id'
    ,merchant_id bigint comment '商家id'
    ,member_id bigint comment '会员id'
    ,pet_id bigint comment '宠物id'
    ,sku_id bigint comment '挂号项目'
    ,unit_id bigint comment '单位'
    ,sku_price string comment '单价'
    ,doctor_id bigint comment '接诊医生id'
    ,expect_clinic_time string comment '预计就诊日期'
    ,status string comment '状态：0-待提交，1-待就诊，2-就诊中，3-已结束，4-已取消'
    ,type string comment '挂号类型：0-初诊，1-复诊'
    ,member_name string comment '会员名称'
    ,member_phone bigint comment '会员手机号'
)
paritioned by (ds string comment '日期')
comment '挂号表';