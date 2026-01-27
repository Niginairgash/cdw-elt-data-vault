insert into core.sat_customer(customer_hk, first_name, last_name, email, active, load_dts, record_source, start_dts, end_dts, is_current)
select 
  hashkey(ssc.customer_id) as customer_hk,
  ssc.first_name as first_name, 
  ssc.last_name as last_name, 
  ssc.email as email, 
  ssc.active as active, 
  now() as load_dts, 
  'dvdrental' as record_source, 
  now() as start_dts, 
  null as end_dts, 
  current_timestamp as is_current
from stage.stg_customer ssc
