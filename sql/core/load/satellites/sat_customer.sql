update core.sat_customer old
set
  end_dts = now(),
  is_current = false
from stage.stg_customer ssc
where old.customer_hk = hashkey(ssc.customer_id)
  and old.is_current = true
  and (
    old.first_name   is distinct from ssc.first_name 
    or old.last_name is distinct from ssc.last_name 
    or old.email     is distinct from ssc.email
    or old.active    is distinct from ssc.active
);

insert into core.sat_customer(customer_hk, first_name, last_name, email, active, load_dts, record_source, start_dts, end_dts)
select 
  hashkey(ssc.customer_id) as customer_hk,
  ssc.first_name as first_name, 
  ssc.last_name as last_name, 
  ssc.email as email, 
  ssc.active as active, 
  now() as load_dts, 
  'dvdrental' as record_source, 
  now() as start_dts, 
  null as end_dts
from stage.stg_customer ssc
where not exists(
    select 1
    from core.sat_customer cs
    where cs.customer_hk = hashkey(ssc.customer_id)
      and cs.is_current = true
      and cs.first_name  is not distinct from ssc.first_name 
      and cs.last_name   is not distinct from ssc.last_name 
      and cs.email       is not distinct from ssc.email
      and cs.active      is not distinct from ssc.active
  );
