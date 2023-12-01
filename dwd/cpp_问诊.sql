select msg_type,content 
from s_mongo_platform_core_im_conversation_history 
where substr(target_ry_id,1,4) = 'ZXWZ'
and msg_type = 'RC:ImgMsg' 
limit 100;


select
t3.content
from 
(
    select consultation_sheet_id
    from s_mongo_interaction_cpp_customer_tool_diagnostic_sheet 
    where ds = '20231116' 
    and create_time > '2023-08-03'
    and diagnosis regexp '皮肤'
    group by consultation_sheet_id
)t1
left join
(
    select id,group_id
    from s_mongo_interaction_cpp_customer_tool_consultation_sheet
    where ds = '20231116' 
    -- and create_time > '2023-08-03'
    group by id,group_id
)t2
on t1.consultation_sheet_id = t2.id
left join
(
    select content ,target_ry_id
    from s_mongo_platform_core_im_conversation_history 
    where ds = '20231116'
    and substr(target_ry_id,1,4) = 'ZXWZ'
    and msg_type = 'RC:ImgMsg'     
    -- and create_time > '2023-08-03'
    and content is not null
)t3
on t2.group_id = t3.target_ry_id
where content is not null
group by content
;
limit 100;








select
-- t3.content他。
t1.consultation_sheet_id
from 
(
    select consultation_sheet_id
    from s_mongo_interaction_cpp_customer_tool_diagnostic_sheet 
    where ds = '20231116' 
    and create_time > '2023-08-03'
    and diagnosis regexp '皮肤'
    group by consultation_sheet_id
)t1
left join
(
    select id,group_id
    from s_mongo_interaction_cpp_customer_tool_consultation_sheet
    where ds = '2023116' 
    -- and create_time > '2023-08-03'
    group by id,group_id
)t2
on t1.consultation_sheet_id = t2.id limit 100;





select
t3.content
,t2.id,t2.group_id,
t3.target_ry_id
from 
(
    select id,group_id
    from s_mongo_interaction_cpp_customer_tool_consultation_sheet
    where ds = '2023116' 
    -- and create_time > '2023-08-03'
    group by id,group_id
)t2
left join
(
    select content ,target_ry_id
    from s_mongo_platform_core_im_conversation_history 
    where ds = '20231116'
    and substr(target_ry_id,1,4) = 'ZXWZ'
    and msg_type = 'RC:ImgMsg'     
    -- and create_time > '2023-08-03'
    and content is not null
)t3
on t2.group_id = t3.target_ry_id
where content is not null

limit 100;
