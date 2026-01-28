with src as(
  select 
    hashkey(customer_id) as customer_hk,
    first_name as first_name, 
    last_name as last_name, 
    email as email, 
    active as active, 
    md5(concat(
        coalesce(first_name,''), '#', 
        coalesce(last_name, ''), '#', 
        coalesce(email, ''),     '#', 
        coalesce(active::text, '')
    ) ) as hashdiff
from stage.stg_customer
)
update core.sat_customer old
set
  end_dts = now(),
  is_current = false
from src
where old.customer_hk = src.customer_hk
  and old.is_current = true
  and old.hashdiff <> src.hashdiff;

insert into core.sat_customer(customer_hk, first_name, last_name, email, active, load_dts, record_source, start_dts, end_dts, is_current, hashdiff)
select 
  customer_hk,
  first_name as first_name, 
  last_name as last_name, 
  email as email, 
  active as active, 
  now() as load_dts, 
  'dvdrental' as record_source, 
  now() as start_dts, 
  null as end_dts,
  true as is_current,
  hashdiff
from src
where not exists(
    select 1
    from core.sat_customer cs
    where cs.customer_hk = src.customer_hk
      and cs.is_current = true
      and cs.hashdiff =  src.hashdiff
    );
