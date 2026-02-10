insert into marts.fact_rental(
  customer_sk,
  staff_sk,
  film_sk,
  date_pk,
  rental_status,
  rental_cnt,
  amount
)
select 
  dc.customer_sk,
  ds.staff_sk,
  df.film_sk,
  dd.date_pk,
  srs.rental_status,
  1 as rental_cnt,
  coalesce(lp.amount, 0) as amount
from core.link_rental lr
join  bv.sat_rental_status srs
   on lr.rental_hk = srs.rental_hk
  and srs.is_current = true
join marts.dim_customer dc
  on lr.customer_hk = dc.customer_hk
  and dc.is_current = true
join marts.dim_staff ds
  on ds.staff_hk = lr.staff_hk
and ds.is_current = true
join marts.dim_film df
  on df.film_hk = lr.film_hk
and df.is_current = true
  
join core.sat_link_rental slr
  on lr.rental_hk = slr.link_rental_hk
  
join marts.dim_date dd
  on slr.rental_date::date = dd.full_date
left join (
  select
    lp.link_rental_hk,
    sum(sp.amount) as amount
  from core.link_payment lp
  join core.sat_link_payment sp
    on lp.payment_hk = sp.payment_hk
   and sp.is_current = true
  group by lp.link_rental_hk
) p on lr.rental_hk = p.link_rental_hk;
