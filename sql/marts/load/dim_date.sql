insert into marts.dim_date (date_pk, full_date, "year", "month", "day", quater)
with bounds as(
	select
		min(order_date)::date as min_dt,
		max(order_date)::date as max_dt
	from public."order" 
)
select
	to_char(d, 'YYYYMMDD')::int 	as date_pk,
	d::DATE 						as full_date,
	extract (year from d) 			as "year",
	extract(month from d) 			as "month",
	extract(day from d) 			as "day",
	(extract(month from d)+2) / 3 	as quater	
from generate_series(
	(select min_dt from bounds),
	(select max_dt + interval '1 year' from bounds),
	interval '1 day'
	) as d
-- Check if date already exists to avoid duplicates
where not exists (
	select 1
	from marts.dim_date dd
	where dd.full_date = d::date
)
