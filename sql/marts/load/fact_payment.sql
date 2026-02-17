insert into marts.fact_payment(
  payment_hk,
  customer_sk,
  staff_sk,
  rental_sk,
  date_pk,
  amount,
  payment_cnt
)
select 
  lp.link_payment_hk as payment_hk,
  dc.customer_sk,
  ds.staff_sk,
  dr.rental_sk,
  dd.date_pk,  
  coalesce(slp.amount, 0) as amount,
  1 as payment_cnt
from core.link_payment lp

join core.sat_link_payment slp
  on lp.link_payment_hk = slp.link_payment_hk
  
join marts.dim_customer dc
  on lp.customer_hk = dc.customer_hk
  and dc.is_current = true
  
join marts.dim_staff ds
  on ds.staff_hk = lp.staff_hk
and ds.is_current = true
  
join marts.dim_rental dr
  on lp.link_rental_hk = dr.rental_hk
  
join marts.dim_date dd
  on slp.payment_date::date = dd.full_date
where not exists (
  select 1
  from  marts.fact_payment fp
  where fp.payment_hk = lp.link_payment_hk
)
