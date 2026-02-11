insert into marts.fact_payment(
  customer_sk,
  staff_sk,
  date_pk,
  amount,
  payment_cnt
)
select 
  dc.customer_sk,
  ds.staff_sk,
  dd.date_pk,  
  coalesce(lp.amount, 0) as amount,
  1 as rental_cnt
from core.link_rental lr

join marts.dim_customer dc
  on lr.customer_hk = dc.customer_hk
  and dc.is_current = true
join marts.dim_staff ds
  on ds.staff_hk = lr.staff_hk
and ds.is_current = true
  
join core.sat_link_payment sp
  on lr.rental_hk = sp.link_payment_hk
  
join marts.dim_date dd
  on sp.rental_date::date = dd.full_date




