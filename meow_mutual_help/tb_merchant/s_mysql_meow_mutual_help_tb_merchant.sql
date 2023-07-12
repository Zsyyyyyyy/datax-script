create table if not exists s_mysql_meow_mutual_help_tb_merchant (
    id string comment '商家id'
    ,user_id string comment '用户id'
    ,merchant_name string comment '商家名称'
    ,avatar_url string comment '商家头像'
    ,background_pic_url string comment '背景图片url'
    ,description string comment '商家介绍'
    ,company_name string comment '公司名称'
    ,business_license_url string comment '营业执照url'
    ,usci string comment '社会统一信用代码'
    ,legal_person_name string comment '法人姓名'
    ,idcard_no string comment '身份证号码'
    ,lon string comment '商家具体位置 经度'
    ,lat string comment '商家具体位置 维度'
    ,geohash string comment 'geohash编码'
    ,province string comment '商家所属省'
    ,province_code string comment '商家所属省code'
    ,city string comment '商家所属城市'
    ,city_code string comment '商家所属省code'
    ,county string comment '商家所属区县'
    ,county_code string comment '商家所属区县code'
    ,AdministrativeDivisionsCode string comment '行政区划代码'
    ,address string comment '商家详细地址'
    ,service_tel string comment '客服电话'
    ,merchant_status string comment '商家状态'
    ,merchant_type string comment '商家类型'
    ,audit_status string comment '认证状态'
    ,del_flag string comment '删除表示 1：删除 0：未删除'
    ,create_time string comment '创建时间'
    ,create_user string comment '创建人名称'
    ,update_time string comment '修改时间'
    ,update_user string comment '修改人名称'
    ,idcard_front_img_url string comment '身份证正面url'
    ,idcard_back_img_url string comment '身份证反面url'
    ,remark string comment '备注'
    ,audit_time string comment '审核时间'
    ,partner_id string comment '合伙人ID'
    ,old_merchant_id string comment '老表对应ID'
    ,merchant_account_type string comment '商家账户类型'
    ,register_operate_source string comment '开户操作来源'
    ,register_operate_user string comment '开户操作人'
    ,register_operate_time string comment '开户操作时间'
    ,register_reason string comment '开通个人户原因'
    ,head_shop_id string comment '总店id'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/tb_merchant/full' overwrite into table s_mysql_meow_mutual_help_tb_merchant partition(ds = '$(date)s'); 