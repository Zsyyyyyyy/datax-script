create table if not exists dim_ther_dis_type_df(
    level1_id bigint comment '一级病症id'
    ,level1_code string comment '一级病症code'
    ,level1_name string comment '一级病症名称'
    ,level2_id bigint comment '二级病症id'
    ,level2_code string comment '二级病症code'
    ,level2_name string comment '二级病症名称'
    ,level3_id bigint comment '三级病症id'
    ,level3_code string comment '三级病症code'
    ,level3_name string comment '三级病症名称'
    ,merchant_id bigint comment '商家id'
    ,source string comment '来源：0,平台，1,商家'
    ,shelves_state string comment '上架状态：0,下架，1,上架'
    ,app_id bigint comment 'app_id'
    ,created_by string comment '创建人'
    ,updated_by string comment '修改人'
    ,created_time string comment '创建时间'
    ,created_time_year int comment '创建时间-年'
    ,created_time_month int comment '创建时间-月'
    ,created_time_day int comment '创建时间-日'
    ,updated_time string comment '更新时间'
    ,updated_time_year int comment '更新时间-年'
    ,updated_time_month int comment '更新时间-月'
    ,updated_time_day int comment '更新时间-日'
)
partitioned by (ds string comment '日期')
comment '疾病分类表';



select 
* 
from (
    select 
        id
        ,code
        ,name
        ,level
        ,parent_id
        ,merchant_id
        ,source
        ,shelves_state
        ,created_time
        ,updated_time
        -- ,created_by
        -- ,updated_by
        ,row_number() over(partition by name order by default_sort desc) as rn
    from cpp.dim_ther_dis_type 
    where ds = 'all'
    and is_deleted = '0'
    and shelves_state = '1'
    and id not in ('1651596688908595202'
                    ,'1635953567104954369'
                    ,'1635953597324914689'
                    ,'1651642447301423106'
                    ,'1635953629260345345'
                    ,'1650802915403120641'
                    ,'1650802954791829505')
)t where rn = '1';

select

*
from dwd_ther_case
where ds = 'all'

select
    id,
    case_id,
    disease_classify_id_str
from dwd_ther_case_info
where ds = 'all'
limit 11;


select 
* 
from dwd_ther_reg 
where ds = 'all'



create table if not exists ads_dis_type_ratio_1d (
    name string comment '疾病名称'
    ,dis_cnt bigint comment '疾病次数'
    ,dis_cnt_ration string comment '疾病次数占比'
) comment '每日问诊疾病表'                          
partitioned by (ds string comment '日期分区');



select 
from 