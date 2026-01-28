update core.sat_customer old
set
  end_dts = now(),
  is_current = false
from stage.stg_customer ssc
where old.customer_hk = hashkey(ssc.customer_id)
  and old.is_current = true
  and old.hashdiff <> md5(
    concat(
      coalesce(old.first_name,''), '#', 
      coalesce(old.last_name, ''), '#', 
      coalesce(old.email, ''),     '#', 
      coalesce(old.active::text, '')
    )
);

insert into core.sat_customer(customer_hk, first_name, last_name, email, active, load_dts, record_source, start_dts, end_dts, is_current, hashdiff)
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
  true as is_current,
  md5(concat(
      coalesce(ssc.first_name,''), '#', 
      coalesce(ssc.last_name, ''), '#', 
      coalesce(ssc.email, ''),     '#', 
      coalesce(ssc.active::text, '')
  ) ) as hashdiff
from stage.stg_customer ssc
where not exists(
    select 1
    from core.sat_customer cs
    where cs.customer_hk = hashkey(ssc.customer_id)
      and cs.is_current = true
      and cs.hashdiff =   md5(
          concat(
            coalesce(ssc.first_name,''), '#', 
            coalesce(ssc.last_name, ''), '#', 
            coalesce(ssc.email, ''),     '#', 
            coalesce(ssc.active::text, '')
          ))
    );
