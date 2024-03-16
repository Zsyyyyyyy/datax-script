
select 
     t1.id
    ,t1.created_time
    ,t1.updated_time
    ,t1.outbound_order_id
    ,t1.sku_id
    ,t1.sku_price
    ,t1.sku_qty
    ,t1.item_id
    ,t1.real_sku_qty
    ,t1.outbound_price
    ,t1.sku_total_amount
    ,t1.outbound_total_amount
    ,t1.batch_no
    ,t1.manufacture_date
    ,t1.expiration_date
    ,t1.validity_type
    ,t1.validity_value
    ,t1.business_type

    ,t2.outbound_order_no
    ,t2.extend_no
    ,t2.extend_id
    ,t2.extend_type
    ,t2.accessory_path
    ,t2.from_depot_id
    ,t2.to_depot_id
    ,t2.status
    ,t2.outbound_order_qty
    ,t2.outbound_type
    ,t2.supplier_id
    ,t2.from_member_id
    ,t2.to_member_id
    ,t2.reason
    ,t2.finance_check
    ,t2.audit_date
    ,t2.audit_by
    ,t2.outbound_date
    ,t2.merchant_id
    ,t2.from_terminal
from (
    select
        id
        ,is_deleted
        ,created_time
        ,updated_time
        ,outbound_order_id
        ,sku_id
        ,sku_price
        ,sku_qty
        ,item_id
        ,real_sku_qty
        ,outbound_price
        ,sku_total_amount
        ,outbound_total_amount
        ,batch_no
        ,manufacture_date
        ,expiration_date
        ,validity_type
        ,validity_value 
        ,merchant_id
        ,business_type
    from  wp_domain_storage.s_mysql_wp_domain_storage_stg_outbound_order_sku_rt where is_deleted = '0'
)t1     
left join 
(
    select
         id
        ,is_deleted
        ,created_time
        ,updated_time
        ,outbound_order_no
        ,extend_no
        ,extend_id
        ,extend_type
        ,accessory_path
        ,from_depot_id
        ,to_depot_id
        ,status
        ,outbound_order_qty
        ,outbound_type
        ,supplier_id
        ,from_member_id
        ,to_member_id
        ,reason
        ,finance_check
        ,audit_date
        ,audit_by
        ,outbound_date
        ,merchant_id
        ,from_terminal
    from wp_domain_storage.s_mysql_wp_domain_storage_stg_outbound_order_rt where is_deleted = '0'
)t2
on t1.outbound_order_id = t2.id
where t2.outbound_type = '0'
limit 100;
-- left join
-- (
    
-- )t3
-- on 
