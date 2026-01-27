insert into core.sat_link_rental(link_rental_hk, rental_date, return_date, load_dts, record_source)
select 
  hashkey(ssr.rental_id) as link_rental_hk,
  ssr.rental_date as rental_date,
  ssr.return_date as return_date,
  now() as load_dts,
  'dvdrental' as record_source
from stage.stg_rental ssr
where not exists(
  select 1
  from core.sat_link_rental slr
  where slr.link_rental_hk = hashkey(ssr.rental_id)
);
