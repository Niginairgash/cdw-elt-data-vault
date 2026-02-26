insert into core.link_rental(link_rental_hk, customer_hk, inventory_hk, staff_hk, load_dts, record_source)
select
  MD5(ssr.rental_id)     as link_rental_hk,
  MD5(ssr.customer_id)   as customer_hk,
  MD5(ssr.inventory_id)  as inventory_hk,
  MD5(ssr.staff_id)      as staff_hk,
  now()                  as load_dts,
  'dvdrental'            as record_source
from stage.stg_rental ssr
where not exists (
  select 1
  from core.link_rental clr
  where clr.link_rental_hk = hashkey(ssr.rental_id)
);
