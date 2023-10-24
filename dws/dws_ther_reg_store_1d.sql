create table if not exists dws_ther_reg_store_1d(
    merchant_id bigint string comment '商家id' 
    ,store_id bigint string comment '门店id' 
    ,reg_user_cnt bigint comment '挂号人数'
    ,reg_cnt bigint comment '挂号次数'
    ,reg_sku_cnt bigint comment '挂号种类数'
    ,reg_amt doulbe comment '挂号金额'
    
    ,first_reg_user_cnt bigint comment '初诊挂号人数'
    ,first_reg_cnt bigint comment '初诊挂号次数'
    ,first_reg_sku_cnt bigint comment '初诊挂号种类数'
    ,first_reg_amt doulbe comment '初诊挂号金额'

    ,follow_reg_user_cnt bigint comment '复诊挂号人数'
    ,follow_reg_cnt bigint comment '复诊挂号次数'
    ,follow_reg_sku_cnt bigint comment '复诊挂号种类数'
    ,follow_reg_amt doulbe comment '复诊挂号金额'
)
partitioned by (ds string comment '日期')
comment '诊疗挂号分析表';