insert into core.link_payment(link_payment_hk, customer_hk, staff_hk, link_rental_hk, load_dts, record_source)
select
  MD5(ssp.payment_id)   as link_payment_hk,
  MD5(ssp.customer_id)  as customer_hk,
  MD5(ssp.staff_id)     as staff_hk,
  MD5(ssp.rental_id)    as link_rental_hk,
  now()                 as load_dts,
  'dvdrental'           as record_source
from stage.stg_payment ssp
where not exists
(
  select 1
  from core.link_payment lp
  where lp.link_payment_hk = hashkey(ssp.payment_id)
);
