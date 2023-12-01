
with dis_type_flat as (
select

t5.id as level_1_id,
t5.code as level_1_code,
t5.name as level_1_name,

t4.id as level_2_id,
t4.code as level_2_code,
t4.name as level_2_name,

t3.id as level_3_id,
t3.code as level_3_code,
t3.name as level_3_name,

t2.id as level_4_id,
t2.code as level_4_code,
t2.name as level_4_name,

t1.id as level_5_id,
t1.code as level_5_code,
t1.name as level_5_name,
t1.level + 1 as level,
t1.created_time,
t1.updated_time

    from
    (
        select id,name,level,created_time,updated_time,code,if(parent_id = '0',id,parent_id) as parent_id from cpp.dim_ther_dis_type where ds = 'all' and id not in ('1635953567104954369','1651596688908595202','1651642447301423106','1635953597324914689','1635953629260345345')
    )t1
    left join
    (
        select id,name,code,if(parent_id = '0',id,parent_id) as parent_id from cpp.dim_ther_dis_type where ds = 'all'
    )t2
    on t1.parent_id = t2.id
    left join
    (
        select id,name,code,if(parent_id = '0',id,parent_id) as parent_id from cpp.dim_ther_dis_type where ds = 'all'
    )t3
    on t2.parent_id = t3.id
    left join
    (
        select id,name,code,if(parent_id = '0',id,parent_id) as parent_id from cpp.dim_ther_dis_type where ds = 'all'
    )t4
    on t3.parent_id = t4.id
    left join
    (
        select id,name,code,if(parent_id = '0',id,parent_id) as parent_id from cpp.dim_ther_dis_type where ds = 'all'
    )t5
    on t4.parent_id = t5.id
)
select * from dis_type_flat;




SELECT 
    name,
    count(1) as dis_cnt,
    round(count(1) / max(sum_cnt), 2)  as dis_cnt_ratio
    -- count(1) / max(sum_cnt)  as dis_cnt_ratio 、
FROM 
(
select
    id,
    case_id,
    count(1) over() as sum_cnt,
    -- disease_classify_id_str,
    split(dis_type,',')[0] as dis_id
from cpp.dwd_ther_case_info
LATERAL VIEW explode(split(disease_classify_id_str,'/')) dis_type as dis_type
where ds = 'all'
-- and created_time > '2023-09-14 00:00:00'
and REGEXP_REPLACE(SUBSTR(updated_time,1,10),'-','') = '${bizdate}'
)t1 
left join
(
    select id ,name,level from cpp.dim_ther_dis_type where ds = 'all'
)t2
on t1.dis_id = t2.id
group by name ;