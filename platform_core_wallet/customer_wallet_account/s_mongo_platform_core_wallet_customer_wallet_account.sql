create table if not exists s_mongo_platform_core_wallet_customer_wallet_account (
    id string comment 'None'
    ,userId string comment 'None'
    ,createTime string comment 'None'
    ,updateTime string comment 'None'
    ,status string comment 'None'
    ,contractNo string comment 'None'
    ,bindState string comment 'None'
    ,customerName string comment 'None'
    ,certificateNo string comment 'None'
    ,imageFront string comment 'None'
    ,imageBack string comment 'None'
    ,fileNo string comment 'None'
    ,passwordStatus string comment 'None'
    ,completeTime string comment 'None'
    ,callSource string comment 'None'
    ,merchantId string comment 'None'
    ,shopId string comment '店铺id'
    ,subjectChangeFlag string comment 'None'
    ,logoffStatus string comment 'None'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_core_wallet/customer_wallet_account/full' overwrite into table s_mongo_platform_core_wallet_customer_wallet_account partition(ds = '$(date)s'); 