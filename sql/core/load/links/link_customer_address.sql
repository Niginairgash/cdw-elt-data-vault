insert into core.link_customer_address(link_customer_address_hk, customer_hk, address_hk, load_dts, record_source)
select
  MD5(concat(sc.customer_id, '#', sa.address_id)) as link_customer_address_hk,
  MD5(sc.customer_id) as customer_hk, 
  MD5(sa.address_id) as address_hk,
  now() as load_dts,
  'dvdrental' as record_source
from stage.stg_customer sc
join stage.stg_address sa on sc.address_id = sa.address_id
where not exists(
  select 1
  from core.link_customer_address l
  where l.link_customer_address_hk = hashkey(concat(sc.customer_id, '#', sa.address_id))
);
