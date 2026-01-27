insert into core.sat_link_payment(link_payment_hk, amount, payment_date, load_dts, record_source)
select 
  hashkey(ssp.payment_id) as link_payment_hk,
  ssp.amount as amount,
  ssp.payment_date as payment_date,
  now() as load_dts,
  'dvdrental' as record_source
from stage.stg_payment ssp
where not exists(
  select 1
  from core.sat_link_payment slp
  where slp.link_payment_hk = hashkey(ssp.payment_id)
);
