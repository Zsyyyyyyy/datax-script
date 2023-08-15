

wp_common_message
CREATE TABLE `ding_message_configure` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `ding_push_type` varchar(255) NOT NULL COMMENT '消息主题',
  `access_token` varchar(255) NOT NULL COMMENT '消息主题',
  `sign_key` varchar(255) NOT NULL COMMENT '消息主题',
  `biz_type` varchar(255) NOT NULL COMMENT '消息主题',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_ding_push_type` (`ding_push_type`) USING BTREE,
  KEY `idx_biz_type` (`biz_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='钉钉消息配置表'



wp_common_message
CREATE TABLE `message_info` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `title` varchar(255) NOT NULL COMMENT '消息主题',
  `type` int(11) NOT NULL COMMENT '消息类型（1：平台消息）',
  `level` int(11) NOT NULL COMMENT '消息级别（1：低  2：中   3：高   4：紧急）',
  `status` int(11) NOT NULL COMMENT '消息状态（1：暂存  2：已启用  3：已停用  4：已作废）',
  `receive_object` int(11) NOT NULL COMMENT '接收对象（1：全平台  2：商户   3：用户）',
  `publish_channel` varchar(11) NOT NULL COMMENT '发布渠道（1：web   2：App）多个逗号隔开',
  `publish_frequency` int(11) NOT NULL COMMENT '发布频率（1：及时  2：固定）',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `remind_type` int(11) NOT NULL COMMENT '提醒方式（0：不提醒  1：提醒一次   2：重复提醒）',
  `content` longtext COMMENT '消息内容',
  `cover_photo` bigint(20) DEFAULT NULL COMMENT '封面图片id',
  `message_code` varchar(255) DEFAULT '' COMMENT '消息编码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_message_code` (`message_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息主表'



wp_common_message
CREATE TABLE `message_receive_account` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `message_id` bigint(20) NOT NULL COMMENT '消息信息id',
  `account_id` bigint(20) NOT NULL COMMENT '账号id',
  `source_type` int(11) NOT NULL COMMENT '来源类型 1内部用户 2会员',
  `source_id` bigint(20) NOT NULL COMMENT '来源id（内部用户userid，会员memberId）',
  `is_read` tinyint(1) NOT NULL COMMENT '是否已读',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `is_remind` tinyint(1) DEFAULT NULL COMMENT '是否已提醒（不提醒--用户登录时无任何提醒\r\n\r\n      提醒一次--用户登录时仅提醒一次，后续登录不再提醒\r\n\r\n      重复提醒--无论用户登录多少次，均提醒，手动点击消息界面【我知道了】作为终止）',
  `remind_type` int(11) NOT NULL COMMENT '提醒方式（0：不提醒  1：提醒一次   2：重复提醒）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_msg_id_account_id` (`message_id`,`account_id`,`is_deleted`) USING BTREE,
  KEY `idx_message_id` (`message_id`) USING BTREE COMMENT '信息id索引',
  KEY `idx_account_id` (`source_type`) USING BTREE COMMENT '账号id索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息推送人员表'



wp_common_pay
CREATE TABLE `pay_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `msg_id` varchar(32) NOT NULL COMMENT '消息通讯唯一编号',
  `mer_id` varchar(32) NOT NULL COMMENT '商户编号',
  `qr_code` varchar(32) NOT NULL COMMENT '被扫付款码',
  `out_trade_no` varchar(32) NOT NULL COMMENT '商户订单号(商户交易系统中唯一)',
  `trade_date` varchar(16) NOT NULL COMMENT '交易日期，格式:YYYYMMDD',
  `trade_time` varchar(16) NOT NULL COMMENT '交易时间，格式:HHMMSS',
  `order_amt` varchar(28) NOT NULL COMMENT '订单金额（分）',
  `attach` varchar(64) DEFAULT NULL COMMENT '商户附加信息',
  `return_code` varchar(16) DEFAULT NULL COMMENT '返回码，交易成功返回0',
  `return_msg` varchar(256) DEFAULT NULL COMMENT '返回码说明',
  `pay_status` int(11) DEFAULT NULL COMMENT '交易结果标志,-1:下单失败，0：支付中，1：支付成功，2：支付失败',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_out_trade_no` (`out_trade_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1689929277663989763 DEFAULT CHARSET=utf8mb4 COMMENT='支付订单表'



wp_common_pay
CREATE TABLE `refund_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `msg_id` varchar(32) NOT NULL COMMENT '消息通讯唯一编号',
  `mer_id` varchar(32) NOT NULL COMMENT '商户编号',
  `out_trade_no` varchar(32) NOT NULL COMMENT '外部订单号',
  `reject_no` varchar(32) NOT NULL COMMENT '退款编号',
  `reject_amt` varchar(28) NOT NULL COMMENT '退款金额，单位：分',
  `return_code` varchar(16) DEFAULT NULL COMMENT '返回码，交易成功返回0',
  `return_msg` varchar(256) DEFAULT NULL COMMENT '返回码说明',
  `success` tinyint(1) DEFAULT NULL COMMENT '是否成功',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_reject_no` (`reject_no`),
  KEY `idx_out_trade_no` (`out_trade_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1682285891524087811 DEFAULT CHARSET=utf8mb4 COMMENT='退款订单表'



wp_digital_retail
CREATE TABLE `aftersale_order_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `aftersale_order_id` bigint(20) NOT NULL COMMENT '关联售后订单id',
  `aftersale_order_no` varchar(32) NOT NULL COMMENT '关联售后订单号',
  `before_status` int(11) NOT NULL COMMENT '售后单审核前状态',
  `after_status` int(11) NOT NULL COMMENT '售后单审核后的状态',
  `audit_type` tinyint(4) DEFAULT NULL COMMENT '售后订单审核类型 （1：仅退款审核  2：退货退款审核）',
  `passed` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核是否通过 （0：不通过，1：通过）',
  `audit_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=605 DEFAULT CHARSET=utf8mb4 COMMENT='售后订单审核记录表'



wp_digital_retail
CREATE TABLE `aftersale_order_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `automatic_audit_time` int(11) DEFAULT NULL COMMENT '自动审核时间',
  `automatic_cancel_time` int(255) DEFAULT NULL COMMENT '自动取消时间',
  `is_automatic_check` tinyint(1) DEFAULT NULL COMMENT '是否自动审核',
  `is_automatic_cancel` tinyint(1) DEFAULT NULL COMMENT '是否自动取消',
  `is_automatic_goods` tinyint(1) DEFAULT NULL COMMENT '是否自动收货',
  `automatic_goods_time` int(255) DEFAULT NULL COMMENT '自动收货时间',
  `is_automatic_trial` tinyint(1) DEFAULT NULL COMMENT '是否自动财审',
  `automatic_trial_time` int(11) DEFAULT NULL COMMENT '自动财审时间',
  `is_automatic_check_good` tinyint(1) DEFAULT NULL COMMENT '是否开启自动验货',
  `automatic_check_goods_time` int(255) DEFAULT NULL COMMENT '自动验货时间',
  `is_automatic_refund` tinyint(1) DEFAULT NULL COMMENT '是否自动退款',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='销售订单配置表'



wp_digital_retail
CREATE TABLE `aftersale_shop_order_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `automatic_audit_time` int(11) DEFAULT NULL COMMENT '自动审核时间',
  `is_automatic_check` tinyint(1) DEFAULT NULL COMMENT '是否自动审核',
  `is_automatic_trial` tinyint(1) DEFAULT NULL COMMENT '是否自动财审',
  `automatic_trial_time` int(11) DEFAULT NULL COMMENT '自动财审时间',
  `is_automatic_goods` tinyint(1) DEFAULT NULL COMMENT '是否自动收货',
  `automatic_goods_time` int(255) DEFAULT NULL COMMENT '自动收货时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='门店采购订单配置表'



wp_digital_retail
CREATE TABLE `api_access_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `token` varchar(255) NOT NULL COMMENT 'token值',
  `is_enable` varchar(10) DEFAULT NULL COMMENT '是否有效',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ERP 网关控制表'



wp_digital_retail
CREATE TABLE `area` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL COMMENT '父级',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '名称',
  `shortname` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '简称',
  `longitude` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '纬度',
  `level` smallint(6) NOT NULL DEFAULT '0' COMMENT '级别',
  `sort` mediumint(9) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态1有效',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `longitude` (`longitude`,`latitude`) USING BTREE,
  KEY `level` (`level`,`sort`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=659006102 DEFAULT CHARSET=utf8mb4


wp_digital_retail
CREATE TABLE `article_refund_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'appId',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `article_refund_order_no` varchar(20) NOT NULL COMMENT '唯一码换货单号',
  `order_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '换货状态：1、待提交 2、待审核 3、已完成  4、已作废',
  `sku_id_in` bigint(20) NOT NULL COMMENT '入库商品',
  `article_code_in` varchar(64) NOT NULL COMMENT '入库唯一码',
  `article_id_in` bigint(20) DEFAULT NULL COMMENT '入库物品id',
  `sku_id_out` bigint(20) NOT NULL COMMENT '出库商品',
  `article_code_out` varchar(64) NOT NULL COMMENT '出库唯一码',
  `article_id_out` bigint(20) NOT NULL COMMENT '出库物品id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE COMMENT '创建时间索引',
  KEY `idx_article_refund_order_no` (`article_refund_order_no`) USING BTREE COMMENT '唯一码换货单号索引'
) ENGINE=InnoDB AUTO_INCREMENT=1553999686515396610 DEFAULT CHARSET=utf8mb4 COMMENT='唯一码换货单'



wp_digital_retail
CREATE TABLE `automatic_order_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `automatic_audit_time` int(11) DEFAULT NULL COMMENT '自动审核时间',
  `is_automatic_check_good` tinyint(4) DEFAULT NULL COMMENT '是否开启自动收货',
  `automatic_check_goods_time` int(11) DEFAULT NULL COMMENT '自动验货时间',
  `is_automatic_check` tinyint(4) DEFAULT NULL COMMENT '是否自动审核',
  `is_automatic_finance` tinyint(4) DEFAULT NULL COMMENT '是否财务确认',
  `automatic_finance_time` int(11) DEFAULT NULL COMMENT '自动财务确认时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='门店采购售后配置表'



wp_digital_retail
CREATE TABLE `bi_dynamic_report_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `account_id` bigint(20) NOT NULL COMMENT '账号id',
  `type` int(10) NOT NULL COMMENT '报表类型 1交易  2仓储',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序值',
  `name` varchar(100) DEFAULT NULL COMMENT '模板名称',
  `detail_json` varchar(2000) DEFAULT NULL COMMENT '模板内容',
  PRIMARY KEY (`id`),
  KEY `idx_account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1637664434452140034 DEFAULT CHARSET=utf8mb4 COMMENT='报表模板表'



wp_digital_retail
CREATE TABLE `business_overview_burying_point` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `user_id` varchar(64) DEFAULT NULL COMMENT '终端用户请求id',
  `activity_id` varchar(64) DEFAULT NULL COMMENT '活动id',
  `traffic_no` int(11) NOT NULL DEFAULT '0' COMMENT '访问量',
  `visitor_no` int(11) NOT NULL DEFAULT '0' COMMENT '访客数',
  `visited_spu_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '被访问商品spuId',
  `exposure_spu_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '商品曝光spuId',
  `product_views_no` int(11) NOT NULL DEFAULT '0' COMMENT '商品浏览量',
  `product_vistor_no` int(11) NOT NULL DEFAULT '0' COMMENT '商品访客数',
  `added_shopping_cart_no` int(11) NOT NULL DEFAULT '0' COMMENT '加购物车件数',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `status` int(2) DEFAULT '0' COMMENT '状态[1-成功，2-失败]',
  `tenant_id` varchar(64) DEFAULT NULL COMMENT '租户',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT '' COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `date` varchar(8) NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25693 DEFAULT CHARSET=utf8mb4 COMMENT='业务大盘埋点表'



wp_digital_retail
CREATE TABLE `category_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(20) NOT NULL COMMENT '类目id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4



wp_digital_retail
CREATE TABLE `cg_agent_apply_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agent_name` varchar(16) NOT NULL COMMENT '代理商名称',
  `agent_phone` varchar(11) NOT NULL COMMENT '代理商电话',
  `company_name` varchar(128) NOT NULL COMMENT '公司名称',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理商意向表'



wp_digital_retail
CREATE TABLE `cg_continent_info` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `continent_name` varchar(16) NOT NULL COMMENT '大洲名称',
  `icon_eng_name` varchar(128) NOT NULL COMMENT '大洲英文名',
  `description` varchar(32) DEFAULT NULL COMMENT '大洲背描述',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='大洲表'



wp_digital_retail
CREATE TABLE `cg_country_commodity_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `country_id` smallint(6) NOT NULL COMMENT '国家主键',
  `item_id` bigint(20) NOT NULL COMMENT '商品主键',
  `vr_url` varchar(255) DEFAULT NULL COMMENT 'vr地址',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='国家商品关联表'



wp_digital_retail
CREATE TABLE `cg_country_info` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `country_name` varchar(16) NOT NULL COMMENT '国家名称',
  `continent_id` tinyint(4) NOT NULL COMMENT '大洲主键',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='国家表'



wp_digital_retail
CREATE TABLE `channel_good_auto_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `shop_id` bigint(20) NOT NULL COMMENT '店铺主键id标识',
  `goods_sku` bigint(20) NOT NULL COMMENT '商品SKU',
  `goods_id` bigint(20) NOT NULL COMMENT '商品itemId标识',
  `shop_sku` varchar(255) NOT NULL COMMENT '商品SKU店铺主键联合标识',
  `is_stock_sync` tinyint(1) NOT NULL DEFAULT '0' COMMENT '库存同步标识，1为开启同步、0为不开启同步，默认为0',
  `sync_percent` int(11) DEFAULT NULL COMMENT '库存同步比例，不允许超过百分之百，默认为实际数值乘上100设计为保留两位小数',
  `is_auto_grounding` tinyint(1) NOT NULL COMMENT '自动上架标识，1为开启、0为不开启，默认为0',
  `auto_grounding_limit` int(11) DEFAULT NULL COMMENT '自动上架临界值',
  `is_auto_off_shelf` tinyint(1) NOT NULL COMMENT '自动下架标识，1为开启、0为不开启，默认为0',
  `auto_off_shelf_limit` int(11) DEFAULT NULL COMMENT '自动下架临界值',
  `channel_goods_id` bigint(20) DEFAULT NULL COMMENT '渠道商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2448 DEFAULT CHARSET=utf8mb4 COMMENT='渠道商品自动操作配置表'



wp_digital_retail
CREATE TABLE `code_generate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `rule_id` bigint(20) NOT NULL COMMENT '编码规则id',
  `date_str` varchar(20) NOT NULL COMMENT '编码生成日',
  `serial_now_count` bigint(20) NOT NULL COMMENT '目前编码的最大使用值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COMMENT='编码生成日志'



wp_digital_retail
CREATE TABLE `code_generate_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '编码名称',
  `module_type` tinyint(4) NOT NULL COMMENT '模块类型 1.商品 2.库存 3.订单 4.会员 5.商户',
  `preview` varchar(255) NOT NULL COMMENT '编码预览内容',
  `prefix` varchar(255) NOT NULL COMMENT '编码前缀',
  `suffix` varchar(255) DEFAULT NULL COMMENT '编码后缀',
  `time_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '时间粒度 1.年月日 2.年 3.月 4.年月',
  `serial_length` tinyint(4) NOT NULL DEFAULT '4' COMMENT '流水号位数',
  `in_use` tinyint(2) NOT NULL COMMENT '是否使用 1是 0否',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COMMENT='编码生成规则'



wp_digital_retail
CREATE TABLE `code_print` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) NOT NULL COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标识',
  `created_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '制单时间',
  `updated_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `updated_by` bigint(20) NOT NULL COMMENT '最后更新人',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `article_id` bigint(20) DEFAULT NULL COMMENT '物品id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `print_count` int(11) NOT NULL DEFAULT '0' COMMENT '打印次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sku_id_merchant_id` (`sku_id`,`merchant_id`) USING BTREE,
  UNIQUE KEY `uk_article_id_merchant_id` (`article_id`,`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4



wp_digital_retail
CREATE TABLE `commission_withdraw_limit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `is_day_limit` tinyint(4) DEFAULT '0' COMMENT '是否开启每日限制 0不开启 1开启',
  `day_limit_qyt` int(11) DEFAULT NULL COMMENT '单日限制次数',
  `day_limit_money` decimal(10,2) DEFAULT NULL COMMENT '单日限制金额',
  `is_once_limit` tinyint(4) DEFAULT '0' COMMENT '是否开启单次限制 0不开启 1开启',
  `once_limit_money` decimal(10,2) DEFAULT NULL COMMENT '单次限制金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='佣金提现限制'



wp_digital_retail
CREATE TABLE `commodity_price_coefficient_setting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `category_id` bigint(20) NOT NULL COMMENT '类目ID',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `price_coefficient` decimal(20,2) NOT NULL COMMENT '价格系数',
  `price_greater` decimal(20,2) DEFAULT NULL COMMENT '价格大于',
  `price_less_equal` decimal(20,2) DEFAULT NULL COMMENT '价格小于等于',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品价格系数信息表'



wp_digital_retail
CREATE TABLE `commodity_price_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `template_name` varchar(11) NOT NULL COMMENT '模板名称',
  `status` tinyint(4) NOT NULL COMMENT '使用状态，0禁用，1启用',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `template` text NOT NULL COMMENT '模板样式',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品价签表'



wp_digital_retail
CREATE TABLE `commodity_purchase_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `name` varchar(11) NOT NULL COMMENT '价目名称',
  `shop_level` varchar(11) NOT NULL COMMENT '关联门店等级',
  `status` tinyint(4) NOT NULL COMMENT '使用状态，0禁用，1启用',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品采购价目基础表'



wp_digital_retail
CREATE TABLE `commodity_purchase_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `purchase_price_id` bigint(32) NOT NULL COMMENT '价目id',
  `sku_name` varchar(256) NOT NULL COMMENT 'sku名称',
  `sku_code` varchar(32) NOT NULL COMMENT 'sku编号',
  `item_name` varchar(255) NOT NULL COMMENT '商品名称',
  `item_id` varchar(32) NOT NULL COMMENT '商品id',
  `up_id` varchar(32) DEFAULT NULL COMMENT 'upid',
  `spu_code` varchar(32) NOT NULL COMMENT 'spu编号',
  `price` decimal(20,2) NOT NULL COMMENT '门店采购单价',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品采购价目关联表'



wp_digital_retail
CREATE TABLE `commodity_settings_basics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `is_commodity_establish` tinyint(1) DEFAULT NULL COMMENT '是否允许商户创建商品',
  `is_commodity_fictitious` tinyint(1) DEFAULT NULL COMMENT '是否允许创建虚拟商品',
  `is_commodity_check` tinyint(1) DEFAULT NULL COMMENT '是否平台创建商品需要审核',
  `is_commodity_delegate` tinyint(1) DEFAULT NULL COMMENT '是否授权店铺可经营相关商品',
  `is_commodity_display` tinyint(1) DEFAULT '1' COMMENT '当店铺已上架商品库存为0时，显示该商品已售罄',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `front_category_show` tinyint(1) DEFAULT '2' COMMENT ' 前台类目节点显示设置  0：未设置  1:按2层类目管理和显示  2:按3层类目管理和显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品设置-基础设置'



wp_digital_retail
CREATE TABLE `commodity_sku_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuid',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'sku类型',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='sku表'



wp_digital_retail
CREATE TABLE `daily_shop_sku_bill_num_count` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id，自增主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `es_item_id` int(11) DEFAULT NULL COMMENT 'es上架ItemId',
  `shop_id` bigint(20) NOT NULL COMMENT '店铺id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku id',
  `count_num` int(11) NOT NULL DEFAULT '0' COMMENT '统计数量',
  `sale_order_type` int(11) NOT NULL COMMENT '类型：1销售订单，2售后订单',
  `created_date` date NOT NULL COMMENT '数据所属日期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_daily_shop_sku_bill_num_count_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='门店商品每日销售量统计表'



wp_digital_retail
CREATE TABLE `deepexi_dr_cf_get_sim_item` (
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `shop_id` bigint(20) NOT NULL COMMENT '商铺id',
  `targ_id` bigint(20) NOT NULL COMMENT '目标id',
  `sim_items` text COMMENT '相似id',
  `rec_method` varchar(100) NOT NULL COMMENT '推荐方法类型',
  `client_name` varchar(100) NOT NULL COMMENT '客户公司名',
  `upload_time` datetime NOT NULL COMMENT '出生时间戳',
  `trace_id` varchar(100) DEFAULT NULL COMMENT '追踪id',
  `category` varchar(100) DEFAULT NULL COMMENT '类别',
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '表主键id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `use_tag` (`app_id`,`tenant_id`,`shop_id`,`targ_id`,`client_name`,`rec_method`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='deepexi_dr_获取相似目标表'



wp_digital_retail
CREATE TABLE `deepexi_dr_cf_hot_list` (
  `item_id` varchar(64) NOT NULL COMMENT '目标id',
  `hot_rate` int(11) NOT NULL COMMENT '热度值',
  `rec_method` varchar(100) NOT NULL COMMENT '推荐方法类型',
  `client_name` varchar(100) NOT NULL COMMENT '客户公司名',
  `upload_time` datetime NOT NULL COMMENT '出生时间戳',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceid跟踪',
  `category` varchar(20) NOT NULL COMMENT '分类',
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `use_tag` (`item_id`,`category`,`client_name`,`rec_method`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='deepexi_dr_热度榜表'



wp_digital_retail
CREATE TABLE `deepexi_dr_cf_rec_res` (
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `rec_items` text COMMENT '推荐商品',
  `rec_method` varchar(100) NOT NULL COMMENT '推荐方法类型',
  `client_name` varchar(100) NOT NULL COMMENT '客户公司名',
  `upload_time` datetime NOT NULL COMMENT '出生时间戳',
  `trace_id` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL COMMENT '商品类型',
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `use_tag` (`user_id`,`client_name`,`rec_method`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='deepexi_dr_推荐结果表'



wp_digital_retail
CREATE TABLE `depot_foundation_setup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_allocation` tinyint(4) DEFAULT NULL COMMENT '是否允许门店申请调拨',
  `is_virtual_warehouse` tinyint(4) DEFAULT NULL COMMENT '启用虚拟仓功能',
  `is_batch` tinyint(4) DEFAULT NULL COMMENT '启用批次管理',
  `is_serial_number` tinyint(4) DEFAULT NULL COMMENT '启用序列号管理',
  `is_location_number` tinyint(4) DEFAULT NULL COMMENT '启用库位号管理',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='仓库配置基础设置'



wp_digital_retail
CREATE TABLE `depot_order_audit` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `order_id` bigint(20) NOT NULL COMMENT '关联单号ID',
  `order_no` varchar(64) NOT NULL COMMENT '关联单据单号',
  `order_type` int(11) NOT NULL COMMENT '单据类型 1：入库单 2：出库单 3：盘点单 4：调拨单',
  `audit_status` int(11) NOT NULL COMMENT '审核状态 0：未审核 1：已审核 2：审核不通过',
  `audit_name` varchar(20) DEFAULT NULL COMMENT '审核人',
  `audit_at` datetime DEFAULT NULL COMMENT '审核时间',
  `application_name` varchar(20) DEFAULT NULL COMMENT '提单人/盘点人姓名',
  `difference` tinyint(1) DEFAULT '0' COMMENT '是否差异',
  `stock_type` tinyint(4) DEFAULT '0' COMMENT '库存类型',
  `depot_id` bigint(20) DEFAULT NULL COMMENT '收货仓库ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5225 DEFAULT CHARSET=utf8mb4 COMMENT='仓库单审核表'



wp_digital_retail
CREATE TABLE `esls_shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_code` varchar(32) DEFAULT NULL COMMENT '价签门店号',
  `shop_name` varchar(64) DEFAULT NULL COMMENT '价签门店名称',
  `link_status` varchar(16) DEFAULT NULL COMMENT '连接状态 在线online',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `disable_status` varchar(16) DEFAULT NULL COMMENT '是否禁用 启用-normal  禁用-suspend',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `tenant_id` varchar(64) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `created_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `version` int(11) DEFAULT NULL COMMENT '乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='价签门店'



wp_digital_retail
CREATE TABLE `esls_tag` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `esl_id` varchar(32) DEFAULT NULL COMMENT '价签id',
  `status` int(11) DEFAULT NULL COMMENT '状态,枚举EslTagStatusEnum',
  `last_heartbeat_time` datetime DEFAULT NULL COMMENT '最后心跳时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `ap_id` varchar(32) DEFAULT NULL COMMENT '基站标识',
  `firmware_id` bigint(20) DEFAULT NULL COMMENT 'Firmware',
  `rom` bigint(20) DEFAULT NULL COMMENT 'Rom版本',
  `battery` int(11) DEFAULT NULL COMMENT '电量',
  `screen_size` varchar(16) DEFAULT NULL COMMENT '屏幕尺寸',
  `freezer` tinyint(1) DEFAULT NULL COMMENT '是否冷冻 0-否 1-是',
  `tag_barcode` varchar(32) DEFAULT NULL COMMENT '价签条码',
  `tag_shop_code` varchar(64) DEFAULT NULL COMMENT '汉硕系统门店编码标识(ex:deepexi.1001)',
  `tenant_id` varchar(64) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `created_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `shop_sku_channel` varchar(80) DEFAULT NULL COMMENT 'shopId_skuId_channelId组合字段',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `bar_code` varchar(20) DEFAULT NULL COMMENT '商品条形码-sku表',
  `sku_code` varchar(64) DEFAULT NULL COMMENT 'sku编号',
  `sku_name` varchar(256) DEFAULT NULL COMMENT 'sku名称',
  `sale_price` decimal(20,2) DEFAULT NULL COMMENT '实际销售价格(商品域上架表)',
  `sku_other_json` json DEFAULT NULL COMMENT '商品其他json信息',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_shop_sku_channel` (`shop_sku_channel`) USING BTREE,
  KEY `idx_esl_id` (`esl_id`) USING BTREE,
  KEY `idx_tag_shop_code` (`tag_shop_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='价签表'



wp_digital_retail
CREATE TABLE `express` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `name` varchar(255) NOT NULL COMMENT '快递公司名称',
  `code` varchar(255) NOT NULL COMMENT '快递公司编码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 1：启用 0：禁用，默认为0',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COMMENT='快递公司信息表'



wp_digital_retail
CREATE TABLE `express_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `express_id` bigint(20) NOT NULL COMMENT '快递公司ID',
  `area_id` bigint(20) NOT NULL COMMENT '地区ID，省级别地址',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1810 DEFAULT CHARSET=utf8mb4 COMMENT='快递公司覆盖城市表'



wp_digital_retail
CREATE TABLE `express_depot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `depot_id` bigint(20) DEFAULT NULL COMMENT '仓库ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，0：禁用，1：启用，默认0',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COMMENT='快递与仓库匹配表'



wp_digital_retail
CREATE TABLE `express_depot_express` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `express_id` bigint(20) DEFAULT NULL COMMENT '快递公司ID',
  `priority` int(11) DEFAULT NULL COMMENT '快递优先级： 越小优先级越高，默认无优先级',
  `express_depot_id` bigint(20) DEFAULT NULL COMMENT '快递与仓库匹配表主键id',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COMMENT='快递与仓库匹配快递表'



wp_digital_retail
CREATE TABLE `express_fee_standard` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `title` varchar(255) DEFAULT NULL COMMENT '运费标题',
  `express_id` bigint(20) NOT NULL COMMENT '快递公司ID',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `fee_type` int(11) NOT NULL DEFAULT '1' COMMENT '计费方式：1：按重量计算  2：按体积计算，默认值1',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：0：禁用，1：启用，默认0',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='快递运费标准表'



wp_digital_retail
CREATE TABLE `express_fee_standard_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `express_fee_standard_id` bigint(20) DEFAULT NULL COMMENT '快递运费标准ID',
  `first_count` int(11) DEFAULT NULL COMMENT '首重/体积',
  `first_fee` int(11) DEFAULT NULL COMMENT '首次费用',
  `continue_count` int(11) DEFAULT NULL COMMENT '续重/体积',
  `continue_fee` int(11) DEFAULT NULL COMMENT '续费',
  `fee_standard` int(11) NOT NULL DEFAULT '0' COMMENT '费用计算标准，0：重量、1：体积，默认0',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='快递运费标准-费用明细表'



wp_digital_retail
CREATE TABLE `express_fee_standard_details_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `express_fee_standard_details_id` bigint(20) NOT NULL COMMENT '快递费用明细ID',
  `area_id` bigint(20) DEFAULT NULL COMMENT '地区ID',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='快递运费标准-费用明细-适用城市关系表'



wp_digital_retail
CREATE TABLE `express_freight_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) NOT NULL COMMENT '模板名称',
  `template_type` int(11) NOT NULL COMMENT '模板类型: 1：自定义  2：预置',
  `status` tinyint(1) NOT NULL COMMENT '状态 1：启用 0：禁用，默认为0',
  `fee_type` int(11) NOT NULL COMMENT '计费方式：1：全部商品  2：按Sku选择 3:暂不关联商品',
  `shop_id` bigint(20) NOT NULL COMMENT '平台创建还是商户创建 平台为1',
  `relation_sku_type` int(11) NOT NULL COMMENT '使用该运费模板商品',
  `freight` decimal(19,2) DEFAULT NULL COMMENT '运费(预置模板)',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'app id',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `version` int(11) DEFAULT '1' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COMMENT='店铺自定义运费模板表'



wp_digital_retail
CREATE TABLE `express_freight_template_deliver_region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板ID',
  `region_ids` varchar(2000) DEFAULT NULL COMMENT '区域ID',
  `first_unit` decimal(19,2) NOT NULL COMMENT '首件（个） | 首重（公斤）',
  `first_freight` decimal(19,2) NOT NULL COMMENT '首件运费（元） | 首重运费（元）',
  `more_unit` decimal(19,2) NOT NULL COMMENT '续件（个） | 续件运费（元）',
  `more_freight` decimal(19,2) NOT NULL COMMENT '续件运费（元） | 续重运费（元）',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'app id',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `version` int(11) DEFAULT '1' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COMMENT='店铺自定义运费模板关联区域表'



wp_digital_retail
CREATE TABLE `express_freight_template_relation_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板ID',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '平台创建还是商户创建 平台为1',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'app id',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `version` int(11) DEFAULT '1' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COMMENT='店铺自定义运费模板关联商品表'



wp_digital_retail
CREATE TABLE `express_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `fee` int(11) NOT NULL DEFAULT '0' COMMENT '运费价格，精确到小数点后两位小数，使用实际值乘上100得到，默认值0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用全局，1：启用、0：不启用，默认0',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='运费模板表'



wp_digital_retail
CREATE TABLE `feedback_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `remark` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `feedback_type` int(11) NOT NULL COMMENT '反馈意见类型',
  `feedback` varchar(1000) CHARACTER SET utf8mb4 NOT NULL COMMENT '反馈内容',
  `source` int(11) NOT NULL COMMENT '数据来源',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人用户名',
  `updated_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人用户名',
  `created_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `feedback_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '反馈人姓名',
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `ope_status` int(11) NOT NULL COMMENT '处理状态',
  `pos_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属商户名称',
  `pos_id` bigint(20) DEFAULT NULL COMMENT '所属商户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='反馈信息表'



wp_digital_retail
CREATE TABLE `feedback_info_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `remark` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `feedback_id` bigint(20) NOT NULL COMMENT '反馈信息id',
  `feedback_img` varchar(500) CHARACTER SET utf8mb4 NOT NULL COMMENT '反馈图片',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='反馈信息图片表'



wp_digital_retail
CREATE TABLE `feedback_info_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `remark` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `ope_result` int(11) DEFAULT NULL COMMENT '处理状态',
  `handel_remark` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '处理说明',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人用户名',
  `created_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `feedback_id` bigint(20) DEFAULT NULL COMMENT '反馈信息id',
  `updated_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='反馈信息处理日志表'



wp_digital_retail
CREATE TABLE `files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `files` mediumblob COMMENT '附件',
  `type` tinyint(4) DEFAULT '0' COMMENT '文件类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='附件存储表'



wp_digital_retail
CREATE TABLE `first_login_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='首次登录记录'



wp_digital_retail
CREATE TABLE `good_channel_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '销售渠道主键id标识(商品所属渠道)',
  `channel_good_code` varchar(255) DEFAULT NULL COMMENT '销售渠道商品编码',
  `channel_good_sku_code` varchar(255) DEFAULT NULL COMMENT '销售渠道商品SKU',
  `channel_goods_name` varchar(255) DEFAULT NULL COMMENT '销售渠道商品名称',
  `shop_id` bigint(20) NOT NULL COMMENT '店铺主键id标识',
  `good_id` bigint(20) NOT NULL COMMENT '商品主键id标识',
  `good_sku_id` bigint(20) DEFAULT NULL COMMENT '商品SKU',
  `bundle_channel_id` bigint(20) DEFAULT NULL COMMENT '平台商品上架门店 绑定的门店渠道id',
  `bundle_shop_id` bigint(20) DEFAULT NULL COMMENT '平台商品上架门店 绑定的门店id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2556 DEFAULT CHARSET=utf8mb4 COMMENT='商品渠道关联信息表'



wp_digital_retail
CREATE TABLE `hardware_management` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `hardware_name` varchar(64) DEFAULT NULL COMMENT '设备名称',
  `hardware_code` varchar(64) DEFAULT NULL COMMENT '设备编号',
  `hardware_type` varchar(64) DEFAULT NULL COMMENT '设备类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='硬件管理'



wp_digital_retail
CREATE TABLE `initialization_relation_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `initialization_id` bigint(20) NOT NULL COMMENT '初始化ID',
  `category_id` bigint(20) NOT NULL COMMENT '分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COMMENT='初始化关联分类类目表'



wp_digital_retail
CREATE TABLE `initialization_setup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_business_merchantbc` tinyint(1) DEFAULT '0' COMMENT '是否开启B2C商城',
  `is_business_merchantoms` tinyint(1) DEFAULT '0' COMMENT '是否开启OMS',
  `is_business_merchantbbc` tinyint(1) DEFAULT '0' COMMENT '是否开启BBC商城',
  `is_business_merchantpos` tinyint(1) DEFAULT '0' COMMENT '是否开启云POS',
  `merchant_name` varchar(64) DEFAULT NULL COMMENT '平台商城参数商城名称',
  `merchant_url` varchar(255) DEFAULT NULL COMMENT '商城logo',
  `parameter_number` tinyint(1) DEFAULT NULL COMMENT '是否开启数量小数点',
  `parameter_number_digit` int(11) DEFAULT '2' COMMENT '数量小数点位数',
  `parameter_money` tinyint(1) DEFAULT NULL COMMENT '是否开启金额小数点',
  `parameter_money_digit` int(11) DEFAULT '2' COMMENT '金额小数点位数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='初始化设置'



wp_digital_retail
CREATE TABLE `initialize_channel_shop_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(20) NOT NULL DEFAULT '0' COMMENT '初始化类型：1.pc运营端 2.H5移动端 3.微信小程序',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='渠道-店铺初始化记录'



wp_digital_retail
CREATE TABLE `item_import` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `merchant_id` bigint(20) NOT NULL COMMENT '销售渠道主键id标识(商品所属渠道)',
  `category_id` bigint(20) DEFAULT NULL COMMENT '销售渠道商品编码',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `source` tinyint(4) DEFAULT NULL COMMENT '创建来源',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4



wp_digital_retail
CREATE TABLE `item_import_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `item_import_id` bigint(20) NOT NULL COMMENT 'app id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '类目id',
  `row_data` json DEFAULT NULL COMMENT '导入记录行JSON数据',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116047 DEFAULT CHARSET=utf8mb4



wp_digital_retail
CREATE TABLE `live_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `room_id` bigint(20) NOT NULL COMMENT '房间id',
  `sale_order_no` varchar(64) NOT NULL COMMENT '销售订单号',
  `goods_id` bigint(20) NOT NULL COMMENT '微信商品id',
  `goods_count` int(11) NOT NULL COMMENT '商品数量',
  `pay_amount` decimal(10,2) NOT NULL COMMENT '支付金额',
  `pay_status` tinyint(4) NOT NULL COMMENT '订单支付状态（0:未支付，1：已支付）',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='直播下单数据表'



wp_digital_retail
CREATE TABLE `live_goods_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '微信商品id',
  `item_id` bigint(20) NOT NULL COMMENT '商品itemId',
  `audit_status` int(11) NOT NULL COMMENT '商品审核状态',
  `cover_img_url` varchar(255) NOT NULL COMMENT '封面图片url',
  `spu_code` varchar(64) NOT NULL COMMENT '商品编码',
  `category_id` bigint(20) NOT NULL COMMENT '类目id',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌id',
  `url` varchar(255) NOT NULL COMMENT '商品详情页的小程序路径',
  `price` decimal(10,2) NOT NULL COMMENT '一口价/价格区间左边界/原价',
  `price2` decimal(10,2) DEFAULT NULL COMMENT '价格区间右边界/折扣价',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `source` tinyint(4) DEFAULT '0' COMMENT '来源，0是mp后台，1是平台端',
  `price_type` tinyint(4) DEFAULT NULL COMMENT '价格类型',
  `audit_id` bigint(20) DEFAULT NULL COMMENT '审核id',
  `third_party_tag` tinyint(4) NOT NULL COMMENT '2：表示是为api添加商品，否则不是api添加商品',
  `category_name` varchar(255) DEFAULT NULL COMMENT '类目名称',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `sku_code` varchar(255) NOT NULL COMMENT 'sku编码',
  `specification` varchar(255) DEFAULT NULL COMMENT '规格属性',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_goods_id` (`goods_id`) USING BTREE,
  KEY `idx_item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='直播商品信息表'



wp_digital_retail
CREATE TABLE `live_room_goods_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `room_id` bigint(20) NOT NULL COMMENT '房间id',
  `item_id` bigint(20) NOT NULL COMMENT '商品上架id',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_item_room_id` (`item_id`,`room_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='直播间_商品信息关联表'



wp_digital_retail
CREATE TABLE `live_room_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `name` varchar(32) NOT NULL COMMENT '直播房间名',
  `room_id` bigint(20) NOT NULL COMMENT '房间id',
  `cover_img` varchar(255) NOT NULL COMMENT '直播间背景墙',
  `share_img` varchar(255) NOT NULL COMMENT '分享卡片封面',
  `live_status` int(11) NOT NULL COMMENT '直播状态',
  `start_time` datetime NOT NULL COMMENT '直播计划开始时间，列表按照start_time降序排列',
  `end_time` datetime NOT NULL COMMENT '直播计划结束时间',
  `anchor_name` varchar(32) NOT NULL COMMENT '主播名',
  `anchor_wechat` varchar(32) DEFAULT NULL COMMENT '主播微信号,需要实名认证',
  `type` tinyint(4) DEFAULT NULL COMMENT '直播类型，1：推流，0：手机直播',
  `screen_type` tinyint(4) DEFAULT NULL COMMENT '1：横屏，0：竖屏，自动根据实际视频分辨率调整',
  `close_like` tinyint(4) DEFAULT NULL COMMENT '1：关闭点赞 0：开启点赞 ，关闭后无法开启',
  `close_goods` tinyint(4) DEFAULT NULL COMMENT '1：关闭货架 0：打开货架，关闭后无法开启',
  `close_comment` tinyint(4) DEFAULT NULL COMMENT '1：关闭评论 0：打开评论，关闭后无法开启',
  `source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '直播间来源类型，1：平台，0：mp端',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_roome_id` (`room_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='直播间信息表，未开播前均可修改'



wp_digital_retail
CREATE TABLE `logistics_configure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'app id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_extracting_code` tinyint(4) DEFAULT NULL COMMENT '启用门店自提码功能',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物流设置'



wp_digital_retail
CREATE TABLE `mail_banner_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `image_url` varchar(500) NOT NULL COMMENT '图片地址',
  `sort` int(4) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `link_url` varchar(500) DEFAULT NULL COMMENT '链接地址 如果链接类型是1的话，跳到内部商品 格式约定为itemId:shopId，0为外部url',
  `link_type` int(4) DEFAULT NULL COMMENT '链接类型 0为外部url，1内部跳转',
  `app_id` bigint(20) DEFAULT '0' COMMENT '应用id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '修改时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '更新人',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `banner_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型 1商城banner  2门店banner',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='轮播图banner设置'



wp_digital_retail
CREATE TABLE `mail_billboard_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `category_id` bigint(20) NOT NULL COMMENT '商品类目ID',
  `sort` int(4) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `type` int(4) NOT NULL COMMENT '榜单类型 0 人气榜 1销售榜',
  `app_id` bigint(20) DEFAULT '0' COMMENT '应用id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '修改时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '更新人',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 DEFAULT '123' COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `image_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='榜单配置'



wp_digital_retail
CREATE TABLE `mail_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `status` tinyint(1) NOT NULL COMMENT '状态 0 禁用 1启用',
  `app_id` bigint(20) DEFAULT '0' COMMENT '应用id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '修改时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '更新人',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 DEFAULT '123' COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城配置'



wp_digital_retail
CREATE TABLE `mail_shop_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'app id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `shop_id` bigint(11) DEFAULT NULL COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用，1：启用、0：不启用，默认0',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `image_url` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片地址',
  `template_type` tinyint(2) DEFAULT NULL COMMENT '模板类型，1：主题模板，2，首页壁纸',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COMMENT='商户模板'



wp_digital_retail
CREATE TABLE `mail_subject_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `image_url` varchar(500) NOT NULL COMMENT '图片地址',
  `sort` int(4) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `link_url` varchar(500) DEFAULT NULL COMMENT '链接地址 如果链接类型是1的话，跳到内部商品 格式约定为itemId:shopId，0为外部url',
  `link_type` tinyint(1) DEFAULT NULL COMMENT '链接类型 0为外部url，1内部跳转',
  `app_id` bigint(20) DEFAULT '0' COMMENT '应用id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '修改时间',
  `created_by` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '创建人',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '更新人',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 DEFAULT '123' COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '备注',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='专题配置'



wp_digital_retail
CREATE TABLE `material_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `template_code` varchar(32) NOT NULL COMMENT '模版编码 code',
  `template_name` varchar(64) NOT NULL COMMENT '模版名称',
  `template_type` tinyint(4) NOT NULL COMMENT '模版类型：1邀请卡 2分销资格开通',
  `template_url` varchar(255) DEFAULT NULL COMMENT '模版图片url',
  `template_desc` varchar(255) DEFAULT NULL COMMENT '模版描述',
  `set_type` tinyint(4) DEFAULT '1' COMMENT '设置类型：1默认设置 2自定义设置',
  `template_detail` json DEFAULT NULL COMMENT '模版详情，当为自定义设置时，都是读取该字段数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='素材模版'



wp_digital_retail
CREATE TABLE `member_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `app_id` varchar(255) DEFAULT NULL COMMENT '接入方id',
  `name` varchar(255) DEFAULT NULL COMMENT '分组名称',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `status` tinyint(4) DEFAULT '0' COMMENT '使用状态，0禁用，1启用',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `english_name` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `is_default` tinyint(4) DEFAULT NULL COMMENT '是否默认状态，0禁用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COMMENT='会员分组'



wp_digital_retail
CREATE TABLE `member_group_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(64) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `group_id` bigint(20) DEFAULT NULL COMMENT '分组ID',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY ```member_id``_``tenant_id``_``app_id``_r` (`member_id`,`tenant_id`,`app_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1397 DEFAULT CHARSET=utf8mb4 COMMENT='会员分组关联表'



wp_digital_retail
CREATE TABLE `member_invoice_rise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户ID',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方ID',
  `memberId` int(32) DEFAULT NULL COMMENT '会员ID',
  `type` tinyint(4) DEFAULT NULL COMMENT '抬头类型（1个人，2企业）',
  `number` varchar(64) DEFAULT NULL COMMENT '发票税号',
  `title` varchar(64) DEFAULT NULL COMMENT '发票抬头',
  `bank` varchar(64) DEFAULT NULL COMMENT '开户行',
  `bankAccount` varchar(64) DEFAULT NULL COMMENT '银行账号',
  `address` varchar(64) DEFAULT NULL COMMENT '企业地址',
  `phone` varchar(64) DEFAULT NULL COMMENT '企业电话',
  `defaults` tinyint(4) DEFAULT NULL COMMENT '默认值,0非默认，1默认',
  `created_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员发票抬头表'



wp_digital_retail
CREATE TABLE `member_level_basics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(64) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `level_id` bigint(20) DEFAULT NULL COMMENT '等级ID',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `give_number` tinyint(4) DEFAULT NULL COMMENT '门店新增会员时，是否需要验证手机号',
  `give_recharge` tinyint(4) DEFAULT NULL COMMENT '是否开通会员充值功能',
  `member_single_amount` decimal(18,2) DEFAULT NULL COMMENT '会员最少单笔充值',
  `give_integral` tinyint(4) DEFAULT NULL COMMENT '是否开启积分功能',
  `give_integral_offset` tinyint(4) DEFAULT NULL COMMENT '是否开启积分抵现',
  `rule_deduction_amount` decimal(18,2) DEFAULT NULL COMMENT '抵扣规则金额',
  `rule_deduction_integral` int(11) DEFAULT NULL COMMENT '抵押规则积分',
  `rule_deduction_lower` decimal(18,2) DEFAULT NULL COMMENT '抵扣规则金额下限',
  `rule_deduction_upper` decimal(18,2) DEFAULT NULL COMMENT '抵扣规则金额上限',
  `member_code_prefix` varchar(64) DEFAULT NULL COMMENT '会员编码前缀',
  `member_code_suffix` varchar(64) DEFAULT NULL COMMENT '会员编码后缀',
  `give_year` tinyint(4) DEFAULT NULL COMMENT '是否开启年',
  `give_month` tinyint(4) DEFAULT NULL COMMENT '是否开启月',
  `give_day` tinyint(4) DEFAULT NULL COMMENT '是否开启日',
  `serial_number` int(11) DEFAULT NULL COMMENT '流水号长度',
  `spacing` int(11) DEFAULT NULL COMMENT '段号间距',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='门店会员等级基础配置表'



wp_digital_retail
CREATE TABLE `member_level_equity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(64) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `level_id` bigint(20) DEFAULT NULL COMMENT '等级ID',
  `give_integral` bit(1) DEFAULT NULL COMMENT '是否赠送积分',
  `integral_value` int(11) DEFAULT NULL COMMENT '赠送积分值',
  `give_coupon` bit(1) DEFAULT NULL COMMENT '是否赠送优惠券',
  `give_category_discount` bit(1) DEFAULT NULL COMMENT '是否赠送专属折扣',
  `original_price_discount` bit(1) DEFAULT NULL COMMENT '专属折扣是否原价享受',
  `discount_type` tinyint(4) DEFAULT NULL COMMENT '折扣类型（1是全场商品打折，2是指定类目）',
  `discount_value` decimal(10,0) DEFAULT NULL COMMENT '折扣值',
  `give_exclusive_commodity` bit(1) DEFAULT NULL COMMENT '是否享有专享商品',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员等级权益基础配置'



wp_digital_retail
CREATE TABLE `member_level_equity_commodity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(64) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `level_id` bigint(20) DEFAULT NULL COMMENT '等级ID',
  `commodity_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `commodity_code` varchar(64) DEFAULT NULL COMMENT '商品编码',
  `sku_code` varchar(64) DEFAULT NULL COMMENT 'sku编号',
  `commodity_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `exclusive_price` decimal(10,2) DEFAULT NULL COMMENT '专享价格',
  `exclusive_stock` int(11) DEFAULT NULL COMMENT '专享库存',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `up_id` bigint(20) DEFAULT NULL COMMENT '上架ID',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺ID',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员权益专属商品配置'



wp_digital_retail
CREATE TABLE `member_level_equity_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(64) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `level_id` bigint(20) DEFAULT NULL COMMENT '等级ID',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券ID',
  `coupon_name` varchar(255) DEFAULT NULL COMMENT '优惠券名称',
  `coupon_number` int(11) DEFAULT NULL COMMENT '优惠券数量',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员权益优惠券配置'



wp_digital_retail
CREATE TABLE `member_level_equity_discount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(64) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `level_id` bigint(20) DEFAULT NULL COMMENT '等级ID',
  `discount_value` int(11) DEFAULT NULL COMMENT '折扣值',
  `category_name` varchar(255) DEFAULT NULL COMMENT '类目名称',
  `category_id` bigint(20) DEFAULT NULL COMMENT '品类ID',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员权益品类折扣配置'



wp_digital_retail
CREATE TABLE `member_search` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `app_id` varchar(255) DEFAULT NULL COMMENT '接入方id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `name` varchar(255) DEFAULT NULL COMMENT '分组名称',
  `search_result` varchar(255) DEFAULT NULL COMMENT '搜索结果',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员搜索'



wp_digital_retail
CREATE TABLE `member_staff_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `staff_id` bigint(20) DEFAULT NULL COMMENT '员工id',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='会员业务员关联表'



wp_digital_retail
CREATE TABLE `member_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `app_id` varchar(255) DEFAULT NULL COMMENT '接入方id',
  `title` varchar(255) DEFAULT NULL COMMENT '任务标题',
  `describe` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `growth_type` tinyint(4) DEFAULT NULL COMMENT '成长值类型(1代表固定数值，2代表按比例，,3代表无)',
  `growth_numerator` decimal(8,2) DEFAULT NULL COMMENT '成长值比例分子',
  `growth_denominator` int(32) DEFAULT NULL COMMENT '成长值比例分母',
  `growth_value` int(32) DEFAULT NULL COMMENT '成长值',
  `integral_type` tinyint(4) DEFAULT NULL COMMENT '积分值类型(1代表固定数值，2代表按比例,3代表无)',
  `integral_numerator` decimal(8,2) DEFAULT NULL COMMENT '成长值比例分子',
  `integral_denominator` int(32) DEFAULT NULL COMMENT '成长值比例分母',
  `integral_value` int(32) DEFAULT NULL COMMENT '积分值',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `status` tinyint(4) DEFAULT '0' COMMENT '使用状态，0禁用，1启用',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `code` varchar(32) DEFAULT NULL COMMENT '会员任务编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员任务'



wp_digital_retail
CREATE TABLE `menu_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `menu_list` varchar(255) DEFAULT NULL COMMENT '菜单id集合',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) DEFAULT NULL COMMENT '版本号，乐观锁',
  `is_deleted` int(11) unsigned DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1641708289380827139 DEFAULT CHARSET=utf8mb4 COMMENT='快捷菜单'



wp_digital_retail
CREATE TABLE `merchant_credential` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `credential_name` varchar(255) DEFAULT NULL COMMENT '证件名称：比如合同名称、xx资质证明 【未使用】',
  `credential_type` tinyint(4) DEFAULT NULL COMMENT '证件类型：0营业执照 1合同、2资质证明 【未使用】',
  `credential_url` varchar(255) NOT NULL COMMENT '证件url',
  `credential_file_id` bigint(20) DEFAULT NULL COMMENT '商户营业执照OSS文件存储主键id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COMMENT='商户证件表'



wp_digital_retail
CREATE TABLE `merchant_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `account_id` varchar(32) NOT NULL COMMENT '账户中心-账户id',
  `merchant_type` tinyint(4) NOT NULL COMMENT '商户类型：0 非直营商户 1直营商户',
  `merchant_name` varchar(64) DEFAULT NULL COMMENT '商户名称',
  `merchant_abbr_name` varchar(64) DEFAULT NULL COMMENT '商户简称【未使用】',
  `merchant_code` varchar(64) DEFAULT NULL COMMENT '商户编码',
  `merchant_level_id` bigint(20) DEFAULT NULL COMMENT '商户等级id',
  `company_name` varchar(64) DEFAULT NULL COMMENT '公司名称',
  `logo_file_id` bigint(20) DEFAULT NULL COMMENT '商户公司logo的OSS文件存储主键id',
  `company_logo` varchar(255) DEFAULT NULL COMMENT '公司logo',
  `company_profile` varchar(255) DEFAULT NULL COMMENT '公司简介',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT '公司详细地址',
  `social_credit_code` varchar(32) DEFAULT NULL COMMENT '社会信用代码',
  `contact_name` varchar(32) NOT NULL COMMENT '联系人名字',
  `contact_phone` varchar(32) NOT NULL COMMENT '联系人电话',
  `lng` decimal(10,7) DEFAULT NULL COMMENT '经度【未使用】',
  `lat` decimal(10,7) DEFAULT NULL COMMENT '纬度【未使用】',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  `online_shop_name` varchar(64) DEFAULT NULL COMMENT '网店名称【未使用】',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_merchant_name` (`merchant_name`) USING BTREE,
  KEY `idx_merchant_code` (`merchant_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COMMENT='商户信息表'



wp_digital_retail
CREATE TABLE `merchant_legal_person_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `legal_name` varchar(32) DEFAULT NULL COMMENT '法人姓名',
  `card_type` tinyint(4) DEFAULT NULL COMMENT '证件类型:0 身份证',
  `card_no` varchar(32) DEFAULT NULL COMMENT '证件号',
  `card_head_url` varchar(255) DEFAULT NULL COMMENT '身份证头像图片',
  `head_file_id` bigint(20) DEFAULT NULL COMMENT '身份证头像图片文件OSS存储主键id',
  `card_flag_url` varchar(255) DEFAULT NULL COMMENT '身份证国旗图片',
  `flag_file_id` bigint(20) DEFAULT NULL COMMENT '身份证国旗图片文件OSS存储主键id',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COMMENT='商户法人信息'



wp_digital_retail
CREATE TABLE `merchant_pay_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '支付中心租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `private_key` text NOT NULL COMMENT '商户私钥',
  `public_key` text NOT NULL COMMENT '商户公钥',
  `merchant_code` varchar(64) NOT NULL COMMENT '商户编码',
  `client_ip` varchar(64) DEFAULT NULL COMMENT '白名单Ip,与配置中心的要一致',
  `now_tenant_id` varchar(255) NOT NULL COMMENT '当前租户id',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '支付回调地址',
  `return_url` varchar(255) DEFAULT NULL COMMENT '退款回调地址',
  `applet_app_secret` varchar(255) DEFAULT NULL COMMENT '小程序appSecret',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商户支付配置表'



wp_digital_retail
CREATE TABLE `merchant_register_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `phone_number` varchar(32) NOT NULL COMMENT '手机号',
  `credential_url` varchar(255) NOT NULL COMMENT '营业执照url',
  `social_credit_code` varchar(32) DEFAULT NULL COMMENT '社会信用代码',
  `merchant_name` varchar(64) DEFAULT NULL COMMENT '商户名称',
  `company_name` varchar(64) DEFAULT NULL COMMENT '公司名称',
  `company_logo` varchar(255) DEFAULT NULL COMMENT '公司logo',
  `company_profile` varchar(255) DEFAULT NULL COMMENT '公司简介',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT '公司详细地址',
  `business_type` varchar(64) NOT NULL COMMENT '业务模式：0云店 1直营门店 2加盟门店 3京东店 4天猫店',
  `card_head_url` varchar(255) DEFAULT NULL COMMENT '身份证头像图片',
  `card_flag_url` varchar(255) DEFAULT NULL COMMENT '身份证国旗图片',
  `legal_name` varchar(32) DEFAULT NULL COMMENT '法人姓名',
  `card_no` varchar(32) DEFAULT NULL COMMENT '证件号',
  `personal_phone` varchar(32) DEFAULT NULL COMMENT '身份证-电话',
  `personal_address` varchar(255) DEFAULT NULL COMMENT '身份证-地址',
  `bank_name` varchar(64) DEFAULT '' COMMENT '银行账户名称',
  `bank_account` varchar(64) DEFAULT '' COMMENT '银行账号',
  `open_bank_name` varchar(128) DEFAULT NULL COMMENT '开户行名称',
  `bank_province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `bank_province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `bank_city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `bank_city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `bank_area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `bank_area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `bank_street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `bank_street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `sub_branch_name` varchar(64) DEFAULT NULL COMMENT '支行名称',
  `status` tinyint(4) DEFAULT '0' COMMENT '是否通过 0审核中，1通过，2不通过，3已完成注册，-1未注册',
  `denied_message` varchar(1000) DEFAULT NULL COMMENT '不通过原因',
  `review_time` datetime DEFAULT NULL COMMENT '审核时间',
  `review_by_name` varchar(20) DEFAULT NULL COMMENT '审核人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_phone` (`phone_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='商户注册信息表'



wp_digital_retail
CREATE TABLE `merchant_service_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `service_end_time` datetime NOT NULL COMMENT '服务截止日期',
  `max_enabled_shop_count` int(10) NOT NULL COMMENT '服务门店数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689166277910896643 DEFAULT CHARSET=utf8mb4 COMMENT='商户服务信息表'



wp_digital_retail
CREATE TABLE `merchant_service_info_clause` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `clause_text` text COMMENT '消费服务条款',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE COMMENT '商户普通索引'
) ENGINE=InnoDB AUTO_INCREMENT=1647132341899649027 DEFAULT CHARSET=utf8mb4 COMMENT='商户服务信息-条款表'



wp_digital_retail
CREATE TABLE `merchant_service_info_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `history` varchar(255) NOT NULL COMMENT '操作记录',
  `operator` varchar(20) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1682644415575924739 DEFAULT CHARSET=utf8mb4 COMMENT='商户服务信息操作记录表'


wp_digital_retail
CREATE TABLE `merchant_sys_data_dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `type_code` varchar(32) NOT NULL COMMENT '类型code',
  `dict_code` varchar(32) NOT NULL COMMENT '字典code',
  `dict_val` varchar(128) NOT NULL COMMENT '字典值',
  `dict_desc` varchar(255) DEFAULT NULL COMMENT '字典描述',
  `sort` int(10) DEFAULT NULL COMMENT '排序id',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689166278347104278 DEFAULT CHARSET=utf8mb4 COMMENT='商户数据字典表'



wp_digital_retail
CREATE TABLE `operator_business_item` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `business_id` bigint(64) NOT NULL COMMENT '业务类型主键id',
  `sku_id` bigint(64) NOT NULL COMMENT '运营商商品id',
  `ratio` double NOT NULL DEFAULT '0' COMMENT '业务单计算系数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_business_id_sku_id` (`business_id`,`sku_id`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567797958077181958 DEFAULT CHARSET=utf8mb4 COMMENT='移动运营商业务类型明细项（商品配置）'



wp_digital_retail
CREATE TABLE `operator_business_type` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `merchant_id` bigint(64) NOT NULL COMMENT '商户id',
  `business_name` varchar(64) NOT NULL COMMENT '业务类型名称',
  `business_code` varchar(65) NOT NULL COMMENT '业务类型编码',
  `enabled` tinyint(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_merchant_id_type_name` (`is_deleted`,`merchant_id`,`business_name`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1561557629823676419 DEFAULT CHARSET=utf8mb4 COMMENT='移动运营商业务类型'



wp_digital_retail
CREATE TABLE `operator_expect_solution` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `merchant_id` bigint(64) NOT NULL COMMENT '商户di',
  `solution_name` varchar(64) NOT NULL COMMENT '方案名称',
  `begin_time` datetime NOT NULL COMMENT '方案开始时间',
  `end_time` datetime NOT NULL COMMENT '方案结束时间',
  `auditer_id` bigint(64) DEFAULT NULL COMMENT '审核人userId',
  `audit_tme` datetime DEFAULT NULL COMMENT '审核时间',
  `status` tinyint(4) NOT NULL COMMENT '状态;1：待审核；2：已审核；3：已作废',
  `expect_way` tinyint(4) DEFAULT '0' COMMENT '预估方式;0：默认',
  `gamble_id` bigint(64) DEFAULT NULL COMMENT '对赌方案主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_merchant_id_solution_name` (`merchant_id`,`solution_name`,`is_deleted`) USING BTREE,
  KEY `idx_begin_time_end_time` (`begin_time`,`end_time`) USING BTREE,
  KEY `idx_gamble_id` (`gamble_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1549225287965384706 DEFAULT CHARSET=utf8mb4 COMMENT='移动运营商预估方案'



wp_digital_retail
CREATE TABLE `operator_expect_solution_business` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `expect_solution_id` bigint(64) NOT NULL COMMENT '预估方案主键id',
  `business_id` bigint(64) NOT NULL COMMENT '业务类型主键id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_expect_solution_id` (`expect_solution_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1549225288107991050 DEFAULT CHARSET=utf8mb4 COMMENT='移动运营商预估方案业务类型关联表'



wp_digital_retail
CREATE TABLE `operator_expect_solution_shop` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `expect_solution_id` bigint(64) NOT NULL COMMENT '预估方案id',
  `shop_id` bigint(64) NOT NULL COMMENT '门店id',
  `shop_code` varchar(65) DEFAULT NULL COMMENT '门店编码',
  `level` int(11) DEFAULT NULL COMMENT '门店星级',
  `level_ratio` double DEFAULT NULL COMMENT '门店星系计算系数',
  `target_amount` decimal(20,2) DEFAULT NULL COMMENT '酬金目标',
  `complete_amount` decimal(20,2) DEFAULT NULL COMMENT '完成酬金金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_solutionId_shopCode` (`expect_solution_id`,`shop_code`,`is_deleted`) USING BTREE,
  KEY `idx_expect_solution_id` (`expect_solution_id`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1549225288414175234 DEFAULT CHARSET=utf8mb4 COMMENT='移动运营商预估方案门店明细项'



wp_digital_retail
CREATE TABLE `operator_expect_solution_sku` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `expect_solution_id` bigint(64) NOT NULL COMMENT '预估方案主键id',
  `business_id` bigint(64) NOT NULL COMMENT '业务类型主键id',
  `sku_id` bigint(64) NOT NULL COMMENT 'skuId',
  `sku_code` varchar(65) NOT NULL COMMENT 'sku编码',
  `business_code` varchar(65) NOT NULL COMMENT '业务类型编码',
  `base_amount` decimal(20,2) NOT NULL COMMENT '基础酬金',
  `point_value` decimal(20,2) NOT NULL COMMENT '积分价值',
  `point_price` decimal(20,2) NOT NULL COMMENT '积分单价',
  `continued_amount` decimal(20,2) NOT NULL COMMENT '维系酬金',
  `inspire_amount` decimal(20,2) NOT NULL COMMENT '激励金额',
  `order_count` int(11) DEFAULT '0' COMMENT '业务订单量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_solutionId_businessCode_skuCode` (`expect_solution_id`,`business_code`,`sku_code`,`is_deleted`) USING BTREE,
  KEY `idx_expect_solution_id` (`expect_solution_id`) USING BTREE,
  KEY `idx_business_id` (`business_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1549225288896520212 DEFAULT CHARSET=utf8mb4 COMMENT='移动运营商预估方案商品明细'



wp_digital_retail
CREATE TABLE `operator_expect_solution_target` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `expect_solution_id` bigint(64) NOT NULL COMMENT '预估方案id',
  `shop_id` bigint(64) NOT NULL COMMENT '门店id',
  `shop_code` varchar(65) NOT NULL COMMENT '门店编码',
  `business_id` bigint(64) NOT NULL COMMENT '业务类型id',
  `business_code` varchar(255) NOT NULL COMMENT '业务类型编码',
  `target_num` double NOT NULL COMMENT '目标数量',
  `complete_num` double DEFAULT NULL COMMENT '完成数量',
  `gamble_amount` decimal(20,2) DEFAULT '0.00' COMMENT '对赌达标金额',
  `gamble_num` double(20,2) DEFAULT '0.00' COMMENT '对赌完成单量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_solutionId_shopCode_businessCode` (`expect_solution_id`,`shop_code`,`business_code`,`is_deleted`) USING BTREE,
  KEY `idx_business_id` (`business_id`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1549225288485478412 DEFAULT CHARSET=utf8mb4 COMMENT='移动运营商预估方案业务目标明细'



wp_digital_retail
CREATE TABLE `operator_gamble_solution` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `merchant_id` bigint(64) NOT NULL COMMENT '商户id',
  `solution_name` varchar(64) NOT NULL COMMENT '对赌方案名称',
  `begin_time` datetime NOT NULL COMMENT '方案开始时间',
  `end_time` datetime NOT NULL COMMENT '方案结束时间',
  `auditer_id` bigint(64) DEFAULT NULL COMMENT '审核人user_id',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `status` tinyint(4) NOT NULL COMMENT '状态;1：待审核；2：已审核；3：已作废',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_merchant_id_solution_name` (`merchant_id`,`solution_name`,`is_deleted`) USING BTREE,
  KEY `idx_begin_end_time` (`begin_time`,`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1554763158559375362 DEFAULT CHARSET=utf8mb4 COMMENT='移动运营商对赌方案'



wp_digital_retail
CREATE TABLE `operator_gamble_solution_business` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `gamble_solution_id` bigint(64) NOT NULL COMMENT '对赌方案主键id',
  `business_id` bigint(64) NOT NULL COMMENT '业务类型主键id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1554763158571958275 DEFAULT CHARSET=utf8mb4 COMMENT='移动运营商对赌方案业务关联表'



wp_digital_retail
CREATE TABLE `operator_gamble_solution_shop` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `gamble_solution_id` bigint(64) NOT NULL COMMENT '对赌方案主键id',
  `shop_id` bigint(64) NOT NULL COMMENT '门店id',
  `shop_code` varchar(65) NOT NULL COMMENT '门店编码',
  `business_id` bigint(64) NOT NULL COMMENT '业务类型id',
  `business_code` varchar(65) NOT NULL COMMENT '业务类型编码',
  `target_num` double NOT NULL COMMENT '对赌目标值',
  `inspire_value` double NOT NULL COMMENT '激励标准值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_gamble_solution_id` (`gamble_solution_id`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE,
  KEY `idx_business_id` (`business_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1554763158609707014 DEFAULT CHARSET=utf8mb4 COMMENT='移动运营商对赌方案门店业务类型明细项'



wp_digital_retail
CREATE TABLE `operator_monetary_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(32) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `operator_order_id` bigint(20) NOT NULL COMMENT '运营商订单id',
  `internal_order_no` varchar(32) NOT NULL COMMENT '内部运营商单号',
  `operator_order_no` varchar(32) NOT NULL COMMENT '运营商单号',
  `monetary_detail_no` varchar(32) DEFAULT NULL COMMENT '酬金明细单号',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id',
  `shop_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `should_send_price` decimal(20,2) DEFAULT NULL COMMENT '应发金额',
  `issued_send_price` decimal(20,2) DEFAULT NULL COMMENT '核发金额',
  `reason` varchar(200) DEFAULT NULL COMMENT '未核发原因',
  `balance_date` varchar(50) NOT NULL DEFAULT '0' COMMENT '结算期数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态,0:完成 1:作废',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_skuId` (`sku_id`) USING BTREE,
  KEY `idx_monetaryDetailNo` (`monetary_detail_no`) USING BTREE,
  KEY `idx_operatorOrderNo` (`operator_order_no`) USING BTREE,
  KEY `idx_shopId` (`shop_id`) USING BTREE,
  KEY `idx_merchantId` (`merchant_id`) USING BTREE,
  KEY `idx_createdTime` (`created_time`) USING BTREE,
  KEY `idx_updatedTime` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1537245529337159683 DEFAULT CHARSET=utf8mb4 COMMENT='运营商订单酬金明细表'



wp_digital_retail
CREATE TABLE `operator_monetary_detail_ext` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(32) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `operator_monetary_detail_id` bigint(20) NOT NULL COMMENT '运营商酬金明细id',
  `monetary_detail_no` varchar(32) NOT NULL COMMENT '运营商酬金明细单号',
  `json_obejct` json DEFAULT NULL COMMENT '酬金明细源数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1537245529651732484 DEFAULT CHARSET=utf8mb4 COMMENT='运营商酬金明细扩展表'



wp_digital_retail
CREATE TABLE `operator_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(32) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `internal_order_no` varchar(32) NOT NULL COMMENT '内部运营商单号',
  `operator_order_no` varchar(32) NOT NULL COMMENT '运营商单号',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id',
  `shop_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `advance_price` decimal(20,2) DEFAULT NULL COMMENT '垫资金额',
  `monetary_price` decimal(20,2) DEFAULT NULL COMMENT '预估酬金',
  `issued_send_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '核发酬金',
  `accept_time` datetime NOT NULL COMMENT '受理时间',
  `effective_time` datetime DEFAULT NULL COMMENT '生效时间',
  `expire_time` datetime DEFAULT NULL COMMENT '失效时间',
  `buyer_name` varchar(32) DEFAULT NULL COMMENT '会员姓名',
  `member_mobile` varchar(32) DEFAULT NULL COMMENT '会员手机号',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `duty_manager_id` bigint(20) DEFAULT NULL COMMENT '当班店长id',
  `operator_id` bigint(20) DEFAULT NULL COMMENT '操作员id',
  `sales_id` varchar(255) DEFAULT NULL COMMENT '销售员id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态,0:创建 1:撤单 2:结算',
  `union_code` varchar(255) DEFAULT NULL COMMENT '受理时间+skuId',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_operator_order_no` (`operator_order_no`) USING BTREE,
  KEY `idx_shopId` (`shop_id`) USING BTREE,
  KEY `idx_merchantId` (`merchant_id`) USING BTREE,
  KEY `idx_createdTime` (`created_time`) USING BTREE,
  KEY `idx_updatedTime` (`updated_time`) USING BTREE,
  KEY `idx_skuId` (`sku_id`) USING BTREE,
  KEY `idx_unionCode` (`union_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1537240928737370115 DEFAULT CHARSET=utf8mb4 COMMENT='运营商订单表'



wp_digital_retail
CREATE TABLE `operator_order_ext` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(32) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `operator_order_id` bigint(20) NOT NULL COMMENT '运营商单号id',
  `operator_order_no` varchar(32) NOT NULL COMMENT '运营商单号',
  `internal_order_no` varchar(32) NOT NULL COMMENT '链户猫单号',
  `json_obejct` json DEFAULT NULL COMMENT '订单源数据',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_operatorOrderId` (`operator_order_id`) USING BTREE,
  KEY `idx_operator_order_no` (`operator_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1537240928749953028 DEFAULT CHARSET=utf8mb4 COMMENT='运营商订单扩展表'



wp_digital_retail
CREATE TABLE `operator_order_salesperson` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(32) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `operator_order_id` bigint(20) NOT NULL COMMENT '运营商单号id',
  `operator_order_no` varchar(32) NOT NULL COMMENT '运营商单号',
  `internal_order_no` varchar(32) NOT NULL COMMENT '链户猫单号',
  `salesperson_id` bigint(11) NOT NULL COMMENT '办理人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_operatorOrderId` (`operator_order_id`) USING BTREE,
  KEY `idx_operatorOrderNo` (`operator_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1537240928775118851 DEFAULT CHARSET=utf8mb4 COMMENT='运营商订单关联办理人'



wp_digital_retail
CREATE TABLE `operator_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  `sku_code` varchar(65) NOT NULL COMMENT '商品sku编码',
  `sku_id` bigint(20) NOT NULL COMMENT '商品skuID',
  `sku_name` varchar(255) NOT NULL COMMENT '商品sku名称',
  `item_id` bigint(20) NOT NULL COMMENT '商品itemID',
  `item_name` varchar(255) NOT NULL COMMENT '商品item名称',
  `cspu_id` bigint(20) NOT NULL COMMENT '商品cspuID',
  `cspu_name` varchar(255) NOT NULL COMMENT '商品cspu名称',
  `classify_id` bigint(20) NOT NULL COMMENT '商品分类ID',
  `category_id` bigint(20) NOT NULL COMMENT '商品类目ID',
  `is_operator` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否运营商商品',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_item_id` (`item_id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_cspu_id` (`cspu_id`) USING BTREE,
  KEY `idx_category_id` (`category_id`) USING BTREE,
  KEY `idx_classify_id` (`classify_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_sku_code` (`sku_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1534001794211880962 DEFAULT CHARSET=utf8mb4 COMMENT='运营商商品表'



wp_digital_retail
CREATE TABLE `oss_file_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `version` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `type` int(11) NOT NULL COMMENT '枚举类型 1补贴活动文件',
  `content_type` varchar(128) DEFAULT NULL COMMENT '文件类型',
  `oss_key` varchar(512) NOT NULL COMMENT '存储OSS的key',
  `name` varchar(128) NOT NULL COMMENT '文件名称（带后缀）',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689917503148994562 DEFAULT CHARSET=utf8mb4 COMMENT='OSS存储文件表'



wp_digital_retail
CREATE TABLE `pay_center_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `pay_sys_access_auth_code` varchar(255) NOT NULL COMMENT '支付平台系统编码',
  `pay_sys_biz_type_code` varchar(255) NOT NULL COMMENT '支付平台业务编码',
  `auth_code` varchar(255) NOT NULL COMMENT '支付平台验签加密key',
  `pay_application_code` varchar(255) NOT NULL COMMENT '支付平台应用code',
  `pay_sys_name` varchar(64) DEFAULT NULL COMMENT '业务名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_code` (`pay_sys_access_auth_code`,`pay_sys_biz_type_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付中心配置表'



wp_digital_retail
CREATE TABLE `permanent_materia_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `media_id` varchar(255) NOT NULL COMMENT '微信生成的素材id',
  `url` varchar(255) NOT NULL COMMENT '上传素材的url',
  `media_type` tinyint(4) NOT NULL COMMENT '素材类型，照片、视频等',
  `classification` tinyint(4) DEFAULT NULL COMMENT '素材分类，背景图、分享图',
  `type` tinyint(4) NOT NULL COMMENT '素材类别,商品/直播间',
  `materia_id` bigint(20) NOT NULL COMMENT '本地素材（商品、直播间主键）id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='永久素材记录表'



wp_digital_retail
CREATE TABLE `permission_user_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '应用id',
  `tenant_id` varchar(255) NOT NULL DEFAULT '' COMMENT '租户id',
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色id',
  `sensitive_field_code` int(255) NOT NULL DEFAULT '0' COMMENT '敏感字段敏感字段code;1:采购入库单价;2:商品采购价;3:库存成本',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `delete_time` datetime DEFAULT NULL COMMENT '【未使用】',
  `remark` varchar(255) DEFAULT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id_app_id` (`role_id`,`app_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='账号角色权限敏感字段关系表'



wp_digital_retail
CREATE TABLE `predict_monetary_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(32) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id',
  `shop_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `union_id` varchar(50) DEFAULT NULL COMMENT 'shopId_skuId',
  `monetary_price` decimal(20,2) DEFAULT NULL COMMENT '预估酬金',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_skuId` (`sku_id`) USING BTREE,
  KEY `idx_merchantId` (`merchant_id`) USING BTREE,
  KEY `idx_unioId` (`union_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1534001796304838721 DEFAULT CHARSET=utf8mb4 COMMENT='预估酬金配置表'



wp_digital_retail
CREATE TABLE `promotion_region_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `promotion_id` bigint(20) DEFAULT NULL COMMENT '促销活动id',
  `promotion_name` varchar(32) NOT NULL COMMENT '促销活动名称',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku id',
  `ext_json` text COMMENT '预留字段json格式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动专区表'



wp_digital_retail
CREATE TABLE `purchase_request_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'appId',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `purchase_request_order_no` varchar(20) NOT NULL COMMENT '要货单号',
  `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '要货状态 1、待提交 2、待审核  3:已完成 4: 已作废',
  `total_count` int(10) NOT NULL COMMENT '要货数量',
  `total_amount` decimal(20,2) NOT NULL COMMENT '要货金额',
  `shop_id` bigint(20) NOT NULL COMMENT '门店id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_purchase_request_order_no` (`purchase_request_order_no`) USING BTREE COMMENT '要货单号索引',
  KEY `idx_created_time` (`created_time`) USING BTREE COMMENT '创建时间索引'
) ENGINE=InnoDB AUTO_INCREMENT=1559948834747781123 DEFAULT CHARSET=utf8mb4



wp_digital_retail
CREATE TABLE `purchase_request_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'appId',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `purchase_request_order_id` bigint(20) NOT NULL COMMENT '要货单id',
  `sku_id` bigint(20) NOT NULL COMMENT '规格id',
  `sku_qty` int(10) NOT NULL COMMENT '要货数量',
  `purchase_price` decimal(20,2) DEFAULT NULL COMMENT '价格清单-采购价',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `last7_days_sell_count` int(10) DEFAULT NULL COMMENT '近7天销量',
  `this_month_sell_count` int(10) DEFAULT NULL COMMENT '本月销量',
  `sku_verify_qty` int(10) DEFAULT NULL COMMENT '要货审核数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_purchase_request_order_id` (`purchase_request_order_id`) USING BTREE COMMENT '要货单id索引'
) ENGINE=InnoDB AUTO_INCREMENT=1559952938484174855 DEFAULT CHARSET=utf8mb4




wp_digital_retail
CREATE TABLE `purchase_request_verify_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `status` int(11) NOT NULL COMMENT '状态 1：已完成 ，2 ：已作废',
  `verify_order_no` varchar(20) NOT NULL COMMENT '审核单号',
  `total_count` int(10) NOT NULL COMMENT '要货审核数量汇总',
  `total_amount` decimal(20,2) NOT NULL COMMENT '要货审核金额汇总',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_seller_id` (`verify_order_no`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE COMMENT '商户id索引',
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1554644348254797826 DEFAULT CHARSET=utf8mb4 COMMENT='要货_审核单_表'



wp_digital_retail
CREATE TABLE `purchase_request_verify_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'appId',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `purchase_request_verify_order_id` bigint(20) NOT NULL COMMENT '要货审核单id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `shop_id` bigint(20) NOT NULL COMMENT '门店id',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库id',
  `last7_days_sell_count` int(10) DEFAULT NULL COMMENT '近7天销量-门店',
  `this_month_sell_count` int(10) DEFAULT NULL COMMENT '本月销量-门店',
  `last7_days_merchant_count` int(10) DEFAULT NULL COMMENT '近7天销量-商户',
  `this_month_merchant_count` int(10) DEFAULT NULL COMMENT '本月销量-商户',
  `shop_stock_qty` int(10) DEFAULT NULL COMMENT '门店库存',
  `merchant_stock_qty` int(10) DEFAULT NULL COMMENT '商户库存',
  `sku_qty` int(10) NOT NULL COMMENT '要货数量',
  `sku_verify_qty` int(10) NOT NULL COMMENT '要货审核数量',
  `purchase_price` decimal(20,2) DEFAULT NULL COMMENT '价格清单-采购价',
  `purchase_verify_price` decimal(20,2) DEFAULT NULL COMMENT '价格清单-审核金额 ， 审核数量 * 采购价',
  `purchase_request_order_remark` varchar(255) DEFAULT NULL COMMENT '要货单备注',
  `purchase_request_order_id` bigint(20) NOT NULL COMMENT '要货单id',
  `purchase_request_order_item_id` bigint(20) NOT NULL COMMENT '要货单明细id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_purchase_request_verify_order_id` (`purchase_request_verify_order_id`) USING BTREE COMMENT '要货审核单id索引'
) ENGINE=InnoDB AUTO_INCREMENT=1554644348661645314 DEFAULT CHARSET=utf8mb4 COMMENT='要货_审核单_明细 表'



wp_digital_retail
CREATE TABLE `push_msg_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `bizIdentification` varchar(100) NOT NULL COMMENT '业务标识',
  `case_id` varchar(64) DEFAULT NULL COMMENT '实例id',
  `content` varchar(64) DEFAULT NULL COMMENT '内容',
  `content_type` tinyint(4) DEFAULT NULL COMMENT '内容类型,0文本,1html',
  `pm_event_id` bigint(20) DEFAULT NULL COMMENT '事件id',
  `push_time` varchar(64) DEFAULT NULL COMMENT '定时推送时间',
  `push_type` bigint(20) DEFAULT NULL COMMENT '推送类型 0:不推送 1:定时推送 2:立即推送',
  `request_no` varchar(100) DEFAULT NULL COMMENT '请求编号',
  `start_time` varchar(100) DEFAULT NULL COMMENT '有效开始时间',
  `target_type` bigint(20) DEFAULT NULL COMMENT '目标类型：0, 指定用户 1,用户分类 2,标签 3,设备别名 4,广播所有人',
  `target_value` varchar(255) DEFAULT NULL COMMENT '推送目标分类值',
  `var_value` varchar(255) DEFAULT NULL COMMENT '内容变量值',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  `system` varchar(20) DEFAULT NULL COMMENT '0 ALL,1 安卓,2 IOS',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息推送日志'



wp_digital_retail
CREATE TABLE `push_msg_member_terminal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `account_id` varchar(100) DEFAULT NULL COMMENT '账号Id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员Id',
  `terminal_id` varchar(64) DEFAULT NULL COMMENT '终端id',
  `terminal_type` varchar(64) DEFAULT NULL COMMENT '终端分类：0网页，1APP',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  `system` varchar(20) DEFAULT NULL COMMENT '0 ALL,1 安卓,2 IOS',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户终端系统信息表'



wp_digital_retail
CREATE TABLE `receipt_template_shop` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `shop_id` bigint(20) NOT NULL COMMENT '门店id',
  `enabled` tinyint(1) NOT NULL COMMENT '是否勾选 1勾选 0不勾选',
  `name` varchar(50) NOT NULL COMMENT '字段名\r\n',
  `chinese_name` varchar(50) NOT NULL COMMENT '字段中文名',
  `value` varchar(255) DEFAULT NULL COMMENT '默认值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='门店小票打印模板'



wp_digital_retail
CREATE TABLE `safe_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `safe_qty` int(32) DEFAULT '0' COMMENT '安全库存数量',
  `union_id` varchar(20) DEFAULT NULL COMMENT '联合ID,仓库id+skuId',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `stock_type` tinyint(4) DEFAULT '0' COMMENT '库存类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4



wp_digital_retail
CREATE TABLE `sale_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `name` varchar(255) NOT NULL COMMENT '渠道名称',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `code` varchar(255) DEFAULT NULL COMMENT '渠道编码',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `default_shop_id` bigint(20) NOT NULL COMMENT '默认店铺',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态，1：启用、0：禁用，默认0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COMMENT='销售渠道信息表'



wp_digital_retail
CREATE TABLE `sale_order_article_fifo_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `fifo_control` tinyint(1) DEFAULT NULL COMMENT '类型 1：强管控  2：弱管控',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id',
  `classify_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '顶级 分类id',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE COMMENT '商户id 索引'
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COMMENT='开单库龄监控先进先出配置表'



wp_digital_retail
CREATE TABLE `sale_order_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `sale_order_no` varchar(32) NOT NULL COMMENT '订单编号',
  `before_status` int(11) NOT NULL COMMENT '订单审核前状态',
  `after_status` int(11) NOT NULL COMMENT '订单审核后的状态',
  `passed` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核是否通过 （0：不通过，1：通过）',
  `audit_type` tinyint(4) DEFAULT NULL COMMENT '订单审核类型 （1：人工审核  2：人工财审）',
  `audit_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1028 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单审核记录表'



wp_digital_retail
CREATE TABLE `sale_order_business_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `control_config` text COMMENT '管控配置: 价格管控，先进先出管控',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uiq_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8mb4 COMMENT='开单业务配置'



wp_digital_retail
CREATE TABLE `sale_order_configuration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `order_place_over_time` int(11) DEFAULT NULL COMMENT '提交订单超时时间',
  `reduce_real_stock_time` int(11) DEFAULT NULL COMMENT '重新发起出库 间隔时间',
  `is_allow_customer_audit` tinyint(4) DEFAULT NULL COMMENT '是否允许客服自动审核 【未使用】',
  `customer_audit_over_time` int(11) DEFAULT NULL COMMENT '客审超时时间 【未使用】',
  `is_allow_change_amount` tinyint(4) DEFAULT NULL COMMENT '是否允许修改未支付订单价格 【未使用】',
  `automatic_delivery_time` int(11) DEFAULT NULL COMMENT '自动配货时间 【未使用】',
  `is_allow_automic_delivery` tinyint(4) DEFAULT NULL COMMENT '是否允许自动配货 【未使用】',
  `financial_audit_over_time` int(11) DEFAULT NULL COMMENT '自动财审时间 【未使用】',
  `is_allow_financial_audit` tinyint(4) DEFAULT NULL COMMENT '是否允许财审 【未使用】',
  `automatic_received_goods_time` int(11) DEFAULT NULL COMMENT '自动收货时间 【未使用】',
  `is_allow_wipe_rule` tinyint(4) DEFAULT NULL COMMENT '是否开启抹零规则 【未使用】',
  `automatic_wipe_rule` tinyint(4) DEFAULT NULL COMMENT '抹零规则 【未使用】',
  `automic_delivery_time` int(11) DEFAULT NULL COMMENT '自动配货审核超时时间 【未使用】',
  `is_allow_store_sweep` tinyint(4) DEFAULT NULL COMMENT '是否开启门店扫码购功能 【未使用】',
  `is_allow_fictitious_stock` tinyint(4) DEFAULT NULL COMMENT '是否开启商品库存为0时，不允许配货 【未使用】',
  `is_allow_demolition_order` tinyint(4) DEFAULT NULL COMMENT '是否开启拆单策略 【未使用】',
  `is_allow_excess_demolition` tinyint(4) DEFAULT NULL COMMENT '是否开启超额拆单 【未使用】',
  `automic_excess_money` int(11) DEFAULT NULL COMMENT '超额金额 【未使用】',
  `is_allow_warehouse_demolition` tinyint(4) DEFAULT NULL COMMENT '是否开启开启指定仓库时不拆单 【未使用】',
  `automic_warehouse_code` varchar(32) DEFAULT NULL COMMENT '仓库编码 【未使用】',
  `automic_splitting_rules` int(11) DEFAULT NULL COMMENT '拆分规则 【未使用】',
  `is_allow_received_goods` tinyint(4) DEFAULT NULL COMMENT '是否开启自动收货 【未使用】',
  `order_place_list_time` int(11) DEFAULT NULL COMMENT '提交订单超时间自动取消挂单 【未使用】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单配置表'



wp_digital_retail
CREATE TABLE `sale_order_operation_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operation_item` varchar(255) DEFAULT NULL COMMENT '操作项',
  `operation_value` varchar(2000) DEFAULT NULL COMMENT '操作值',
  `sale_order_id` bigint(20) DEFAULT NULL COMMENT '订单关联id',
  `sale_order_no` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `sku_name` varchar(256) DEFAULT NULL COMMENT '商品名称',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'app id',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='销售订单操作日志'



wp_digital_retail
CREATE TABLE `sale_order_print` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `print_count` bigint(20) DEFAULT '1' COMMENT '打印次数',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `created_by` bigint(11) DEFAULT NULL COMMENT '创建人',
  `updated_by` bigint(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE COMMENT '销售订单id唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689535056116088834 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单打印次数数据'



wp_digital_retail
CREATE TABLE `sale_stock_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `action_extend` int(11) DEFAULT NULL COMMENT '操作单据',
  `extend_type` int(11) DEFAULT NULL COMMENT '单据类型',
  `extend_id` varchar(50) DEFAULT NULL COMMENT '单据ID',
  `action_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `actionFields` varchar(255) DEFAULT NULL COMMENT '操作字段',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'app id',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `version` int(11) DEFAULT NULL COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `created_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3644 DEFAULT CHARSET=utf8mb4 COMMENT='库存日志'



wp_digital_retail
CREATE TABLE `sale_stock_log_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `stock_log_id` bigint(20) DEFAULT NULL COMMENT '关联库存日志ID',
  `action_field` varchar(255) DEFAULT NULL COMMENT '操作字段',
  `before_Value` varchar(255) DEFAULT NULL COMMENT '修改前',
  `after_value` varchar(255) DEFAULT NULL COMMENT '修改后',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'app id',
  `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
  `version` int(11) DEFAULT NULL COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `created_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(20) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8mb4 COMMENT='库存日志明细'



wp_digital_retail
CREATE TABLE `seckill_remind` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户id',
  `app_id` varchar(32) DEFAULT NULL COMMENT '接入方id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `phone` varchar(20) DEFAULT NULL COMMENT '会员手机',
  `item_id` bigint(32) NOT NULL COMMENT 'itemId',
  `sku_id` bigint(32) NOT NULL COMMENT 'skuId',
  `item_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `activity_id` bigint(20) DEFAULT NULL COMMENT '活动Id',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0 未发送 1已发送',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='秒杀提醒表'



wp_digital_retail
CREATE TABLE `shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `name` varchar(255) NOT NULL COMMENT '店铺名称',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '渠道主键标识',
  `code` varchar(255) DEFAULT NULL COMMENT '店铺编码',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态，1：启用、0：禁用，默认0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='店铺信息表'



wp_digital_retail
CREATE TABLE `shop_channel_depot_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `shop_id` bigint(20) NOT NULL COMMENT '店铺主键标识',
  `channel_id` bigint(20) NOT NULL COMMENT '渠道主键标识',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，1：启用、0：禁用，默认0',
  `is_local_depot_prior` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启优先匹配当地城市仓库，1：开启、0：关闭，默认0',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `depot_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `version` int(11) DEFAULT NULL COMMENT '版本号，乐观锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='店铺渠道仓库关联信息表'



wp_digital_retail
CREATE TABLE `shop_channel_depot_relation_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库主键标识',
  `priority` int(11) DEFAULT NULL COMMENT '优先级，数字越小优先级越高',
  `shop_channel_depot_id` bigint(20) NOT NULL COMMENT '店铺、仓库、渠道概览id标识',
  `version` int(11) DEFAULT NULL COMMENT '版本号，乐观锁',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='店铺渠道仓库信息地址优先级详情表'



wp_digital_retail
CREATE TABLE `staff_duty_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '表记录版本,从1开始,修改加1',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `staff_id` bigint(20) DEFAULT NULL COMMENT '员工id',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态（0值班中，1值班完成）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COMMENT='值班记录表'



wp_digital_retail
CREATE TABLE `stg_batch_inbound` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '导入记录的创建商户id',
  `inbound_type` tinyint(1) NOT NULL COMMENT '入库类型0:采购入库，4其他入库',
  `status` tinyint(4) NOT NULL COMMENT '完成状态 0否 1是',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_inbound_type` (`inbound_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1565993949138366466 DEFAULT CHARSET=utf8mb4 COMMENT='唯一码批量入库导入批次'



wp_digital_retail
CREATE TABLE `stg_batch_inbound_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '是否逻辑删除',
  `batch_inbound_id` bigint(20) NOT NULL COMMENT '导入批次id',
  `supplier_code` varchar(255) NOT NULL COMMENT '供应商编码',
  `supplier_name` varchar(255) DEFAULT '' COMMENT '供应商名称',
  `depot_no` varchar(255) NOT NULL COMMENT '仓库编码',
  `depot_name` varchar(255) DEFAULT '' COMMENT '仓库名称',
  `sku_no` varchar(255) NOT NULL COMMENT '商品编码',
  `sku_name` varchar(255) DEFAULT '' COMMENT '商品名称',
  `article_code` varchar(64) DEFAULT NULL COMMENT '唯一码',
  `cost_price` varchar(64) NOT NULL COMMENT '成本价',
  `import_status` tinyint(1) NOT NULL COMMENT '导入状态，0失败 1成功',
  `import_result` varchar(64) DEFAULT NULL COMMENT '导入结果',
  `submit_status` tinyint(1) NOT NULL COMMENT '递交状态，0未递交 1成功 2失败',
  `submit_result` varchar(64) DEFAULT NULL COMMENT '递交结果',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `depot_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `article_id` bigint(20) DEFAULT NULL COMMENT '唯一码id',
  `deleted_date` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '删除时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `inbound_type` tinyint(1) NOT NULL COMMENT '入库类型0:采购入库，4其他入库',
  `sku_qty` varchar(64) DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_batch_inbound_id` (`batch_inbound_id`) USING BTREE,
  KEY `idx_inbound_type` (`inbound_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1565993949167726596 DEFAULT CHARSET=utf8mb4 COMMENT='批量入库结果'



wp_digital_retail
CREATE TABLE `stg_inbound_order_extra` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inbound_order_id` bigint(20) NOT NULL COMMENT '入库单id',
  `accessory_path` varchar(500) DEFAULT NULL COMMENT '附件路径',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) DEFAULT NULL COMMENT '制单人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_inbound_order_id` (`inbound_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1496679450082779138 DEFAULT CHARSET=utf8mb4



wp_digital_retail
CREATE TABLE `stock_idempotency_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `extend_type` tinyint(4) NOT NULL COMMENT '单据类型',
  `extend_id` bigint(20) NOT NULL COMMENT '单据ID',
  `extend_no` varchar(32) NOT NULL COMMENT '单据编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_type_id_no` (`extend_type`,`extend_id`,`extend_no`) USING BTREE COMMENT '幂等性校验'
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4 COMMENT='同步库存幂等性校验表'



wp_digital_retail
CREATE TABLE `store_channel_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `channel_id` bigint(20) NOT NULL COMMENT '渠道主键id标识',
  `shop_id` bigint(20) NOT NULL COMMENT '店铺主键id标识',
  `channel_name` varchar(64) NOT NULL COMMENT '渠道名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_shop_id_channel_id` (`shop_id`,`channel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689455048320253955 DEFAULT CHARSET=utf8mb4 COMMENT='门店渠道关联表'



wp_digital_retail
CREATE TABLE `store_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `account_id` varchar(32) DEFAULT NULL COMMENT '账户中心-账户id【未使用】',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '渠道id，已废弃【未使用】',
  `store_type` tinyint(4) NOT NULL COMMENT '门店类型：0加盟网店 1直营门店  2加盟门店',
  `store_code` varchar(64) NOT NULL COMMENT '门店编码',
  `store_abbr` varchar(64) DEFAULT NULL COMMENT '门店简称',
  `store_name` varchar(64) NOT NULL COMMENT '门店名称',
  `store_level_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店等级id【未使用】',
  `grade_desc` varchar(255) DEFAULT NULL COMMENT '等级描述【未使用】',
  `logo_file_id` bigint(20) DEFAULT NULL COMMENT '门店logo的OSS文件存储主键id',
  `store_logo` varchar(255) DEFAULT NULL COMMENT '门店logo',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `user` varchar(32) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `lng` decimal(10,7) DEFAULT NULL COMMENT '经度',
  `lat` decimal(10,7) DEFAULT NULL COMMENT '纬度',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  `map_tag_name` varchar(64) DEFAULT NULL COMMENT '地图标注名称【未使用】',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_creted_time` (`created_time`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COMMENT='门店信息表'



wp_digital_retail
CREATE TABLE `sys_data_dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `dict_code` varchar(32) NOT NULL COMMENT '字典code',
  `dict_val` varchar(128) NOT NULL COMMENT '字典值',
  `dict_desc` varchar(255) DEFAULT NULL COMMENT '字典描述',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4417 DEFAULT CHARSET=utf8mb4 COMMENT='数据字典'



wp_digital_retail
CREATE TABLE `system_export_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `operator_user_id` bigint(20) NOT NULL COMMENT '操作人id',
  `export_service_url` varchar(256) NOT NULL COMMENT '导出服务路径',
  `params` json NOT NULL COMMENT '请求参数',
  `number` int(11) NOT NULL COMMENT '导出条数',
  `file_name` varchar(64) NOT NULL COMMENT '导出文件名称',
  `merchant_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689921788093751299 DEFAULT CHARSET=utf8mb4 COMMENT='系统导出日志'



wp_digital_retail
CREATE TABLE `tenant_enterprise_code_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `enterprise_code` varchar(32) NOT NULL COMMENT '企业ID',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='租户与企业ID关联关系表'



wp_digital_retail
CREATE TABLE `tenant_initialization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `depot_type` tinyint(4) NOT NULL COMMENT '选择仓库类型:(1总仓,2:分仓)',
  `shopping_mall_name` varchar(255) NOT NULL DEFAULT 'H5商城' COMMENT '商城名称',
  `logo_url` varchar(255) DEFAULT '' COMMENT 'LOGO图片',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COMMENT='租户初始化记录表'



wp_digital_retail
CREATE TABLE `tenant_initialization_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `category_name` varchar(32) NOT NULL COMMENT '类目名称',
  `category_code` varchar(20) DEFAULT NULL COMMENT 'code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='租户初始化类目表'



wp_digital_retail
CREATE TABLE `tenant_initialization_guide` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `title_deputy` varchar(255) DEFAULT NULL COMMENT '副标题',
  `copy_button` varchar(255) DEFAULT NULL COMMENT '文案按钮',
  `button_url` varchar(255) DEFAULT NULL COMMENT '按钮链接',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  0：待完成 1：已完成 2：已忽略，默认为0',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型： 0 ：基础指引 1：操作指引',
  `mark_id` tinyint(50) NOT NULL DEFAULT '0' COMMENT '事项标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8mb4 COMMENT='智能指引指引事项'



wp_digital_retail
CREATE TABLE `tenant_initialization_remind` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  0：未点击不再提醒   1：已点击不再提醒    默认为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='租户的智能指引提醒记录'



wp_digital_retail
CREATE TABLE `token_scheduled` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用ID',
  `application_type` tinyint(32) DEFAULT NULL COMMENT '应用类型 (1-iamToken)',
  `application_value` varchar(255) DEFAULT NULL COMMENT '应用类型Value',
  `token_value` varchar(512) DEFAULT NULL COMMENT 'token值',
  `token_refresh_value` varchar(255) DEFAULT NULL COMMENT 'token刷新值',
  `expires_in` int(11) DEFAULT NULL COMMENT '过期时间（单位:秒）',
  `expires_time` datetime DEFAULT NULL COMMENT '过期时间',
  `refresh_time` datetime DEFAULT NULL COMMENT '刷新时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='token刷新存储实体'



wp_digital_retail
CREATE TABLE `wx_fans_unsubscribe_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '会员id',
  `media_app_id` varchar(32) DEFAULT NULL COMMENT '帐号',
  `unsubscribe_time` datetime DEFAULT NULL COMMENT '取消关注时间',
  `open_id` varchar(64) DEFAULT NULL COMMENT 'openID',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `subscribe` tinyint(1) DEFAULT NULL COMMENT '订阅状态',
  `version` int(10) DEFAULT NULL COMMENT '版本',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='粉丝取消关注信息表'



wp_digital_retail
CREATE TABLE `wx_template_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL COMMENT '创建人',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `updated_by` varchar(32) NOT NULL COMMENT '最后更新人',
  `template_category` int(11) NOT NULL COMMENT '模版消息类别 1 拼团消息 2 优惠券消息',
  `template_type` int(11) NOT NULL COMMENT '模版消息类型 1 开团成功 2 拼团成功 3 拼团失败 4 参团成功 5 优惠券领取成功 6 优惠券核销成功 7 优惠券过期提醒',
  `template_id` varchar(128) NOT NULL COMMENT '模版id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_template_id` (`template_id`) USING BTREE,
  KEY `idx_template_type` (`template_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信模版配置表'



wp_digital_retail
CREATE TABLE `wx_third_party_authorizer_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `app_id` bigint(20) DEFAULT NULL COMMENT 'appId',
  `component_app_id` varchar(32) DEFAULT NULL COMMENT '第三方appId',
  `authorizer_app_id` varchar(32) DEFAULT NULL COMMENT '授权方 appid',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `head_img` varchar(500) DEFAULT NULL COMMENT '头像',
  `service_type_info` varchar(255) DEFAULT NULL COMMENT '公众号类型 （0 订阅号 1升级后的订阅号 2服务号）json字符串',
  `verify_type_info` varchar(500) DEFAULT NULL COMMENT '认证类型（详见公众号认证类型）json字符串',
  `user_name` varchar(255) DEFAULT NULL COMMENT '原始ID',
  `principal_name` varchar(255) DEFAULT NULL COMMENT '主体名称',
  `alias` varchar(255) DEFAULT NULL COMMENT '公众号所设置的微信号，可能为空',
  `business_info` varchar(2000) DEFAULT NULL COMMENT '开通状况（0代表未开通，1代表已开通）json字符串',
  `qrcode_url` varchar(500) DEFAULT NULL COMMENT '二维码图片的 URL',
  `signature` varchar(255) DEFAULT NULL COMMENT '签名',
  `idc` varchar(20) DEFAULT NULL COMMENT 'idc',
  `authorization_info` text COMMENT '认证信息',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `auth_type` varchar(4) DEFAULT '1' COMMENT '帐号类型(1:公众号;2小程序)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4



wp_digital_retail
CREATE TABLE `wx_token_scheduled` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用ID',
  `wx_app_id` varchar(32) DEFAULT NULL COMMENT '微信appID',
  `token_name` varchar(255) DEFAULT NULL COMMENT 'token名称',
  `token_value` varchar(255) DEFAULT NULL COMMENT 'token值',
  `token_refresh_value` varchar(255) DEFAULT NULL COMMENT 'token刷新值',
  `expires_in` int(11) DEFAULT NULL COMMENT '过期时间（单位:秒）',
  `expires_time` datetime DEFAULT NULL COMMENT '过期时间',
  `refresh_time` datetime DEFAULT NULL COMMENT '刷新时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8



wp_digital_retail
CREATE TABLE `wx_user_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '会员id',
  `wx_app_id` varchar(32) DEFAULT NULL COMMENT '帐号',
  `nickname` varchar(50) DEFAULT NULL COMMENT '通讯地址',
  `province` varchar(50) DEFAULT NULL COMMENT '关注时间',
  `open_id` varchar(64) DEFAULT NULL COMMENT 'openID',
  `union_id` varchar(64) DEFAULT NULL COMMENT 'unionID',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像url',
  `privilege` varchar(255) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员社交信息表'


wp_domain_article
CREATE TABLE `glxy_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `last_depot_id` bigint(20) DEFAULT NULL COMMENT '最后所在仓库（全局）',
  `last_member_id` bigint(20) DEFAULT NULL COMMENT '最后所在会员（全局）',
  `extend_id` bigint(20) DEFAULT NULL COMMENT '关联创建单据ID（全局）',
  `extend_no` varchar(64) DEFAULT NULL COMMENT '关联创建单据编号（全局）',
  `extend_type` tinyint(1) DEFAULT NULL COMMENT '关联创建单据类型（全局）',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1624977349737500678 DEFAULT CHARSET=utf8mb4 COMMENT='物品主表'



wp_domain_article
CREATE TABLE `glxy_article_change` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `article_id` bigint(20) NOT NULL COMMENT '物品id',
  `change_type` tinyint(2) NOT NULL COMMENT '变更类型 1: 标签变更',
  `before_update_value` varchar(255) DEFAULT NULL COMMENT '调整前值',
  `after_update_value` varchar(255) DEFAULT NULL COMMENT '调整后值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物品调整记录表'



wp_domain_article
CREATE TABLE `glxy_article_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `article_id` bigint(20) NOT NULL COMMENT '物品ID',
  `type` varchar(64) NOT NULL COMMENT '唯一码类型:IME、IMEI、SN',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '唯一码',
  `reverse_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '唯一码反转编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1624977349771055110 DEFAULT CHARSET=utf8mb4 COMMENT='物品唯一码表'



wp_domain_article
CREATE TABLE `glxy_article_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `article_id` bigint(20) NOT NULL COMMENT '物品ID',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuID',
  `from_depot_id` bigint(20) DEFAULT NULL COMMENT '来源仓库ID',
  `from_member_id` bigint(20) DEFAULT NULL COMMENT '来源会员ID',
  `to_depot_id` bigint(20) DEFAULT NULL COMMENT '目的仓库ID',
  `to_member_id` bigint(20) DEFAULT NULL COMMENT '目的会员ID',
  `extend_no` varchar(64) DEFAULT NULL COMMENT '关联单据编号',
  `extend_id` bigint(20) DEFAULT NULL COMMENT '关联单据ID',
  `extend_type` tinyint(1) DEFAULT NULL COMMENT '关联单据类型',
  `order_type` tinyint(1) DEFAULT NULL COMMENT '关联订单单据类型:1-入库单、2-出库单、3-销售单、4-批发单',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1625051075120254978 DEFAULT CHARSET=utf8mb4 COMMENT='物品流转历史表'



wp_domain_article
CREATE TABLE `glxy_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `article_id` bigint(20) NOT NULL COMMENT '物品ID',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuID',
  `entry_time` datetime NOT NULL COMMENT '入库时间',
  `out_time` datetime DEFAULT NULL COMMENT '出库时间',
  `stock_label_id` bigint(20) DEFAULT NULL COMMENT '库存标签',
  `cost_price` decimal(20,6) NOT NULL COMMENT '唯一码成本',
  `reason` varchar(255) DEFAULT NULL COMMENT '入库原因',
  `status` tinyint(1) NOT NULL COMMENT '在库状态:1-在库、2-锁定、3-已出库',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商ID',
  `is_enabled` tinyint(1) NOT NULL COMMENT '商户过期状态:0-过期、1-未过期',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `inx_depot_id_sku_id` (`depot_id`,`sku_id`) USING BTREE COMMENT '仓库id  和 skuId 组合索引'
) ENGINE=InnoDB AUTO_INCREMENT=1624978337298960391 DEFAULT CHARSET=utf8mb4 COMMENT='物品库存表'



wp_domain_article
CREATE TABLE `glxy_inventory_change` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `inventory_id` bigint(20) NOT NULL COMMENT '物品入库ID',
  `extend_id` bigint(20) DEFAULT NULL COMMENT '扩展单ID',
  `extend_no` varchar(64) DEFAULT NULL COMMENT '扩展单编号',
  `change_type` tinyint(1) DEFAULT NULL COMMENT '变更类型:2-库存标签、1-成本',
  `before_value` varchar(64) DEFAULT NULL COMMENT '变更前值',
  `after_value` varchar(64) DEFAULT NULL COMMENT '变更后值',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物品库存变更表'



wp_domain_article
CREATE TABLE `stg_outbound_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `outbound_order_no` varchar(64) NOT NULL COMMENT '出库单号',
  `extend_no` varchar(64) DEFAULT NULL COMMENT '关联单号',
  `extend_id` bigint(20) DEFAULT NULL COMMENT '外部扩展id',
  `extend_type` tinyint(4) DEFAULT NULL COMMENT '外部扩展类型',
  `accessory_path` varchar(512) DEFAULT NULL COMMENT '出库单附件信息',
  `from_depot_id` bigint(20) NOT NULL COMMENT '发货仓库ID',
  `to_depot_id` bigint(20) DEFAULT NULL COMMENT '收货存储点ID',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `outbound_order_qty` decimal(20,2) DEFAULT NULL COMMENT '出库数量',
  `outbound_type` tinyint(2) NOT NULL COMMENT '出库类型',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '目的供应商（采购退货）',
  `from_member_id` bigint(20) DEFAULT NULL COMMENT '来源会员ID',
  `to_member_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `reason` varchar(256) DEFAULT NULL COMMENT '原因',
  `finance_check` tinyint(1) DEFAULT '0' COMMENT '财务复核（0 未复核 1 已复核）',
  `audit_date` datetime DEFAULT NULL COMMENT '订单审核时间',
  `audit_by` bigint(20) DEFAULT NULL COMMENT '审核人',
  `outbound_date` datetime DEFAULT NULL COMMENT '出库时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `from_terminal` int(10) DEFAULT NULL COMMENT '单据来源：1商户端 2门店端 3移动端 4外部单据',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_outbound_order_no` (`outbound_order_no`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_extend_no` (`extend_no`) USING BTREE,
  KEY `idx_from_depot_id_to_depot_id` (`from_depot_id`,`to_depot_id`) USING BTREE,
  KEY `idx_outbound_date` (`outbound_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='出库单表'



wp_domain_article
CREATE TABLE `stg_outbound_order_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `outbound_order_id` bigint(20) NOT NULL COMMENT '出库单ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuID',
  `sku_price` decimal(20,6) DEFAULT NULL COMMENT 'sku成本价',
  `sku_qty` decimal(20,2) NOT NULL COMMENT 'sku出库数量',
  `hang_bill_price` decimal(20,6) DEFAULT NULL COMMENT '挂账补贴金额',
  `real_sku_qty` decimal(20,6) DEFAULT NULL COMMENT '实际出库sku数量',
  `outbound_price` decimal(20,6) DEFAULT NULL COMMENT '出库价',
  `specification_convert_rate` decimal(20,6) DEFAULT NULL COMMENT '规格换算率',
  `sku_total_amount` decimal(20,6) DEFAULT NULL COMMENT '总成本',
  `outbound_total_amount` decimal(20,6) DEFAULT NULL COMMENT '总出库金额',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(32) DEFAULT NULL COMMENT '生产日期',
  `expiration_date` varchar(32) DEFAULT NULL COMMENT '效期',
  `validity_type` tinyint(2) DEFAULT NULL COMMENT '效期单位',
  `validity_value` int(10) DEFAULT NULL COMMENT '商品效期',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `front_unit_qty` decimal(20,2) DEFAULT NULL COMMENT '前端填写的大单位数量',
  `business_type` varchar(32) DEFAULT NULL COMMENT '业务类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='出库单详细表'



wp_domain_article
CREATE TABLE `tag_relation` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `group_id` bigint(20) NOT NULL COMMENT '标签组ID',
  `article_id` bigint(20) NOT NULL COMMENT '关联唯一码ID',
  `tag_id` bigint(20) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_tag_id` (`tag_id`) USING BTREE,
  KEY `idx_group_id` (`group_id`) USING BTREE,
  KEY `idx_article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签关联关系表'



wp_domain_commercial
CREATE TABLE `asset_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户',
  `type` int(11) NOT NULL COMMENT '资产类型;1固定资产 2租赁资产',
  `asset_no` varchar(32) NOT NULL COMMENT '资产编号',
  `status` tinyint(1) NOT NULL COMMENT '设备状态;1在月 0闲置',
  `name` varchar(64) NOT NULL COMMENT '设备名称',
  `shop_id` bigint(20) NOT NULL COMMENT '门店id',
  `shop_address` varchar(256) NOT NULL COMMENT '门店地址',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_asset_no_chain_id` (`asset_no`,`chain_id`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689116378024062979 DEFAULT CHARSET=utf8mb4 COMMENT='资产信息表'



wp_domain_commercial
CREATE TABLE `asset_transfer_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户',
  `asset_info_id` bigint(20) NOT NULL COMMENT '资产信息表id',
  `out_shop_id` bigint(20) NOT NULL COMMENT '迁出门店id',
  `out_shop_address` varchar(256) NOT NULL COMMENT '迁出门店地址',
  `out_merchant_id` bigint(20) NOT NULL COMMENT '迁出商户id',
  `in_shop_id` bigint(20) NOT NULL COMMENT '迁入门店id',
  `in_shop_address` varchar(256) NOT NULL COMMENT '迁入门店地址',
  `in_merchant_id` bigint(20) NOT NULL COMMENT '迁入商户id',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1689116381488558082 DEFAULT CHARSET=utf8mb4 COMMENT='资产迁移记录表'



wp_domain_commercial
CREATE TABLE `chain_info` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `chain_name` varchar(64) NOT NULL COMMENT '连锁名称',
  `merchant_num` int(11) NOT NULL COMMENT '连锁商户数量',
  `top_merchant_id` bigint(64) NOT NULL COMMENT '顶部商户id',
  `mer_id` varchar(64) DEFAULT NULL COMMENT '工行开卡收银账户',
  `enable_business_finance` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启业财一体化',
  `main` tinyint(1) NOT NULL DEFAULT '1' COMMENT '主副连锁 0副连锁 1主连锁',
  `main_chain_id` bigint(20) DEFAULT NULL COMMENT '主连锁id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_top_merchant_id_is_deleted` (`top_merchant_id`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689114309926006786 DEFAULT CHARSET=utf8mb4 COMMENT='连锁信息表'




wp_domain_commercial
CREATE TABLE `chain_merchant` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `chain_id` bigint(64) NOT NULL COMMENT '连锁主键id',
  `merchant_id` bigint(64) NOT NULL COMMENT '商户id',
  `parent_merchant_id` bigint(64) NOT NULL COMMENT '上级商户id',
  `current_level` bigint(64) NOT NULL COMMENT '当前商户连锁级别;0顶级10一级;20二级',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_merchant_id_is_deleted` (`merchant_id`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689166277868466179 DEFAULT CHARSET=utf8mb4 COMMENT='连锁商户表'



wp_domain_commercial
CREATE TABLE `customer_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `name` varchar(255) NOT NULL COMMENT '客户名称',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `contact_name` varchar(32) DEFAULT NULL COMMENT '联系人名字',
  `contact_phone` varchar(32) NOT NULL COMMENT '联系人电话',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `customer_code` varchar(255) DEFAULT NULL COMMENT '客户编码',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_customer_code` (`customer_code`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1675800578744451074 DEFAULT CHARSET=utf8mb4 COMMENT='客户信息表'



wp_domain_commercial
CREATE TABLE `merchant_account_bank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL DEFAULT '' COMMENT '租户id',
  `app_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `bank_name` varchar(64) DEFAULT '' COMMENT '银行账户名称',
  `bank_account` varchar(64) DEFAULT '' COMMENT '银行账号',
  `open_bank_name` varchar(128) DEFAULT NULL COMMENT '开户行名称',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `sub_branch_name` varchar(64) DEFAULT NULL COMMENT '支行名称',
  `account_type` int(2) NOT NULL DEFAULT '1' COMMENT '账号类型：1.商户账号2.供应商账号.3.客户账号merchant_id可以是商户id，也可以是供应商id，也可以是客户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_merchant_id_account_type` (`merchant_id`,`account_type`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689166277847494658 DEFAULT CHARSET=utf8mb4 COMMENT='商户银行账户表'



wp_domain_commercial
CREATE TABLE `merchant_credential` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `credential_name` varchar(255) DEFAULT NULL COMMENT '证件名称：比如合同名称、xx资质证明 【未使用】',
  `credential_type` tinyint(4) DEFAULT NULL COMMENT '证件类型：0营业执照 1合同、2资质证明 【未使用】',
  `credential_url` varchar(255) DEFAULT NULL COMMENT '证件url',
  `credential_file_id` bigint(20) NOT NULL COMMENT '商户营业执照OSS文件存储主键id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1610109558030843910 DEFAULT CHARSET=utf8mb4 COMMENT='商户证件表'



wp_domain_commercial
CREATE TABLE `merchant_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `account_id` varchar(32) DEFAULT NULL COMMENT '账户中心-账户id',
  `merchant_type` tinyint(4) NOT NULL COMMENT '商户类型：0 非直营商户 1直营商户',
  `merchant_name` varchar(64) DEFAULT NULL COMMENT '商户名称',
  `merchant_abbr_name` varchar(64) DEFAULT NULL COMMENT '商户简称【未使用】',
  `merchant_code` varchar(64) DEFAULT NULL COMMENT '商户编码',
  `merchant_level_id` bigint(20) DEFAULT NULL COMMENT '商户等级id',
  `company_name` varchar(64) DEFAULT NULL COMMENT '公司名称',
  `logo_file_id` bigint(20) DEFAULT NULL COMMENT '商户公司logo的OSS文件存储主键id',
  `company_logo` varchar(255) DEFAULT NULL COMMENT '公司logo',
  `company_profile` varchar(255) DEFAULT NULL COMMENT '公司简介',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT '公司详细地址',
  `social_credit_code` varchar(32) DEFAULT NULL COMMENT '社会信用代码',
  `contact_name` varchar(32) NOT NULL COMMENT '联系人名字',
  `contact_phone` varchar(32) NOT NULL COMMENT '联系人电话',
  `lng` decimal(10,7) DEFAULT NULL COMMENT '经度【未使用】',
  `lat` decimal(10,7) DEFAULT NULL COMMENT '纬度【未使用】',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  `online_shop_name` varchar(64) DEFAULT NULL COMMENT '网店名称【未使用】',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_merchant_name` (`merchant_name`) USING BTREE,
  KEY `idx_merchant_code` (`merchant_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689166277834911746 DEFAULT CHARSET=utf8mb4 COMMENT='商户信息表'



wp_domain_commercial
CREATE TABLE `merchant_legal_person_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `legal_name` varchar(32) DEFAULT NULL COMMENT '法人姓名',
  `card_type` tinyint(4) DEFAULT NULL COMMENT '证件类型:0 身份证',
  `card_no` varchar(32) DEFAULT NULL COMMENT '证件号',
  `card_head_url` varchar(255) DEFAULT NULL COMMENT '身份证头像图片',
  `head_file_id` bigint(20) DEFAULT NULL COMMENT '身份证头像图片文件OSS存储主键id',
  `card_flag_url` varchar(255) DEFAULT NULL COMMENT '身份证国旗图片',
  `flag_file_id` bigint(20) DEFAULT NULL COMMENT '身份证国旗图片文件OSS存储主键id',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689166277855883267 DEFAULT CHARSET=utf8mb4 COMMENT='商户法人信息'



wp_domain_commercial
CREATE TABLE `merchant_pay_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_code` varchar(255) NOT NULL DEFAULT '' COMMENT '账户code，请求支付中心使用',
  `account_name` varchar(255) NOT NULL DEFAULT '' COMMENT '账户名称',
  `channel_id` varchar(255) NOT NULL DEFAULT '' COMMENT '渠道id',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id',
  `account_status` varchar(5) NOT NULL DEFAULT 'I' COMMENT '账号开户状态 I:初始化;P:处理中;S开户成功;F;开户失败',
  `channel_account_no` varchar(255) NOT NULL DEFAULT '' COMMENT '支付中心返回支付账号',
  `channel_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '渠道费率 * 10000',
  `tenant_id` varchar(255) NOT NULL DEFAULT '' COMMENT '租户id',
  `app_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '接入方id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_account_code` (`account_code`) USING BTREE,
  KEY `idx_merchant_id_channel_id` (`merchant_id`,`channel_id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1687035797923303427 DEFAULT CHARSET=utf8mb4 COMMENT='商户支付各渠道账号信息'



wp_domain_commercial
CREATE TABLE `merchant_supplier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_code` varchar(64) NOT NULL DEFAULT '' COMMENT '供应商编码',
  `supplier_group` tinyint(4) NOT NULL DEFAULT '0' COMMENT '供应商分组；0国内1国外',
  `supplier_name` varchar(64) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `merchant_id` bigint(32) NOT NULL DEFAULT '0' COMMENT '商户id',
  `contact_name` varchar(32) NOT NULL DEFAULT '' COMMENT '联系人名字',
  `contact_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `tel` varchar(18) DEFAULT NULL COMMENT '座机',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  `remark` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `province_code` varchar(20) NOT NULL DEFAULT '' COMMENT '省code',
  `province_name` varchar(20) NOT NULL DEFAULT '' COMMENT '省name',
  `city_code` varchar(20) NOT NULL DEFAULT '' COMMENT '市code',
  `city_name` varchar(20) NOT NULL DEFAULT '' COMMENT '市name',
  `area_code` varchar(20) NOT NULL DEFAULT '' COMMENT '区域code',
  `area_name` varchar(20) NOT NULL DEFAULT '' COMMENT '区域name',
  `street_code` varchar(20) NOT NULL DEFAULT '' COMMENT '街道code',
  `street_name` varchar(20) NOT NULL DEFAULT '' COMMENT '街道name',
  `detailed_address` varchar(255) NOT NULL DEFAULT '' COMMENT '公司详细地址',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `tenant_id` varchar(32) NOT NULL DEFAULT '' COMMENT '租户id',
  `app_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_supplier_code` (`supplier_code`) USING BTREE,
  KEY `idx_supplier_name` (`supplier_name`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1688824128744402946 DEFAULT CHARSET=utf8mb4 COMMENT='商户供应商表'



wp_domain_commercial
CREATE TABLE `store_delivery` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `delivery_type` tinyint(4) DEFAULT NULL COMMENT '配送方式：0配送到家 1现场自提 2快递',
  `delivery_name` varchar(255) DEFAULT NULL COMMENT '配送方式名称',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '渠道id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689455048281329666 DEFAULT CHARSET=utf8mb4 COMMENT='门店配送方式'



wp_domain_commercial
CREATE TABLE `store_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `account_id` varchar(32) DEFAULT NULL COMMENT '账户中心-账户id【未使用】',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '渠道id，已废弃【未使用】',
  `store_type` tinyint(4) NOT NULL COMMENT '门店类型：0加盟网店 1直营门店  2加盟门店',
  `store_code` varchar(64) NOT NULL COMMENT '门店编码',
  `store_abbr` varchar(64) DEFAULT NULL COMMENT '门店简称',
  `store_name` varchar(64) NOT NULL COMMENT '门店名称',
  `store_level_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店等级id【未使用】',
  `grade_desc` varchar(255) DEFAULT NULL COMMENT '等级描述【未使用】',
  `logo_file_id` bigint(20) DEFAULT NULL COMMENT '门店logo的OSS文件存储主键id',
  `store_logo` varchar(255) DEFAULT NULL COMMENT '门店logo',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `user` varchar(32) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `lng` decimal(10,7) DEFAULT NULL COMMENT '经度',
  `lat` decimal(10,7) DEFAULT NULL COMMENT '纬度',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  `map_tag_name` varchar(64) DEFAULT NULL COMMENT '地图标注名称【未使用】',
  `bank_account_name` varchar(64) NOT NULL COMMENT '账户名称',
  `bank_account` varchar(32) NOT NULL COMMENT '银行账号',
  `bank_name` varchar(32) NOT NULL COMMENT '开户银行',
  `bank_city_code` varchar(20) NOT NULL COMMENT '开户城市code',
  `bank_city_name` varchar(20) NOT NULL COMMENT '开户城市名称',
  `bank_branch_name` varchar(64) DEFAULT NULL COMMENT '支行名称',
  `enterprise_nature` tinyint(4) NOT NULL DEFAULT '0' COMMENT '企业性质,0:小微企业，1:一般纳税人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_creted_time` (`created_time`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689455048268746754 DEFAULT CHARSET=utf8mb4 COMMENT='门店信息表'



wp_domain_commercial
CREATE TABLE `store_pay_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `store_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店id',
  `channel_id` varchar(255) NOT NULL DEFAULT '' COMMENT '渠道id',
  `account_code` varchar(255) NOT NULL DEFAULT '' COMMENT '支付中心账号',
  `channel_account_no` varchar(255) NOT NULL DEFAULT '' COMMENT '支付中心返回支付账号',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `tenant_id` varchar(255) NOT NULL DEFAULT '' COMMENT '租户id',
  `app_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '接入方id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL,
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account_code` (`account_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689461902424182795 DEFAULT CHARSET=utf8mb4 COMMENT='门店支付账号信息'



wp_domain_commercial
CREATE TABLE `tag_relation` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `group_id` bigint(20) NOT NULL COMMENT '标签组ID',
  `store_id` bigint(20) NOT NULL COMMENT '关联门店ID',
  `tag_id` bigint(20) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_tag_id` (`tag_id`) USING BTREE,
  KEY `idx_store_id` (`store_id`) USING BTREE,
  KEY `idx_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1686617040545517571 DEFAULT CHARSET=utf8mb4 COMMENT='标签关联关系表'



wp_domain_commodity
CREATE TABLE `category_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(20) NOT NULL COMMENT '类目id',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` varchar(255) NOT NULL COMMENT '创建人',
  `updated_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号，乐观锁',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品类目使用顺序表'



wp_domain_commodity
CREATE TABLE `commodity_barcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cspu_id` bigint(20) NOT NULL,
  `bar_code` varchar(20) NOT NULL,
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sku_id` (`cspu_id`) USING BTREE,
  KEY `idx_bar_code` (`bar_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882602328932354 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku条形码表'



wp_domain_commodity
CREATE TABLE `commodity_brand` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `chinese_name` varchar(64) NOT NULL COMMENT '品牌中文名',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(32) DEFAULT NULL COMMENT '商户id',
  `source` tinyint(4) DEFAULT NULL COMMENT '创建来源',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_marchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1686617887691145219 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='品牌表'



wp_domain_commodity
CREATE TABLE `commodity_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `name` varchar(32) NOT NULL COMMENT '类目名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类目的主键',
  `is_leaf` tinyint(4) DEFAULT NULL COMMENT '是否为叶子类目，1：是，0：否',
  `level` tinyint(4) NOT NULL COMMENT '从0开始，根目录为0，下一级为1 、2、3 ',
  `path` varchar(200) NOT NULL COMMENT '例子  1/10/100',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_enabled` tinyint(4) DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_parent_id` (`parent_id`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1685957175889567747 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='基础类目表'



wp_domain_commodity
CREATE TABLE `commodity_category_property_relationship` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `category_id` bigint(20) NOT NULL COMMENT '类目ID',
  `property_id` bigint(20) NOT NULL COMMENT '属性id',
  `is_required` tinyint(4) NOT NULL COMMENT '属性是否必填，1：必填，0：非必填',
  `property_types` tinyint(4) NOT NULL COMMENT '属性类型，1：关键属性，2：销售属性，3：非关键属性',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_category_id` (`category_id`) USING BTREE,
  KEY `idx_property_id` (`property_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1686261966024818696 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='类目和属性的关联关系表'



wp_domain_commodity
CREATE TABLE `commodity_category_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `type_code` varchar(32) NOT NULL COMMENT '类目类型代码：0为前台，1为后台，2为产品线',
  `type_name` varchar(32) NOT NULL COMMENT '类目类型名称',
  `root_category_id` bigint(20) NOT NULL COMMENT '前台根类目的主键id，关联`commodity_front_category`表的主键id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_category_id` (`root_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1685957175902150659 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='类目类型表'



wp_domain_commodity
CREATE TABLE `commodity_classify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL COMMENT '父节点id',
  `name` varchar(255) NOT NULL COMMENT '节点名',
  `path` varchar(255) NOT NULL COMMENT '节点路径',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `level` tinyint(4) NOT NULL,
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `type` tinyint(4) DEFAULT NULL COMMENT '分类类型 0为默认分类 不可删除不可编辑不可增加子分类',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `code` varchar(32) DEFAULT NULL COMMENT '编码',
  `source` tinyint(4) DEFAULT NULL COMMENT '来源:0为平台，1为商户',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689166277994463235 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品分类表'



wp_domain_commodity
CREATE TABLE `commodity_cspu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` varchar(32) NOT NULL COMMENT '应用id',
  `item_id` bigint(20) DEFAULT NULL COMMENT 'itemID',
  `name` varchar(256) DEFAULT NULL COMMENT 'sku名称',
  `name_fuzzy` varchar(256) DEFAULT NULL COMMENT '名称模糊',
  `code` varchar(64) NOT NULL COMMENT 'sku编号',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `bar_code` varchar(255) DEFAULT NULL COMMENT '条形码',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `merchant_id` bigint(32) DEFAULT NULL COMMENT '商户id',
  `unit_group_id` bigint(20) DEFAULT NULL COMMENT '单位',
  `source` tinyint(4) DEFAULT '0' COMMENT '来源:0为平台，1为商户',
  `category_id` bigint(20) NOT NULL COMMENT '类目ID',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌ID',
  `classify_id` bigint(32) DEFAULT NULL COMMENT '分类id',
  `item_name` varchar(255) DEFAULT NULL COMMENT 'item名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_item_id` (`item_id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882602320543746 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='spec信息表'



wp_domain_commodity
CREATE TABLE `commodity_cspu_property_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` varchar(32) NOT NULL COMMENT '应用id',
  `cspu_id` bigint(20) NOT NULL COMMENT 'cspu ID',
  `property_id` varchar(32) DEFAULT NULL COMMENT '属性ID',
  `property_value_id` varchar(32) DEFAULT NULL COMMENT '属性值ID',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `property_name` varchar(20) NOT NULL COMMENT '属性名',
  `property_value` varchar(64) DEFAULT NULL COMMENT '属性值',
  `property_code` varchar(32) DEFAULT NULL COMMENT '属性code',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_cspu_id` (`cspu_id`) USING BTREE,
  KEY `idx_property_id` (`property_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882602333126659 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='CSPU属性表'



wp_domain_commodity
CREATE TABLE `commodity_daily_report_classify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `code` varchar(32) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) NOT NULL COMMENT '节点名',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`chain_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品日报分类表'



wp_domain_commodity
CREATE TABLE `commodity_daily_report_classify_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daily_report_id` bigint(20) NOT NULL COMMENT '日报分类id',
  `classify_id` bigint(20) NOT NULL COMMENT '商品分类id',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`chain_id`) USING BTREE,
  KEY `idx_daily_report_id` (`daily_report_id`) USING BTREE,
  KEY `idx_classify_id` (`classify_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品日报分类关联商品分类表'



wp_domain_commodity
CREATE TABLE `commodity_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `category_id` bigint(20) NOT NULL COMMENT '类目ID',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌ID',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺ID',
  `code` varchar(32) NOT NULL COMMENT 'item编号',
  `name` varchar(255) NOT NULL COMMENT 'item名称',
  `name_fuzzy` varchar(256) DEFAULT NULL COMMENT '名称模糊',
  `major_picture` varchar(1024) DEFAULT NULL COMMENT '主图',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `source` tinyint(4) DEFAULT '0' COMMENT '来源:0为平台，1为商户',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `merchant_id` bigint(32) DEFAULT NULL COMMENT '商户id',
  `classify_id` bigint(32) DEFAULT NULL COMMENT '分类id',
  `unique_code` tinyint(4) DEFAULT NULL COMMENT '是否有唯一码 0无 1有',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `is_operator` tinyint(1) DEFAULT '0' COMMENT '是否运营商商品',
  `unit_mode` tinyint(4) NOT NULL COMMENT '计量方式 1.单计量 2.双计量',
  `unit_group_id` bigint(20) NOT NULL COMMENT '单位id',
  `batch_num_ctrl` tinyint(1) DEFAULT NULL COMMENT '批号管控',
  `validity_ctrl` tinyint(1) DEFAULT NULL COMMENT '效期管控',
  `validity_type` tinyint(4) DEFAULT NULL COMMENT '效期单位 1天、2月、3年',
  `validity_value` int(10) DEFAULT NULL COMMENT '商品效期',
  `virtualized` tinyint(1) DEFAULT NULL COMMENT '是否虚拟商品',
  `therapy_type` tinyint(4) DEFAULT NULL COMMENT '诊疗类型 0.挂号 1.检查 2.处方 3.处置',
  `rate_code` varchar(64) DEFAULT NULL COMMENT '税率编码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_category_id` (`category_id`) USING BTREE,
  KEY `idx_brand_id` (`brand_id`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_classify_id` (`classify_id`) USING BTREE,
  KEY `idx_code` (`code`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882602282795010 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='item基础信息表'


wp_domain_commodity
CREATE TABLE `commodity_item_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `item_id` bigint(20) NOT NULL COMMENT 'item ID',
  `picture` varchar(1024) DEFAULT NULL COMMENT '图片',
  `video` varchar(1024) DEFAULT NULL COMMENT '视频',
  `detail_content` longtext COMMENT 'spu图文详情',
  `terminal_type` tinyint(4) NOT NULL COMMENT '终端类型： 图片: 0,\n  视频: 1,\n  PC端: 2,\n  移动端: 3,',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1688730223658311689 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='item详情表'



wp_domain_commodity
CREATE TABLE `commodity_item_property` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `item_id` bigint(20) NOT NULL COMMENT 'item ID',
  `property_id` bigint(20) DEFAULT NULL COMMENT '关联属性ID',
  `property_name` varchar(32) NOT NULL COMMENT '属性名称',
  `property_type` tinyint(4) NOT NULL COMMENT '属性类型，1：关键属性，2：销售属性，3：非关键属性',
  `sort` int(11) DEFAULT '0' COMMENT '属性排序',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882602291183618 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='item属性表'



wp_domain_commodity
CREATE TABLE `commodity_item_property_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `item_id` bigint(20) NOT NULL COMMENT 'itemID',
  `item_property_id` bigint(20) NOT NULL COMMENT 'item属性ID',
  `property_value_id` bigint(20) DEFAULT NULL COMMENT '关联属性值ID',
  `property_value` varchar(64) DEFAULT NULL COMMENT '属性',
  `sort` int(11) DEFAULT '0' COMMENT '属性排序',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_item_id` (`item_id`) USING BTREE,
  KEY `idx_item_property_id` (`item_property_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882602295377923 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='item属性值表'



wp_domain_commodity
CREATE TABLE `commodity_item_release_version` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `item_id` bigint(32) NOT NULL COMMENT 'itemID',
  `item_detail` json NOT NULL COMMENT 'item详情',
  `release_version` int(11) NOT NULL COMMENT 'item版本',
  `unique` varchar(50) NOT NULL COMMENT 'itemId_releaseVersion组合字段',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNIQUE` (`unique`) USING BTREE,
  KEY `idx_item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882602421207043 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='item版本表'


wp_domain_commodity
CREATE TABLE `commodity_label_merchant` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` varchar(32) NOT NULL COMMENT '应用id',
  `label_id` bigint(20) DEFAULT NULL COMMENT 'i采购标签ID',
  `merchant_id` bigint(32) DEFAULT NULL COMMENT '商户id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='采购标签商户可见表'



wp_domain_commodity
CREATE TABLE `commodity_mnemonic_code_import` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` varchar(255) NOT NULL COMMENT '多选的商户ID',
  `status` tinyint(4) NOT NULL COMMENT '完成状态 0否 1是',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1649235408900997122 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku助记码导入批次'



wp_domain_commodity
CREATE TABLE `commodity_mnemonic_code_import_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `import_id` bigint(20) NOT NULL COMMENT '历史项ID',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId\r\n',
  `mnemonic_code` varchar(64) DEFAULT NULL COMMENT '零售价',
  `import_status` tinyint(5) NOT NULL COMMENT '导入状态，0失败 1成功',
  `import_result` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '导入结果',
  `submit_status` tinyint(5) NOT NULL COMMENT '递交状态，0未递交 1成功 2失败',
  `submit_result` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '递交结果',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `sku_code` varchar(64) DEFAULT NULL COMMENT 'sku编号',
  `sku_name` varchar(256) DEFAULT NULL COMMENT 'sku名称',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_import_id` (`import_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1649236251209515011 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku助记码导入批次详情'
wp_domain_commodity
CREATE TABLE `commodity_price_strategy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `name` varchar(255) NOT NULL COMMENT '价格策略名称',
  `code` varchar(32) NOT NULL COMMENT '编码',
  `start_time` datetime NOT NULL COMMENT '策略开始时间',
  `end_time` datetime NOT NULL COMMENT '策略结束时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  `status` int(4) NOT NULL COMMENT '状态 0未生效 1生效中 2已失效 3:作废',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689881140702068738 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品价格策略表'



wp_domain_commodity
CREATE TABLE `commodity_price_strategy_apply_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `price_control` int(4) NOT NULL COMMENT '价格管控 0弱管控 1强管控',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='价格策略应用配置表'



wp_domain_commodity
CREATE TABLE `commodity_price_strategy_shop` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `shop_id` bigint(20) NOT NULL COMMENT '门店ID',
  `strategy_id` bigint(20) NOT NULL COMMENT '价格策略ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE,
  KEY `idx_strategy_id` (`strategy_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689881140718845954 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='价格策略门店表'



wp_domain_commodity
CREATE TABLE `commodity_price_strategy_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `strategy_id` bigint(20) NOT NULL COMMENT '价格策略ID',
  `lowest_price` decimal(20,2) DEFAULT NULL COMMENT '最低零售价',
  `assessment_cost` decimal(20,2) DEFAULT NULL COMMENT '考核成本',
  `sale_price` decimal(20,2) DEFAULT NULL COMMENT '零售价',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_strategy_id` (`strategy_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689881140706263054 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='价格策略SKU表'



wp_domain_commodity
CREATE TABLE `commodity_property` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `property_name` varchar(32) NOT NULL COMMENT '属性名称',
  `input_type` tinyint(4) NOT NULL COMMENT '输入方式，1：多选，2：输入',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用,1启用,0不启用',
  `merchant_id` bigint(32) DEFAULT NULL COMMENT '商户id',
  `source` tinyint(4) DEFAULT NULL COMMENT '创建来源',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1685957287235756034 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='基础属性表'



wp_domain_commodity
CREATE TABLE `commodity_property_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `property_id` bigint(20) NOT NULL COMMENT '属性id',
  `property_value` varchar(64) DEFAULT NULL COMMENT '属性值',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(32) DEFAULT NULL COMMENT '商户id',
  `source` tinyint(4) DEFAULT NULL COMMENT '创建来源',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_property_id` (`property_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1685957287709712388 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='属性值表'



wp_domain_commodity
CREATE TABLE `commodity_purchase_prop_merchant` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` varchar(32) NOT NULL COMMENT '应用id',
  `purchase_prop_id` bigint(20) DEFAULT NULL COMMENT '采购属性ID',
  `merchant_id` bigint(32) DEFAULT NULL COMMENT '商户id',
  `is_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_purchase_prop_id` (`purchase_prop_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1635573937085931523 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='采购属性商户可见表'



wp_domain_commodity
CREATE TABLE `commodity_purchase_property` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `name` varchar(100) NOT NULL COMMENT '标签名',
  `code` varchar(20) NOT NULL COMMENT '标签编码',
  `type` tinyint(4) NOT NULL COMMENT '类型 1采购标签',
  `status` tinyint(1) NOT NULL COMMENT '状态 1启用，0禁用',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否默认字段',
  `created_by` bigint(20) DEFAULT NULL COMMENT '制单人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_code` (`code`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1635573936746192899 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC



wp_domain_commodity
CREATE TABLE `commodity_search_syn_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` tinyint(4) DEFAULT NULL COMMENT '同步类型 0全量同步，1增量同步',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='搜索中心同步记录'



wp_domain_commodity
CREATE TABLE `commodity_shop_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `item_id` bigint(20) NOT NULL COMMENT 'itemID',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuID',
  `channel_id` bigint(20) NOT NULL COMMENT '渠道ID',
  `shop_id` bigint(20) NOT NULL COMMENT '店铺ID',
  `release_version` bigint(20) NOT NULL COMMENT '版本号',
  `shop_sku` varchar(50) NOT NULL COMMENT 'shopId_skuId组合字段(废弃)',
  `shop_sku_version` varchar(64) NOT NULL COMMENT 'shopId_skuId_releaseVersion组合字段(废弃)',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `shop_sku_channel` varchar(80) DEFAULT NULL COMMENT 'shopId_skuId_channelId组合字段',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `sku_name` varchar(256) DEFAULT NULL COMMENT 'sku名称',
  `mnemonic_code` varchar(20) DEFAULT NULL COMMENT '助记码',
  `category_id` bigint(20) NOT NULL COMMENT '类目ID',
  `classify_id` bigint(32) DEFAULT NULL COMMENT '分类id',
  `item_name` varchar(255) DEFAULT NULL COMMENT 'item名称',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌ID',
  `sku_code` varchar(64) NOT NULL COMMENT 'sku编号',
  `therapy_type` tinyint(4) DEFAULT NULL COMMENT '诊疗类型 0.挂号 1.检查 2.处方 3.处置',
  `virtualized` tinyint(1) DEFAULT NULL COMMENT '是否虚拟商品',
  `disabled` tinyint(4) DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_shop_sku_version` (`shop_sku_version`) USING BTREE,
  KEY `idx_shop_sku` (`shop_sku`) USING BTREE,
  KEY `idx_item_id` (`item_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_shop_id_sku` (`shop_id`,`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882602731585541 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='item上架表'



wp_domain_commodity
CREATE TABLE `commodity_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `item_id` bigint(20) NOT NULL COMMENT 'itemID',
  `cspu_id` bigint(20) DEFAULT NULL COMMENT '关联CSPUID',
  `major_picture` varchar(255) DEFAULT NULL COMMENT '主图',
  `price` decimal(20,2) DEFAULT NULL COMMENT '价格',
  `unit_group_id` bigint(20) DEFAULT NULL COMMENT '单位',
  `code` varchar(64) NOT NULL COMMENT 'sku编号',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `bar_code` varchar(255) DEFAULT NULL COMMENT '商品条形码',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sku_name` varchar(256) DEFAULT NULL COMMENT 'sku名称',
  `sku_name_fuzzy` varchar(256) DEFAULT NULL COMMENT 'sku名称模糊',
  `purchase_price` decimal(20,2) DEFAULT NULL COMMENT '进货价-价格',
  `weight` decimal(16,4) DEFAULT NULL COMMENT '重量',
  `trade_price` tinyint(4) DEFAULT '0' COMMENT '批发价',
  `volume` decimal(16,4) DEFAULT NULL COMMENT '体积',
  `merchant_id` bigint(32) DEFAULT NULL COMMENT '商户id',
  `source` tinyint(4) DEFAULT '0' COMMENT '来源:0为平台，1为商户',
  `lowest_price` decimal(20,2) DEFAULT NULL COMMENT '最低零售价',
  `shop_id` bigint(32) DEFAULT NULL COMMENT '门店id',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `purchase_prop_id` bigint(20) DEFAULT NULL COMMENT '采购属性Id',
  `mapper_id` bigint(20) DEFAULT NULL COMMENT 'article_mapper对应表的ID',
  `is_disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `mnemonic_code` varchar(20) DEFAULT NULL COMMENT '助记码',
  `category_id` bigint(20) NOT NULL COMMENT '类目ID',
  `brand_id` bigint(20) NOT NULL COMMENT '品牌ID',
  `classify_id` bigint(32) DEFAULT NULL COMMENT '分类id',
  `item_name` varchar(255) DEFAULT NULL COMMENT 'item名称',
  `cspu_name` varchar(256) DEFAULT NULL COMMENT 'cspu名称',
  `therapy_type` tinyint(4) DEFAULT NULL COMMENT '诊疗类型 0.挂号 1.检查 2.处方 3.处置',
  `virtualized` tinyint(1) DEFAULT NULL COMMENT '是否虚拟商品',
  `unique_code` tinyint(4) DEFAULT NULL COMMENT '是否有唯一码 0无 1有',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_item_id` (`item_id`) USING BTREE,
  KEY `idx_code` (`code`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_cspu_id` (`cspu_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_mnemonic_code` (`mnemonic_code`) USING BTREE,
  KEY `idx_purchase_prop_id` (`purchase_prop_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882602366681090 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku表'

wp_domain_commodity
CREATE TABLE `commodity_sku_barcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) NOT NULL,
  `bar_code` varchar(20) NOT NULL,
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_bar_code` (`bar_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku条形码表'



wp_domain_commodity
CREATE TABLE `commodity_sku_no_price_ignore` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  `ignore_time` datetime NOT NULL COMMENT '忽略时间 在这之前的商品将不计入未维护的统计',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='未维护价格统计忽略表'



wp_domain_commodity
CREATE TABLE `commodity_sku_price` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `sale_price` decimal(20,2) DEFAULT NULL COMMENT '零售价',
  `purchase_price` decimal(20,2) DEFAULT NULL COMMENT '采购价',
  `lowest_price` decimal(20,2) DEFAULT NULL COMMENT '最低零售价',
  `assessment_cost` decimal(20,2) DEFAULT NULL COMMENT '考核成本',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882602605756423 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='SKU价格表'



wp_domain_commodity
CREATE TABLE `commodity_sku_price_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `price_id` bigint(20) NOT NULL COMMENT '价格ID',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `changed_field` varchar(255) DEFAULT NULL COMMENT '更新字段',
  `old_value` decimal(20,2) DEFAULT NULL COMMENT '老值',
  `new_value` decimal(20,2) DEFAULT NULL COMMENT '新值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_price_id` (`price_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689888789262876677 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='价格修改历史表'



wp_domain_commodity
CREATE TABLE `commodity_sku_price_import` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_ids` varchar(255) NOT NULL COMMENT '多选的商户ID',
  `created_merchant_id` bigint(20) NOT NULL COMMENT '导入记录的创建商户id',
  `status` tinyint(4) NOT NULL COMMENT '完成状态 0否 1是',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_ids`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1686268002924314626 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku价格导入批次'



wp_domain_commodity
CREATE TABLE `commodity_sku_price_import_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `import_id` bigint(20) NOT NULL COMMENT '历史项ID',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `sale_price` decimal(20,2) DEFAULT NULL COMMENT '零售价',
  `purchase_price` decimal(20,2) DEFAULT NULL COMMENT '采购价',
  `lowest_price` decimal(20,2) DEFAULT NULL COMMENT '最低零售价',
  `assessment_cost` decimal(20,2) DEFAULT NULL COMMENT '考核成本',
  `import_status` tinyint(5) NOT NULL COMMENT '导入状态，0失败 1成功',
  `import_result` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '导入结果',
  `submit_status` tinyint(5) NOT NULL COMMENT '递交状态，0未递交 1成功 2失败',
  `submit_result` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '递交结果',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `sku_code` varchar(64) DEFAULT NULL COMMENT 'sku编号',
  `sku_name` varchar(256) DEFAULT NULL COMMENT 'sku名称',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_import_id` (`import_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1686268002974646277 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku价格导入批次详情'



wp_domain_commodity
CREATE TABLE `commodity_sku_property_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku ID',
  `property_id` varchar(32) DEFAULT NULL COMMENT '属性ID',
  `property_value_id` varchar(32) DEFAULT NULL COMMENT '属性值ID',
  `property_name` varchar(20) NOT NULL COMMENT '属性名',
  `property_value` varchar(64) DEFAULT NULL COMMENT '属性值',
  `version` int(11) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku属性值表'



wp_domain_commodity
CREATE TABLE `commodity_sku_shop` (
  `id` bigint(20) NOT NULL,
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuID',
  `shop_id` bigint(20) NOT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='sku和门店关联表'



wp_domain_commodity
CREATE TABLE `commodity_unit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `group_id` bigint(32) DEFAULT NULL COMMENT '单位组ID',
  `unit_code` varchar(32) DEFAULT NULL COMMENT '单位编码',
  `unit_name` varchar(64) NOT NULL COMMENT '单位名称',
  `conversion_rate` double(20,4) DEFAULT NULL COMMENT '基准单位换算率',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689121639292059650 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='基准计量单位'



wp_domain_commodity
CREATE TABLE `commodity_unit_group` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `code` varchar(32) NOT NULL COMMENT '编码',
  `name` varchar(64) NOT NULL COMMENT '单位组名称',
  `unit_mode` tinyint(4) NOT NULL COMMENT '计量方式 1.单计量 2.双计量',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用,1启用,0不启用',
  `merchant_id` bigint(32) DEFAULT NULL COMMENT '商户id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689121639287865347 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='单位组表'



wp_domain_commodity
CREATE TABLE `commodity_unit_sub` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `group_id` bigint(32) DEFAULT NULL COMMENT '单位组ID',
  `unit_id` bigint(32) NOT NULL COMMENT '基准单位ID',
  `code` varchar(32) DEFAULT NULL COMMENT '单位编码',
  `name` varchar(64) NOT NULL COMMENT '单位名称',
  `conversion_rate` double(20,4) DEFAULT NULL COMMENT '非基准单位换算率',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `numerator` double(20,4) DEFAULT NULL COMMENT '换算分子',
  `denominator` double(20,4) DEFAULT NULL COMMENT '换算分母',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689121639329808386 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='非基准计量单位'



wp_domain_commodity
CREATE TABLE `item_import` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号，乐观锁',
  `is_deleted` tinyint(1) NOT NULL COMMENT '删除标识',
  `merchant_id` bigint(20) NOT NULL COMMENT '销售渠道主键id标识(商品所属渠道)',
  `category_id` bigint(20) DEFAULT NULL COMMENT '销售渠道商品编码',
  `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `source` tinyint(4) DEFAULT NULL COMMENT '创建来源',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  `count` int(20) DEFAULT NULL COMMENT '导入数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1688730224870465539 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品初始化导入记录'



wp_domain_commodity
CREATE TABLE `item_import_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `item_import_id` bigint(20) NOT NULL COMMENT 'app id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '类目id',
  `row_data` json DEFAULT NULL COMMENT '导入记录行JSON数据',
  `app_id` bigint(20) NOT NULL COMMENT 'app id',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1688730224958545925 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品初始化导入记录详情'



wp_domain_commodity
CREATE TABLE `sale_stock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `channel_id` bigint(20) NOT NULL COMMENT '渠道ID',
  `union_id` varchar(200) NOT NULL COMMENT '联合主键ID,shop_id+sku_id+channel_id',
  `shop_id` bigint(20) NOT NULL COMMENT '店铺ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuID',
  `salable_stock_qty` double(20,2) unsigned NOT NULL COMMENT '销售总库存数量，实际库存数量+锁定库存数量+虚拟库存',
  `available_stock_qty` double(20,2) unsigned NOT NULL COMMENT '实际库存数量',
  `lock_stock_qty` double(20,2) unsigned NOT NULL COMMENT '锁定库存数量',
  `saled_stock_qty` double(20,2) unsigned NOT NULL COMMENT '已销售库存数量',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `type` tinyint(4) DEFAULT '1' COMMENT '库存类型:1.虚拟库存2.实时库存(根据调度仓库变化)',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_union_id` (`union_id`) COMMENT '联合主键索引',
  KEY `index_shop_id_sku_id` (`shop_id`,`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689889532254470146 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku销售库存表'



wp_domain_commodity
CREATE TABLE `sale_stock_change` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `extend_type` tinyint(4) NOT NULL COMMENT '单据类型',
  `extend_no` varchar(32) NOT NULL COMMENT '单据号',
  `extend_id` bigint(20) DEFAULT NULL COMMENT '单据id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `app_id` bigint(32) NOT NULL COMMENT '应用ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929381212700674 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='库存变更批次表'



wp_domain_commodity
CREATE TABLE `sale_stock_change_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `sale_stock_change_id` bigint(20) NOT NULL COMMENT '变更批次ID',
  `sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `stock_type` tinyint(4) NOT NULL COMMENT '库存类型 1销售总库存，2实际库存，3锁定库存，4已销售库存',
  `pre_stock_qty` double(20,2) NOT NULL COMMENT '变更前库存',
  `change_stock_qty` double(20,2) NOT NULL COMMENT '库存变更数量',
  `post_stock_qty` double(20,2) NOT NULL COMMENT '变更后库存',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `shop_id` bigint(20) NOT NULL COMMENT '门店ID',
  `channel_id` bigint(20) NOT NULL COMMENT '渠道ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_stock_change_id` (`sale_stock_change_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929381237866498 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='库存变更明细表'



wp_domain_commodity
CREATE TABLE `tag_relation` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `group_id` bigint(20) NOT NULL COMMENT '标签组ID',
  `sku_id` bigint(20) NOT NULL COMMENT '关联skuID',
  `tag_id` bigint(20) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_tag_id` (`tag_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1686984843778752515 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='标签关联关系表'



wp_domain_k3cloud
CREATE TABLE `cpp_doc_receive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `business_id` bigint(20) NOT NULL COMMENT '门店id',
  `storage_id` bigint(20) NOT NULL COMMENT '仓库id',
  `book_id` bigint(64) NOT NULL COMMENT '账套id',
  `type` tinyint(4) NOT NULL COMMENT '金蝶单据类型 1：销售出库单，2：销售退货单',
  `doc_date` date NOT NULL COMMENT '业务单据日期',
  `doc_no` varchar(32) NOT NULL COMMENT '金蝶单据编号',
  `status` tinyint(4) NOT NULL COMMENT '状态;1待处理 2已处理 3失败',
  `json_object` json NOT NULL COMMENT '单据详情-JSON格式',
  `sale_org_code` varchar(64) DEFAULT NULL COMMENT '销售组织编码',
  `sale_org_name` varchar(64) DEFAULT NULL COMMENT '销售组织名称',
  `error_msg` varchar(2000) DEFAULT NULL COMMENT '同步错误信息',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_doc_no_type` (`doc_no`,`type`,`deleted`) USING BTREE,
  KEY `idx_book_id` (`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1674100354964959234 DEFAULT CHARSET=utf8mb4 COMMENT='接收单据表'



wp_domain_k3cloud
CREATE TABLE `cpp_doc_receive_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `type` int(4) DEFAULT NULL COMMENT '规则类型：1: 销售组织, 2：单据类型',
  `business_code` varchar(64) DEFAULT NULL COMMENT '编码',
  `business_name` varchar(64) DEFAULT NULL COMMENT '编码对应名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1675794501480394757 DEFAULT CHARSET=utf8mb4 COMMENT='金蝶账套业务映射配置'



wp_domain_k3cloud
CREATE TABLE `kd_base_bank_account_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除逻辑标记',
  `app_id` bigint(20) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '账套主键id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id;',
  `store_id` bigint(20) NOT NULL COMMENT '宠奇妙门店id',
  `store_name` varchar(64) NOT NULL COMMENT '宠奇妙门店name',
  `store_code` varchar(255) NOT NULL COMMENT '宠奇妙门店code',
  `bank_account_code` varchar(255) NOT NULL COMMENT '银行账号编码',
  `bank_account_name` varchar(255) NOT NULL COMMENT '银行账号名称',
  `kd_bank_account_code` varchar(255) DEFAULT NULL COMMENT '金蝶星空银行账号编码',
  `kd_bank_account_name` varchar(255) DEFAULT NULL COMMENT '金蝶星空银行账号名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_book_id_kd_bank_account` (`book_id`,`kd_bank_account_code`,`deleted`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_store_id` (`store_id`) USING BTREE,
  KEY `idx_consumer_id` (`consumer_id`) USING BTREE,
  KEY `idx_store_code` (`store_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='银行账号映射'



wp_domain_k3cloud
CREATE TABLE `kd_base_biz_type_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `biz_type_name` varchar(64) NOT NULL COMMENT '业务类型名称',
  `biz_type_code` varchar(64) NOT NULL COMMENT 'saas业务类型编码',
  `kd_id` varchar(64) DEFAULT NULL COMMENT '金蝶主键id,修改时必须要带',
  `kd_biz_type_name` varchar(255) NOT NULL COMMENT '金蝶业务类型名称',
  `kd_biz_type_code` varchar(255) NOT NULL COMMENT '金蝶业务类型编码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `consumer_id` bigint(20) NOT NULL COMMENT '商户id;业务调用方提供',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1679440754774908941 DEFAULT CHARSET=utf8mb4 COMMENT='业务类型资料映射表'



wp_domain_k3cloud
CREATE TABLE `kd_base_brand_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `brand_name` varchar(64) NOT NULL COMMENT '品牌名称',
  `brand_code` varchar(64) NOT NULL COMMENT '品牌编码',
  `kd_id` bigint(20) NOT NULL COMMENT '金蝶主键id,修改时必须要带',
  `kd_brand_name` varchar(255) NOT NULL COMMENT '金蝶品牌名称',
  `kd_brand_code` varchar(255) NOT NULL COMMENT '金蝶品牌编码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `consumer_id` bigint(20) NOT NULL COMMENT '商户id;业务调用方提供',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1686617888378204162 DEFAULT CHARSET=utf8mb4 COMMENT='品牌映射表'



wp_domain_k3cloud
CREATE TABLE `kd_base_category_map` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `book_id` bigint(64) NOT NULL COMMENT '账套id',
  `classify_id` bigint(20) NOT NULL COMMENT '商品分类id',
  `classify_code` varchar(255) NOT NULL DEFAULT '' COMMENT '宠奇妙商品分类编码',
  `classify_name` varchar(255) NOT NULL DEFAULT '' COMMENT '宠奇妙商品分类名称',
  `material_group_code` varchar(255) NOT NULL DEFAULT '' COMMENT '星空物料分组编码',
  `material_group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '星空物料分组名称',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(4) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除逻辑标记',
  `app_id` bigint(64) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id;',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_book_id_classfiy_code` (`book_id`,`classify_code`,`deleted`) USING BTREE,
  KEY `idx_book_id` (`book_id`) USING BTREE,
  KEY `idx_classfiy_code` (`classify_code`) USING BTREE,
  KEY `idx_material_group_code` (`material_group_code`) USING BTREE,
  KEY `idx_classify_id` (`classify_id`) USING BTREE,
  KEY `idx_consumer_id` (`consumer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1645310546608398376 DEFAULT CHARSET=utf8mb4 COMMENT='资料映射-商品分类映射'



wp_domain_k3cloud
CREATE TABLE `kd_base_customer_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `customer_id` bigint(20) NOT NULL COMMENT '客户id',
  `customer_code` varchar(64) NOT NULL COMMENT '客户编码',
  `customer_name` varchar(64) DEFAULT '' COMMENT '客户名称',
  `kd_customer_code` varchar(32) NOT NULL COMMENT '星空客户编码',
  `kd_customer_name` varchar(64) DEFAULT NULL COMMENT '星空客户名称',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id;',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_department_code_book_id_isdeleted` (`book_id`,`customer_code`,`deleted`) USING BTREE,
  KEY `idx_department_code` (`customer_code`) USING BTREE,
  KEY `idx_department_name` (`customer_name`) USING BTREE,
  KEY `idx_consumer_id` (`consumer_id`) USING BTREE,
  KEY `idx_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1675800579354046466 DEFAULT CHARSET=utf8mb4 COMMENT='账套客户映射资料'



wp_domain_k3cloud
CREATE TABLE `kd_base_department_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `department_id` bigint(20) NOT NULL COMMENT '门店id',
  `department_code` varchar(64) NOT NULL COMMENT '宠奇妙门店编码',
  `department_name` varchar(64) DEFAULT '' COMMENT '宠奇妙门店名称',
  `kd_department_code` varchar(64) NOT NULL COMMENT '星空部门编码',
  `kd_department_name` varchar(64) DEFAULT NULL COMMENT '星空部门名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_department_code_book_id_isdeleted` (`book_id`,`department_code`,`deleted`) USING BTREE,
  KEY `idx_department_code` (`department_code`) USING BTREE,
  KEY `idx_department_name` (`department_name`) USING BTREE,
  KEY `idx_consumer_id` (`consumer_id`) USING BTREE,
  KEY `idx_kd_department_code` (`kd_department_code`) USING BTREE,
  KEY `idx_kd_department_name` (`kd_department_name`) USING BTREE,
  KEY `idx_department_id` (`department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689455049147604995 DEFAULT CHARSET=utf8mb4 COMMENT='账套部门映射资料'



wp_domain_k3cloud
CREATE TABLE `kd_base_info_receive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `service_info_code` varchar(255) NOT NULL COMMENT '基础资料编码',
  `info_type` int(4) NOT NULL COMMENT '基础资料类型;1:SKU;2:供应商（待扩展）',
  `action` int(4) NOT NULL DEFAULT '1' COMMENT '操作类型:1新增,2修改,3删除',
  `service_date` date NOT NULL COMMENT '业务创建日期',
  `status` int(4) NOT NULL COMMENT '状态;1待处理 2已处理',
  `json_object` json NOT NULL COMMENT '单据详情-JSON格式',
  `send_doc_id` bigint(20) DEFAULT NULL COMMENT '推送金蝶基础信息表id;',
  `book_id` bigint(20) DEFAULT NULL COMMENT '账套id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id_info_type` (`consumer_id`,`info_type`) USING BTREE,
  KEY `service_info_code` (`service_info_code`,`info_type`) USING BTREE,
  KEY `idx_send_doc_id` (`send_doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1689882610998362114 DEFAULT CHARSET=utf8mb4 COMMENT='基础资料业务接收单据表'



wp_domain_k3cloud
CREATE TABLE `kd_base_info_send` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `book_id` bigint(20) DEFAULT NULL COMMENT '账套id',
  `kd_type` int(11) NOT NULL COMMENT '金蝶基础资料类型：1:物料',
  `service_info_code` varchar(32) NOT NULL DEFAULT '' COMMENT '金蝶基础资料编码',
  `status` int(11) NOT NULL COMMENT '状态;0同步中 1已成功 2已失败 3已作废',
  `error_msg` varchar(2000) DEFAULT NULL COMMENT '错误信息',
  `receive_id` bigint(20) DEFAULT NULL COMMENT '接收金蝶基础资料表id',
  `auto_retry_count` int(4) NOT NULL DEFAULT '0' COMMENT '自动推送重试次数，最多3次，间隔5分钟',
  `auto_retry_time` datetime DEFAULT NULL COMMENT '自动重试时间-默认值为创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_kd_info_code` (`service_info_code`) USING BTREE,
  KEY `idx_merchant_id_kd_type` (`consumer_id`,`kd_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882611099025411 DEFAULT CHARSET=utf8mb4 COMMENT='推送金蝶基础资料表'



wp_domain_k3cloud
CREATE TABLE `kd_base_info_send_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `app_id` bigint(20) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `send_doc_id` bigint(20) NOT NULL COMMENT '推送金蝶单据表id',
  `json_object` json NOT NULL COMMENT '单据详情-JSON格式',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_send_doc_id` (`send_doc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882611262603266 DEFAULT CHARSET=utf8mb4 COMMENT='推送金蝶单据详情表'



wp_domain_k3cloud
CREATE TABLE `kd_base_material_category_map` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `book_id` bigint(64) NOT NULL COMMENT '账套id',
  `first_classify_id` bigint(20) NOT NULL COMMENT '商品分类id',
  `first_classify_code` varchar(255) NOT NULL DEFAULT '' COMMENT '宠奇妙商品一级分类编码',
  `first_classify_name` varchar(255) NOT NULL DEFAULT '' COMMENT '宠奇妙商品一级分类名称',
  `kd_material_category_code` varchar(255) NOT NULL DEFAULT '' COMMENT '星空物料存货类别编码',
  `kd_material_category_name` varchar(255) NOT NULL DEFAULT '' COMMENT '星空物料存货类别名称',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(4) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除逻辑标记',
  `app_id` bigint(64) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id;',
  PRIMARY KEY (`id`),
  KEY `idx_first_classify_code` (`book_id`,`first_classify_code`) USING BTREE COMMENT '分类编码索引'
) ENGINE=InnoDB AUTO_INCREMENT=1673869545220841474 DEFAULT CHARSET=utf8mb4 COMMENT='存货类别映射表'



wp_domain_k3cloud
CREATE TABLE `kd_base_rate_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `kd_rate_code` varchar(64) NOT NULL COMMENT '金蝶税率编码',
  `kd_rate_name` varchar(64) DEFAULT NULL COMMENT '金蝶税率名称',
  `rate_code` varchar(64) DEFAULT NULL COMMENT '税率编码',
  `rate_name` varchar(64) DEFAULT NULL COMMENT '税率名称',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态;0停用1启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_rate_code` (`deleted`,`book_id`,`rate_code`) USING BTREE COMMENT '同账套下，税率编码唯一'
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='税率映射'



wp_domain_k3cloud
CREATE TABLE `kd_base_settle_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除逻辑标记',
  `app_id` bigint(20) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '账套主键id',
  `pay_type_id` bigint(20) DEFAULT NULL COMMENT '结算方式id',
  `pay_type_code` varchar(16) NOT NULL COMMENT '结算方式编码',
  `pay_type_name` varchar(16) NOT NULL COMMENT '结算方式名称',
  `kd_pay_type_code` varchar(32) NOT NULL COMMENT '星空结算方式编码',
  `kd_pay_type_name` varchar(64) DEFAULT NULL COMMENT '星空结算方式名称',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_book_id_pay_type_code` (`book_id`,`pay_type_code`,`deleted`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COMMENT='结算方式映射'



wp_domain_k3cloud
CREATE TABLE `kd_base_sku_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除逻辑标记',
  `app_id` bigint(20) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuid',
  `sku_code` varchar(32) NOT NULL COMMENT 'sku编码',
  `sku_name` varchar(256) NOT NULL COMMENT 'sku名称',
  `material_no` varchar(32) NOT NULL COMMENT '金蝶物料编号',
  `material_name` varchar(64) DEFAULT NULL COMMENT '金蝶物料名称',
  `rate_code` varchar(255) NOT NULL COMMENT '税率编码',
  `gift` tinyint(4) DEFAULT '0' COMMENT '是否为赠品 0：否 1：是',
  `stock_status` varchar(32) DEFAULT 'KCZT01_SYS' COMMENT '库存状态',
  `consumer_id` bigint(20) NOT NULL COMMENT '商户id;业务调用方提供',
  `unit_group_id` bigint(20) DEFAULT NULL COMMENT '单位组id',
  `kd_id` varchar(64) DEFAULT NULL COMMENT '金蝶主键id,修改时必须要带',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_book_id_sku_code` (`book_id`,`sku_code`,`deleted`) USING BTREE,
  KEY `idx_material_no` (`material_no`) USING BTREE,
  KEY `idx_sku_name` (`sku_name`) USING BTREE,
  KEY `idx_material_name` (`material_name`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_consumer_id` (`consumer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689179924798918659 DEFAULT CHARSET=utf8mb4 COMMENT='资料映射-sku映射'



wp_domain_k3cloud
CREATE TABLE `kd_base_storage_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `consumer_id` bigint(20) NOT NULL COMMENT '商户id;业务调用方提供',
  `storage_id` bigint(20) NOT NULL COMMENT '仓库id',
  `storage_code` varchar(32) NOT NULL COMMENT '仓库编码',
  `storage_name` varchar(64) DEFAULT NULL COMMENT '仓库名称',
  `kd_storage_code` varchar(32) NOT NULL COMMENT '星空仓库编码',
  `kd_storage_name` varchar(64) DEFAULT NULL COMMENT '星空仓库名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_book_id_storage_code` (`deleted`,`book_id`,`storage_code`) USING BTREE,
  KEY `idx_storage_id` (`storage_id`) USING BTREE,
  KEY `idx_consumer_id` (`consumer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1668516175794597894 DEFAULT CHARSET=utf8mb4 COMMENT='账套仓库映射资料'



wp_domain_k3cloud
CREATE TABLE `kd_base_supplier_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `supplier_id` bigint(20) NOT NULL COMMENT '供应商id',
  `supplier_code` varchar(64) NOT NULL COMMENT '供应商编码',
  `supplier_name` varchar(64) DEFAULT '' COMMENT '供应商名称',
  `kd_id` varchar(255) DEFAULT NULL COMMENT '金蝶单据主键',
  `kd_supplier_code` varchar(64) DEFAULT '' COMMENT '星空供应商编码',
  `kd_supplier_name` varchar(64) DEFAULT '' COMMENT '星空供应商名称',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_book_id_supplier_code_is_deleted` (`book_id`,`supplier_code`,`deleted`) USING BTREE,
  KEY `idx_supplier_code` (`supplier_code`) USING BTREE,
  KEY `idx_supplier_name` (`supplier_name`) USING BTREE,
  KEY `idx_kd_supplier_code` (`kd_supplier_code`) USING BTREE,
  KEY `idx_supplier_id` (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1688824130467639299 DEFAULT CHARSET=utf8mb4 COMMENT='供应商映射'



wp_domain_k3cloud
CREATE TABLE `kd_base_unit_map` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `book_id` bigint(64) NOT NULL COMMENT '账套id',
  `unit_group_id` bigint(20) DEFAULT NULL COMMENT '单位组id',
  `unit_group_name` varchar(255) DEFAULT NULL COMMENT '单位组名称',
  `unit_id` bigint(20) NOT NULL COMMENT '单位id',
  `unit_code` varchar(255) NOT NULL DEFAULT '' COMMENT '单位编码',
  `unit_name` varchar(255) NOT NULL DEFAULT '' COMMENT '单位名称',
  `kd_group_name` varchar(255) DEFAULT NULL COMMENT '金蝶单位组名称',
  `kd_unit_code` varchar(255) NOT NULL DEFAULT '' COMMENT '金蝶单位编码',
  `kd_unit_name` varchar(255) NOT NULL DEFAULT '' COMMENT '金蝶单位名称',
  `min_unit` tinyint(1) DEFAULT NULL COMMENT '是否小单位（1：是-小单位    0：否-大单位）,小单位就是金蝶基准单位',
  `current_unit_rate` decimal(20,2) DEFAULT NULL COMMENT '当前单位换算率，当前单位与小单位的换算率，小单位默认 1',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(4) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除逻辑标记',
  `app_id` bigint(64) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id;',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_book_id_unit_code` (`book_id`,`unit_code`,`deleted`) USING BTREE COMMENT '单位编码索引',
  KEY `idx_kd_unit_code` (`book_id`,`kd_unit_code`) USING BTREE COMMENT '金蝶单位编码索引'
) ENGINE=InnoDB AUTO_INCREMENT=1685840275478097924 DEFAULT CHARSET=utf8mb4 COMMENT='单位映射'



wp_domain_k3cloud
CREATE TABLE `kd_book_base_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除逻辑标记',
  `app_id` bigint(20) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:sku 2：结算方式 3：仓库  4：供应商  5：商品分类  6：银行账号  7：税率 8：客户 9：部门',
  `consumer_id` bigint(20) NOT NULL COMMENT '商户id;',
  `name` varchar(64) DEFAULT NULL COMMENT '类型对应名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_book_id_type` (`book_id`,`type`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689151547945799693 DEFAULT CHARSET=utf8mb4 COMMENT='金蝶账套资料映射基本表'



wp_domain_k3cloud
CREATE TABLE `kd_book_business` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `business_id` bigint(20) NOT NULL COMMENT '门店id',
  `business_code` varchar(64) NOT NULL COMMENT '门店编码',
  `kd_business_code` varchar(64) NOT NULL COMMENT '金蝶组织编码',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `storage_id` bigint(20) NOT NULL COMMENT '仓库id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态;0停用1启用',
  `merchant_id` bigint(20) NOT NULL COMMENT '当前门店所属的商户id',
  `kd_consumer_code` varchar(255) DEFAULT NULL COMMENT '金蝶客户编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_book_id_business_id_is_deleted` (`book_id`,`business_id`,`deleted`) USING BTREE,
  KEY `idx_business_id` (`business_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689152488988233731 DEFAULT CHARSET=utf8mb4 COMMENT='金蝶账套业务映射配置'



wp_domain_k3cloud
CREATE TABLE `kd_book_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `name` varchar(64) NOT NULL COMMENT '账套名称',
  `account_username` varchar(256) NOT NULL COMMENT '金蝶账套登陆账号',
  `account_password` varchar(256) NOT NULL COMMENT '金蝶账套账号登陆密码',
  `db_id` varchar(64) NOT NULL COMMENT '账套内码',
  `post_url` varchar(256) NOT NULL COMMENT '金蝶网址',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态;0停用1启用',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `consumer_name` varchar(64) DEFAULT '' COMMENT '顶部商户名称;',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689151547853524995 DEFAULT CHARSET=utf8mb4 COMMENT='金蝶账套'



wp_domain_k3cloud
CREATE TABLE `kd_doc_auto_retry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `send_id` bigint(20) NOT NULL COMMENT '单据推送主键id',
  `auto_retry_count` tinyint(4) NOT NULL COMMENT '自动推送重试次数，最多3次，间隔5分钟',
  `type` tinyint(4) DEFAULT NULL COMMENT '1: 订单同步 2：基础信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_send_id` (`send_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689882611099025411 DEFAULT CHARSET=utf8mb4 COMMENT='金蝶单据失败自动推送记录'



wp_domain_k3cloud
CREATE TABLE `kd_doc_config` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `type` int(11) NOT NULL COMMENT '金蝶单据类型;参考kd_doc_info表',
  `name` varchar(32) NOT NULL COMMENT '金蝶单据类型名称',
  `submit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否自动提交;0:否;1:是',
  `audit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否自动审核;0:否;1:是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uk_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='金蝶单据推送配置'



wp_domain_k3cloud
CREATE TABLE `kd_doc_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `doc_id` bigint(20) NOT NULL COMMENT '金蝶单据id',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级字段id 0代表根节点',
  `field_name` varchar(32) DEFAULT NULL COMMENT '字段中文名',
  `field` varchar(32) NOT NULL COMMENT '字段英文名',
  `field_type` int(11) NOT NULL DEFAULT '0' COMMENT '字段类型;0字符串/1数组/2数组对象/3对象',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除逻辑标记',
  `app_id` bigint(20) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  PRIMARY KEY (`id`,`app_id`) USING BTREE,
  KEY `idx_doc_id` (`doc_id`) USING BTREE,
  KEY `idx_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1682268583633965078 DEFAULT CHARSET=utf8mb4 COMMENT='金蝶单据字段表'


wp_domain_k3cloud
CREATE TABLE `kd_doc_field_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `doc_id` bigint(20) NOT NULL COMMENT '金蝶单据id',
  `doc_target_field_id` bigint(20) NOT NULL COMMENT '金蝶单据字段id',
  `mapping_field_name` varchar(32) NOT NULL COMMENT '映射字段名;根据字段名取值',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除逻辑标记',
  `app_id` bigint(20) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_doc_id` (`doc_id`) USING BTREE,
  KEY `idx_doc_target_field_id` (`doc_target_field_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=332713 DEFAULT CHARSET=utf8mb4 COMMENT='单据字段映射表'


wp_domain_k3cloud
CREATE TABLE `kd_doc_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `doc_name` varchar(32) NOT NULL COMMENT '单据名称;单据名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '单据类型;单据类型 1采购入库单 2采购退料单 3销售出库单4销售退货单 5直接调拨单 6其他出库单 7其他入库单 8收款单 9成本调整单',
  `doc_no` varchar(32) NOT NULL COMMENT '单据编码',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL DEFAULT '1196271598647115865' COMMENT '接入方id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_doc_no` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='金蝶单据表'



wp_domain_k3cloud
CREATE TABLE `kd_doc_receive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `business_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `book_id` bigint(64) DEFAULT NULL COMMENT '账套id',
  `type` tinyint(4) NOT NULL COMMENT '业务单据类型;上层业务定义自身单据类型，只做保存',
  `doc_date` date NOT NULL COMMENT '业务单据日期',
  `doc_no` varchar(32) NOT NULL COMMENT '单据编号',
  `status` tinyint(4) NOT NULL COMMENT '状态;1待处理 2已处理',
  `json_object` json NOT NULL COMMENT '单据详情-JSON格式',
  `send_doc_id` bigint(20) DEFAULT NULL COMMENT '推送金蝶单据表id',
  `kd_type` tinyint(4) NOT NULL COMMENT '单据类型;1采购入库单 2采购退料单 3销售出库单4销售退货单 5其他入库参数 6其他出库参数 7盘盈单 8盘亏单 9收款单 10退款单',
  `json_model_objects` json DEFAULT NULL COMMENT '单据列表详情-JSON格式',
  `merchant_id` bigint(20) NOT NULL COMMENT '当前门店所属的商户id',
  `next_node` int(4) DEFAULT NULL COMMENT '单据下个单据节点,如同步成功后,下次触发其他单据同步',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_doc_no_type_app_id` (`doc_no`,`type`,`app_id`) USING BTREE,
  KEY `idx_send_doc_id` (`send_doc_id`) USING BTREE,
  KEY `idx_doc_no` (`doc_no`) USING BTREE,
  KEY `idx_book_id` (`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689837204512075778 DEFAULT CHARSET=utf8mb4 COMMENT='接收单据表'



wp_domain_k3cloud
CREATE TABLE `kd_doc_send` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `consumer_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `business_id` bigint(20) NOT NULL COMMENT '门店id',
  `book_id` bigint(64) NOT NULL COMMENT '账套id',
  `type` tinyint(4) NOT NULL COMMENT '业务单据类型;上层传入',
  `doc_no` varchar(20) NOT NULL COMMENT '业务方订单编号',
  `doc_date` date NOT NULL COMMENT '业务单据日期',
  `kd_doc_no` varchar(32) NOT NULL DEFAULT '' COMMENT '金蝶单据编号',
  `kd_type` tinyint(4) NOT NULL COMMENT '单据类型;1采购入库单 2采购退料单 3销售出库单4销售退货单 5其他入库参数 6其他出库参数 7盘盈单 8盘亏单 9收款单 10退款单',
  `status` tinyint(4) NOT NULL COMMENT '状态;0处理中 1成功 2失败 3作废',
  `error_msg` varchar(2000) DEFAULT NULL COMMENT '同步错误信息',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '当前门店所属的商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_consoumer_id` (`consumer_id`) USING BTREE,
  KEY `idx_business_id` (`business_id`) USING BTREE,
  KEY `idx_kd_doc_no` (`kd_doc_no`) USING BTREE,
  KEY `idx_book_id` (`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689808910236413954 DEFAULT CHARSET=utf8mb4 COMMENT='推送金蝶单据表'



wp_domain_k3cloud
CREATE TABLE `kd_doc_send_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `send_doc_id` bigint(20) NOT NULL COMMENT '推送金蝶单据表id',
  `json_object` json NOT NULL COMMENT '单据详情-JSON格式',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_send_doc_id` (`send_doc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689808916292988931 DEFAULT CHARSET=utf8mb4 COMMENT='推送金蝶单据详情表'



wp_domain_k3cloud
CREATE TABLE `kd_fixed_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `book_id` bigint(20) NOT NULL COMMENT '账套id',
  `bill_type` int(11) NOT NULL COMMENT '参数类型;由上层业务调用传入',
  `field_key` varchar(32) NOT NULL COMMENT '字段',
  `field_value` varchar(64) NOT NULL COMMENT '字段值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_book_id` (`book_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1676050602166964266 DEFAULT CHARSET=utf8mb4 COMMENT='固定参数'



wp_domain_member
CREATE TABLE `breed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `name` varchar(32) NOT NULL COMMENT '品种名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父类id',
  `level` int(4) DEFAULT '0' COMMENT '层级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2296 DEFAULT CHARSET=utf8mb4 COMMENT='宠物品种表'



wp_domain_member
CREATE TABLE `card_template` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `name` varchar(50) NOT NULL COMMENT '卡模板名称',
  `code` varchar(32) NOT NULL COMMENT '卡模板编号',
  `card_type` tinyint(4) NOT NULL COMMENT '卡类型;0:储值卡;1:次卡,2:套餐卡',
  `validity_type` tinyint(4) NOT NULL COMMENT '有效期类型;0:自定义;1:长期有效',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `price` decimal(20,2) NOT NULL COMMENT '购卡金额',
  `commodity_discount` json DEFAULT NULL COMMENT '商品折扣',
  `give_item` tinyint(1) NOT NULL COMMENT '赠送项目;0:无;1:有',
  `merchant_type` tinyint(4) NOT NULL COMMENT '生效商户;0:全部;1:部分商户',
  `status` tinyint(4) NOT NULL COMMENT '状态;0:禁用,1:启用,2:作废',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `recharge_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '续充类型;0:不支持续充;1:续充（含赠送商品）,2:续充（不含赠送商品）',
  `give_rule` tinyint(4) NOT NULL DEFAULT '0' COMMENT '赠送规则：对于储蓄卡：0-全部；1-多选  对于次卡：0-单商品；1-多商品',
  `choose_count` int(4) DEFAULT NULL COMMENT '储蓄卡-多选 可选商品数量',
  `give_count` int(4) DEFAULT NULL COMMENT '储蓄卡-多选 实送数量/次卡-多商品 购买总次数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='卡模板主表'



wp_domain_member
CREATE TABLE `card_template_item` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `template_id` bigint(20) NOT NULL COMMENT '卡模板主表id',
  `type` tinyint(4) NOT NULL COMMENT '类型;0:金额;1:次数',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `price` decimal(20,2) DEFAULT '0.00' COMMENT '充值金额/次数/次卡-多商品-最多可用次数',
  `give_price` decimal(20,2) DEFAULT '0.00' COMMENT '赠送金额/次数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_templateId` (`template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='卡模板明细表'


wp_domain_member
CREATE TABLE `card_template_merchant` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `template_id` bigint(20) NOT NULL COMMENT '卡模板主表id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_templateId` (`template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='卡模板生效商户表'

wp_domain_member
CREATE TABLE `customer_origin` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `origin_type` varchar(32) NOT NULL COMMENT '客户来源',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 1:启用, 0:不启用',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户来源表'



wp_domain_member
CREATE TABLE `member` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账号id',
  `name` varchar(10) NOT NULL COMMENT '会员姓名',
  `code` varchar(32) NOT NULL COMMENT '会员编号',
  `sex` tinyint(4) NOT NULL COMMENT '性别;0:男;1:女',
  `phone` varchar(16) NOT NULL COMMENT '手机号',
  `phone_suffix` varchar(16) NOT NULL COMMENT '手机号后四位',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `merchant_id` bigint(20) NOT NULL COMMENT '顶部商户id',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '来源门店id',
  `source_merchant_id` bigint(20) NOT NULL COMMENT '来源商户id',
  `customer_origin_id` bigint(20) DEFAULT NULL COMMENT '客户来源id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_merchant_id_phone` (`merchant_id`,`phone`,`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员表'



wp_domain_member
CREATE TABLE `member_card` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `template_id` bigint(20) NOT NULL COMMENT '卡模板id',
  `template_name` varchar(50) NOT NULL COMMENT '卡模板名称',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `code` varchar(32) NOT NULL COMMENT '会员卡编号',
  `card_type` tinyint(4) NOT NULL COMMENT '卡类型;0:储值卡;1:次卡,2:套餐卡',
  `validity_type` tinyint(4) NOT NULL COMMENT '有效期类型;0:自定义;1:长期有效',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `price` decimal(20,2) NOT NULL COMMENT '购卡金额',
  `commodity_discount` json DEFAULT NULL COMMENT '商品折扣',
  `give_item` tinyint(1) NOT NULL COMMENT '赠送项目;0:无;1:有',
  `merchant_type` tinyint(4) DEFAULT NULL COMMENT '生效商户;0:全部;1:部分商户',
  `merchant_id` bigint(20) NOT NULL COMMENT '开卡商户id',
  `shop_id` bigint(20) NOT NULL COMMENT '开卡门店id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `status` tinyint(4) NOT NULL COMMENT '状态;-1:待支付,0:未生效,1:生效中,2:消费完成,3:已过期,4:已作废',
  `invalid_reason` varchar(255) DEFAULT NULL COMMENT '作废原因',
  `recharge_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '续充类型;0:不支持续充;1:续充（含赠送商品）,2:续充（不含赠送商品）',
  `accumulate_recharge_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '累计购买的充值金额',
  `accumulate_recharge_times` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '累计购买的充值次数',
  `accumulate_give_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '累计购买的赠送金额',
  `accumulate_give_times` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '累计购买的赠送次数',
  `accumulate_consume_recharge_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '累计消费的充值金额',
  `accumulate_consume_recharge_times` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '累计消费的充值次数',
  `accumulate_consume_give_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '累计消费的赠送金额',
  `accumulate_consume_give_times` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '累计消费的赠送次数',
  `balance_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '剩余的可用金额',
  `balance_times` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '剩余的可用次数',
  `refund_amount` decimal(20,2) DEFAULT NULL COMMENT '退卡金额',
  `give_rule` tinyint(4) NOT NULL DEFAULT '0' COMMENT '赠送规则：对于储蓄卡：0-全部；1-多选  对于次卡：0-单商品；1-多商品',
  `use_count` int(4) DEFAULT NULL COMMENT '次卡-多商品 使用总次数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_memberId` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员卡表'



wp_domain_member
CREATE TABLE `member_card_amount_item` (
  `id` bigint(32) NOT NULL COMMENT 'ID',
  `created_by` bigint(32) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(32) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(32) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `member_card_id` bigint(32) NOT NULL COMMENT '会员卡id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型，0：开卡,1：续充',
  `weight` tinyint(4) NOT NULL DEFAULT '1' COMMENT '消费权重',
  `price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `usable_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '充值可用金额',
  `give_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '赠送金额',
  `usable_give_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '赠送可用金额',
  `rate` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '充值金额消费比率',
  `order_id` bigint(32) DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_memberCardId` (`member_card_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员卡金额明细表'



wp_domain_member
CREATE TABLE `member_card_amount_log` (
  `id` bigint(32) NOT NULL COMMENT 'ID',
  `created_by` bigint(32) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(32) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(32) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `member_id` bigint(32) NOT NULL COMMENT '会员id',
  `member_card_id` bigint(32) NOT NULL COMMENT '会员卡id',
  `extend_id` bigint(32) DEFAULT NULL COMMENT '关联外部单号id',
  `extend_no` varchar(32) NOT NULL COMMENT '关联外部单号',
  `merchant_id` bigint(32) NOT NULL COMMENT '商户id',
  `shop_id` bigint(32) NOT NULL COMMENT '门店id',
  `reduce_type` tinyint(4) NOT NULL COMMENT '消费类型;0:扣减;1:退回',
  `turnover_amount` decimal(20,2) DEFAULT '0.00' COMMENT '营业额',
  `total_price` decimal(20,2) NOT NULL COMMENT '消费的总金额',
  `price` decimal(20,2) NOT NULL COMMENT '消费的充值金额',
  `give_price` decimal(20,2) NOT NULL COMMENT '消费的赠送金额',
  `card_amount_item_id` bigint(32) DEFAULT NULL COMMENT '会员卡金额明细id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_memberId` (`member_id`) USING BTREE,
  KEY `idx_memberCardId` (`member_card_id`) USING BTREE,
  KEY `idx_extendNo` (`extend_no`) USING BTREE,
  KEY `idx_extendId` (`extend_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员卡金额明细消费记录表'



wp_domain_member
CREATE TABLE `member_card_item` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `member_card_id` bigint(20) NOT NULL COMMENT '会员卡id',
  `type` tinyint(4) NOT NULL COMMENT '类型;0:开卡;1:续充',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `sku_price` decimal(20,2) DEFAULT NULL COMMENT '商品零售价',
  `shared_price` decimal(20,4) DEFAULT NULL COMMENT '商品单次均摊价',
  `total_shared_price` decimal(20,2) DEFAULT NULL COMMENT '商品总均摊价',
  `weight` tinyint(4) NOT NULL DEFAULT '1' COMMENT '消费权重',
  `price` decimal(20,2) DEFAULT '0.00' COMMENT '充值金额/次数/次卡-多商品-最多次数',
  `usable_price` decimal(20,2) DEFAULT '0.00' COMMENT '充值可用金额/次数/次卡-多商品-可用最多次数',
  `give_price` decimal(20,2) DEFAULT '0.00' COMMENT '赠送金额/次数',
  `usable_give_price` decimal(20,2) DEFAULT '0.00' COMMENT '赠送可用金额/次数',
  `rate` decimal(20,4) DEFAULT '0.0000' COMMENT '充值金额消费比率',
  `order_id` bigint(32) DEFAULT NULL COMMENT '订单id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_memberCardId` (`member_card_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员卡明细表'


wp_domain_member
CREATE TABLE `member_card_log` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `member_card_id` bigint(20) NOT NULL COMMENT '会员卡id',
  `extend_id` bigint(20) DEFAULT NULL COMMENT '关联外部单号id',
  `extend_no` varchar(32) NOT NULL COMMENT '关联外部单号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `sku_price` decimal(20,2) DEFAULT NULL COMMENT '商品零售价',
  `shared_price` decimal(20,4) DEFAULT NULL COMMENT '商品均摊价',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `shop_id` bigint(20) NOT NULL COMMENT '门店id',
  `reduce_type` tinyint(4) NOT NULL COMMENT '消费类型;0:扣减;1:退回',
  `total_price` decimal(20,2) NOT NULL COMMENT '消费的总充值金额/次数',
  `price` decimal(20,2) NOT NULL COMMENT '消费的充值金额/次数',
  `give_price` decimal(20,2) NOT NULL COMMENT '消费的赠送金额/次数',
  `card_item_id` bigint(20) DEFAULT NULL COMMENT '会员卡明细id',
  `turnover_amount` decimal(20,2) DEFAULT '0.00' COMMENT '营业额',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_memberId` (`member_id`) USING BTREE,
  KEY `idx_memberCardId` (`member_card_id`) USING BTREE,
  KEY `idx_extendNo` (`extend_no`),
  KEY `idx_extendId` (`extend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员卡消费记录表'



wp_domain_member
CREATE TABLE `member_card_merchant` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `member_card_id` bigint(20) NOT NULL COMMENT '会员卡id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_memberCardId` (`member_card_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员卡生效商户表'



wp_domain_member
CREATE TABLE `member_card_recharge_log` (
  `id` bigint(32) NOT NULL COMMENT 'ID',
  `created_by` bigint(32) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(32) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(32) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `member_id` bigint(32) NOT NULL COMMENT '会员id',
  `member_card_id` bigint(32) NOT NULL COMMENT '会员卡id',
  `extend_id` bigint(32) DEFAULT NULL COMMENT '关联外部单号id',
  `extend_no` varchar(32) DEFAULT NULL COMMENT '关联外部单号',
  `merchant_id` bigint(32) NOT NULL COMMENT '商户id',
  `shop_id` bigint(32) NOT NULL COMMENT '门店id',
  `amount` decimal(20,2) NOT NULL COMMENT '开卡/续充金额',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态,0:待支付,1:已支付',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型;0:开卡;1:续充',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_memberId` (`member_id`) USING BTREE,
  KEY `idx_memberCardId` (`member_card_id`) USING BTREE,
  KEY `idx_extendNo` (`extend_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员卡开卡/续充记录表'



wp_domain_member
CREATE TABLE `merchant_relation_temp` (
  `merchant_id` bigint(20) DEFAULT NULL,
  `merchant_name` varchar(200) DEFAULT NULL,
  `new_merchant_id` bigint(20) DEFAULT NULL,
  `new_merchant_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商户映射临时表'



wp_domain_member
CREATE TABLE `pet_info` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `name` varchar(10) NOT NULL COMMENT '宠物姓名',
  `breed` bigint(20) NOT NULL COMMENT '宠物品种',
  `sex` int(4) NOT NULL COMMENT '宠物性别;0:公;1:母',
  `weight` varchar(10) DEFAULT NULL COMMENT '宠物体重',
  `birthday` datetime DEFAULT NULL COMMENT '宠物出生日期',
  `sterilization` int(4) DEFAULT NULL COMMENT '是否绝育  1:未绝育 2:已绝育 3:未知',
  `vaccine_status` tinyint(4) DEFAULT NULL COMMENT '疫苗接种情况;-1:未接种任何疫苗,0:只接种狂犬疫苗,1:只接种三联/六联疫苗,2:接种全部疫苗',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `class_id` int(4) DEFAULT NULL COMMENT '宠物种类 1:猫,2:狗,3:其他',
  `card_no` varchar(100) DEFAULT NULL COMMENT '证件号码',
  `hair_color` varchar(64) DEFAULT NULL COMMENT '毛发颜色',
  `lineage` int(4) DEFAULT NULL COMMENT '血统 1:纯种 2:混血 3:未知',
  `chip_no` varchar(100) DEFAULT NULL COMMENT '芯片号码',
  `img_id` bigint(20) DEFAULT NULL COMMENT '宠物照片',
  `hair_length_type` int(4) DEFAULT NULL COMMENT '毛发长度类型 1：短毛  2：长毛 3：无毛',
  `expelling_parasite` tinyint(1) DEFAULT NULL COMMENT '驱虫情况  0：未驱虫   1： 已驱虫',
  `code` varchar(32) DEFAULT NULL COMMENT '宠物编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_memberId` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员表'



wp_domain_member
CREATE TABLE `shop_relation_temp` (
  `shop_id` bigint(20) DEFAULT NULL,
  `merchant_id` bigint(20) DEFAULT NULL,
  `new_shop_id` bigint(20) DEFAULT NULL,
  `new_merchant_id` bigint(20) DEFAULT NULL,
  `shop_name` varchar(200) DEFAULT NULL,
  `merchant_name` varchar(200) DEFAULT NULL,
  `new_shop_name` varchar(200) DEFAULT NULL,
  `new_merchant_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='门店新老连锁映射关系表'



wp_domain_member
CREATE TABLE `sku_relation_temp` (
  `sku_id` bigint(20) DEFAULT NULL,
  `sku_code` varchar(200) DEFAULT NULL,
  `sku_name` varchar(200) DEFAULT NULL,
  `new_sku_id` bigint(20) DEFAULT NULL,
  `new_sku_code` varchar(200) DEFAULT NULL,
  `new_sku_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='SKU映射临时表'



wp_domain_permission
CREATE TABLE `menu_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建者',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` bigint(20) NOT NULL COMMENT '账号id',
  `menu_list` varchar(255) NOT NULL COMMENT '菜单id集合',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1666366027314421762 DEFAULT CHARSET=utf8mb4 COMMENT='快捷菜单'



wp_domain_permission
CREATE TABLE `system_account_app_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `account_id` bigint(20) NOT NULL COMMENT '账户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_account_id` (`account_id`,`app_id`) USING BTREE,
  KEY `app_id` (`app_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1504374528184492036 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账户应用关联关系表'



wp_domain_permission
CREATE TABLE `system_account_authentication` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `account_id` bigint(20) NOT NULL,
  `authentication_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '认证键 类似账户名称',
  `authentication_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '认证唯一标识 类似密码',
  `authentication_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_authentication_key` (`authentication_key`,`is_deleted`,`tenant_id`) USING BTREE,
  KEY `idx_accountId` (`account_id`) USING BTREE,
  KEY `idx_authentication_key` (`authentication_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689545024995713027 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账户登录认证信息表'



wp_domain_permission
CREATE TABLE `system_account_data_scope` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `account_id` bigint(20) NOT NULL COMMENT '账号id',
  `platform_type` int(11) NOT NULL DEFAULT '0' COMMENT '平台类型 1运营平台 2商户平台 3门店平台 4会员平台',
  `scope_type` tinyint(4) NOT NULL COMMENT '权限类型 0门店id 1商户id',
  `scope_value` varchar(2000) NOT NULL COMMENT '范围对象 逗号分隔',
  `full_authority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0部分权限1全部权限',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_account_platform_scope` (`account_id`,`platform_type`,`scope_type`,`is_deleted`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689545471974301699 DEFAULT CHARSET=utf8mb4 COMMENT='账号数据权限'



wp_domain_permission
CREATE TABLE `system_account_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `login_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '账户名字',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:禁用 1:启用',
  `source_type` int(11) NOT NULL DEFAULT '0' COMMENT '来源类型 1内部用户 2会员',
  `source_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_source` (`is_deleted`,`source_type`,`source_id`) USING BTREE,
  UNIQUE KEY `uk_login_name` (`login_name`,`is_deleted`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689545024987324418 DEFAULT CHARSET=utf8mb4 COMMENT='账户表'



wp_domain_permission
CREATE TABLE `system_account_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账户id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `platform_type` int(11) DEFAULT '0' COMMENT '平台类型 0公共 1运营平台 2商户平台 3门店平台 4会员平台',
  `remote_request_ip` varchar(128) DEFAULT '0' COMMENT '请求ip',
  `ip_city` varchar(128) DEFAULT NULL COMMENT '请求ip的城市相关信息',
  `browser_name` varchar(128) DEFAULT '0' COMMENT '浏览器名称',
  `browser_type` varchar(128) DEFAULT NULL COMMENT '浏览器类型',
  `browser_version` varchar(128) DEFAULT NULL COMMENT '浏览器版本',
  `operating_system` varchar(128) DEFAULT NULL COMMENT '操作系统名称',
  `device_type` varchar(128) DEFAULT NULL COMMENT '访问设备类型',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_account_id` (`account_id`) USING BTREE COMMENT '账号id索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689934890606649347 DEFAULT CHARSET=utf8mb4 COMMENT='账户登录日志表'



wp_domain_permission
CREATE TABLE `system_account_platform` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `account_id` bigint(20) NOT NULL COMMENT '帐号id',
  `platform_type` int(11) NOT NULL DEFAULT '0' COMMENT '平台类型 0公共 1运营平台 2商户平台 3门店平台 4会员平台',
  `organization_id` bigint(20) NOT NULL COMMENT '归属组织id',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id 非商户内人员填0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_account_platform_type` (`account_id`,`platform_type`,`is_deleted`) USING BTREE,
  KEY `idx_merchant_organization` (`merchant_id`,`organization_id`,`platform_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689545471949135874 DEFAULT CHARSET=utf8mb4 COMMENT='账户平台表'



wp_domain_permission
CREATE TABLE `system_account_qual` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `type` tinyint(4) NOT NULL COMMENT '资质类型;1:医生;2:护士',
  `user_id` bigint(64) NOT NULL COMMENT '人员id',
  `account_id` bigint(64) NOT NULL COMMENT '账户id',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `number` varchar(32) DEFAULT NULL COMMENT '资质编号',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1689247379509075971 DEFAULT CHARSET=utf8mb4 COMMENT='人员资质管理'



wp_domain_permission
CREATE TABLE `system_account_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `account_id` bigint(20) NOT NULL COMMENT '账号id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `platform_type` int(11) NOT NULL DEFAULT '0' COMMENT '平台类型 1运营平台 2商户平台 3门店平台 4会员平台',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE,
  KEY `idx_account_platform` (`account_id`,`platform_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689545471965913094 DEFAULT CHARSET=utf8mb4 COMMENT='账号角色表'



wp_domain_permission
CREATE TABLE `system_account_third_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `tenant_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '租户id',
  `account_id` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '账号id',
  `avatar` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像url',
  `nickname` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '第三方名称',
  `platform_user_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '第三方id',
  `type` int(10) DEFAULT NULL COMMENT '第三方类型0:微信公众号,1:三方APP,2微信小程序',
  `platform_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '第三方平台ID',
  `union_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'union_id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_accountid_platformid` (`account_id`,`platform_id`,`is_deleted`) USING BTREE COMMENT '同一账号只能绑定一个微信',
  KEY `idx_tenant_id_platform_user_id` (`tenant_id`,`platform_user_id`) USING BTREE COMMENT '根据openid查询用户'
) ENGINE=InnoDB AUTO_INCREMENT=1569581061019451394 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='第三方表'



wp_domain_permission
CREATE TABLE `system_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名称',
  `is_outer_app` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否外部应用 1是 0否',
  `platform_type` int(11) NOT NULL DEFAULT '0' COMMENT '平台类型 0公共 1运营平台 2商户平台 3门店平台 4会员平台',
  `permission_controlled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否参与配置 0否 1是',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应用编号',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `status` tinyint(1) NOT NULL COMMENT '是否可用',
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`,`is_deleted`) USING BTREE,
  UNIQUE KEY `uk_clientId` (`client_id`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1559735569515413506 DEFAULT CHARSET=utf8mb4



wp_domain_permission
CREATE TABLE `system_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `code` varchar(255) NOT NULL COMMENT '菜单编码',
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `icon` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单图标',
  `path_url` varchar(256) NOT NULL COMMENT '菜单url（用于前端路由）',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级菜单id',
  `is_leaf` tinyint(1) NOT NULL COMMENT '是否叶子节点;0否1是',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:禁用，1:启用',
  `sort` int(10) NOT NULL COMMENT '排序',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型 1菜单 2按钮',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`,`is_deleted`,`tenant_id`,`app_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1688399374899703811 DEFAULT CHARSET=utf8mb4 COMMENT='系统菜单表'



wp_domain_permission
CREATE TABLE `system_password_strategy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `open_first_update` tinyint(1) DEFAULT NULL COMMENT '是否开启首次登录密码更新（0：关闭  1：开启）',
  `open_combination` tinyint(1) DEFAULT NULL COMMENT '是否开启密码组合策略（0：关闭  1：开启）',
  `open_update` tinyint(1) DEFAULT NULL COMMENT '是否开启密码更新策略（0：关闭  1：开启）',
  `update_frequency` int(11) DEFAULT NULL COMMENT '密码更新频率（单位/天）',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL COMMENT '版本号',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='密码策略表'



wp_domain_permission
CREATE TABLE `system_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单表id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型  0-菜单 1-按钮 2-其它',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-有效 1-无效',
  `permission_name` varchar(255) NOT NULL COMMENT '权限名称',
  `permission_url` varchar(256) NOT NULL COMMENT '权限路径',
  `permission_code` varchar(256) NOT NULL COMMENT '权限编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_permission_url` (`menu_id`,`permission_url`,`is_deleted`,`app_id`) USING BTREE,
  UNIQUE KEY `uk_permission_code` (`menu_id`,`permission_code`,`is_deleted`,`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统权限表'



wp_domain_permission
CREATE TABLE `system_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '角色编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名',
  `platform_type` int(11) NOT NULL DEFAULT '0' COMMENT '平台类型 1运营平台 2商户平台 3门店平台 4会员平台',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `initialize` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是初始化',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序值',
  `range_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '下放范围类型，0下放给平台所有商户 1下放给指定商户',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态，1启用，0禁用',
  `issued` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否下放 0否 1是',
  `admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员 0否 1是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689444394520141826 DEFAULT CHARSET=utf8mb4 COMMENT='角色表'



wp_domain_permission
CREATE TABLE `system_role_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_role_permission` (`role_id`,`app_id`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689444394536919043 DEFAULT CHARSET=utf8mb4 COMMENT='角色应用表'



wp_domain_permission
CREATE TABLE `system_role_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `sensitive_field_code` int(11) NOT NULL DEFAULT '0' COMMENT '敏感字段code;1:采购入库单价;2:商品采购价;3:库存成本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_role_field` (`role_id`,`sensitive_field_code`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1688477828219367432 DEFAULT CHARSET=utf8mb4 COMMENT='角色敏感字段表'



wp_domain_permission
CREATE TABLE `system_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单表id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_role_permission` (`role_id`,`menu_id`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689446522806460435 DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单表'



wp_domain_permission
CREATE TABLE `system_role_merchant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_role` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689444394532724739 DEFAULT CHARSET=utf8mb4 COMMENT='角色-下放商户表'



wp_domain_permission
CREATE TABLE `system_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `permission_id` bigint(20) NOT NULL COMMENT '权限表id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_role_permission` (`role_id`,`permission_id`,`is_deleted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色权限表'



wp_domain_permission
CREATE TABLE `system_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_zone` varchar(64) DEFAULT NULL COMMENT '时区',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用',
  `login_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4



wp_domain_promotion
CREATE TABLE `promotion_activity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `PA_template_id` int(32) NOT NULL COMMENT '模板id（1：满减、3：N元N件、4：打折促销、5：买赠、6：积分兑换、7：拼团活动、8：领券活动、10：预售活动、11：充值活动）',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `code` varchar(255) DEFAULT NULL COMMENT '编码',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(10) DEFAULT NULL COMMENT '活动状态(0:草稿、1：未开始、2：进行中、3：已完成、4：已终止、5：已过期、6：已作废)',
  `created_person` varchar(50) DEFAULT NULL COMMENT '创建人',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `coupons_flag` tinyint(1) DEFAULT NULL COMMENT '0 有用优惠卷 1 不能用优惠卷',
  `return_money_type` tinyint(4) DEFAULT '0' COMMENT '0 全款可退 1 定金可退 2 不可退',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567796351180214275 DEFAULT CHARSET=utf8 COMMENT='促销活动'



wp_domain_promotion
CREATE TABLE `promotion_activity_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `activity_id` bigint(32) DEFAULT NULL COMMENT '促销活动id',
  `oss_file_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'oss文件id',
  `oss_file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `type` int(10) DEFAULT NULL COMMENT '枚举类型 1补贴活动文件',
  `content_type` varchar(128) DEFAULT NULL COMMENT '文件类型',
  `created_by` bigint(20) NOT NULL DEFAULT '20' COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_activity_id` (`activity_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1522873733857857539 DEFAULT CHARSET=utf8mb4 COMMENT='活动关联附件'



wp_domain_promotion
CREATE TABLE `promotion_activity_limit` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `activity_id` bigint(32) NOT NULL COMMENT '促销活动id',
  `type` tinyint(11) DEFAULT NULL COMMENT '限制类型',
  `limits` json DEFAULT NULL COMMENT '限制类型字段',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567796352279121930 DEFAULT CHARSET=utf8 COMMENT='促销活动限制表'



wp_domain_promotion
CREATE TABLE `promotion_activity_logger` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `activity_id` int(32) NOT NULL COMMENT '活动id',
  `user_id` int(32) NOT NULL COMMENT '会员id',
  `order_detail` json NOT NULL COMMENT '订单商品内容',
  `status` tinyint(10) DEFAULT NULL COMMENT '0 锁定状态 1 支付完成状态',
  `follow_number` varchar(255) DEFAULT NULL COMMENT '流水号',
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单号',
  `user_type` tinyint(11) DEFAULT NULL COMMENT '用户类型',
  `pre_price` decimal(10,2) DEFAULT NULL COMMENT '应付金额',
  `discounts_price` decimal(10,2) DEFAULT NULL COMMENT '优惠金额\r\n',
  `coupon_flag` varchar(255) DEFAULT NULL COMMENT '是否使用优惠卷',
  `user_phone` varchar(255) DEFAULT NULL COMMENT '会员手机号',
  `order_qty` int(11) DEFAULT NULL COMMENT '订单数量',
  `first_pay_time` datetime DEFAULT NULL COMMENT '订单第一次支付时间 用于预售活动的定金支付，或者全款支付',
  `end_pay_time` datetime DEFAULT NULL COMMENT '订单最后支付时间 用于预售活动的尾款支付',
  `code` varchar(20) DEFAULT NULL COMMENT '用户活动记录code',
  `final_payment_time` datetime DEFAULT NULL COMMENT '多久时间前需要支付尾款',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户活动表'



wp_domain_promotion
CREATE TABLE `promotion_activity_order_history` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id',
  `depot_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '门店id',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_name` varchar(256) DEFAULT NULL,
  `sku_qty` int(11) NOT NULL COMMENT '商品数量',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `sale_order_no` varchar(32) NOT NULL COMMENT '订单号',
  `subsidy_method_type` tinyint(4) DEFAULT NULL COMMENT '补贴方式类型0:挂账',
  `subsidy_method_name` varchar(64) DEFAULT NULL COMMENT '补贴方式类型描述',
  `hang_bill_price` decimal(20,2) NOT NULL COMMENT '补贴单价',
  `hang_bill_total_amount` decimal(20,2) NOT NULL COMMENT '补贴总金额',
  `activity_id` bigint(32) NOT NULL COMMENT '活动id',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `pa_template_id` bigint(32) NOT NULL COMMENT '模板id',
  `strategy_id` bigint(20) NOT NULL COMMENT '策略id',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_depot_id` (`depot_id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE,
  KEY `idx_sale_order_no` (`sale_order_no`) USING BTREE,
  KEY `idx_activity_id` (`activity_id`) USING BTREE,
  KEY `idx_pa_template_id` (`pa_template_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1548967216423964674 DEFAULT CHARSET=utf8 COMMENT='订单活动记录表'



wp_domain_promotion
CREATE TABLE `promotion_activity_template` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) DEFAULT NULL COMMENT '模板名称',
  `code` varchar(32) DEFAULT NULL COMMENT '模板名字',
  `description` varchar(255) DEFAULT NULL COMMENT '模板描述',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  `strategy` json DEFAULT NULL COMMENT '策略类型json数据',
  `rules_of_limit` json DEFAULT NULL COMMENT '限制json数据',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动模板表'



wp_domain_promotion
CREATE TABLE `promotion_coupon` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `coupon_name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `coupon_type` varchar(255) DEFAULT NULL COMMENT '优惠券类型',
  `coupon_value` decimal(16,2) DEFAULT NULL COMMENT '代金券面值|折扣券折扣',
  `status` tinyint(10) DEFAULT NULL COMMENT '是否启用 0 禁用 1 启用',
  `condition` decimal(16,2) DEFAULT NULL COMMENT '使用条件',
  `limits` json DEFAULT NULL COMMENT '限制',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT '优惠券code',
  `code` varchar(20) DEFAULT NULL COMMENT '优惠卷code',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券表'



wp_domain_promotion
CREATE TABLE `promotion_coupon_logger` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `coupon_id` bigint(32) NOT NULL COMMENT '优惠券id',
  `release_id` bigint(32) NOT NULL COMMENT '关联来源id',
  `order_id` varchar(64) DEFAULT NULL COMMENT '订单id',
  `status` tinyint(4) DEFAULT NULL COMMENT '使用状态',
  `user_id` bigint(32) NOT NULL COMMENT '用户id',
  `user_type` tinyint(10) DEFAULT NULL COMMENT '用户类型',
  `start_time` datetime DEFAULT NULL COMMENT '优惠券起始时间',
  `end_time` datetime DEFAULT NULL COMMENT '优惠券结束时间',
  `receive_time` datetime DEFAULT NULL COMMENT '领券时间',
  `used_time` datetime DEFAULT NULL COMMENT '核销时间',
  `release_type` tinyint(4) DEFAULT NULL COMMENT '关联来源类型（0活动|1会员）',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `code` varchar(20) DEFAULT NULL COMMENT '用户优惠卷code',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户优惠券表'



wp_domain_promotion
CREATE TABLE `promotion_open_group` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `activity_id` bigint(32) NOT NULL COMMENT '活动id',
  `activity_name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `activity_code` varchar(255) DEFAULT NULL COMMENT '活动编码',
  `activity_description` varchar(255) DEFAULT NULL COMMENT '活动描述',
  `group_type` int(11) NOT NULL COMMENT '开团类型；1-普通团，2-老带新',
  `people_number` int(11) NOT NULL COMMENT '成团人数;活动限制同步过来',
  `activity_price` decimal(10,2) NOT NULL COMMENT '活动价格',
  `discount_flag` tinyint(10) NOT NULL COMMENT '团主优惠标识 1是 0否',
  `discount_price` decimal(10,2) DEFAULT NULL COMMENT '团主价格',
  `commodity_detail` text NOT NULL COMMENT '拼团商品信息',
  `order_detail` text NOT NULL COMMENT '拼团订单信息',
  `pay_order_detail` text COMMENT '已支付拼团订单信息',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(10) DEFAULT NULL COMMENT '拼团状态;0-待成团，1-已成团，2-超时取消，3-下单锁定',
  `created_id` bigint(32) DEFAULT NULL COMMENT '创建人;团长',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户开团信息表'



wp_domain_promotion
CREATE TABLE `promotion_strategy` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `strategy_type` varchar(255) DEFAULT NULL COMMENT '策略类型',
  `rules` json DEFAULT NULL COMMENT '条件结果json数据',
  `activity_id` bigint(32) DEFAULT NULL COMMENT '促销活动id',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567796351834525699 DEFAULT CHARSET=utf8 COMMENT='促销策略表'



wp_domain_promotion
CREATE TABLE `promotion_strategy_ex` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `activity_id` bigint(32) DEFAULT NULL COMMENT '促销活动id',
  `strategy_id` bigint(20) DEFAULT NULL COMMENT '策略id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `order_type_ids` varchar(255) DEFAULT NULL COMMENT '订单类型集合（逗号拼接）',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE,
  KEY `idx_activity_id` (`activity_id`) USING BTREE,
  KEY `idx_strategy_id` (`strategy_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567796352778244099 DEFAULT CHARSET=utf8 COMMENT='促销策略扩展表'



wp_domain_storage
CREATE TABLE `purchase_apply_order` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `purchase_apply_order_no` varchar(32) NOT NULL COMMENT '采购申请单号',
  `store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  `top_merchant_id` bigint(20) NOT NULL COMMENT '顶部商户ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态,0:待处理,1:处理中,2:已处理【前面已废弃】;3:区域待审核;4:区域审核驳回;5:总部处理中;6:总部已处理',
  `sku_total_qty` decimal(10,2) NOT NULL COMMENT 'sku总数量',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `audit_by` bigint(20) DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_purchase_apply_order_no` (`purchase_apply_order_no`) USING BTREE,
  KEY `idx_merchantId` (`merchant_id`),
  KEY `idx_topMerchantId` (`top_merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购申请单表'



wp_domain_storage
CREATE TABLE `purchase_apply_order_sku` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `purchase_apply_order_id` bigint(32) NOT NULL COMMENT '采购申请id',
  `purchase_apply_order_no` varchar(32) NOT NULL COMMENT '采购申请单号',
  `store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  `top_merchant_id` bigint(20) NOT NULL COMMENT '顶部商户ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'SKUID',
  `sku_code` varchar(32) NOT NULL COMMENT 'sku编码',
  `unit_id` bigint(20) NOT NULL COMMENT '单位ID',
  `unit_code` varchar(32) NOT NULL COMMENT '单位编码',
  `real_sku_qty` decimal(10,2) DEFAULT NULL COMMENT '实际确认审核通过数量',
  `sku_qty` decimal(10,2) NOT NULL COMMENT 'sku申请数量',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态,0:未下推,1:已下推',
  `deal_date` datetime DEFAULT NULL COMMENT '处理时间',
  `order_sku_total_id` bigint(32) DEFAULT NULL COMMENT '采购申请汇总id',
  `purchase_total_order_no` varchar(32) DEFAULT NULL COMMENT '采购汇总订单编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_totalId` (`order_sku_total_id`),
  KEY `idx_orderId` (`purchase_apply_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购申请单明细表'



wp_domain_storage
CREATE TABLE `purchase_apply_order_sku_total` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `sku_id` bigint(20) NOT NULL COMMENT 'SKUID',
  `sku_code` varchar(32) NOT NULL COMMENT 'sku编码',
  `unit_id` bigint(20) NOT NULL COMMENT '单位ID',
  `unit_code` varchar(32) NOT NULL COMMENT '单位编码',
  `sku_total_qty` decimal(10,2) NOT NULL COMMENT 'sku申请数量总和',
  `order_total_num` int(10) NOT NULL COMMENT '关联单据数量',
  `purchase_total_order_no` varchar(32) DEFAULT NULL COMMENT '采购汇总订单编号',
  `supplier_code` varchar(32) DEFAULT NULL COMMENT '供应商编码',
  `purchase_org` varchar(32) DEFAULT NULL COMMENT '采购组织',
  `summary_date` datetime DEFAULT NULL COMMENT '汇总时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  `top_merchant_id` bigint(20) NOT NULL COMMENT '顶部商户ID',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态,0:未下推,1:已下推',
  `deal_date` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_topmerchantId` (`top_merchant_id`),
  KEY `idx_skuId` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购申请商品维度汇总表'



wp_domain_storage
CREATE TABLE `stg_depot` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `app_id` bigint(20) NOT NULL COMMENT '应用ID',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `name` varchar(128) NOT NULL COMMENT '仓库名称',
  `depot_no` varchar(32) NOT NULL COMMENT '仓库编码',
  `contact_id` bigint(20) DEFAULT NULL COMMENT '联系人ID',
  `contact_name` varchar(128) DEFAULT NULL COMMENT '联系人名',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `province_id` bigint(20) DEFAULT NULL COMMENT '存储点省信息',
  `city_id` bigint(20) DEFAULT NULL COMMENT '存储点城市信息',
  `district_id` bigint(20) DEFAULT NULL COMMENT '存储点行政区划信息',
  `street_id` bigint(20) DEFAULT NULL COMMENT '存储点街道信息',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用状态: 0-禁用 1-启用',
  `create_from` tinyint(4) NOT NULL DEFAULT '0' COMMENT '创建来源:1-门店、2-商户',
  `create_from_id` bigint(20) NOT NULL COMMENT '创建来源数据ID',
  `union_id` varchar(30) NOT NULL COMMENT '组合ID(create_from_create_from_id)',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_depot_no` (`depot_no`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_union_id` (`union_id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689455048362475522 DEFAULT CHARSET=utf8mb4 COMMENT='仓库表'



wp_domain_storage
CREATE TABLE `stg_depot_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `app_id` bigint(20) NOT NULL COMMENT '接入方ID',
  `version` int(11) NOT NULL COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '制单时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `name` varchar(128) NOT NULL COMMENT '仓库组名称',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_merchant_id_name` (`merchant_id`,`name`,`is_deleted`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1534066414237298691 DEFAULT CHARSET=utf8mb4 COMMENT='仓库组表'



wp_domain_storage
CREATE TABLE `stg_depot_group_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户ID',
  `app_id` bigint(20) NOT NULL COMMENT '接入方ID',
  `version` int(11) NOT NULL COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '制单时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `depot_group_id` bigint(20) NOT NULL COMMENT '仓库组ID',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_depot_group_id_depot_id` (`depot_group_id`,`depot_id`,`is_deleted`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1547385172340482051 DEFAULT CHARSET=utf8mb4 COMMENT='仓库组明细表'



wp_domain_storage
CREATE TABLE `stg_idempotency_check` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `operate_type` tinyint(2) NOT NULL COMMENT '操作类型',
  `extend_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单据编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_operate_type_ extend_no` (`operate_type`,`extend_no`) USING BTREE COMMENT '幂等性校验'
) ENGINE=InnoDB AUTO_INCREMENT=1689929381156114434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='幂等性校验表'



wp_domain_storage
CREATE TABLE `stg_inbound_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `inbound_type` tinyint(2) DEFAULT NULL COMMENT '入库类型',
  `inbound_order_no` varchar(32) NOT NULL COMMENT '入库单号',
  `extend_no` varchar(32) DEFAULT NULL COMMENT '关联单号',
  `extend_id` bigint(20) DEFAULT NULL COMMENT '外部扩展id',
  `extend_type` tinyint(4) DEFAULT NULL COMMENT '外部扩展类型',
  `from_depot_id` bigint(20) DEFAULT NULL COMMENT '发货存储点ID',
  `to_depot_id` bigint(20) NOT NULL COMMENT '收货仓库ID',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `inbound_order_qty` decimal(20,2) DEFAULT NULL COMMENT '入库数量',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `from_member_id` bigint(20) DEFAULT NULL COMMENT '来源会员id',
  `to_member_id` bigint(20) DEFAULT NULL COMMENT '目的会员',
  `reason` varchar(256) DEFAULT NULL COMMENT '入库原因',
  `accessory_path` varchar(512) DEFAULT NULL COMMENT '入库单附件信息',
  `audit_date` datetime DEFAULT NULL COMMENT '订单审核时间',
  `audit_by` bigint(20) DEFAULT NULL COMMENT '审核人',
  `arrival_date` datetime DEFAULT NULL COMMENT '入库时间',
  `from_terminal` tinyint(2) NOT NULL DEFAULT '1' COMMENT '来源终端：1、商户端 2、门店端 3、移动端',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_inbound_order_no` (`inbound_order_no`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_to_dept_id_from_depot_id` (`to_depot_id`,`from_depot_id`) USING BTREE,
  KEY `idx_extend_no` (`extend_no`) USING BTREE,
  KEY `idx_arrival_date` (`arrival_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929380896067587 DEFAULT CHARSET=utf8mb4 COMMENT='入库单表'



wp_domain_storage
CREATE TABLE `stg_inbound_order_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `inbound_order_id` bigint(20) NOT NULL COMMENT '出库单ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku ID',
  `article_id` bigint(20) NOT NULL COMMENT '物品ID',
  `cost_price` decimal(20,6) DEFAULT NULL COMMENT '物品成本价',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  `inbound_order_sku_id` bigint(20) NOT NULL COMMENT '入库单skuID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_inbound_order_id_article_id` (`inbound_order_id`,`article_id`,`is_deleted`) USING BTREE,
  UNIQUE KEY `uk_inbound_order_sku_id_article_id` (`inbound_order_sku_id`,`article_id`,`is_deleted`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1625051074522308611 DEFAULT CHARSET=utf8mb4 COMMENT='入库单物品明细'



wp_domain_storage
CREATE TABLE `stg_inbound_order_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `inbound_order_id` bigint(20) NOT NULL COMMENT '入库单ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'SKUID',
  `sku_qty` decimal(20,2) NOT NULL COMMENT 'sku入库数量',
  `sku_price` decimal(20,6) DEFAULT NULL COMMENT 'sku成本',
  `real_sku_qty` decimal(20,2) DEFAULT NULL COMMENT '实际入库数量',
  `inbound_price` decimal(20,6) DEFAULT NULL COMMENT '入库价',
  `sku_total_amount` decimal(20,6) DEFAULT NULL COMMENT '总成本',
  `inbound_total_amount` decimal(20,6) DEFAULT NULL COMMENT '总入库价',
  `specification_convert_rate` decimal(20,6) DEFAULT NULL COMMENT '规格换算率',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(32) DEFAULT NULL COMMENT '生产日期',
  `expiration_date` varchar(32) DEFAULT NULL COMMENT '效期',
  `validity_type` tinyint(2) DEFAULT NULL COMMENT '效期单位',
  `validity_value` int(10) DEFAULT NULL COMMENT '商品效期',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `front_cost` decimal(20,6) DEFAULT NULL COMMENT '前端填写的大单位成本',
  `front_total_amount` decimal(20,6) DEFAULT NULL COMMENT '前端填写的总成本',
  `front_unit_qty` decimal(20,2) DEFAULT NULL COMMENT '前端填写的大单位数量',
  `refund_price` decimal(20,6) DEFAULT NULL COMMENT '交易-退款单价',
  `refund_total_amount` decimal(20,6) DEFAULT NULL COMMENT '交易-退款总额',
  `is_reference_unit` tinyint(1) unsigned zerofill DEFAULT '1' COMMENT '是否基准单位：0-否、1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929380904456194 DEFAULT CHARSET=utf8mb4 COMMENT='入库单详细表'



wp_domain_storage
CREATE TABLE `stg_inbound_stock_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `depot_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sku_id` bigint(20) NOT NULL COMMENT '规格id',
  `type` tinyint(2) NOT NULL COMMENT '入库单类型 0采购入库 1调拨入库 2其他入库 3销售退货',
  `arrival_date` date NOT NULL COMMENT '门店入库时间',
  `merchant_arrival_date` date NOT NULL COMMENT '商户入库时间',
  `inbound_count` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '入库数量',
  `is_use_up` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用完 0未使用完 2已使用完',
  `union_id` varchar(64) NOT NULL COMMENT 'depot_id + sku_id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uiq_sku` (`depot_id`,`sku_id`,`arrival_date`,`merchant_arrival_date`) USING BTREE,
  KEY `idx_sku_id_depot_id_use_up` (`sku_id`,`depot_id`,`is_use_up`) USING BTREE,
  KEY `idx_union_id` (`union_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库龄计算中间表'



wp_domain_storage
CREATE TABLE `stg_init_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL,
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `depot_id` bigint(20) NOT NULL COMMENT '仓库id',
  `submit_status` tinyint(1) NOT NULL COMMENT '递交状态，0未递交 1已递交',
  `submit_by` varchar(64) DEFAULT NULL COMMENT '递交人',
  `submit_time` datetime DEFAULT NULL COMMENT '递交时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_depot_id` (`depot_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='库存初始化表'



wp_domain_storage
CREATE TABLE `stg_init_stock_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '是否逻辑删除',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库id',
  `sku_id` bigint(20) DEFAULT '0' COMMENT '规格id',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '规格名称',
  `sku_no` varchar(20) DEFAULT NULL COMMENT 'SKU编码',
  `barcode` varchar(255) DEFAULT NULL COMMENT '条码',
  `article_code` varchar(64) DEFAULT '' COMMENT '唯一码',
  `qty` varchar(64) DEFAULT NULL COMMENT '数量',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `cost` varchar(64) DEFAULT '0.00' COMMENT '成本价',
  `import_status` tinyint(1) NOT NULL COMMENT '导入状态，0失败 1成功',
  `import_result` varchar(64) DEFAULT NULL COMMENT '导入结果',
  `submit_status` tinyint(1) NOT NULL COMMENT '递交状态，0未递交 1成功 2失败',
  `submit_result` varchar(64) DEFAULT NULL COMMENT '递交结果',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `supplier_name` varchar(255) DEFAULT NULL COMMENT '供应商',
  `deleted_date` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '删除时间',
  `batch_no` varchar(64) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(64) DEFAULT NULL COMMENT '生产日期',
  `expiration_date` varchar(64) DEFAULT NULL COMMENT '效期',
  `validity_type` tinyint(2) DEFAULT NULL COMMENT '效期单位',
  `validity_value` int(10) DEFAULT NULL COMMENT '商品效期',
  `specification_convert_rate` decimal(20,6) DEFAULT NULL COMMENT '规格换算率',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_depot_id` (`depot_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8



wp_domain_storage
CREATE TABLE `stg_outbound_cost_adjust` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本，乐观锁标识',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `adjust_amount` decimal(20,6) NOT NULL COMMENT '调整差额',
  `adjust_qty` decimal(20,2) NOT NULL COMMENT '调整数量',
  `outbound_cost_adjust_no` varchar(64) NOT NULL COMMENT '出库成本调整单号',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_outbound_cost_adjust_no` (`outbound_cost_adjust_no`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='出库库存成本调整主表'



wp_domain_storage
CREATE TABLE `stg_outbound_cost_adjust_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本，乐观锁标识',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `outbound_cost_adjust_id` bigint(20) NOT NULL COMMENT '出库成本调整单id',
  `outbound_order_article_id` bigint(20) NOT NULL COMMENT '出库物品主键id',
  `outbound_order_no` varchar(64) NOT NULL COMMENT '出库单单号',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `article_id` bigint(20) NOT NULL COMMENT '物品id',
  `article_code` varchar(64) NOT NULL COMMENT '唯一码',
  `cost_price` decimal(20,2) NOT NULL COMMENT '出库成本价',
  `adjust_price` decimal(20,2) NOT NULL COMMENT '调整金额',
  `after_adjust_cost_price` decimal(20,2) NOT NULL COMMENT '调整后成本价',
  `adjust_qty` int(10) NOT NULL COMMENT '调整数量',
  `sale_order_no` varchar(64) NOT NULL COMMENT '销售单单号',
  `outbound_date` datetime NOT NULL COMMENT '出库时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_outbound_cost_adjust_id` (`outbound_cost_adjust_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='出库库存成本调整详细表'



wp_domain_storage
CREATE TABLE `stg_outbound_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `outbound_order_no` varchar(64) NOT NULL COMMENT '出库单号',
  `extend_no` varchar(64) DEFAULT NULL COMMENT '关联单号',
  `extend_id` bigint(20) DEFAULT NULL COMMENT '外部扩展id',
  `extend_type` tinyint(4) DEFAULT NULL COMMENT '外部扩展类型',
  `accessory_path` varchar(512) DEFAULT NULL COMMENT '出库单附件信息',
  `from_depot_id` bigint(20) NOT NULL COMMENT '发货仓库ID',
  `to_depot_id` bigint(20) DEFAULT NULL COMMENT '收货存储点ID',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `outbound_order_qty` decimal(20,2) DEFAULT NULL COMMENT '出库数量',
  `outbound_type` tinyint(2) NOT NULL COMMENT '出库类型',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '目的供应商（采购退货）',
  `from_member_id` bigint(20) DEFAULT NULL COMMENT '来源会员ID',
  `to_member_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `reason` varchar(256) DEFAULT NULL COMMENT '原因',
  `finance_check` tinyint(1) DEFAULT '0' COMMENT '财务复核（0 未复核 1 已复核）',
  `audit_date` datetime DEFAULT NULL COMMENT '订单审核时间',
  `audit_by` bigint(20) DEFAULT NULL COMMENT '审核人',
  `outbound_date` datetime DEFAULT NULL COMMENT '出库时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `from_terminal` int(10) DEFAULT NULL COMMENT '单据来源：1商户端 2门店端 3移动端 4外部单据',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_outbound_order_no` (`outbound_order_no`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_extend_no` (`extend_no`) USING BTREE,
  KEY `idx_from_depot_id_to_depot_id` (`from_depot_id`,`to_depot_id`) USING BTREE,
  KEY `idx_outbound_date` (`outbound_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929277867184131 DEFAULT CHARSET=utf8mb4 COMMENT='出库单表'



wp_domain_storage
CREATE TABLE `stg_outbound_order_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `outbound_order_id` bigint(20) NOT NULL COMMENT '出库单ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku ID',
  `article_id` bigint(20) NOT NULL COMMENT '物品ID',
  `cost_price` decimal(20,6) DEFAULT NULL COMMENT '成本价',
  `source_cost_price` decimal(20,6) DEFAULT NULL COMMENT '出库时成本价',
  `outbound_price` decimal(20,6) DEFAULT NULL COMMENT '出库价',
  `hang_bill_price` decimal(20,6) DEFAULT NULL COMMENT '挂账补贴金额',
  `outbound_order_sku_id` bigint(20) NOT NULL COMMENT '出库skuid',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_outbound_order_id_article_id` (`outbound_order_id`,`article_id`,`is_deleted`) USING BTREE,
  UNIQUE KEY `uk_outbound_order_sku_id_article_id` (`outbound_order_sku_id`,`article_id`,`is_deleted`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1625050928141099010 DEFAULT CHARSET=utf8mb4 COMMENT='出库单物品明细'



wp_domain_storage
CREATE TABLE `stg_outbound_order_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `outbound_order_id` bigint(20) NOT NULL COMMENT '出库单ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuID',
  `sku_price` decimal(20,6) DEFAULT NULL COMMENT 'sku成本价',
  `sku_qty` decimal(20,2) NOT NULL COMMENT 'sku出库数量',
  `hang_bill_price` decimal(20,6) DEFAULT NULL COMMENT '挂账补贴金额',
  `real_sku_qty` decimal(20,6) DEFAULT NULL COMMENT '实际出库sku数量',
  `outbound_price` decimal(20,6) DEFAULT NULL COMMENT '出库价',
  `specification_convert_rate` decimal(20,6) DEFAULT NULL COMMENT '规格换算率',
  `sku_total_amount` decimal(20,6) DEFAULT NULL COMMENT '总成本',
  `outbound_total_amount` decimal(20,6) DEFAULT NULL COMMENT '总出库金额',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '批号',
  `manufacture_date` varchar(32) DEFAULT NULL COMMENT '生产日期',
  `expiration_date` varchar(32) DEFAULT NULL COMMENT '效期',
  `validity_type` tinyint(2) DEFAULT NULL COMMENT '效期单位',
  `validity_value` int(10) DEFAULT NULL COMMENT '商品效期',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `front_unit_qty` decimal(20,2) DEFAULT NULL COMMENT '前端填写的大单位数量',
  `business_type` varchar(32) DEFAULT NULL COMMENT '业务类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929277875572739 DEFAULT CHARSET=utf8mb4 COMMENT='出库单详细表'



wp_domain_storage
CREATE TABLE `stg_price_protected_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作人',
  `created_time` datetime NOT NULL,
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `qty` decimal(20,2) NOT NULL COMMENT '价保总数量',
  `amount` decimal(20,6) NOT NULL COMMENT '价保总金额',
  `price_protected_order_no` varchar(32) NOT NULL,
  `price_protected_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '价保类型（1、唯一码价保 2、非唯一码价保）',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_order_no` (`price_protected_order_no`) USING BTREE,
  KEY `idx_supplier_id` (`supplier_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='价保单表'



wp_domain_storage
CREATE TABLE `stg_price_protected_order_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL,
  `price_protected_order_id` bigint(20) NOT NULL COMMENT '价保单id',
  `depot_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '规格id',
  `qty` decimal(20,2) NOT NULL COMMENT '价保数量',
  `cost` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '库存成本价',
  `diff_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '价保单价',
  `article_id` bigint(20) DEFAULT NULL COMMENT '唯一码',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '批号',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_price_protected_order_id` (`price_protected_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='价保详细表'



wp_domain_storage
CREATE TABLE `stg_stock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku ID',
  `union_id` varchar(41) NOT NULL COMMENT '联合ID,仓库id+skuId',
  `available_stock_qty` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '可用库存数量',
  `lock_stock_qty` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '锁定库存数量',
  `outbound_stock_qty` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '已出库库存数量',
  `unavailable_stock_qty` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '不可用库存',
  `in_transit_stock_qty` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '在途量',
  `total_cost` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '在库总成本',
  `cost` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '平均成本',
  `specification_convert_rate` decimal(20,6) DEFAULT NULL COMMENT '规格换算率',
  `virtual_stock` tinyint(1) DEFAULT '0' COMMENT '是否虚拟商品库存：0-否，1-是',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_union_id` (`union_id`) USING BTREE,
  KEY `idx_depot_id` (`depot_id`) USING BTREE,
  KEY `idx_depot_id_sku_id` (`depot_id`,`sku_id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689889532197883907 DEFAULT CHARSET=utf8mb4 COMMENT='仓库库存表'



wp_domain_storage
CREATE TABLE `stg_stock_age` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标志',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL,
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL,
  `depot_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sku_id` bigint(20) NOT NULL COMMENT '规格id',
  `arrival_date` date NOT NULL COMMENT '入库时间',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '库龄类型：0 仓库库龄，1 SKU库龄',
  `age` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '库龄',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sku_id_depot_id` (`sku_id`,`depot_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库龄表'



wp_domain_storage
CREATE TABLE `stg_stock_batch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stock_id` bigint(20) NOT NULL COMMENT '仓库库存主表ID',
  `available_stock_qty` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '可用库存数量',
  `lock_stock_qty` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '锁定库存数量',
  `outbound_stock_qty` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '已出库库存数量',
  `unavailable_stock_qty` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '不可用库存',
  `in_transit_stock_qty` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '在途量',
  `total_cost` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '在库总成本',
  `cost` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT '平均成本',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '批号',
  `union_id` varchar(64) DEFAULT NULL COMMENT 'depot_id、sku_id、batch_no',
  `manufacture_date` varchar(32) DEFAULT NULL COMMENT '生产日期',
  `expiration_date` varchar(32) DEFAULT NULL COMMENT '效期',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `expiration_date_config` int(4) DEFAULT '30' COMMENT '效期提醒-到期前x天, 默认30天',
  `stock_qty_config` decimal(20,2) DEFAULT '0.00' COMMENT '库存提醒 默认0件',
  `expiration_date_flag` tinyint(1) DEFAULT NULL COMMENT '效期提醒-异常  1:正常  0:异常',
  `stock_qty_error_flag` tinyint(1) DEFAULT NULL COMMENT '库存提醒-异常  1:正常  0:异常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_stock_batch` (`stock_id`,`batch_no`,`is_deleted`) USING BTREE,
  UNIQUE KEY `uk_union_id` (`union_id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_stock_id` (`stock_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689918063669825539 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='仓库库存批次表'



wp_domain_storage
CREATE TABLE `stg_stock_batch_lock_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `extend_no` varchar(64) NOT NULL COMMENT '外部单号',
  `store_id` bigint(20) NOT NULL COMMENT '门店ID',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `is_release` tinyint(1) NOT NULL COMMENT '是否已经释放锁定库存:0-否、1-是',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_extend_no` (`extend_no`) USING BTREE COMMENT '外部单号唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=1681602608763555843 DEFAULT CHARSET=utf8mb4 COMMENT='批号库存锁定日志表'



wp_domain_storage
CREATE TABLE `stg_stock_batch_lock_log_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `batch_no` varchar(64) NOT NULL COMMENT '库存批号',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `lock_qty` decimal(20,6) NOT NULL COMMENT '锁定库存数量',
  `log_id` bigint(20) NOT NULL COMMENT '批号库存锁定表主键ID',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_log_id` (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1681602608767750146 DEFAULT CHARSET=utf8mb4 COMMENT='批号库存锁定日志明细表'



wp_domain_storage
CREATE TABLE `stg_stock_batch_result` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库ID',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1: 有效期 2：库存',
  `num` bigint(20) DEFAULT '0' COMMENT '提醒的商品数量',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态 1：正常提示  2：关闭提示',
  PRIMARY KEY (`id`),
  KEY `idx_depot_id` (`depot_id`) USING BTREE COMMENT '仓库索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689672969542090755 DEFAULT CHARSET=utf8mb4 COMMENT='#批号商品-提醒结果'



wp_domain_storage
CREATE TABLE `stg_stock_change` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `depot_id` bigint(20) NOT NULL COMMENT '存储点ID',
  `extend_type` tinyint(2) NOT NULL COMMENT '单据类型',
  `extend_no` varchar(32) NOT NULL COMMENT '关联单据号',
  `change_type` tinyint(2) DEFAULT NULL COMMENT '单据变动类型-映射出入库(等)单据类型字段',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929381181280259 DEFAULT CHARSET=utf8mb4 COMMENT='库存变更批次表'



wp_domain_storage
CREATE TABLE `stg_stock_change_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `stock_change_id` bigint(20) NOT NULL COMMENT '库存变更批次ID',
  `sku_id` bigint(20) NOT NULL COMMENT '商品sku ID',
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '库存类型',
  `pre_stock_qty` decimal(20,6) NOT NULL COMMENT '变更前库存',
  `change_stock_qty` decimal(20,6) NOT NULL COMMENT '库存变更数量',
  `post_stock_qty` decimal(20,6) NOT NULL COMMENT '变更后库存',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_stock_change_id` (`stock_change_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929381189668866 DEFAULT CHARSET=utf8mb4 COMMENT='库存变更批次明细表'



wp_domain_storage
CREATE TABLE `stg_take_stock_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'appId',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `count_order_no` varchar(64) NOT NULL COMMENT '盘点单号',
  `scope_type` tinyint(2) NOT NULL COMMENT '盘点范围（1、商品分类 2、商品品牌 3、商品型号）',
  `status` tinyint(2) NOT NULL COMMENT '状态（1、盘点中 2、已完成 3、已作废）',
  `depot_id` bigint(20) NOT NULL COMMENT '仓库id',
  `address` varchar(256) DEFAULT NULL COMMENT '移动端盘点位置信息',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `diff_qty` decimal(20,2) DEFAULT NULL COMMENT '盘点差异数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_count_order_no_is_deleted` (`count_order_no`,`is_deleted`) USING BTREE COMMENT '盘点单号唯一索引',
  KEY `idx_created_time` (`created_time`) USING BTREE COMMENT '盘点单创建时间索引',
  KEY `idx_updated_time` (`updated_time`) USING BTREE COMMENT '盘点单更新时间索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689907997063401475 DEFAULT CHARSET=utf8mb4 COMMENT='盘点单表'



wp_domain_storage
CREATE TABLE `stg_take_stock_order_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'appId',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `count_order_id` bigint(20) NOT NULL COMMENT '盘点单id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `count_order_sku_id` bigint(20) NOT NULL COMMENT '盘点单sku主键id',
  `count_article_code` varchar(64) DEFAULT NULL COMMENT '盘点唯一码',
  `count_cost_price` decimal(20,2) DEFAULT NULL COMMENT '盘点物品成本',
  `book_article_code` varchar(64) DEFAULT NULL COMMENT '账面库存唯一码',
  `book_article_id` bigint(20) DEFAULT NULL COMMENT '账面库存物品id',
  `book_cost_price` decimal(20,2) DEFAULT NULL COMMENT '账面库存物品成本',
  `book_reverse_article_code` varchar(64) DEFAULT NULL COMMENT '账面库存唯一码反转编码',
  `count_reverse_article_code` varchar(64) DEFAULT NULL COMMENT '盘点唯一码反转编码',
  `data_type` tinyint(2) NOT NULL COMMENT '数据类型（1、新增盘点单 2、异常上报）',
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已盘',
  `settle_status` tinyint(1) NOT NULL COMMENT '是否结算',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `error_msg_type` tinyint(2) DEFAULT NULL COMMENT '异常上报类型（1、唯一码异常上报 2、非唯一码异常上报 3、扫不出码）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_count_order_id_sku_id` (`count_order_id`,`sku_id`) USING BTREE COMMENT '盘点单sku联合索引',
  KEY `idx_count_order_sku_id` (`count_order_sku_id`) USING BTREE COMMENT '盘点单skuId索引',
  KEY `idx_created_time` (`created_time`) USING BTREE COMMENT '创建时间索引',
  KEY `idx_updated_time` (`updated_time`) USING BTREE COMMENT '更新时间索引'
) ENGINE=InnoDB AUTO_INCREMENT=1664565569558679563 DEFAULT CHARSET=utf8mb4 COMMENT='盘点单唯一码表'



wp_domain_storage
CREATE TABLE `stg_take_stock_order_error_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'appId',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `count_order_id` bigint(20) NOT NULL COMMENT '盘点单id',
  `error_record_no` varchar(64) NOT NULL COMMENT '异常上报单号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'skuId',
  `article_code` varchar(64) DEFAULT NULL COMMENT '唯一码',
  `error_msg_type` tinyint(2) NOT NULL COMMENT '异常上报类型（1、唯一码异常上报 2、非唯一码异常上报 3、扫不出码）',
  `count_qty` decimal(20,2) unsigned zerofill NOT NULL DEFAULT '000000000000000000.00' COMMENT '非唯一码商品盘点数量',
  `accessory_path` varchar(512) DEFAULT NULL COMMENT '异常上报附件信息',
  `settle_status` tinyint(1) NOT NULL COMMENT '是否结算',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_count_order_id` (`count_order_id`) USING BTREE COMMENT '盘点单主键id索引',
  KEY `idx_created_time` (`created_time`) USING BTREE COMMENT '创建时间索引',
  KEY `idx_updated_time` (`updated_time`) USING BTREE COMMENT '更新时间索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='盘点单异常上报表'



wp_domain_storage
CREATE TABLE `stg_take_stock_order_scope` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'appId',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `created_by` bigint(20) NOT NULL COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `count_order_id` bigint(20) NOT NULL COMMENT '盘点单主键id',
  `scope_id` bigint(20) NOT NULL COMMENT '盘点范围id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_count_order_id_scope_id` (`count_order_id`,`scope_id`) USING BTREE COMMENT '盘点单盘点范围唯一索引',
  KEY `idx_count_order_id` (`count_order_id`) USING BTREE COMMENT '盘点单主键索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689907997071790082 DEFAULT CHARSET=utf8mb4 COMMENT='盘点单盘点范围明细项表'



wp_domain_storage
CREATE TABLE `stg_take_stock_order_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` bigint(20) NOT NULL COMMENT 'appId',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '制单人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `count_order_id` bigint(20) NOT NULL COMMENT '盘点单id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuId',
  `final_count_qty` decimal(20,2) DEFAULT '0.00' COMMENT '最终盘点数量',
  `count_qty` decimal(20,2) DEFAULT '0.00' COMMENT '盘点数量',
  `book_qty` decimal(20,2) DEFAULT NULL COMMENT '账面库存数量',
  `cost_price` decimal(20,6) DEFAULT NULL COMMENT '平均成本',
  `count_result_type` tinyint(2) DEFAULT NULL COMMENT '盘点结果（1、盘盈 2、盘亏 3、盘平）',
  `count_result_value` decimal(20,2) DEFAULT '0.00' COMMENT '盘点数量差异',
  `count_result_amount` decimal(20,6) DEFAULT NULL COMMENT '盘点金额差异',
  `data_type` tinyint(2) NOT NULL COMMENT '数据类型（1、新增盘点单 2、异常上报）',
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已盘',
  `settle_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否结算',
  `unique_code` tinyint(2) DEFAULT NULL COMMENT '是否唯一码',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `classify_id` bigint(20) DEFAULT NULL COMMENT '分类id',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_count_order_id_sku_id` (`count_order_id`,`sku_id`,`is_deleted`) USING BTREE COMMENT '盘点单id、skuId唯一索引',
  KEY `idx_created_time` (`created_time`) USING BTREE COMMENT '创建时间索引',
  KEY `idx_updated_time` (`updated_time`) USING BTREE COMMENT '更新时间索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689907997348614151 DEFAULT CHARSET=utf8mb4 COMMENT='盘点单sku表'



wp_domain_supply
CREATE TABLE `contract_attachment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '附件名称',
  `type` tinyint(4) NOT NULL COMMENT '附件类型',
  `contract_id` bigint(20) NOT NULL COMMENT '合同id',
  `attachment_path` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '附件路径',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_contract_id` (`contract_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='合同附件表'



wp_domain_supply
CREATE TABLE `contract_custom_field` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `field_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段名',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自定义扩展字段表'



wp_domain_supply
CREATE TABLE `contract_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '合同名称',
  `contract_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '合同编码',
  `type` tinyint(4) NOT NULL COMMENT '合同类型',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `our_main_body` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '我方签约主体',
  `our_position` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '我方签约地位',
  `contract_commencement_date` datetime NOT NULL COMMENT '合同生效日期',
  `contract_termination_date` datetime NOT NULL COMMENT '合同终止日期',
  `expected_signing_date` datetime NOT NULL COMMENT '预计签订日期',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合同状态,由上层定义',
  `settlement_type` tinyint(4) NOT NULL COMMENT '结算类型',
  `currency_type` tinyint(4) NOT NULL COMMENT '币种',
  `total_amount` decimal(10,2) NOT NULL COMMENT '合同金额',
  `summary` text COLLATE utf8mb4_unicode_ci COMMENT '摘要',
  `signed_by` bigint(20) NOT NULL COMMENT '签约人',
  `transactor_id` bigint(20) NOT NULL COMMENT '经办人',
  `department_id` bigint(32) NOT NULL COMMENT '经办人部门',
  `text` text COLLATE utf8mb4_unicode_ci COMMENT '正文',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_contract_no` (`contract_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='合同基础信息表'



wp_domain_supply
CREATE TABLE `contract_info_field` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `contract_id` bigint(20) NOT NULL COMMENT '合同id',
  `field_name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段名',
  `field_value` text COLLATE utf8mb4_unicode_ci COMMENT '字段值',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_contract_id` (`contract_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='合同基础信息字段拓展表'



wp_domain_supply
CREATE TABLE `contract_relationship` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `major_contract_id` bigint(20) NOT NULL COMMENT '主合同id',
  `complementary_id` bigint(32) NOT NULL COMMENT '从合同id,补充协议',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='主从合同关联表'



wp_domain_supply
CREATE TABLE `contract_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `template_code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '创建人类型',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='合同模板表'



wp_domain_supply
CREATE TABLE `contract_template_field` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `template_id` bigint(20) NOT NULL COMMENT '模板id',
  `field_name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段名',
  `sort` tinyint(4) NOT NULL COMMENT '排序',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_template_id` (`template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='合同模板字段拓展表'



wp_domain_supply
CREATE TABLE `contract_template_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板类型名称',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模板类型表'



wp_domain_supply
CREATE TABLE `contract_template_type_relationship` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `type_id` bigint(20) NOT NULL COMMENT '模板类型id',
  `template_id` bigint(20) NOT NULL COMMENT '合同模板id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模板类型关联合同模板表'



wp_domain_supply
CREATE TABLE `fin_capital_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人id【未使用】',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效  1有效',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int(11) DEFAULT '0' COMMENT '版本号，乐观锁',
  `trade_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易流水号',
  `amount` decimal(18,2) DEFAULT NULL COMMENT '金额',
  `business_type` tinyint(4) DEFAULT NULL COMMENT '业务类型(1会员退款入账、2会员订单入账、3会员充值入驻)',
  `order_channel` int(11) DEFAULT NULL COMMENT '下单渠道',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店铺名称',
  `sale_order_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联订单单号',
  `phone` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `budget_type` tinyint(4) DEFAULT NULL COMMENT '收支类型(1支出  2收入)',
  `payment_type` tinyint(4) DEFAULT NULL COMMENT '支付方式(1支付宝 2微信 3银行卡 4现金)',
  `accounting_time` datetime DEFAULT NULL COMMENT '入账时间',
  `buyer_pay_account` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '买家支付账户，这里如果是微信应该存微信商户号等',
  `buyer_pay_account_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '买家支付账户名称',
  `seller_pay_account` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卖家支付账户，这里如果是微信应该存微信商户号等',
  `seller_pay_account_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卖家支付账户名称',
  `recharge_front_amount` decimal(20,2) DEFAULT NULL COMMENT '充值前金额【未使用】',
  `recharge_give_amount` decimal(20,2) DEFAULT NULL COMMENT '充值赠送金额【未使用】',
  `recharge_after_amount` decimal(20,2) DEFAULT NULL COMMENT '充值后金额【未使用】',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `relate_order_remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联单据备注',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `settle_amount` decimal(20,2) NOT NULL COMMENT '结算金额',
  `service_charge` decimal(20,2) NOT NULL COMMENT '手续费',
  `pay_type_id` bigint(20) NOT NULL COMMENT '结算方式id',
  `pay_channel_id` bigint(20) NOT NULL COMMENT '结算渠道',
  `associated_object_id` bigint(20) DEFAULT NULL COMMENT '往来单位的对象id',
  `associated_object_type` tinyint(4) DEFAULT NULL COMMENT '往来单位的对象类型0:客户1:会员',
  `associated_object_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '往来单位的对象name',
  `source_type` int(11) NOT NULL DEFAULT '101' COMMENT '来源单据类型默认 101线下零售单 102线下批发单 103线下预售单 201售后退款单 202售后退货退款单 301挂账单 ',
  `payments_status` int(4) NOT NULL DEFAULT '1' COMMENT '资金上缴状态，默认新增待上缴。1:待上缴;2:上缴中;3:已上缴',
  `payments_id` bigint(64) DEFAULT NULL COMMENT '资金上缴记录主键id',
  `settlement_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否结算状态0：未结算1：已结算',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `pay_trade_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联订单流水号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_source_type` (`source_type`) USING BTREE COMMENT '来源单据类型索引',
  KEY `idx_associated_object_name` (`associated_object_name`) USING BTREE COMMENT '往来单位的对象名称-添加索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689929381451345923 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金流水'



wp_domain_supply
CREATE TABLE `fin_capital_payments` (
  `id` bigint(64) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效  1有效',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` int(11) DEFAULT '0' COMMENT '版本号，乐观锁',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态;1:未审核;2:未通过;3:已通过;',
  `merchant_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '商户id',
  `shop_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '门店id',
  `payments_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '上缴单编码',
  `payments_total_amount` decimal(20,2) DEFAULT NULL COMMENT '上缴总金额',
  `settle_total_amount` decimal(20,2) DEFAULT NULL COMMENT '上缴单结算总金额',
  `shortfall_total_amount` decimal(20,2) DEFAULT NULL COMMENT '上缴单总差额',
  `trade_total_amount` decimal(20,2) DEFAULT NULL COMMENT '交易总金额',
  `service_charge_total_amount` decimal(20,2) DEFAULT NULL COMMENT '手续费总金额',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_payments_code` (`payments_code`) USING BTREE,
  KEY `idx_merchant_id_store_id` (`merchant_id`,`shop_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683319763670368258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金上缴'



wp_domain_supply
CREATE TABLE `fin_capital_payments_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `payments_id` bigint(64) DEFAULT NULL COMMENT '资金上缴记录主键id',
  `item_id` bigint(11) DEFAULT NULL COMMENT '资金上缴明细id',
  `capital_id` bigint(20) NOT NULL COMMENT '资金流水明细id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `created_by` bigint(11) DEFAULT NULL COMMENT '创建人',
  `updated_by` bigint(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_payments_id` (`payments_id`) USING BTREE COMMENT '资金上缴单主键id- 普通索引',
  KEY `idx_capital_id` (`capital_id`) USING BTREE COMMENT '资金流水id-普通索引 '
) ENGINE=InnoDB AUTO_INCREMENT=1683319764496646156 DEFAULT CHARSET=utf8mb4 COMMENT='#资金上缴单 关联流水明细表'



wp_domain_supply
CREATE TABLE `fin_capital_payments_item` (
  `id` bigint(64) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效  1有效',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `version` int(11) DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `payments_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '上缴单主键id',
  `payments_amount` decimal(20,2) DEFAULT NULL COMMENT '上缴单金额',
  `settle_amount` decimal(20,2) DEFAULT NULL COMMENT '上缴单结算金额',
  `pay_type_id` bigint(64) NOT NULL DEFAULT '0' COMMENT '结算方式id',
  `shortfall_amount` decimal(20,2) DEFAULT NULL COMMENT '上缴单差额',
  `trade_amount` decimal(20,2) DEFAULT NULL COMMENT '交易金额',
  `service_charge_amount` decimal(20,2) DEFAULT NULL COMMENT '手续费金额',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1683319764131741699 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金上缴明细'



wp_domain_supply
CREATE TABLE `fin_day_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人id【未使用】',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效  1有效',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int(11) DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店铺名称',
  `total_income_amount` decimal(18,2) DEFAULT NULL COMMENT '每日总收入(元)',
  `total_income_num` int(11) DEFAULT NULL COMMENT '每日总收入数量(笔)',
  `total_expenditure_amount` decimal(18,2) DEFAULT NULL COMMENT '每日总支出(元)',
  `total_expenditure_num` int(11) DEFAULT NULL COMMENT '每日总支出数量(笔)',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `accounting_time` datetime DEFAULT NULL COMMENT '账单日期',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金对账-日账单'



wp_domain_supply
CREATE TABLE `fin_month_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人id【未使用】',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效  1有效',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int(11) DEFAULT '0' COMMENT '版本号，乐观锁',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店铺名称',
  `total_income_amount` decimal(18,2) DEFAULT NULL COMMENT '每月总收入(元)',
  `total_income_num` int(11) DEFAULT NULL COMMENT '每月总收入数量(笔)',
  `total_expenditure_amount` decimal(18,2) DEFAULT NULL COMMENT '每月总支出(元)',
  `total_expenditure_num` int(11) DEFAULT NULL COMMENT '每月总支出数量(笔)',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `accounting_time` datetime DEFAULT NULL COMMENT '账单日期',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='资金对账-月账单'



wp_domain_supply
CREATE TABLE `fin_shop_procure_day_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效  1有效',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` tinyint(11) DEFAULT '0' COMMENT '版本号，乐观锁',
  `bill_time` datetime DEFAULT NULL COMMENT '账单日期',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店铺名称',
  `total_bill_amount` decimal(18,2) DEFAULT NULL COMMENT '账单金额汇总(元)',
  `total_procure_order_num` int(11) DEFAULT NULL COMMENT '采购订单数量汇总',
  `total_procure_sale_num` int(11) DEFAULT NULL COMMENT '采购售后数量汇总',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='门店采购日账单'



wp_domain_supply
CREATE TABLE `fin_shop_procure_month_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人名称',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效  1有效',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` int(11) DEFAULT '0' COMMENT '版本号，乐观锁',
  `bill_time` datetime DEFAULT NULL COMMENT '账单日期',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店铺名称',
  `total_bill_amount` decimal(18,2) DEFAULT NULL COMMENT '账单金额汇总(元)',
  `total_procure_order_num` int(11) DEFAULT NULL COMMENT '采购订单数量汇总',
  `total_procure_sale_num` int(11) DEFAULT NULL COMMENT '采购售后数量汇总',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `merchant_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='门店采购月账单'



wp_domain_supply
CREATE TABLE `finance_account_set` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账套编码',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账套名称',
  `account_set_desc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账套描述',
  `org_id` bigint(20) NOT NULL COMMENT '组织中心id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账套表'



wp_domain_supply
CREATE TABLE `finance_pay_channel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `channel_name` varchar(50) NOT NULL COMMENT '支付渠道名称',
  `channel_code` varchar(255) NOT NULL DEFAULT '' COMMENT '渠道code，对应支付中心的channel_id',
  `online` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '是否线上支付渠道；1是;0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='支付渠道表'



wp_domain_supply
CREATE TABLE `finance_pay_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `channel_id` bigint(20) unsigned NOT NULL COMMENT '渠道id',
  `pay_type_name` varchar(50) DEFAULT NULL COMMENT '结算方式名称',
  `pay_type_code` varchar(255) NOT NULL DEFAULT '' COMMENT '支付方式code',
  `pay_ratio` decimal(10,7) DEFAULT NULL COMMENT '结算手续费率1',
  `pay_ratio_unit` varchar(30) DEFAULT NULL COMMENT '结算手续费率单位',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `is_present` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否预设：1预设；0自建',
  `is_enable` tinyint(4) NOT NULL COMMENT '是否启用：1启用；0禁用',
  `is_hang_bill` tinyint(4) DEFAULT '0' COMMENT '是否挂账：1：是：0：否（默认）',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE COMMENT '商户id索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689477395731918851 DEFAULT CHARSET=utf8mb4 COMMENT='结算方式表'



wp_domain_supply
CREATE TABLE `finance_payable_form` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `account_set_id` bigint(20) NOT NULL COMMENT '账套id',
  `status` tinyint(4) NOT NULL COMMENT '申请状态,举例 0:待提交，1:待审核，2:待付款，3:付款中，4:已完成，5:已拒绝，6:待复核，7:付款失败',
  `form_type` tinyint(4) NOT NULL COMMENT '表单类型，举例 0:采购报销单，1:日常付款单，2:预付款单',
  `pay_type` tinyint(4) NOT NULL COMMENT '付款类型，举例 0:对私，1:对公',
  `pay_mode` tinyint(4) NOT NULL COMMENT '付款模式，举例 0:先票后款，1:先款后票',
  `payee_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人名称',
  `payee_org_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人组织代码',
  `payee_bank` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人开户行',
  `payee_account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人账号',
  `applicant` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申请人',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `auditor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核人',
  `audit_pass_time` datetime DEFAULT NULL COMMENT '审核通过时间',
  `payer` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '付款人',
  `pay_confirm_time` datetime DEFAULT NULL COMMENT '付款确认时间',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `total_time` bigint(20) DEFAULT NULL COMMENT '耗时总计',
  `total_payable_amount` decimal(20,8) DEFAULT NULL COMMENT '应付金额合计',
  `total_paid_amount` decimal(20,8) DEFAULT NULL COMMENT '实付金额合计',
  `finance_payable_form_no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '付款单号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_finance_payable_form_no` (`finance_payable_form_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='付款单表'



wp_domain_supply
CREATE TABLE `finance_payable_form_commodity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `finance_payable_form_id` bigint(20) unsigned NOT NULL COMMENT '付款明细id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) unsigned NOT NULL COMMENT '接入方id',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效 1有效',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `skuId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品SKU编码',
  `commodity_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `commodity_abbreviation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品简称',
  `specification_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规格编码',
  `specification_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `spu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '产品SPU编码',
  `commodity_classify_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品分类编码',
  `commodity_classify_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品分类名称',
  `brand_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌编码',
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌名称',
  `product_line_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '产品线编码',
  `product_line_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '产品线名称',
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '采购单位（采购商品的单位：只/个/双）',
  `currency` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CNY' COMMENT '货币（默认CNY人民币）',
  `sku_qty` int(11) NOT NULL COMMENT '商品数量',
  `total_payable_amount` decimal(20,8) DEFAULT NULL COMMENT '应付金额合计',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='付款明细商品表'



wp_domain_supply
CREATE TABLE `finance_payable_form_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `payable_form_id` bigint(20) NOT NULL COMMENT '付款单id',
  `pay_time` datetime DEFAULT NULL COMMENT '发生日期',
  `type_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '款项类型名称',
  `type_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '款项类型编码',
  `pay_amount` decimal(20,8) NOT NULL COMMENT '付款金额',
  `pay_remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '付款备注',
  `relate_project_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联项目编号',
  `relate_contract_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联合同编号',
  `relate_biz_order` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联业务订单号',
  `status` tinyint(4) NOT NULL COMMENT '明细状态，举例 0:未付，1:付款中，2:已付',
  `complete_time` datetime DEFAULT NULL COMMENT '实付时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='付款单明细'



wp_domain_supply
CREATE TABLE `finance_payable_form_operate_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `payable_form_id` bigint(20) DEFAULT NULL COMMENT '付款单id',
  `payable_form_detail_id` bigint(20) DEFAULT NULL COMMENT '付款单id',
  `from_data` json NOT NULL COMMENT '被修改前的数据',
  `to_data` json NOT NULL COMMENT '被修改后的数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='付款单操作日志表'



wp_domain_supply
CREATE TABLE `finance_receivable_form` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `account_set_id` bigint(20) NOT NULL COMMENT '账套id',
  `status` tinyint(4) NOT NULL COMMENT '申请状态, 举例 0:待提交，1:待审核，2:待确认，3:已完成，4:已拒绝，5:待复核',
  `form_type` tinyint(4) NOT NULL COMMENT '表单类型，举例 0:收款单',
  `receivable_type` tinyint(4) NOT NULL COMMENT '收款类型，举例 0:对私，1:对公',
  `receivable_mode` tinyint(4) NOT NULL COMMENT '收款模式，举例 0:先票后款，1:先款后票',
  `payer_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '付款人名称',
  `payer_org_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '付款人组织代码',
  `payer_bank` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '付款人开户行',
  `payer_account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '付款人账号',
  `payee_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人名称',
  `payee_org_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人组织代码',
  `payee_bank` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人开户行',
  `payee_account` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款人账号',
  `applicant` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申请人',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `auditor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核人',
  `audit_pass_time` datetime DEFAULT NULL COMMENT '审核通过时间',
  `payee` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收款确认人',
  `receivable_confirm_time` datetime DEFAULT NULL COMMENT '收款确认时间',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `total_time` bigint(20) DEFAULT NULL COMMENT '耗时总计',
  `total_receivable_amount` decimal(20,8) DEFAULT NULL COMMENT '应收金额合计',
  `total_actual_receivable_amount` decimal(20,8) DEFAULT NULL COMMENT '实收金额合计',
  `finance_receivable_form_no` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收款单号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_finance_receivable_form_no` (`finance_receivable_form_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收款单表'



wp_domain_supply
CREATE TABLE `finance_receivable_form_commodity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `finance_receivable_form_id` bigint(20) unsigned NOT NULL COMMENT '收款明细id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) unsigned NOT NULL COMMENT '接入方id',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效 1有效',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `skuId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品SKU编码',
  `commodity_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `commodity_abbreviation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品简称',
  `specification_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规格编码',
  `specification_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `spu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '产品SPU编码',
  `commodity_classify_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品分类编码',
  `commodity_classify_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品分类名称',
  `brand_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌编码',
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '品牌名称',
  `product_line_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '产品线编码',
  `product_line_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '产品线名称',
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '采购单位（采购商品的单位：只/个/双）',
  `currency` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CNY' COMMENT '货币（默认CNY人民币）',
  `sku_qty` int(11) NOT NULL COMMENT '商品数量',
  `total_receivable_amount` decimal(20,8) DEFAULT NULL COMMENT '应收金额合计',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='付款明细商品表'



wp_domain_supply
CREATE TABLE `finance_receivable_form_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `receivable_form_id` bigint(20) NOT NULL COMMENT '收款单id',
  `receivable_time` datetime DEFAULT NULL COMMENT '发生日期',
  `type_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '款项类型名称',
  `type_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '款项类型编码',
  `receivable_amount` decimal(20,8) NOT NULL COMMENT '应收款金额',
  `actual_receivable_amount` decimal(20,8) NOT NULL COMMENT '已收款金额',
  `receivable_remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收款备注',
  `relate_project_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联项目编号',
  `relate_contract_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联合同编号',
  `relate_biz_order` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联业务订单号',
  `status` tinyint(4) NOT NULL COMMENT '明细状态，举例 0:未收，1:部分收款，2:已收',
  `complete_time` datetime DEFAULT NULL COMMENT '实收时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收款单明细表'



wp_domain_supply
CREATE TABLE `finance_receivable_form_operate_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `receivable_form_id` bigint(20) DEFAULT NULL COMMENT '收款单id',
  `receivable_form_detail_id` bigint(20) DEFAULT NULL COMMENT '收款单明细id',
  `from_data` json NOT NULL COMMENT '被修改前的数据',
  `to_data` json NOT NULL COMMENT '被修改后的数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收款操作日志表'



wp_domain_supply
CREATE TABLE `lgs_company_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编码',
  `is_enabled` tinyint(1) NOT NULL COMMENT '状态：1-启用，0-禁用',
  `classify` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类别。1：物流。2：快递。',
  `type` tinyint(1) NOT NULL COMMENT '类型： 1.国内运输商 2.国际运输商 3.国际邮政',
  `service_provider` tinyint(255) NOT NULL DEFAULT '1' COMMENT '服务商: 1.快递100 2.快递鸟 3.菜鸟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='物流公司信息表'



wp_domain_supply
CREATE TABLE `lgs_service_provider` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `service_provider` int(255) NOT NULL DEFAULT '1' COMMENT '服务商: 1.快递100 2.快递鸟 3.菜鸟',
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '授权KEY',
  `customer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司编码',
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'secret',
  `userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'userid',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_ts` (`tenant_id`,`service_provider`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='物流服务商密钥配置信息'



wp_domain_supply
CREATE TABLE `lgs_template_apply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `apply_type` tinyint(1) NOT NULL COMMENT '应用模式 0-单品运费 1-店铺运费',
  `product_rule` tinyint(1) NOT NULL COMMENT '一单多品规则 0-叠加 1-最大值',
  `version` int(11) DEFAULT NULL COMMENT '乐观锁版本',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='运费模板应用模式表'



wp_domain_supply
CREATE TABLE `lgs_template_product_relation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品类型',
  `template_single_id` bigint(20) NOT NULL COMMENT '关联单品运费模板id',
  `version` int(11) DEFAULT NULL COMMENT '乐观锁版本',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品模板关联关系表'



wp_domain_supply
CREATE TABLE `lgs_template_shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `delivery_type` tinyint(1) NOT NULL COMMENT '运送方式 1-快递 2-货到付款',
  `free_flag` tinyint(1) DEFAULT NULL COMMENT '是否包邮 0-否 1-是',
  `default_flag` tinyint(1) DEFAULT NULL COMMENT '是否默认 0-否 1-是',
  `version` int(11) DEFAULT NULL COMMENT '乐观锁版本',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='店铺运费模板表'



wp_domain_supply
CREATE TABLE `lgs_template_shop_charge` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `template_shop_id` bigint(20) NOT NULL COMMENT '店铺运费模板id',
  `region_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区id',
  `region_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区名称',
  `default_flag` tinyint(1) NOT NULL COMMENT '是否默认 0-否 1-是',
  `charge_type` tinyint(1) NOT NULL COMMENT '计价方式 1-固定 2-按订单金额',
  `fixed_fare` decimal(16,2) DEFAULT NULL COMMENT '固定费用',
  `version` int(11) DEFAULT NULL COMMENT '乐观锁版本',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='店铺运费模板计费表'



wp_domain_supply
CREATE TABLE `lgs_template_shop_charge_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `template_shop_charge_id` bigint(20) NOT NULL COMMENT '店铺运费模板计费id',
  `order_amount` decimal(16,2) DEFAULT NULL COMMENT '订单金额',
  `fare` decimal(16,2) DEFAULT NULL COMMENT '运费',
  `version` int(11) DEFAULT NULL COMMENT '乐观锁版本',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='计费详情表'



wp_domain_supply
CREATE TABLE `lgs_template_shop_relation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `shop_id` bigint(20) NOT NULL COMMENT '店铺id',
  `template_shop_id` bigint(20) NOT NULL COMMENT '关联店铺运费模板id',
  `version` int(11) DEFAULT NULL COMMENT '乐观锁版本',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='店铺模板关联关系表'



wp_domain_supply
CREATE TABLE `lgs_template_single` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编码',
  `delivery_type` tinyint(1) DEFAULT NULL COMMENT '运送方式 1-快递 2-货到付款',
  `charge_type` tinyint(1) DEFAULT NULL COMMENT '计价方式 1按件 2-按重 3-按体积',
  `prior_flag` tinyint(1) NOT NULL COMMENT '单品运费优先 0-否 1-是',
  `free_flag` tinyint(1) NOT NULL COMMENT '是否包邮 0-否 1-是',
  `default_flag` tinyint(1) DEFAULT NULL COMMENT '是否默认 0-否 1-是',
  `version` int(11) DEFAULT NULL COMMENT '乐观锁版本',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='单品运费模板表'



wp_domain_supply
CREATE TABLE `lgs_template_single_express` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `template_single_id` bigint(20) NOT NULL COMMENT '单品运费模板id',
  `region_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区id',
  `region_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区名称',
  `default_flag` tinyint(1) NOT NULL COMMENT '是否默认 0-否 1-是',
  `first_quantity` decimal(16,4) DEFAULT NULL COMMENT '首件数量(包括重量体积所以设置小数)',
  `first_fare` decimal(16,2) DEFAULT NULL COMMENT '首件邮费',
  `other_quantity` decimal(16,4) DEFAULT NULL COMMENT '续件数量(包括重量体积所以设置小数)',
  `other_fare` decimal(16,2) DEFAULT NULL COMMENT '续件邮费',
  `unit` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单位',
  `version` int(11) DEFAULT NULL COMMENT '乐观锁版本',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='单品运费模板快递详情表'



wp_domain_supply
CREATE TABLE `lgs_tenser_settlement_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  `order_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易流水号',
  `order_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单类型',
  `pay_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付类型',
  `account_no` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户号',
  `account_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户名称',
  `success_time` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '平台支付成功时间',
  `settle_success_time` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '平台结算成功时间',
  `total_amount` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单金额',
  `pay_amount` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付金额',
  `settle_amount` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结算金额',
  `fee_amount` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易手续费金额',
  `grt_amount` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '担保手续费金额',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_order_no` (`order_no`) USING BTREE COMMENT '交易流水号索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='腾盛结算信息记录表'



wp_domain_supply
CREATE TABLE `lgs_travel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `express_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递单号',
  `express_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递公司编码',
  `sign` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签名用随机字符串。32位自定义字符串。添加该参数，则推送的时候会增加sign给贵司校验消息的可靠性',
  `ischeck` int(255) DEFAULT NULL COMMENT '是否签收标记',
  `state` int(255) DEFAULT NULL COMMENT '快递单当前状态，包括0在途，1揽收，2疑难，3签收，4退签，5派件，6退回，7转投，10待清关，11清关中，12已清关，13清关异常，14拒签 等13个状态',
  `data` longtext COLLATE utf8mb4_unicode_ci COMMENT '轨迹详情json',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_tec` (`tenant_id`,`express_no`,`express_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='物流轨迹表'



wp_domain_supply
CREATE TABLE `pay_channel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '最后更新人',
  `channel_name` varchar(50) NOT NULL COMMENT '支付渠道名称',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE COMMENT '商户id索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付渠道表'



wp_domain_supply
CREATE TABLE `purchase_order_calculate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效 1有效',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_available` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否可用，0：否，1：是，用于标记是否是已下架但仍在补货配置中的商品',
  `is_newest` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否最新标记，0：否，1：是',
  `purchase_order_configuration_id` bigint(20) NOT NULL COMMENT '采购补货规则配置id（关联通用配置关联表：purchase_order_configuration）',
  `shop_no` bigint(20) DEFAULT NULL COMMENT '门店编码',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` bigint(20) NOT NULL COMMENT '商品SPU编码',
  `item_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品SPU名称',
  `replenish_days` int(11) NOT NULL COMMENT '补货周期（天）',
  `calculate_num` int(11) NOT NULL COMMENT '建议补货数量',
  `sales_volume` int(11) NOT NULL COMMENT '近三十天销售量',
  `add_cycle` int(11) NOT NULL COMMENT '补货周期',
  `available_stock` int(11) NOT NULL COMMENT '可用库存',
  `transportation_stock` int(11) NOT NULL COMMENT '在途库存',
  `save_stock` int(11) NOT NULL COMMENT '安全库存',
  `purchase_pre_cycle` int(11) NOT NULL COMMENT '采购提前期',
  `shop_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店铺编码',
  `sku_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SKU编码',
  `item_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SPU编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购单补货预测表'



wp_domain_supply
CREATE TABLE `purchase_order_configuration` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效 1有效',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator_id` int(11) DEFAULT '0' COMMENT '创建人id',
  `modifier_id` int(11) DEFAULT '0' COMMENT '修改人id',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建人',
  `updated_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '修改人',
  `day_sale_mode` int(11) DEFAULT NULL COMMENT '日均销售计算方式(天)',
  `default_replenish_days` int(11) DEFAULT NULL COMMENT '默认补货周期(天)',
  `default_purchase_lead_time` int(11) DEFAULT NULL COMMENT '默认采购提前期(天)',
  `shop_no` bigint(20) DEFAULT NULL COMMENT '门店编码',
  `is_enable` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用标记',
  `shop_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店铺编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购补货规则配置'



wp_domain_supply
CREATE TABLE `purchase_order_delivery` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效 1有效',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `purchase_order_id` bigint(20) NOT NULL COMMENT '采购单Id',
  `delivery_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '配送方式 1、物流配送 2、自提',
  `delivery_company_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配送公司',
  `delivery_company_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配送公司名称',
  `logistics_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流编号',
  `province_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '街道name',
  `consignee` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_purchase_order_id` (`purchase_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购订单配送信息表'



wp_domain_supply
CREATE TABLE `purchase_order_delivery_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效 1有效',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `purchase_order_id` bigint(20) NOT NULL COMMENT '采购单Id',
  `purchase_order_item_id` bigint(20) NOT NULL COMMENT '配送信息id',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `up_id` bigint(20) NOT NULL COMMENT '商品上架id',
  `sku_qty` int(11) NOT NULL COMMENT '数量',
  `item_id` bigint(20) NOT NULL COMMENT '商品item_id',
  `sku_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品code',
  `sku_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_unit` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '计价单位',
  `sku_weight` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品的重量',
  `sku_volume` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品的体积',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_purchase_order_id` (`purchase_order_id`) USING BTREE,
  KEY `idx_purchase_order_item_id` (`purchase_order_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购订单配送信息详情表'



wp_domain_supply
CREATE TABLE `purchase_order_goods_configuration` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `is_deleted` tinyint(4) DEFAULT '0' COMMENT '删除状态 0无效 1有效',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator_id` int(11) DEFAULT '0' COMMENT '创建人id',
  `modifier_id` int(11) DEFAULT '0' COMMENT '修改人id',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建人',
  `updated_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '修改人',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` bigint(20) NOT NULL COMMENT '商品SPU编码',
  `item_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品SPU名称',
  `replenish_days` int(11) NOT NULL COMMENT '补货周期（天）',
  `shop_no` bigint(20) DEFAULT NULL COMMENT '门店编码',
  `purchase_order_configuration_id` bigint(20) NOT NULL COMMENT '采购补货规则配置id（关联通用配置关联表：purchase_order_configuration）',
  `item_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品SPU编码',
  `sku_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品SKU编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购补货规则配置(特殊商品设置)'



wp_domain_supply
CREATE TABLE `purchase_order_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `status` tinyint(4) NOT NULL COMMENT '订单状态，此状态由上层定义，比如1、2、3等',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `purchase_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '采购单号',
  `parent_order_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父级订单号',
  `split_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '拆单类型  1:未拆单、2：已拆单',
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单据类型 1:门店订货 、2、总部创建',
  `shop_no` bigint(20) DEFAULT NULL COMMENT '门店id',
  `shop_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店名称',
  `pos_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商户编码',
  `pos_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商户名称',
  `send_time` datetime NOT NULL COMMENT '要求送达日期',
  `order_total_amount` decimal(10,2) NOT NULL COMMENT '订货金额',
  `ext_json` text COLLATE utf8mb4_unicode_ci COMMENT '预留json字段',
  `order_remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单备注',
  `platform_remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '平台备注',
  `cancel_reason` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '取消订单原因',
  `province_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '街道name',
  `consignee` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `shop_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '门店编码',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '渠道id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_purchase_order_no` (`purchase_order_no`) USING BTREE,
  KEY `idx_shop_no` (`shop_no`) USING BTREE,
  KEY `idx_pos_no` (`pos_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购订单表'



wp_domain_supply
CREATE TABLE `purchase_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `purchase_order_id` bigint(20) NOT NULL COMMENT '采购订单关联id',
  `purchase_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '采购订单号',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `up_id` bigint(20) NOT NULL COMMENT '商品上架id',
  `sku_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spu_id` bigint(20) DEFAULT NULL COMMENT '商品SPU编码',
  `spu_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品SPU名称',
  `sku_version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sku版本',
  `sku_unit` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '计价单位',
  `sku_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品code',
  `item_id` bigint(20) NOT NULL COMMENT '商品item_id',
  `sku_length` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的长度',
  `sku_width` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的宽度',
  `sku_height` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的高度',
  `sku_weight` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的重量',
  `sku_json` text COLLATE utf8mb4_unicode_ci COMMENT '预留json字段',
  `sku_price` decimal(10,2) NOT NULL COMMENT '单价（含税）',
  `sku_qty` int(11) NOT NULL COMMENT '数量',
  `sku_total_amount` decimal(10,2) NOT NULL COMMENT '金额小计',
  `delivery_goods_count` int(11) DEFAULT NULL COMMENT '已配货数',
  `ship_goods_count` int(11) DEFAULT NULL COMMENT '已发货数',
  `confirm_goods_count` int(11) DEFAULT NULL COMMENT '已收货数',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '商铺id',
  `channel_id` bigint(20) DEFAULT NULL COMMENT '渠道id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_purchase_order_id_sku_id` (`purchase_order_id`,`sku_id`) USING BTREE,
  KEY `idx_purchase_order_no` (`purchase_order_no`,`sku_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购订单详情表'



wp_domain_supply
CREATE TABLE `purchase_order_status_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator_id` int(11) DEFAULT '0' COMMENT '创建人id',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建人',
  `purchase_order_id` bigint(20) DEFAULT NULL COMMENT '采购单id',
  `form_status` int(11) DEFAULT NULL COMMENT '变更前状态',
  `to_status` int(11) NOT NULL COMMENT '变更后状态',
  `operate_type` int(11) NOT NULL COMMENT '操作类型',
  `operate_result` tinyint(4) NOT NULL COMMENT '操作执行情况',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购订单状态变更表'



wp_domain_supply
CREATE TABLE `purchase_refund_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `purchase_return_order_id` bigint(20) NOT NULL COMMENT '关联采购售后订单id',
  `trade_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易流水号',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付类型：1：微信，2：支付宝，3：云闪付',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `place_time` datetime NOT NULL COMMENT '订单退款时间',
  `completion_time` datetime NOT NULL COMMENT '订单退款完成时间',
  `refund_account` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款账户，这里如果是微信应该存微信商户号等',
  `refund_account_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款账户名称',
  `seller_pay_account` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卖家支付账户，这里如果是微信应该存微信商户号等',
  `seller_pay_account_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '卖家支付账户名称',
  `ext_json` json DEFAULT NULL COMMENT '预留字段json格式,存额外的支付信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_trade_no` (`trade_no`) USING BTREE,
  KEY `idx_purchase_return_order_id` (`purchase_return_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购退款流水表'



wp_domain_supply
CREATE TABLE `purchase_return_order_delivery` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `purchase_return_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `delivery_type` tinyint(4) NOT NULL COMMENT '配送方式 1、物流配送 2、自提',
  `delivery_company_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配送公司',
  `delivery_company_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配送公司名称',
  `logistics_no` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流编号',
  `province_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '街道name',
  `consignee` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货地址',
  `ext_json` text COLLATE utf8mb4_unicode_ci COMMENT '预留字段json格式',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_purchase_return_order_id` (`purchase_return_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购售后订单配送信息表'



wp_domain_supply
CREATE TABLE `purchase_return_order_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `purchase_order_id` bigint(20) DEFAULT NULL COMMENT '采购订单关联id',
  `purchase_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '采购订单号',
  `purchase_return_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '采购售后订单号',
  `channel_id` bigint(20) NOT NULL COMMENT '渠道ID',
  `source` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '订单来源，由上层定义(店铺ID)',
  `status` int(11) NOT NULL COMMENT '订单状态',
  `total_amount` decimal(10,2) NOT NULL COMMENT '申请退款金额',
  `real_refund_amount` decimal(10,2) NOT NULL COMMENT '实际退款金额',
  `purchase_return_type` int(255) DEFAULT NULL COMMENT '采购售后类型',
  `refund_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '申请原因',
  `refund_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款描述',
  `ext_json` text COLLATE utf8mb4_unicode_ci COMMENT '预留字段json格式',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_purchase_return_order_no` (`purchase_return_order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购售后订单表'



wp_domain_supply
CREATE TABLE `purchase_return_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `purchase_return_order_id` bigint(20) NOT NULL COMMENT '关联采购售后订单id',
  `purchase_return_order_no` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联采购售后订单号',
  `purchase_order_item_id` bigint(20) DEFAULT NULL COMMENT '关联采购订单项id',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `sku_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'sku编码',
  `sku_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品单位',
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品item_id',
  `sku_length` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的长度',
  `sku_width` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的宽度',
  `sku_height` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的高度',
  `sku_weight` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的重量',
  `sku_json` text COLLATE utf8mb4_unicode_ci COMMENT '预留字段json格式,存额外的商品信息',
  `sku_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_qty` int(11) NOT NULL COMMENT '申请退货商品数量，这个数量不能大于原来订单项的数量',
  `real_sku_qty` int(11) NOT NULL COMMENT '实际退货商品数量，这个数量不能大于原来订单项的数量',
  `shop_id` bigint(20) NOT NULL COMMENT '商铺id',
  `channel_id` bigint(20) NOT NULL COMMENT '渠道id',
  `up_id` bigint(20) NOT NULL COMMENT '商品上架id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_purchase_return_order_id_sku_id` (`purchase_return_order_id`,`sku_id`) USING BTREE,
  KEY `idx_purchase_return_order_no_sku_id` (`purchase_return_order_no`,`sku_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购售后订单项表'



wp_domain_supply
CREATE TABLE `purchase_return_order_status_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `purchase_return_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `form_status` int(11) NOT NULL COMMENT '变更前状态',
  `to_status` int(11) NOT NULL COMMENT '变更后状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_purchase_return_order_id` (`purchase_return_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='采购售后订单状态变更记录'



wp_domain_supply
CREATE TABLE `tx_pay_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '最后更新人',
  `channel_id` bigint(20) unsigned NOT NULL COMMENT '渠道id',
  `pay_type_name` varchar(50) DEFAULT NULL COMMENT '结算方式名称',
  `pay_ratio` decimal(10,2) DEFAULT NULL COMMENT '结算手续费率',
  `pay_ratio_unit` varchar(30) DEFAULT NULL COMMENT '结算手续费率单位',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `is_present` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否预设：1预设；0自建',
  `is_enable` tinyint(4) NOT NULL COMMENT '是否启用：1启用；0禁用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE COMMENT '商户id索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='结算方式表'



wp_domain_tag
CREATE TABLE `tag_group` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `name` varchar(120) NOT NULL COMMENT '标签组名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '标签组类型',
  `top_merchant_id` bigint(20) NOT NULL COMMENT '顶部商户ID',
  `mutex` tinyint(1) NOT NULL COMMENT '互斥',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_top_merchant_id` (`top_merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1677254257720438787 DEFAULT CHARSET=utf8mb4 COMMENT='标签分组表'



wp_domain_tag
CREATE TABLE `tag_info` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `name` varchar(120) NOT NULL COMMENT '标签名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '标签类型-冗余group的',
  `group_id` bigint(20) NOT NULL COMMENT '分组id',
  `top_merchant_id` bigint(20) NOT NULL COMMENT '顶部商户ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_top_merchant_id` (`top_merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1677254768586665986 DEFAULT CHARSET=utf8mb4 COMMENT='标签表'



wp_domain_therapy
CREATE TABLE `case` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `case_no` varchar(32) NOT NULL COMMENT '病历单号',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `registration_id` bigint(20) NOT NULL COMMENT '挂号表id',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `doctor_id` bigint(20) NOT NULL COMMENT '接诊医生id',
  `doctor_no` varchar(32) DEFAULT NULL COMMENT '医生编码',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物id',
  PRIMARY KEY (`id`),
  KEY `idx_doctor_account_id` (`doctor_id`),
  KEY `idx_merchant_id_store_id` (`merchant_id`,`store_id`),
  KEY `idx_registration_id` (`registration_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1689885474521423875 DEFAULT CHARSET=utf8



wp_domain_therapy
CREATE TABLE `case_health_checkup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '租户id',
  `case_id` bigint(20) NOT NULL COMMENT '病例主表id',
  `health_checkup_info_id` bigint(20) NOT NULL COMMENT '体格检查id',
  `normal` tinyint(2) NOT NULL COMMENT '无明显异常:0-否、1-是',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1687742356462276611 DEFAULT CHARSET=utf8mb4 COMMENT='病历关联体格检查'



wp_domain_therapy
CREATE TABLE `case_health_checkup_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '租户id',
  `case_health_checkup_item_id` bigint(20) NOT NULL COMMENT '病历关联体格检查-检查项id',
  `health_checkup_item_detail_id` bigint(20) NOT NULL COMMENT '体格检查项id',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '自主填写内容',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1687742356642631682 DEFAULT CHARSET=utf8mb4 COMMENT='病历体格关联体格检查'



wp_domain_therapy
CREATE TABLE `case_health_checkup_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '租户id',
  `case_health_checkup_id` bigint(20) NOT NULL COMMENT '病历关联体格检查id',
  `health_checkup_item_id` bigint(20) NOT NULL COMMENT '体格检查项id',
  `other_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '填空内容',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1687742356609077251 DEFAULT CHARSET=utf8mb4 COMMENT='病历关联体格检查-检查项'



wp_domain_therapy
CREATE TABLE `case_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `case_id` bigint(20) NOT NULL COMMENT '病例主表id',
  `chief_complaint` varchar(200) DEFAULT NULL COMMENT '主诉',
  `past_history` tinyint(4) DEFAULT NULL COMMENT '既往史:1-无、2-过敏史、3-慢性病史、4-其他',
  `past_description` varchar(64) DEFAULT NULL COMMENT '既往史其他-描述',
  `disease_level` tinyint(4) DEFAULT NULL COMMENT '病情等级:1-危重、2-一级、3-二级、4-三级',
  `weight` decimal(20,2) DEFAULT NULL COMMENT '重量',
  `body_temperature` decimal(20,2) DEFAULT NULL COMMENT '体温',
  `heart_rate` decimal(20,2) DEFAULT NULL COMMENT '心率',
  `respiratory_rate` decimal(20,2) DEFAULT NULL COMMENT '呼吸频率',
  `bcs` decimal(20,2) DEFAULT NULL COMMENT 'bcs评分',
  `crt` decimal(20,2) DEFAULT NULL COMMENT 'crt',
  `medical_examine` varchar(200) DEFAULT NULL COMMENT '体格检查描述',
  `diagnosis_disease` varchar(200) DEFAULT NULL COMMENT '诊断描述',
  `advice` varchar(500) DEFAULT NULL COMMENT '医嘱',
  `blood_pressure` decimal(20,2) DEFAULT NULL COMMENT '血压',
  `diagnosis` varchar(255) DEFAULT NULL COMMENT '病情诊断',
  `diagnosis_mark` tinyint(1) DEFAULT NULL COMMENT '诊断 拟 的标记勾选， 1：勾选  0：未勾选',
  `disease_classify_id_str` text COMMENT '疾病分类id集合，以/分割',
  `file_id_str` varchar(500) DEFAULT NULL COMMENT '附件id集合',
  PRIMARY KEY (`id`),
  KEY `idx_case_id` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1689810437697249283 DEFAULT CHARSET=utf8



wp_domain_therapy
CREATE TABLE `case_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `case_id` bigint(20) NOT NULL COMMENT '病例主表id',
  `sku_id` bigint(20) NOT NULL COMMENT '挂号项目',
  `type` tinyint(4) NOT NULL COMMENT '挂号项目类型，1检查化验 2处方 3处置',
  `unit_id` bigint(20) DEFAULT NULL COMMENT '单位',
  `sku_qty` decimal(20,2) NOT NULL COMMENT '数量',
  `sku_price` decimal(20,2) NOT NULL COMMENT '单价',
  `single_dose` decimal(20,2) DEFAULT NULL COMMENT '单次用量',
  `time_of_day` decimal(20,2) DEFAULT NULL COMMENT '次/天',
  `days` decimal(20,2) DEFAULT NULL COMMENT '天数',
  `is_reference_unit` tinyint(1) DEFAULT '0' COMMENT '是否是基础单位',
  `test_examine` varchar(200) DEFAULT NULL COMMENT '检查化验描述',
  `oss_file_id_str` varchar(255) DEFAULT NULL COMMENT '检查化验结果图片(最多三张)',
  `template_id` bigint(20) DEFAULT NULL COMMENT '检查化验模板ID',
  `attachment_id` bigint(20) DEFAULT NULL COMMENT '附件ID',
  PRIMARY KEY (`id`),
  KEY `idx_case_id` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1689886381938122754 DEFAULT CHARSET=utf8



wp_domain_therapy
CREATE TABLE `copywriting_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '租户id',
  `doctor_id` bigint(20) NOT NULL COMMENT '接诊医生',
  `copywriting_type` tinyint(4) NOT NULL COMMENT '文本分组:1-主诉、2-体格检查、3-病情诊断、4医嘱',
  `title` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '文本标题',
  `content` varchar(512) CHARACTER SET utf8 NOT NULL COMMENT '文本内容',
  `used_count` int(11) DEFAULT NULL COMMENT '使用频次',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_type_tittle` (`doctor_id`,`copywriting_type`,`title`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1688806426974167042 DEFAULT CHARSET=utf8mb4 COMMENT='文本模板'



wp_domain_therapy
CREATE TABLE `disease_classify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL COMMENT '父节点id',
  `name` varchar(255) NOT NULL COMMENT '节点名',
  `path` varchar(255) NOT NULL COMMENT '节点路径',
  `level` tinyint(4) NOT NULL,
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `type` tinyint(4) DEFAULT NULL COMMENT '分类类型 0为默认分类 不可删除不可编辑不可增加子分类',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `code` varchar(32) DEFAULT NULL COMMENT '编码',
  `source` tinyint(4) DEFAULT NULL COMMENT '来源:0为平台，1为商户',
  `shelves_state` tinyint(4) DEFAULT '0' COMMENT '上下架状态0：下架、1：上架',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1669603876277628930 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='宠物疾病分类表'



wp_domain_therapy
CREATE TABLE `health_checkup_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `checkup_name` varchar(28) NOT NULL COMMENT '检查名称',
  `pet_type` int(11) NOT NULL COMMENT '宠物类别;1猫 2狗 3其他',
  `disease_classify` tinyint(1) NOT NULL COMMENT '是否关联疾病',
  `status` tinyint(1) NOT NULL COMMENT '上架状态',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1680783084882771971 DEFAULT CHARSET=utf8mb4 COMMENT='体格检查表'



wp_domain_therapy
CREATE TABLE `health_checkup_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `checkup_info_id` bigint(20) NOT NULL COMMENT '体格检查id',
  `type` int(11) NOT NULL COMMENT '类型;1填空 2单选 3多选',
  `title` varchar(64) NOT NULL COMMENT '标题',
  `sort` int(11) NOT NULL COMMENT '排序',
  `min_count` int(11) DEFAULT NULL COMMENT '最少选几项',
  `max_count` int(11) DEFAULT NULL COMMENT '最多选几项',
  `required` tinyint(1) NOT NULL COMMENT '是否必填',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1680783084895354884 DEFAULT CHARSET=utf8mb4 COMMENT='体格检查项表'



wp_domain_therapy
CREATE TABLE `health_checkup_item_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `checkup_info_id` bigint(20) NOT NULL COMMENT '体格检查id',
  `checkup_item_id` bigint(20) NOT NULL COMMENT '体格检查项id',
  `choice` varchar(64) NOT NULL COMMENT '选项',
  `sort` int(11) NOT NULL COMMENT '排序',
  `defaulted` tinyint(1) NOT NULL COMMENT '是否默认选项；1是 0否',
  `allow_fill` tinyint(1) NOT NULL COMMENT '是否允许填空；1是 0否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1680783084903743493 DEFAULT CHARSET=utf8mb4 COMMENT='体格检查项明细表'



wp_domain_therapy
CREATE TABLE `health_checkup_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `checkup_info_id` bigint(20) NOT NULL COMMENT '体格检查id',
  `disease_classify_id` bigint(20) NOT NULL COMMENT '关联疾病id',
  `first_disease_classify_id` bigint(20) NOT NULL COMMENT '关联疾病一级分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1646750716494798851 DEFAULT CHARSET=utf8mb4 COMMENT='体格检查关联疾病表'



wp_domain_therapy
CREATE TABLE `memo_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `recorder_id` bigint(20) NOT NULL COMMENT '记录人id',
  `referral_hospital` varchar(50) DEFAULT NULL COMMENT '转诊医院',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  PRIMARY KEY (`id`),
  KEY `idx_merchant_id_store_id` (`merchant_id`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1657304704180641794 DEFAULT CHARSET=utf8



wp_domain_therapy
CREATE TABLE `registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `store_id` bigint(20) NOT NULL COMMENT '门店id',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物id',
  `sku_id` bigint(20) NOT NULL COMMENT '挂号项目',
  `unit_id` bigint(20) DEFAULT NULL COMMENT '单位',
  `sku_price` decimal(20,2) NOT NULL COMMENT '单价',
  `doctor_id` bigint(20) NOT NULL COMMENT '接诊医生id',
  `expect_clinic_time` datetime DEFAULT NULL COMMENT '预计就诊日期',
  `status` tinyint(4) NOT NULL COMMENT '状态0待提交 1待就诊 2就诊中 3已结束 4已取消',
  `type` tinyint(4) DEFAULT '0' COMMENT '挂号类型0：初诊，1：复诊',
  `member_name` varchar(64) DEFAULT NULL COMMENT '会员名称',
  `pet_name` varchar(64) DEFAULT NULL COMMENT '宠物名称',
  `member_phone` varchar(64) DEFAULT NULL COMMENT '会员手机号',
  PRIMARY KEY (`id`),
  KEY `idx_doctor_account_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1689885474521423875 DEFAULT CHARSET=utf8



wp_domain_therapy
CREATE TABLE `return_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0未回访 1已回访',
  `case_id` bigint(20) DEFAULT NULL COMMENT '病例主表id',
  `expect_return_time` datetime NOT NULL COMMENT '计划回访时间',
  `expect_return_time_to` datetime DEFAULT NULL COMMENT '计划回访时间',
  `return_time` datetime DEFAULT NULL COMMENT '回访时间',
  `return_time_to` datetime DEFAULT NULL COMMENT '回访时间',
  `return_receiver_id` bigint(20) DEFAULT NULL COMMENT '回访接待人id',
  `return_record` varchar(500) DEFAULT NULL,
  `return_type` bigint(20) DEFAULT NULL COMMENT '回访类型',
  `return_plan_receiver_id` bigint(20) DEFAULT NULL COMMENT '计划回访执行人',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户 id',
  `store_id` bigint(20) NOT NULL COMMENT '门店 id',
  `member_id` bigint(20) NOT NULL COMMENT '会员 id',
  `pet_id` bigint(20) NOT NULL COMMENT '宠物 id',
  `return_method` bigint(20) DEFAULT NULL COMMENT '回访方式',
  `return_method_name` varchar(100) DEFAULT NULL COMMENT '回访方式名称',
  PRIMARY KEY (`id`),
  KEY `idx_case_id` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1689846288481329155 DEFAULT CHARSET=utf8



wp_domain_therapy
CREATE TABLE `settlement_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) NOT NULL COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `relate_item_type` tinyint(4) NOT NULL COMMENT '关联项类型: 0挂号 1病例',
  `relate_item_id` bigint(20) NOT NULL COMMENT '关联项id',
  `pay_status` tinyint(4) NOT NULL COMMENT '状态 0待付款 1付款中 2已付款',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_relate_item_id` (`relate_item_id`,`is_deleted`) USING BTREE,
  KEY `idx_member_id,pay_status` (`member_id`,`pay_status`)
) ENGINE=InnoDB AUTO_INCREMENT=1689886381946511362 DEFAULT CHARSET=utf8



wp_domain_therapy
CREATE TABLE `template_classify_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `classify_name` varchar(32) NOT NULL COMMENT '分类名称',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1673978908932599811 DEFAULT CHARSET=utf8mb4 COMMENT='模版分类表'



wp_domain_therapy
CREATE TABLE `template_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(20) NOT NULL COMMENT '平台ID（数据来源）',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `template_name` varchar(32) NOT NULL COMMENT '模板名称',
  `template_classify_info_id` bigint(20) NOT NULL COMMENT '分类id',
  `status` tinyint(1) NOT NULL COMMENT '上架状态',
  `doc_id` bigint(20) NOT NULL COMMENT '文件id',
  `chain_id` bigint(20) NOT NULL COMMENT '连锁id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1673979190659805187 DEFAULT CHARSET=utf8mb4 COMMENT='模版表'



wp_domain_trade
CREATE TABLE `after_sale_order_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `after_sale_order_id` bigint(20) NOT NULL COMMENT '退订单id',
  `after_sale_order_item_id` bigint(20) NOT NULL COMMENT '退订单项id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuid',
  `article_id` bigint(20) DEFAULT NULL COMMENT '唯一码id',
  `article_code` varchar(255) DEFAULT NULL COMMENT '物品条码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_after_sale_order_id` (`after_sale_order_id`) USING BTREE COMMENT '退订单id',
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_after_sale_order_item_id_sku_id` (`after_sale_order_item_id`,`sku_id`) USING BTREE,
  KEY `idx_article_code` (`article_code`) USING BTREE,
  KEY `idx_article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1625051043940913155 DEFAULT CHARSET=utf8mb4 COMMENT='退订单物品码表'



wp_domain_trade
CREATE TABLE `aftersale_order_audit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `aftersale_order_no` varchar(32) NOT NULL COMMENT '售后订单号',
  `aftersale_order_id` bigint(20) NOT NULL COMMENT '售后订单ID',
  `pre_status` tinyint(4) NOT NULL COMMENT '审核前状态',
  `after_status` tinyint(4) NOT NULL COMMENT '审核后状态',
  `audit_type` tinyint(4) DEFAULT NULL COMMENT '售后订单审核类型 （1：仅退款审核  2：退货退款审核）',
  `passed` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核是否通过 （0：不通过，1：通过）',
  `audit_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `operator` bigint(20) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='售后订单审核表 【未使用】'



wp_domain_trade
CREATE TABLE `aftersale_order_delivery` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `aftersale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `delivery_type` tinyint(4) NOT NULL COMMENT '配送方式 1电子 2快递 3自提 4门店配送(配送到家) 5线下门店配送类型(无需收货地址）',
  `delivery_company_code` varchar(32) DEFAULT NULL COMMENT '配送公司',
  `delivery_company_name` varchar(50) DEFAULT NULL COMMENT '配送公司名称',
  `logistics_no` varchar(32) DEFAULT NULL COMMENT '物流编号',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `consignee` varchar(64) DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) DEFAULT NULL COMMENT '收货地址',
  `ext_json` text COMMENT '预留json字段',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_aftersale_order_id` (`aftersale_order_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929329478012931 DEFAULT CHARSET=utf8mb4 COMMENT='售后订单配送信息表'



wp_domain_trade
CREATE TABLE `aftersale_order_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) DEFAULT NULL COMMENT '销售订单关联id',
  `sale_order_no` varchar(32) DEFAULT NULL COMMENT '销售订单号',
  `aftersale_order_no` varchar(32) NOT NULL COMMENT '售后订单号',
  `source` varchar(32) NOT NULL COMMENT '订单来源，由上层定义',
  `status` int(11) NOT NULL COMMENT '订单状态 1待审核 2退款关闭 3待退货 4待验货 5待退款 6退款中 7退款成功 8已删除 9待换货 10换货已完成 11换货关闭',
  `total_amount` decimal(20,2) NOT NULL COMMENT '申请退款金额',
  `real_refund_amount` decimal(20,2) NOT NULL COMMENT '实际退款金额',
  `buyer_id` bigint(20) DEFAULT NULL COMMENT '买家ID',
  `buyer_name` varchar(64) DEFAULT NULL COMMENT '买家名称',
  `buyer_type` varchar(32) DEFAULT NULL COMMENT '买家类型：0:客户 1:会员',
  `seller_id` bigint(20) DEFAULT NULL COMMENT '卖家ID',
  `seller_name` varchar(64) DEFAULT NULL COMMENT '卖家名称',
  `seller_type` varchar(32) DEFAULT NULL COMMENT '卖家类型',
  `aftersale_type` int(11) NOT NULL COMMENT '售后类型 1仅退款 2退货退款 3换货 4退订金',
  `ext_json` text COMMENT '预留json字段 【未使用】',
  `refund_reason` varchar(1000) DEFAULT NULL COMMENT '退款原因',
  `refund_description` varchar(1000) DEFAULT NULL COMMENT '退款描述 【未使用】',
  `buyer_mobile` varchar(32) DEFAULT NULL COMMENT '买家电话',
  `aftersale_order_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '售后订单类型 3有源 4无源',
  `operator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作员id 【未使用】',
  `is_shutdown` tinyint(4) DEFAULT '0' COMMENT '订单是否被会员端删除 【未使用】',
  `sales_name` varchar(60) DEFAULT NULL COMMENT '关联导购 【未使用】',
  `merchant_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '商户id',
  `refunded_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '已退款金额',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `member_card_id` bigint(20) DEFAULT NULL COMMENT '会员卡id',
  `card_type` int(4) DEFAULT NULL COMMENT '会员卡类型 0： 储值卡、1： 次卡、2： 套餐卡',
  `return_turnover_amount` decimal(20,2) DEFAULT NULL COMMENT '营业金额（会员实际付款+会员卡结算金额）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sale_order_no` (`aftersale_order_no`) USING BTREE,
  KEY `idx_buyer_id` (`buyer_id`) USING BTREE,
  KEY `idx_seller_id` (`seller_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_sale_order_no` (`sale_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929329457041410 DEFAULT CHARSET=utf8mb4 COMMENT='售后订单表'



wp_domain_trade
CREATE TABLE `aftersale_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `aftersale_order_id` bigint(20) NOT NULL COMMENT '关联售后订单id',
  `aftersale_order_no` varchar(32) NOT NULL COMMENT '关联售后订单号',
  `sale_order_item_id` bigint(20) DEFAULT NULL COMMENT '关联销售订单项id',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_price` decimal(20,2) NOT NULL COMMENT '零售价',
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品item_id',
  `sku_length` varchar(8) DEFAULT NULL COMMENT '商品的长度 【未使用】',
  `sku_width` varchar(8) DEFAULT NULL COMMENT '商品的宽度 【未使用】',
  `sku_height` varchar(8) DEFAULT NULL COMMENT '商品的高度 【未使用】',
  `sku_weight` varchar(8) DEFAULT NULL COMMENT '商品的重量 【未使用】',
  `sku_json` text COMMENT '预留json字段',
  `sku_qty` decimal(10,2) DEFAULT NULL COMMENT '申请退货商品数量，这个数量不能大于原来订单项的数量',
  `real_sku_qty` decimal(10,2) DEFAULT NULL COMMENT '实际退货商品数量，这个数量不能大于原来订单项的数量',
  `sku_name` varchar(256) DEFAULT NULL COMMENT 'SKU名称',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '商铺id',
  `sku_code` varchar(32) DEFAULT NULL COMMENT '商品code',
  `image_url` varchar(256) DEFAULT NULL COMMENT '图片url',
  `source_sku_id` bigint(20) DEFAULT NULL COMMENT '原skuid 【未使用】',
  `source_item_id` bigint(20) DEFAULT NULL COMMENT '原商品item_id 【未使用】',
  `return_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '实际退货单价',
  `return_total_amount` decimal(20,2) NOT NULL COMMENT '实际退货总金额',
  `first_item_id` bigint(20) DEFAULT NULL COMMENT '一级类目id 【未使用】',
  `first_item_name` varchar(64) DEFAULT NULL COMMENT '一级类目名称 【未使用】',
  `unique_code` tinyint(1) DEFAULT NULL COMMENT '是否有码 0否1是',
  `purchase_price` decimal(20,6) DEFAULT NULL COMMENT '成本价(区分有源无源、有码无码)',
  `identifier` int(11) DEFAULT '1' COMMENT '标识 1主商品 2赠品 3搭售',
  `cost_account_price` decimal(20,2) DEFAULT NULL COMMENT '考核成本',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '批号',
  `is_reference_unit` tinyint(1) DEFAULT NULL COMMENT '是否是基准单位',
  `min_unit_qty` decimal(10,2) DEFAULT NULL COMMENT '最小单位；数量',
  `sku_unit` varchar(8) DEFAULT NULL COMMENT '计价单位',
  `member_card_id` bigint(20) DEFAULT NULL COMMENT '会员卡id',
  `return_turnover_amount` decimal(20,2) DEFAULT NULL COMMENT '营业金额（会员实际付款+会员卡结算金额）',
  `turnover_price_min` decimal(20,6) DEFAULT NULL COMMENT '小单位营业额均价',
  `numerator` decimal(20,4) DEFAULT NULL COMMENT '换算分子',
  `denominator` decimal(20,4) DEFAULT NULL COMMENT '换算分母',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_aftersale_order_id_sku_id` (`aftersale_order_id`,`sku_id`) USING BTREE,
  KEY `idx_aftersale_order_no_sku_id` (`aftersale_order_no`,`sku_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929329457041411 DEFAULT CHARSET=utf8mb4 COMMENT='售后订单项表'



wp_domain_trade
CREATE TABLE `aftersale_order_item_salesperson` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `aftersale_order_id` bigint(20) NOT NULL COMMENT '售后订单id',
  `aftersale_order_no` varchar(32) NOT NULL COMMENT '售后订单号',
  `aftersale_order_item_id` bigint(20) NOT NULL COMMENT '售后订单项id',
  `salesperson_id` bigint(20) NOT NULL COMMENT '销售员id:userid',
  `salesperson_name` varchar(32) DEFAULT NULL COMMENT '销售员名称:name',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`aftersale_order_id`) USING BTREE,
  KEY `idx_aftersale_sale_order_item_id` (`aftersale_order_item_id`) USING BTREE,
  KEY `idx_salesperson_id` (`aftersale_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929329461235715 DEFAULT CHARSET=utf8mb4 COMMENT='售后订单项-关联销售员表'



wp_domain_trade
CREATE TABLE `aftersale_order_salesperson` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `aftersale_order_id` bigint(20) NOT NULL COMMENT '售后订单id',
  `aftersale_order_no` varchar(32) NOT NULL COMMENT '售后订单号',
  `salesperson_id` bigint(20) NOT NULL COMMENT '销售员id:userid',
  `salesperson_name` varchar(32) NOT NULL COMMENT '销售员名称:name',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`aftersale_order_id`) USING BTREE,
  KEY `idx_salesperson_id` (`aftersale_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929329482207234 DEFAULT CHARSET=utf8mb4 COMMENT='售后订单-关联销售员表'



wp_domain_trade
CREATE TABLE `aftersale_order_status_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `aftersale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `form_status` int(11) NOT NULL COMMENT '变更前状态',
  `to_status` int(11) NOT NULL COMMENT '变更后状态',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_aftersale_order_id` (`aftersale_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1483617574234611715 DEFAULT CHARSET=utf8mb4 COMMENT='售后订单状态变更记录'



wp_domain_trade
CREATE TABLE `configuration` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` varchar(32) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '最后更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `biz_no` varchar(32) NOT NULL COMMENT '业务编码',
  `key` varchar(32) NOT NULL COMMENT '配置关键字',
  `value` varchar(255) DEFAULT NULL COMMENT '配置值',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0-禁用 1-启用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_biz_no` (`biz_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='配置表 【未使用】'



wp_domain_trade
CREATE TABLE `give_preferential_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) DEFAULT NULL COMMENT '订单关联id',
  `preferential_id` varchar(255) DEFAULT NULL COMMENT '优惠实体id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品关联id',
  `change_code` varchar(255) DEFAULT NULL COMMENT '业务序列号（积分专用）',
  `change_type` tinyint(4) NOT NULL COMMENT '优惠业务类型名称，比如优惠券，积分等',
  `change_name` varchar(64) DEFAULT NULL COMMENT '优惠名称',
  `source_id` bigint(20) DEFAULT NULL COMMENT '来源id',
  `preferential_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠数值',
  `preferential_qty` int(11) DEFAULT NULL COMMENT '赠送数量，比如积分，使用数量',
  `type` tinyint(4) DEFAULT NULL COMMENT '针对类型：1：整单，2：单个sku',
  `sale_order_no` varchar(255) NOT NULL COMMENT '销售订单号',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `account_code` varchar(64) DEFAULT NULL COMMENT '会员账户',
  `status` tinyint(4) DEFAULT NULL COMMENT '优惠是否赠送开关(0 未赠送 ，1 已赠送)',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='赠送优惠信息表 【未使用】'



wp_domain_trade
CREATE TABLE `glxy_inventory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` bigint(20) unsigned NOT NULL COMMENT '物品id',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku_id',
  `cspu_id` bigint(20) DEFAULT NULL COMMENT 'cspu_id',
  `depot_id` bigint(20) NOT NULL COMMENT '所在仓库',
  `reservoir_area_id` bigint(20) DEFAULT NULL COMMENT '所在库区',
  `storage_bin_id` bigint(20) DEFAULT NULL COMMENT '所在库位',
  `status` tinyint(2) NOT NULL COMMENT '物品在库状态（在库、锁定、已出库）',
  `entry_time` datetime DEFAULT NULL COMMENT '入库时间',
  `out_time` datetime DEFAULT NULL COMMENT '出库时间',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(32) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `reason` varchar(255) DEFAULT NULL COMMENT '采购原因',
  `cost_price` decimal(20,2) DEFAULT NULL COMMENT '成本价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_depot_id_article_id` (`depot_id`,`article_id`) USING BTREE,
  KEY `idx_article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113640316346975136 DEFAULT CHARSET=utf8mb4



wp_domain_trade
CREATE TABLE `hang_bill_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `hang_bill_id` bigint(20) NOT NULL COMMENT '挂账单id',
  `hang_bill_item_id` bigint(20) NOT NULL COMMENT '挂帐单项id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuid',
  `article_id` bigint(20) DEFAULT NULL COMMENT '唯一码id',
  `article_code` varchar(255) DEFAULT NULL COMMENT '物品条码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_hang_bill_id` (`hang_bill_id`) USING BTREE COMMENT '退订单id',
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_hang_bill_item_id_sku_id` (`hang_bill_item_id`,`sku_id`) USING BTREE,
  KEY `idx_article_code` (`article_code`) USING BTREE,
  KEY `idx_article_id` (`article_id`) USING BTREE COMMENT '唯一码id索引'
) ENGINE=InnoDB AUTO_INCREMENT=1497163852266680323 DEFAULT CHARSET=utf8mb4 COMMENT='挂账单物品码表'



wp_domain_trade
CREATE TABLE `hang_bill_associated_object` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `hang_bill_id` bigint(20) NOT NULL COMMENT '挂账单关联id',
  `object_id` bigint(20) NOT NULL COMMENT '对象ID',
  `object_type` tinyint(4) NOT NULL COMMENT '对象类型0:客户1:会员2:供应商',
  `object_name` varchar(255) NOT NULL COMMENT '对象name',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_hang_bill_id` (`hang_bill_id`) USING BTREE,
  KEY `idx_object_id` (`object_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_object_name` (`object_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567796888281812995 DEFAULT CHARSET=utf8mb4 COMMENT='挂账单关联对象信息表'



wp_domain_trade
CREATE TABLE `hang_bill_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL COMMENT '商户id',
  `hang_bill_no` varchar(32) NOT NULL COMMENT '挂账单号',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '挂账门店id',
  `shop_name` varchar(64) DEFAULT NULL COMMENT '挂账门店name',
  `total_amount` decimal(20,2) NOT NULL COMMENT '挂账金额',
  `finally_pay_amount` decimal(20,2) DEFAULT NULL COMMENT '最终支付金额',
  `sale_order_id` bigint(20) DEFAULT NULL COMMENT '销售订单关联id',
  `sale_order_no` varchar(32) DEFAULT NULL COMMENT '销售订单号',
  `settlement_id` bigint(20) DEFAULT NULL COMMENT '结算人id',
  `settlement_name` varchar(255) DEFAULT NULL COMMENT '结算人name',
  `settlement_time` datetime DEFAULT NULL COMMENT '结算时间',
  `operator_id` bigint(20) DEFAULT NULL COMMENT '制单人id【未使用】',
  `operator_name` varchar(64) DEFAULT NULL COMMENT '制单人name【未使用】',
  `operator_time` datetime DEFAULT NULL COMMENT '制单时间【未使用】',
  `status` int(11) NOT NULL COMMENT '订单状态0:未结算,1:已结算,2:已作废',
  `effective` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效0:无效,1:有效(线下预售订单付定金为无效，付尾款后有效)',
  `activity_id` bigint(32) DEFAULT NULL COMMENT '促销活动id',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_hang_bill_no` (`hang_bill_no`) USING BTREE,
  KEY `idx_shop_id` (`shop_id`) USING BTREE,
  KEY `idx_shop_name` (`shop_name`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE,
  KEY `idx_settlement_id` (`settlement_id`) USING BTREE,
  KEY `idx_settlement_name` (`settlement_name`) USING BTREE,
  KEY `idx_operator_id` (`operator_id`) USING BTREE,
  KEY `idx_operator_name` (`operator_name`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_sale_order_no` (`sale_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567360942788841474 DEFAULT CHARSET=utf8mb4 COMMENT='挂账单表'



wp_domain_trade
CREATE TABLE `hang_bill_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `hang_bill_id` bigint(20) NOT NULL COMMENT '关联挂账单id',
  `hang_bill_no` varchar(32) NOT NULL COMMENT '关联挂账单no',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_original_price` decimal(20,2) DEFAULT NULL COMMENT '零售价',
  `hang_bill_price` decimal(20,2) NOT NULL COMMENT '挂账单价',
  `hang_bill_total_amount` decimal(20,2) NOT NULL COMMENT '挂账总金额',
  `finally_pay_amount` decimal(20,2) DEFAULT NULL COMMENT '最终支付金额',
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品item_id',
  `sku_qty` int(11) NOT NULL COMMENT '商品数量',
  `sku_name` varchar(256) DEFAULT NULL COMMENT '商品名称',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '商铺id',
  `unique_code` tinyint(1) DEFAULT NULL COMMENT '是否有码 0否1是',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_hang_bill_id_sku_id` (`hang_bill_id`,`sku_id`) USING BTREE,
  KEY `idx_hang_bill_no_sku_id` (`hang_bill_no`,`sku_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567796888281812994 DEFAULT CHARSET=utf8mb4 COMMENT='挂账单订单项表'



wp_domain_trade
CREATE TABLE `hang_bill_item_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `hang_bill_id` bigint(20) NOT NULL COMMENT '关联挂账单id',
  `hang_bill_no` varchar(32) NOT NULL COMMENT '关联挂账单no',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `strategy_id` bigint(20) DEFAULT NULL COMMENT '策略id',
  `sku_qty` int(10) DEFAULT NULL COMMENT '数量',
  `hang_bill_price` decimal(20,2) DEFAULT NULL COMMENT '补贴单价',
  `hang_bill_total_amount` decimal(20,2) DEFAULT NULL COMMENT '补贴总金额',
  `subsidy_method_name` varchar(255) DEFAULT NULL COMMENT '补贴方式类型描述',
  `sale_order_item_id` bigint(20) DEFAULT NULL COMMENT '关联销售明细id',
  `hang_bill_item_id` bigint(20) DEFAULT NULL COMMENT '挂帐单项id',
  `finally_pay_amount` decimal(20,2) DEFAULT NULL COMMENT '最终支付金额',
  `sale_order_id` bigint(20) DEFAULT NULL COMMENT '销售订单关联id',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1548967215558369284 DEFAULT CHARSET=utf8mb4 COMMENT='挂账关联明细'



wp_domain_trade
CREATE TABLE `hang_bill_payment_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `hang_bill_id` bigint(20) NOT NULL COMMENT '关联挂账订单id',
  `trade_no` varchar(32) NOT NULL COMMENT '交易流水号',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付类型：1：微信，2：支付宝，3：云闪付',
  `amount` decimal(20,2) NOT NULL COMMENT '金额',
  `place_time` datetime NOT NULL COMMENT '挂账单下单时间',
  `completion_time` datetime NOT NULL COMMENT '挂账单完成时间',
  `buyer_pay_account` varchar(64) DEFAULT NULL COMMENT '买家支付账户，这里如果是微信应该存微信商户号等',
  `buyer_pay_account_name` varchar(32) DEFAULT NULL COMMENT '买家支付账户名称',
  `seller_pay_account` varchar(64) DEFAULT NULL COMMENT '卖家支付账户，这里如果是微信应该存微信商户号等',
  `seller_pay_account_name` varchar(32) DEFAULT NULL COMMENT '卖家支付账户名称',
  `ext_json` json DEFAULT NULL COMMENT '预留字段json格式,存额外的支付信息',
  `settle_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '结算金额',
  `service_charge` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `pay_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算方式id',
  `pay_channel_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算渠道',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_trade_no` (`trade_no`) USING BTREE,
  KEY `idx_hang_bill_id` (`hang_bill_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567796864722407427 DEFAULT CHARSET=utf8mb4 COMMENT='挂账单支付流水表'



wp_domain_trade
CREATE TABLE `hang_bill_salesperson` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `salesperson_id` bigint(11) NOT NULL COMMENT '关联业务员id',
  `salesperson_name` varchar(512) DEFAULT NULL COMMENT '关联业务员名称',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `hang_bill_id` bigint(20) NOT NULL COMMENT '关联挂账单id',
  `hang_bill_no` varchar(32) NOT NULL COMMENT '关联挂账单no',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_salesperson_id` (`salesperson_id`) USING BTREE COMMENT '销售员id-索引',
  KEY `idx_hang_bill_id` (`hang_bill_id`) USING BTREE COMMENT '挂账单id-索引'
) ENGINE=InnoDB AUTO_INCREMENT=1548971991992451078 DEFAULT CHARSET=utf8mb4 COMMENT='挂账单-关联销售员表'



wp_domain_trade
CREATE TABLE `hang_bill_status_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `hang_bill_id` bigint(20) NOT NULL COMMENT '挂账单id',
  `form_status` int(11) NOT NULL COMMENT '变更前状态',
  `to_status` int(11) NOT NULL COMMENT '变更后状态',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_hang_bill_id` (`hang_bill_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1567796863959044098 DEFAULT CHARSET=utf8mb4 COMMENT='挂账单状态变更表'



wp_domain_trade
CREATE TABLE `hrms_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '头像',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别（0：男，1：女）',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'staff_user 中文名',
  `name_en` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'staff_user 英文名',
  `user_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'staff_user 工号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0在职 1离职',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1623197344147759106 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息'



wp_domain_trade
CREATE TABLE `order_no_replace_table` (
  `order_id` bigint(20) DEFAULT NULL,
  `source_order_no` varchar(20) DEFAULT NULL,
  `new_order_no` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4



wp_domain_trade
CREATE TABLE `pay_configuration` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(255) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) DEFAULT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `private_key` text NOT NULL COMMENT '商户私钥',
  `client_ip` varchar(64) DEFAULT NULL COMMENT '白名单Ip,与配置中心的要一致',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '支付回调地址',
  `return_url` varchar(255) DEFAULT NULL COMMENT '退款回调地址',
  `source` tinyint(4) NOT NULL COMMENT '来源',
  `payment_tenant_id` varchar(255) NOT NULL COMMENT '支付中心租户id',
  `payment_public_key` text NOT NULL COMMENT '支付中心商户公钥',
  `merchant_code` varchar(64) NOT NULL COMMENT '商户编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付配置表 【未使用】'



wp_domain_trade
CREATE TABLE `payment_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `trade_no` varchar(64) NOT NULL COMMENT '交易流水号',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付类型 1混合支付 2微信 3支付宝 4云闪付 5积分兑换 6现金 7余额 8pos 9微信稍后支付 10腾盛支付',
  `amount` decimal(20,2) NOT NULL COMMENT '金额',
  `place_time` datetime NOT NULL COMMENT '订单下单时间',
  `completion_time` datetime NOT NULL COMMENT '订单完成时间',
  `buyer_pay_account` varchar(64) DEFAULT NULL COMMENT '买家支付账户，这里如果是微信应该存微信商户号等',
  `buyer_pay_account_name` varchar(64) DEFAULT NULL COMMENT '买家支付账户名称',
  `seller_pay_account` varchar(64) DEFAULT NULL COMMENT '卖家支付账户，这里如果是微信应该存微信商户号等',
  `seller_pay_account_name` varchar(64) DEFAULT NULL COMMENT '卖家支付账户名称',
  `ext_json` text COMMENT '预留json字段',
  `pay_sale_order_no` varchar(32) DEFAULT NULL COMMENT '支付订单号',
  `pay_picture` varchar(3000) DEFAULT NULL COMMENT '支付截图，逗号分隔',
  `out_trade_no` varchar(64) DEFAULT NULL COMMENT '外部单号',
  `out_account` varchar(64) DEFAULT NULL COMMENT '外部账户',
  `settle_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '结算金额',
  `service_charge` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `pay_type_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '结算方式id',
  `pay_channel_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '结算渠道',
  `pay_use_type` int(11) DEFAULT '1' COMMENT '支付场景 1通用支付 2订金支付 3尾款支付',
  `pay_status` int(11) NOT NULL DEFAULT '1' COMMENT '支付状态 1支付中，2支付完成，3支付失败',
  `pay_result` varchar(256) DEFAULT NULL COMMENT '支付结果',
  `associated_object_id` bigint(20) DEFAULT NULL COMMENT '往来单位的对象id 【未使用】',
  `associated_object_type` tinyint(4) DEFAULT NULL COMMENT '往来单位的对象类型0:客户1:会员 【未使用】',
  `associated_object_name` varchar(255) DEFAULT NULL COMMENT '往来单位的对象name 【未使用】',
  `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否线上支付 0线下支付 1线上支付',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `turnover_amount` decimal(20,2) DEFAULT NULL COMMENT '营业额',
  `member_card_id` bigint(20) DEFAULT NULL COMMENT '会员卡id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_trade_no_sale_order_id` (`trade_no`,`sale_order_id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929277732884482 DEFAULT CHARSET=utf8mb4 COMMENT='支付流水表'



wp_domain_trade
CREATE TABLE `refund_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `aftersale_order_id` bigint(20) NOT NULL COMMENT '关联售后订单id',
  `trade_no` varchar(32) NOT NULL COMMENT '交易流水号',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付类型 1混合支付 2微信 3支付宝 4云闪付 5积分兑换 6现金 7余额 8pos 9微信稍后支付 10腾盛支付',
  `amount` decimal(20,2) NOT NULL COMMENT '金额',
  `place_time` datetime NOT NULL COMMENT '订单退款时间',
  `completion_time` datetime NOT NULL COMMENT '订单退款完成时间',
  `refund_account` varchar(64) DEFAULT NULL COMMENT '退款账户，这里如果是微信应该存微信商户号等',
  `refund_account_name` varchar(32) DEFAULT NULL COMMENT '退款账户名称',
  `seller_pay_account` varchar(64) DEFAULT NULL COMMENT '卖家支付账户，这里如果是微信应该存微信商户号等',
  `seller_pay_account_name` varchar(32) DEFAULT NULL COMMENT '卖家支付账户名称',
  `ext_json` json DEFAULT NULL COMMENT '预留字段json格式,存额外的支付信息',
  `settle_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '结算金额',
  `service_charge` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `pay_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算方式id',
  `pay_channel_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '结算渠道',
  `payment_detail_id` bigint(20) DEFAULT NULL COMMENT '关联支付明细id',
  `pay_trade_no` varchar(64) DEFAULT NULL COMMENT '关联支付明细流水号',
  `refund_status` int(11) NOT NULL DEFAULT '1' COMMENT '退款状态 1退款中 2退款完成 3退款失败',
  `refund_result` varchar(256) DEFAULT NULL COMMENT '退款结果',
  `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否线上支付 0线下支付 1线上支付',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `return_turnover_amount` decimal(20,2) DEFAULT NULL COMMENT '营业金额（会员实际付款+会员卡结算金额）',
  `member_card_id` bigint(20) DEFAULT NULL COMMENT '会员卡id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_trade_no` (`trade_no`) USING BTREE,
  KEY `idx_aftersale_order_id` (`aftersale_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929381344776194 DEFAULT CHARSET=utf8mb4 COMMENT='退款流水表'



wp_domain_trade
CREATE TABLE `sale_order_amount_change` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `sale_order_item_id` bigint(20) DEFAULT NULL COMMENT '商品明细关联id',
  `change_code` varchar(32) DEFAULT NULL COMMENT '变动编码',
  `change_type` varchar(32) NOT NULL COMMENT '优惠业务类型名称，比如优惠券，积分等',
  `change_name` varchar(64) NOT NULL COMMENT '优惠名称',
  `source_id` bigint(20) DEFAULT NULL COMMENT '来源id',
  `change_amount` decimal(20,2) NOT NULL COMMENT '优惠金额',
  `change_qty` int(11) NOT NULL COMMENT '使用数量，比如积分，使用数量',
  `type` tinyint(4) NOT NULL COMMENT '针对类型：1：整单，2：单个sku',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id_source_id` (`sale_order_id`,`source_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单金额变动明细（优惠信息）表 【未使用】'



wp_domain_trade
CREATE TABLE `sale_order_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(10) unsigned DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单id',
  `sale_order_item_id` bigint(20) NOT NULL COMMENT '订单项id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuid',
  `article_id` bigint(20) DEFAULT NULL COMMENT '唯一码id',
  `article_code` varchar(255) DEFAULT NULL COMMENT '物品条码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE COMMENT '订单id',
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_sale_order_item_id` (`sale_order_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1625050881726205954 DEFAULT CHARSET=utf8mb4 COMMENT='订单物品码表'



wp_domain_trade
CREATE TABLE `sale_order_associated_object` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `object_id` bigint(20) NOT NULL COMMENT '对象ID',
  `object_type` tinyint(4) NOT NULL COMMENT '对象类型0:客户1:会员',
  `object_name` varchar(255) NOT NULL COMMENT '对象name',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE,
  KEY `idx_object_id` (`object_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_object_name` (`object_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1483633206019743746 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单关联对象信息表'



wp_domain_trade
CREATE TABLE `sale_order_audit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_no` varchar(32) NOT NULL COMMENT '订单号',
  `sale_order_id` bigint(20) NOT NULL COMMENT '销售订单ID',
  `pre_status` tinyint(4) NOT NULL COMMENT '审核前状态',
  `after_status` tinyint(4) NOT NULL COMMENT '审核后状态',
  `passed` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核是否通过 （0：不通过，1：通过）',
  `audit_type` tinyint(4) DEFAULT NULL COMMENT '订单审核类型 （1：人工审核  2：人工财审）',
  `audit_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `operator` bigint(20) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单审核表 【未使用】'



wp_domain_trade
CREATE TABLE `sale_order_delivery` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `delivery_type` tinyint(4) NOT NULL COMMENT '配送方式 1电子 2快递 3自提 4门店配送(配送到家) 5线下门店配送类型(无需收货地址）',
  `delivery_company_code` varchar(32) DEFAULT NULL COMMENT '配送公司',
  `delivery_company_name` varchar(50) DEFAULT NULL COMMENT '配送公司名称',
  `logistics_no` varchar(32) DEFAULT NULL COMMENT '物流编号',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `consignee` varchar(64) DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) DEFAULT NULL COMMENT '收货地址',
  `pickup_code` char(20) DEFAULT NULL COMMENT '提货码',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '店铺ID',
  `shop_name` varchar(64) DEFAULT NULL COMMENT '店铺名称',
  `shop_type` varchar(32) DEFAULT NULL COMMENT '店铺类型',
  `shop_honour_id` bigint(20) DEFAULT NULL COMMENT '履约门店id',
  `shipments_status` int(11) NOT NULL DEFAULT '0' COMMENT '发货状态：0 未发货 1部分发货 2全部发货',
  `receive_cargo_status` int(11) NOT NULL DEFAULT '0' COMMENT '收货状态：0 未收货 1部分收货 2全部收货',
  `lng` decimal(10,7) DEFAULT NULL COMMENT '经度',
  `lat` decimal(10,7) DEFAULT NULL COMMENT '纬度',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1498864499416698882 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单配送信息表'



wp_domain_trade
CREATE TABLE `sale_order_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `sale_order_no` varchar(32) NOT NULL COMMENT '订单号',
  `parent_order_no` varchar(32) DEFAULT NULL COMMENT '父级订单号',
  `relate_order_id` bigint(20) DEFAULT NULL COMMENT '关联单据id',
  `relate_order_no` varchar(32) DEFAULT NULL COMMENT '关联单据编号',
  `relate_order_type` varchar(32) DEFAULT NULL COMMENT '关联单据类型',
  `split_type` tinyint(4) NOT NULL COMMENT '拆单类型  1:未拆单、2：已拆单',
  `status` int(11) NOT NULL COMMENT '订单状态 0删除 1待付款 2待客审 3待配货 4待财审 5待发货 6待收货 7已完成 8交易关闭 9定金已支付 10预收单尾款待支付 11自提订单待自提 12支付中 13订金已支付 14退款中 15已退款 16退货退款 17已退订金 18订金支付中',
  `type` varchar(32) NOT NULL COMMENT '订单类型 015线下预售 016线下零售 017线下批发 018 充值单',
  `source` varchar(32) NOT NULL COMMENT '订单来源，由上层定义',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付类型 1混合支付 2微信 3支付宝 4云闪付 5积分兑换 6现金 7余额 8pos 9微信稍后支付 10 会员卡支付 11:聚合支付',
  `real_pay_amount` decimal(20,2) NOT NULL COMMENT '应收金额(订单金额+变动金额+折让金额+运费)',
  `original_total_amount` decimal(20,2) NOT NULL COMMENT '订单金额(订单项的零售价*数量累加）',
  `freight` decimal(20,2) NOT NULL COMMENT '运费',
  `change_amount` decimal(20,2) NOT NULL COMMENT '变动金额(积分、优惠变动量x购买数量)',
  `paid_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '实收金额(已支付的金额，可能分多笔支付)',
  `buyer_id` bigint(20) DEFAULT NULL COMMENT '买家ID',
  `buyer_name` varchar(64) DEFAULT NULL COMMENT '买家名称',
  `buyer_type` varchar(32) DEFAULT NULL COMMENT '买家类型：0:客户 1:会员',
  `buyer_mobile` varchar(32) DEFAULT NULL COMMENT '买家手机号',
  `seller_id` bigint(20) DEFAULT NULL COMMENT '卖家ID',
  `seller_name` varchar(64) DEFAULT NULL COMMENT '卖家名称',
  `seller_type` varchar(32) DEFAULT NULL COMMENT '卖家类型',
  `ext_json` text COMMENT '预留json字段 【未使用】',
  `refund_status` tinyint(4) DEFAULT NULL COMMENT '退款状态 1待审核 2退款关闭 （对应前端-->>已取消）3待退货 4待验货 5待退款 6退款中 7退款成功 (对应前端-->>已完成) 8已删除',
  `external_order_no` varchar(32) DEFAULT NULL COMMENT '外部订单号 【未使用】',
  `seller_remark` varchar(256) DEFAULT NULL COMMENT '卖家备注 【未使用】',
  `buy_remark` varchar(256) DEFAULT NULL COMMENT '买家家备注 【未使用】',
  `cancel_reason` varchar(128) DEFAULT NULL COMMENT '取消订单原因 【未使用】',
  `source_order_type` tinyint(4) NOT NULL COMMENT '销售来源订单类型 1门店收银台订单 2门店手工开单 3商户手工开单 4云店扫码开单',
  `checker` varchar(20) DEFAULT NULL COMMENT '收银员',
  `sales_no` varchar(512) DEFAULT NULL COMMENT '关联业务员编号 【未使用】',
  `sales_name` varchar(512) DEFAULT NULL COMMENT '关联业务员名称 【未使用】',
  `source_order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联销售订单id(换货类型保存源订单的销售订单id)',
  `is_shutdown` tinyint(4) DEFAULT '0' COMMENT '订单是否被会员端删除 【未使用】',
  `receipt_no` varchar(64) DEFAULT NULL COMMENT '小票编号（实体门店小票编号）',
  `checker_id` bigint(20) DEFAULT NULL COMMENT '收银员账号id',
  `sale_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '销售类型：0 默认订单， 1: 诊疗商品订单',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id',
  `allowance_price_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '折让金额(折让价*数量)',
  `operator_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '操作员id 【未使用】',
  `completion_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `discount_remark` varchar(256) DEFAULT NULL COMMENT '折让原因',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `price_error` tinyint(4) NOT NULL DEFAULT '0' COMMENT '价格是否异常：1异常；0正常',
  `price_control` int(10) NOT NULL DEFAULT '0' COMMENT '价格管控 0弱管控 1强管控 默认弱管控',
  `fifo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否符合先进先出标识：1符合；0：不符合',
  `member_card_id` bigint(20) DEFAULT NULL COMMENT '会员卡id',
  `card_type` int(4) DEFAULT NULL COMMENT '会员卡类型 0： 储值卡、1： 次卡、2： 套餐卡',
  `out_bound` tinyint(1) DEFAULT '0' COMMENT '是否出库 1: 出库  0:未出库',
  `pay_fail_msg` varchar(255) DEFAULT NULL COMMENT '支付失败原因；用于支付失败状态下，展示失败原因',
  `turnover_amount` decimal(20,2) DEFAULT NULL COMMENT '营业金额（会员实际付款+会员卡结算金额）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sale_order_no` (`sale_order_no`) USING BTREE,
  KEY `idx_buyer_id` (`buyer_id`) USING BTREE,
  KEY `idx_seller_id` (`seller_id`) USING BTREE,
  KEY `idx_external_order_no` (`external_order_no`) USING BTREE,
  KEY `idx_checker_id` (`checker_id`) USING BTREE COMMENT '收银员id普通索引',
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE COMMENT '商户id索引',
  KEY `idx_updated_time` (`updated_time`) USING BTREE,
  KEY `idx_created_time` (`created_time`) USING BTREE,
  KEY `idx_operator_id` (`operator_id`) USING BTREE COMMENT '制单人id普通索引',
  KEY `idx_idx_seller_id_status` (`status`,`seller_id`) USING BTREE,
  KEY `idx_relate_order_no` (`relate_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689935686205771778 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单表'



wp_domain_trade
CREATE TABLE `sale_order_invoice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `type` tinyint(4) NOT NULL COMMENT '发票类型 1：增值税普通发票、2：增值税普通专票',
  `email` varchar(32) DEFAULT NULL COMMENT '电子邮箱地址，电子的类型必填',
  `title_type` tinyint(4) NOT NULL COMMENT '抬头类型 1：个人、2：企业',
  `title` varchar(64) DEFAULT NULL COMMENT '发票抬头',
  `number` varchar(64) DEFAULT NULL COMMENT '发票税号',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '开票金额',
  `content` varchar(128) NOT NULL COMMENT '发票内容',
  `status` tinyint(4) NOT NULL COMMENT '发票状态1 : 未开票， 2： 已开票',
  `delivery_type` tinyint(4) NOT NULL COMMENT '配送类型 1：电子、2：快递、3：自提',
  `delivery_mode_code` varchar(32) DEFAULT NULL COMMENT '配送方式编码',
  `delivery_mode_name` varchar(50) DEFAULT NULL COMMENT '配送方式名称',
  `delivery_company_code` varchar(32) DEFAULT NULL COMMENT '配送公司编码',
  `delivery_company_name` varchar(50) DEFAULT NULL COMMENT '配送公司名称',
  `logistics_no` varchar(32) DEFAULT NULL COMMENT '物流编号',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `province_name` varchar(20) DEFAULT NULL COMMENT '省name',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `city_name` varchar(20) DEFAULT NULL COMMENT '市name',
  `area_code` varchar(20) DEFAULT NULL COMMENT '区域code',
  `area_name` varchar(20) DEFAULT NULL COMMENT '区域name',
  `street_code` varchar(20) DEFAULT NULL COMMENT '街道code',
  `street_name` varchar(20) DEFAULT NULL COMMENT '街道name',
  `consignee` varchar(20) DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(64) DEFAULT NULL COMMENT '收货地址',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_sale_order_id` (`sale_order_id`) USING BTREE,
  KEY `idx_number` (`number`) USING BTREE,
  KEY `idx_title` (`title`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1482953987348127747 DEFAULT CHARSET=utf8mb4 COMMENT='发票信息表'



wp_domain_trade
CREATE TABLE `sale_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `sale_order_no` varchar(32) NOT NULL COMMENT '订单号',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `sku_name` varchar(256) DEFAULT NULL COMMENT '订单名称',
  `sku_version` varchar(32) DEFAULT NULL COMMENT 'sku版本',
  `sku_unit` varchar(8) DEFAULT NULL COMMENT '计价单位',
  `sku_code` varchar(32) DEFAULT NULL COMMENT '商品code',
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品item_id',
  `sku_length` varchar(8) DEFAULT NULL COMMENT '商品的长度 【未使用】',
  `sku_width` varchar(8) DEFAULT NULL COMMENT '商品的宽度 【未使用】',
  `sku_height` varchar(8) DEFAULT NULL COMMENT '商品的高度 【未使用】',
  `sku_weight` varchar(8) DEFAULT NULL COMMENT '商品的重量 【未使用】',
  `sku_json` text COMMENT '预留json字段',
  `sku_original_price` decimal(20,2) NOT NULL COMMENT '零售价',
  `sku_price` decimal(20,2) NOT NULL COMMENT '应收价(零售价+价格变动+折让价)',
  `change_amount` decimal(20,2) NOT NULL COMMENT '价格变动(积分、优惠导致的价格变动量)',
  `total_amount` decimal(20,2) NOT NULL COMMENT '应收金额(应收价*数量)',
  `sku_qty` decimal(20,2) NOT NULL COMMENT '商品数量(支持两位小数)',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '商铺id',
  `image_url` varchar(256) DEFAULT NULL COMMENT '图片url 【未使用】',
  `state` varchar(16) DEFAULT NULL COMMENT '商品状况，比如有些商品是经过售后二次销售的 【未使用】',
  `type` int(11) DEFAULT NULL COMMENT '商品类型，比如是否赠品 【未使用】',
  `tax` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '税额 【未使用】',
  `can_return` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可以退款0：不可以：1: 可以 【未使用】',
  `finally_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '改价后的单价',
  `first_item_id` bigint(20) DEFAULT NULL COMMENT '一级类目id 【未使用】',
  `first_item_name` varchar(64) DEFAULT NULL COMMENT '一级类目名称 【未使用】',
  `unique_code` tinyint(1) DEFAULT NULL COMMENT '是否有码 0否1是',
  `purchase_price` decimal(20,6) DEFAULT NULL COMMENT '成本价(区分有源无源、有码无码)',
  `allowance_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '折让价(改价后的单价-零售价)',
  `identifier` int(11) DEFAULT '1' COMMENT '标识 1主商品 2赠品 3搭售',
  `sort_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序码，针对同批次订单的商品项排序',
  `min_sale_price` decimal(20,2) DEFAULT NULL COMMENT '最低销售价格',
  `cost_account_price` decimal(20,2) DEFAULT NULL COMMENT '考核成本',
  `price_error` tinyint(1) NOT NULL DEFAULT '0' COMMENT '价格是否异常：1异常；0正常,与最低价相比',
  `price_error_type` int(10) DEFAULT '0' COMMENT '价格异常类型： 0正常，1单价低于最低零售价 2:单价超出最低零售价过多',
  `multiplying_power` int(10) DEFAULT NULL COMMENT '价格倍数',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `fifo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否符合先进先出标识：1符合；0：不符合',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '批次 ',
  `deduction_qty` decimal(10,2) DEFAULT NULL COMMENT '次卡抵扣次数   ',
  `deduction_price` decimal(10,2) DEFAULT NULL COMMENT '优惠金额=用次卡、套餐卡等勾选抵扣的商品的总金额',
  `member_card_id` bigint(20) DEFAULT NULL COMMENT '会员卡id',
  `card_template_id` bigint(20) DEFAULT NULL COMMENT '会员卡模板id',
  `virtualized` tinyint(1) DEFAULT NULL COMMENT '是否虚拟商品',
  `allowance_rate` decimal(20,2) DEFAULT NULL COMMENT '折扣率',
  `settlement_item_id` bigint(20) DEFAULT NULL COMMENT '诊疗结算项目id',
  `is_reference_unit` tinyint(1) DEFAULT NULL COMMENT '是否是基准单位',
  `min_unit_qty` decimal(10,2) DEFAULT NULL COMMENT '最小单位；数量',
  `turnover_amount` decimal(20,2) DEFAULT NULL COMMENT '营业金额（会员实际付款+会员卡结算金额）',
  `turnover_price_min` decimal(20,6) DEFAULT NULL COMMENT '小单位的平均营业额',
  `turnover_amount_deduction` decimal(20,2) DEFAULT '0.00' COMMENT '抵扣部分的营业额',
  `numerator` decimal(20,4) DEFAULT NULL COMMENT '换算分子',
  `denominator` decimal(20,4) DEFAULT NULL COMMENT '换算分母',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id_sku_id` (`sale_order_id`,`sku_id`) USING BTREE,
  KEY `idx_sale_order_no` (`sale_order_no`,`sku_id`) USING BTREE,
  KEY `idx_updated_time` (`updated_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689935686205771779 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单项表'



wp_domain_trade
CREATE TABLE `sale_order_item_price_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '销售订单关联id',
  `sale_order_no` varchar(32) NOT NULL COMMENT '销售订单关联单号',
  `sale_order_item_id` bigint(20) DEFAULT NULL COMMENT '关联销售明细id',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `price_strategy_id` bigint(20) DEFAULT NULL COMMENT '价格策略id',
  `type` int(10) DEFAULT NULL COMMENT '类型 1：最低零售价  2：考核成本价',
  `price` decimal(20,2) DEFAULT NULL COMMENT '价格',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689929233881436164 DEFAULT CHARSET=utf8mb4 COMMENT='价格策略信息流水表'



wp_domain_trade
CREATE TABLE `sale_order_item_salesperson` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `sale_order_no` varchar(32) NOT NULL COMMENT '订单号',
  `sale_order_item_id` bigint(20) NOT NULL COMMENT '订单项id',
  `salesperson_id` bigint(11) NOT NULL,
  `salesperson_name` varchar(512) DEFAULT NULL COMMENT '关联业务员名称',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE COMMENT '销售订单id-索引',
  KEY `idx_sale_order_item_id` (`sale_order_item_id`) USING BTREE COMMENT '销售订单项id-索引',
  KEY `idx_salesperson_id` (`salesperson_id`) USING BTREE COMMENT '销售员id-索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689935686230937602 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单项-关联销售员表'




wp_domain_trade
CREATE TABLE `sale_order_item_strategy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单id',
  `sale_order_item_id` bigint(20) NOT NULL COMMENT '订单项id',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuid',
  `strategy_id` bigint(20) NOT NULL COMMENT '活动策略id',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1548968003038945283 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单项-关联活动信息表'



wp_domain_trade
CREATE TABLE `sale_order_operate_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '销售订单关联id',
  `from_data` json NOT NULL COMMENT '被修改前的数据',
  `to_data` json NOT NULL COMMENT '被修改后的数据',
  `req_data` json NOT NULL COMMENT '请求操作数据',
  `operate_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作类型 如：1:修改金额 2:修改商品项 3:修改配送地址',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1483637335735656451 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单变更记录表'



wp_domain_trade
CREATE TABLE `sale_order_parcel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_no` varchar(32) NOT NULL COMMENT '订单号',
  `sale_order_id` bigint(20) NOT NULL COMMENT '销售订单ID',
  `parcel_code` varchar(64) NOT NULL COMMENT '包裹编号',
  `parcel_id` bigint(20) NOT NULL COMMENT '包裹ID,对应仓储的包裹ID',
  `sku_id` bigint(20) NOT NULL COMMENT 'skuID',
  `sku_qty` int(11) NOT NULL COMMENT 'sku数量',
  `logistics_code` varchar(64) DEFAULT NULL COMMENT '物流编号',
  `parcel_detail` json DEFAULT NULL COMMENT '包裹详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单包裹表 【未使用】'



wp_domain_trade
CREATE TABLE `sale_order_pet_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `sale_order_no` varchar(32) NOT NULL COMMENT '订单号',
  `pet_id` bigint(11) NOT NULL COMMENT '宠物id',
  `pet_name` varchar(512) DEFAULT NULL COMMENT '宠物名称',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE COMMENT '销售订单id-索引',
  KEY `idx_pet_id` (`pet_id`) USING BTREE COMMENT '宠物id-索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689924723876368389 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单项-关联宠物表'



wp_domain_trade
CREATE TABLE `sale_order_salesperson` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `sale_order_id` bigint(20) NOT NULL COMMENT '订单关联id',
  `sale_order_no` varchar(32) NOT NULL COMMENT '订单号',
  `salesperson_id` bigint(11) NOT NULL,
  `salesperson_name` varchar(512) DEFAULT NULL COMMENT '关联业务员名称',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE COMMENT '销售订单id-索引',
  KEY `idx_salesperson_id` (`salesperson_id`) USING BTREE COMMENT '销售员id-索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689929278076817410 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单-关联销售员表'



wp_domain_trade
CREATE TABLE `sale_order_status_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '销售订单关联id',
  `form_status` int(11) NOT NULL COMMENT '变更前状态',
  `to_status` int(11) NOT NULL COMMENT '变更后状态',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1483637334523502595 DEFAULT CHARSET=utf8mb4 COMMENT='销售订单状态变更表'



wp_domain_trade
CREATE TABLE `shopping_cart_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `type` varchar(32) NOT NULL COMMENT '订单类型 015线下预售 016线下零售 017线下批发 018 充值单',
  `buyer_id` bigint(20) DEFAULT NULL COMMENT '买家ID',
  `buyer_name` varchar(64) DEFAULT NULL COMMENT '买家名称',
  `buyer_type` varchar(32) DEFAULT NULL COMMENT '买家类型：0:客户 1:会员',
  `buyer_mobile` varchar(32) DEFAULT NULL COMMENT '买家手机号',
  `store_id` bigint(20) DEFAULT NULL COMMENT '门店id',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id',
  `status` int(11) NOT NULL COMMENT '订单状态 -1：删除  1：待结算  2：待付款 3：已付款 ',
  `member_card_id` bigint(20) DEFAULT NULL COMMENT '会员卡id',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `real_pay_amount` decimal(20,2) DEFAULT NULL COMMENT '应收金额(订单金额+变动金额+折让金额+运费)',
  `sale_order_id` bigint(20) DEFAULT NULL COMMENT '订单关联id',
  `sale_order_no` varchar(32) DEFAULT NULL COMMENT '订单号',
  `original_total_amount` decimal(20,2) DEFAULT NULL COMMENT '订单金额(订单项的零售价*数量累加）',
  `allowance_price_amount` decimal(20,2) DEFAULT NULL COMMENT '折让金额',
  `deduction_price_amount` decimal(20,2) DEFAULT NULL COMMENT '抵扣金额',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sale_order_id` (`sale_order_id`) USING BTREE COMMENT '订单id索引',
  KEY `idx_store_id` (`store_id`) USING BTREE COMMENT '门店索引',
  KEY `idx_buyer_type_id` (`buyer_type`,`buyer_id`) USING BTREE COMMENT '会员类型 以及 会员id 索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689928871808143362 DEFAULT CHARSET=utf8mb4 COMMENT='购物车表'



wp_domain_trade
CREATE TABLE `shopping_cart_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '应用id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `shopping_cart_id` bigint(20) NOT NULL COMMENT '购物车id',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_qty` decimal(20,2) NOT NULL COMMENT '商品数量',
  `sku_name` varchar(256) DEFAULT NULL COMMENT '商品名称',
  `sku_price` decimal(20,2) DEFAULT NULL COMMENT '商品价格',
  `settlement_item_id` bigint(20) DEFAULT NULL COMMENT '诊疗结算项目id',
  `is_reference_unit` tinyint(1) DEFAULT NULL COMMENT '是否是基准单位',
  `batch_no` varchar(125) DEFAULT NULL COMMENT '批次 ',
  `identifier` int(11) DEFAULT '1' COMMENT '标识 1主商品 2赠品 3搭售',
  `finally_price` decimal(20,2) DEFAULT '0.00' COMMENT '改价后的单价',
  `sku_original_price` decimal(20,2) DEFAULT NULL COMMENT '零售价',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `sku_unit` varchar(8) DEFAULT NULL COMMENT '计价单位',
  `deduction_qty` decimal(10,2) DEFAULT NULL COMMENT '次卡抵扣次数   ',
  `member_card_id` bigint(20) DEFAULT NULL COMMENT '会员卡id',
  `batch_json` json DEFAULT NULL COMMENT '诊疗商品的批号json',
  `allowance_rate` decimal(20,2) DEFAULT NULL COMMENT '折扣率',
  `total_amount` decimal(20,2) DEFAULT NULL COMMENT '应收金额',
  `release_version` bigint(32) DEFAULT NULL COMMENT 'sku版本',
  `numerator` decimal(20,4) DEFAULT NULL COMMENT '换算分子',
  `denominator` decimal(20,4) DEFAULT NULL COMMENT '换算分母',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_sku_id` (`sku_id`) USING BTREE COMMENT 'sku_id 索引',
  KEY `idx_shopping_cart_id` (`shopping_cart_id`) USING BTREE COMMENT '卡片id 索引',
  KEY `idx_settlement_item_id` (`settlement_item_id`) USING BTREE COMMENT '诊疗结算商品项id索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689928938162032643 DEFAULT CHARSET=utf8mb4 COMMENT='购物车商品项表'



wp_domain_trade
CREATE TABLE `shopping_cart_item_salesperson` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `shopping_cart_item_id` bigint(20) NOT NULL COMMENT '购物车商品项id',
  `shopping_cart_id` bigint(20) NOT NULL COMMENT '购物车id',
  `salesperson_id` bigint(11) NOT NULL,
  `salesperson_name` varchar(512) DEFAULT NULL COMMENT '关联业务员名称',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_salesperson_id` (`salesperson_id`) USING BTREE COMMENT '销售员id-索引',
  KEY `idx_sale_order_item_id` (`shopping_cart_item_id`) USING BTREE COMMENT '卡片商品项id-索引',
  KEY `idx_shopping_cart_id` (`shopping_cart_id`) USING BTREE COMMENT '卡片id-索引'
) ENGINE=InnoDB AUTO_INCREMENT=1689928938178809859 DEFAULT CHARSET=utf8mb4 COMMENT='购物车商品项-关联销售员表'



wp_domain_trade
CREATE TABLE `spell_order_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `sale_order_id` bigint(20) NOT NULL COMMENT '销售订单id',
  `user_account` varchar(32) DEFAULT NULL COMMENT '用户账号',
  `activity_time_length` int(11) NOT NULL COMMENT '活动时长，单位是小时',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `spell_remain_count` int(11) DEFAULT NULL COMMENT '拼团剩余人数',
  `spell_result` int(11) NOT NULL COMMENT '拼团结果',
  `activity_timeout` datetime NOT NULL COMMENT '活动截止时间',
  `spell_id` bigint(20) DEFAULT NULL COMMENT '拼团id',
  `total_spell_remain_count` int(11) DEFAULT NULL COMMENT '开团总人数，只有团长订单才会存储该数据',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `spell_order_type` int(11) NOT NULL COMMENT '拼团类型 1、普通拼团 2、老带新拼团',
  `leader_user_id` bigint(20) NOT NULL COMMENT '团长的用户id',
  `spell_group_id` bigint(20) DEFAULT NULL COMMENT '记录促销中心返回的参团id',
  `activity_name` varchar(128) NOT NULL COMMENT '活动名称',
  `sale_order_no` varchar(32) NOT NULL COMMENT '销售订单号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_sale_order_id` (`sale_order_id`) USING BTREE,
  KEY `idx_spell_id` (`spell_id`) USING BTREE,
  KEY `idx_user_account` (`user_account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='拼团记录表 【未使用】'



wp_domain_trade
CREATE TABLE `temp_article_sku_mapping` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `app_id` bigint(20) NOT NULL COMMENT '接入方id',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '版本号，乐观锁',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id',
  `article_id` bigint(20) DEFAULT NULL COMMENT '唯一码id',
  `article_code` varchar(255) DEFAULT NULL COMMENT '物品条码',
  `sku_id` bigint(20) NOT NULL COMMENT '商品id',
  `sku_name` varchar(256) DEFAULT NULL,
  `sku_version` varchar(32) DEFAULT NULL COMMENT 'sku版本',
  `sku_unit` varchar(8) DEFAULT NULL COMMENT '计价单位',
  `sku_code` varchar(32) DEFAULT NULL COMMENT '商品code',
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品item_id',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='临时表_商户唯一码和sku映射表'



wp_domain_user
CREATE TABLE `hrms_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '头像',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别（0：男，1：女）',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'staff_user 中文名',
  `name_en` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'staff_user 英文名',
  `user_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'staff_user 工号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0在职 1离职',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `is_doctor` tinyint(1) DEFAULT '0' COMMENT '是否配置为挂号医生(0：否，1：是)【废弃】',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1689545024896540675 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息'



wp_domain_user
CREATE TABLE `hrms_user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `user_id` bigint(20) NOT NULL COMMENT '员工id',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账户id',
  `account_name` varchar(64) DEFAULT NULL COMMENT '账户名',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1511610858318647299 DEFAULT CHARSET=utf8mb4 COMMENT='用户-账户关系表'



wp_domain_user
CREATE TABLE `hrms_user_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(20) NOT NULL COMMENT '创建人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `user_id` bigint(20) NOT NULL COMMENT '员工id',
  `organization_id` bigint(20) DEFAULT NULL COMMENT '组织id',
  `organization_type` tinyint(1) unsigned NOT NULL COMMENT '组织类型0:商户，1门店，2运营平台',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `merchant_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商户id 非商户内人员填0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_organization_id` (`organization_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1511610857907605506 DEFAULT CHARSET=utf8mb4 COMMENT='用户所属组织关系表'



wp_domain_user
CREATE TABLE `hrms_user_qualification` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_by` bigint(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` bigint(64) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `app_id` bigint(64) NOT NULL COMMENT '接入方id',
  `tenant_id` varchar(32) NOT NULL COMMENT '租户id',
  `type` tinyint(4) NOT NULL COMMENT '资质类型;1:医生;2:护士',
  `user_id` bigint(64) NOT NULL COMMENT '人员id',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `number` varchar(32) DEFAULT NULL COMMENT '资质编号',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='人员资质管理'



wp_sso_authentication
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) NOT NULL,
  `token` blob,
  `authentication_id` varchar(128) DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL,
  `client_id` varchar(128) NOT NULL,
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4



wp_sso_authentication
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(128) NOT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) NOT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4



wp_sso_authentication
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(128) DEFAULT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4



wp_sso_authentication
CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4



wp_sso_authentication
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) NOT NULL,
  `token` blob,
  `authentication` blob,
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4



wp_sso_authentication
CREATE TABLE `wx_token_scheduled` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用ID',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(10) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `created_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '最后更新时间',
  `wx_app_id` varchar(32) DEFAULT NULL COMMENT '微信appID',
  `token_name` varchar(255) DEFAULT NULL COMMENT 'token名称',
  `token_value` varchar(255) DEFAULT NULL COMMENT 'token值',
  `token_refresh_value` varchar(255) DEFAULT NULL COMMENT 'token刷新值',
  `expires_in` int(11) DEFAULT NULL COMMENT '过期时间（单位:秒）',
  `expires_time` datetime DEFAULT NULL COMMENT '过期时间',
  `refresh_time` datetime DEFAULT NULL COMMENT '刷新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='微信以及其对应的secret表'

