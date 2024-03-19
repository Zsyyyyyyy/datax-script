doctor_user_name
dialog
nickName
gender
age
weight
petType
categoryName
sterilizationStatus
vaccine
expelInsects
illnessDesc
symptom_type
symptomImags
symptomDuration
diagnosis_index
diagnosis
diagnosis_remarks
offline_advice_index
offline_advice
medication_advice
other_advice

select 
    user_id,
    user_name as doctor_name
from cpp.s_mongo_interaction_cpp_customer_tool_doctor_info
where ds = '20240317' 
and user_id in ('221853469624705024', '231554616571039744')
limit 100;



select 
id,
nick_name,
sex,
birth,
category_name,
sterilization_status,
vaccin_status
from cpp.s_mysql_meow_mutual_help_t_pet where ds = '20240317';


--问诊单
select 
pre_filled_info,
symptom_type
from cpp.s_mongo_interaction_cpp_customer_tool_consultation_sheet
where ds = '20240317'



--处方单
select 
    consultation_sheet_id,
    doctor_user_id,
    valid,
    diagnosis_index,
    diagnosis,
    diagnosis_remarks,
    offline_advice_index,
    offline_advice,
    medication_advice,
    other_advice,
    weight
from cpp.s_mongo_interaction_cpp_customer_tool_diagnostic_sheet 
where ds = '20240108' 
and create_time > '2024-01-01'










select
    t1.consultation_sheet_id,
    t1.doctor_user_id,
    t1.valid,
    t1.diagnosis_index,
    -- t1.diagnosis,
    t1.diagnosis_remarks,
    t1.offline_advice_index,
    t1.offline_advice,
    t1.medication_advice,
    t1.other_advice,
    -- t1.weight
    -- t2.group_id,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.nickName') as nickName,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.gender') as gender,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.petType') as petType,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.sterilizationStatus') as sterilizationStatus,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.age') as age,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.categoryName') as categoryName,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.illnessDesc') as illnessDesc,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.vaccine') as vaccine,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.expelInsects') as expelInsects,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.symptomImags') as symptomImags,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.symptomDuration') as symptomDuration,
    get_json_object(cpp_bson_udf(t2.pre_filled_info),'$.weight') as weight,
    -- t2.symptom_type,
    t3.s_content
    -- t3.msg_type
from 
(
    select 
        consultation_sheet_id,
        doctor_user_id,
        valid,
        diagnosis_index,
        diagnosis,
        diagnosis_remarks,
        offline_advice_index,
        offline_advice,
        medication_advice,
        other_advice,
        weight
    from s_mongo_interaction_cpp_customer_tool_diagnostic_sheet 
    where ds = '20240318' 
    -- and create_time > '2023-08-03'
    and doctor_user_id in ('221853469624705024', '231554616571039744')
    -- and diagnosis regexp '吐'
    -- and diagnosis regexp '毛'
)t1
left join
(
    select 
        id,
        group_id,
        pre_filled_info,
        symptom_type
    from s_mongo_interaction_cpp_customer_tool_consultation_sheet
    where ds = '20240318' 
    -- and create_time > '2023-08-03'
    -- group by id,group_id
)t2
on t1.consultation_sheet_id = t2.id
left join
(
    select
    target_ry_id,
    regexp_replace(regexp_replace(concat_ws(';;',collect_set(s_content)),'221853469624705024','龚泽杰'),'231554616571039744','康佳') as s_content
    from
    (
        select 
            content,
            target_ry_id,
            -- msg_type,
            case when from_user_id = '221853469624705024' then '龚泽杰'
                 when from_user_id = '231554616571039744' then '康佳'
                 else 'user' end,
            create_time,
            concat(create_time ,' ' ,from_user_id,' ', content) as s_content
        from s_mongo_platform_core_im_conversation_history 
        where ds = '20240318'
        and substr(target_ry_id,1,4) = 'ZXWZ'
        -- and from_user_id in ('221853469624705024','')
        -- and msg_type = 'RC:ImgMsg'     
        and msg_type = 'RC:TxtMsg'     
        -- and create_time > '2023-08-03'
        and content is not null  
    )t1 group by target_ry_id    
)t3
on t2.group_id = t3.target_ry_id
limit 10
;
