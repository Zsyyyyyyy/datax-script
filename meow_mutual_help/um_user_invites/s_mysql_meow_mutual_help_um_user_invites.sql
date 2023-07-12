create table if not exists s_mysql_meow_mutual_help_um_user_invites (
    id string comment '主键'
    ,active_code string comment '活动code'
    ,activity_type string comment 'NORMAL 普通邀请助力
INVITE_NEW 拉新邀请'
    ,inviter_user_id string comment '邀请人用户id'
    ,inviter_user_phone string comment '邀请人手机号'
    ,inviter_code string comment '邀请人邀请码'
    ,invitee_user_id string comment '被邀请人用户id'
    ,invitee_user_phone string comment '被邀请人手机号'
    ,invitee_code string comment '被邀请人邀请码'
    ,invitee_nick_name string comment '被邀请人昵称'
    ,invitee_avatar_url string comment '被邀请人头图'
    ,reg_platform string comment '注册手机平台 0 安卓 1 ios 3PC 4小程序 5H5 99其他'
    ,invite_channel string comment '邀请渠道'
    ,create_time string comment '创建时间'
    ,update_time string comment '修改时间'
    ,covered string comment '是否覆盖了；0没有；H5注册APP登录后，需要将用户信息同步到um_user'
    ,device_id string comment '设备号'
    ,effectived string comment '是否有效。0待生效、1有效、2设备号达到上限、3被邀请手机号存在注销记录'
) comment '' 
partitioned by (ds string comment 'yyyyMMdd') 
stored as parquet
tblproperties ('parquet.compression' = 'snappy');

load data inpath '/cpp_data/mysql/meow_mutual_help/um_user_invites/full' overwrite into table s_mysql_meow_mutual_help_um_user_invites partition(ds = '$(date)s'); 