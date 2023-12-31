create table if not exists s_mongo_platform_core_order_order_pay_info (
    id string comment '订单支付id'
    ,payOrderNo string comment '支付订单编号'
    ,orderNo string comment '订单编号'
    ,orderType string comment '订单类型，GENERAL_ORDER：普通商品订单，SERVICE_ORDER：服务商品订单'
    ,gatePaySerialNo string comment '第三方支付流水号'
    ,payType string comment '支付方式，WX：微信，ZFB：支付宝'
    ,payServiceType string comment '支付业务类型: WECHAT_JSGZH:微信公众号支付， WECHAT_JSXCX:微信小程序支付， ALIPAY_A'
    ,productName string comment '商品名称'
    ,shopId string comment '店铺id'
    ,merchantId string comment '商家id'
    ,merchantUserId string comment '商家用户id'
    ,merchantWalletId string comment '商家钱包id'
    ,chainShopWalletId string comment '连锁店铺钱包id 只有在连锁店铺下单时 才有该字段'
    ,merchantContractNo string comment '商家三方账户号'
    ,payUserId string comment '支付用户id'
    ,payUserName string comment '支付用户名称'
    ,payUserWalletId string comment '支付用户钱包id'
    ,payStatus string comment '支付状态，10：未支付，20：支付中，30：支付成功，40：支付失败'
    ,tradeAmount string comment '交易金额'
    ,splitFlag string comment '分账标识 0:未分账， 1:已分账'
    ,orderPayTime string comment '支付时间'
    ,splitTime string comment '分账时间'
    ,expireDate string comment '订单支付有效时间 （不传默认下单时间加15分钟 格式:yyyyMMddHHmmss）'
    ,validDate string comment '分账开始日期，>=该值才可分账; 格式:yyyyMMdd'
    ,isRaw string comment '是否非原生 微信公众号：是否原生态.1-原生；0-非原生，不传默认是1-原生'
    ,marketingAmount string comment 'None'
    ,totalMarketingAmount string comment 'None'
    ,marketingInfos string comment 'None'
    ,feature string comment '扩展字段'
    ,createTime string comment '创建时间'
    ,updateTime string comment '更新时间'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_core_order/order_pay_info/full' overwrite into table s_mongo_platform_core_order_order_pay_info partition(ds = '$(date)s'); 