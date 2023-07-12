create table if not exists s_mongo_platform_core_wallet_business_wallet_account (
    id string comment 'None'
    ,userId string comment 'None'
    ,contractNo string comment 'None'
    ,createTime string comment 'None'
    ,updateTime string comment 'None'
    ,accountStatus string comment 'None'
    ,bindCardStatus string comment 'None'
    ,passwordStatus string comment 'None'
    ,parentWalletId string comment 'None'
    ,openAccountInfo string comment 'None'
    ,completeTime string comment 'None'
    ,subjectChangeFlag string comment 'None'
    ,shopId string comment '店铺id'
    ,parentShopId string comment '总店id'
    ,accountMode string comment '分账模式
   
    @see com.meow.platform.constants.wallet.busines'
    ,accountType string comment '钱包店铺类型
   
    @see com.meow.platform.constants.wallet.busin'
    ,logoffStatus string comment 'None'
) comment '' 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mongo/platform_core_wallet/business_wallet_account/full' overwrite into table s_mongo_platform_core_wallet_business_wallet_account partition(ds = '$(date)s'); 