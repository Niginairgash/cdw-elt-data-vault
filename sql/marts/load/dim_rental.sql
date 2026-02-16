with src as (
  select 
    lr.link_rental_hk as rental_hk,
    slr.rental_date,
    slr.return_date
  from core.link_rental lr
  join core.sat_link_rental slr
    on slr.link_rental_hk = lr.link_rental_hk
)
  
update marts.dim_rental dr
set dr.return_date = src.return_date
from src
where dr.rental_hk = src.rental_hk;

insert into marts.dim_rental(rental_hk, rental_date, return_date)
select 
  slr.link_rental_hk,
  slr.rental_date,
  slr.return_date
from src
where not exists(
  select 1
  from marts.dim_rental dr
  where dr.return_date = src.return_date
);
