create table if not exists s_mysql_meow_mutual_help_um_score_order (
    id string comment '主键id'
    ,order_no string comment '订单编号'
    ,user_id string comment '下单用户id-外键(um_user)'
    ,origin_score string comment '订单原始积分'
    ,pay_score string comment '订单实际支付积分'
    ,pay_type string comment '支付方式:1-胖豆(积分)'
    ,status string comment '订单状态(0-已关闭;1-待发货;2-已发货;3-已完成)'
    ,receiver_name string comment '收货人姓名'
    ,receiver_phone string comment '收货人手机号码'
    ,receiver_province string comment '收货人省'
    ,receiver_province_code string comment '收货人省编码'
    ,receiver_city string comment '收货人市'
    ,receiver_city_code string comment '收货人市编码'
    ,receiver_county string comment '收货人区'
    ,receiver_county_code string comment '收货人区编码'
    ,receiver_address string comment '收货人详情地址'
    ,place_order_time_day string comment '下单支付时间 yyyy-MM-dd'
    ,place_order_time string comment '下单支付时间'
    ,close_reason string comment '关闭原因'
    ,remark string comment '订单备注'
    ,is_return string comment '是否退还积分(0-不退还 1-退还)'
    ,del_flag string comment '删除标识 1：删除 0：未删除'
    ,create_time string comment '创建时间'
    ,update_time string comment '更新时间'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/um_score_order/full' overwrite into table s_mysql_meow_mutual_help_um_score_order partition(ds = '$(date)s'); 