insert into stage.stg_customer(
  customer_id ,
	store_id 	,
	first_name 	,
	last_name ,
	email ,
	address_id 	,
	activebool 	,
	create_date ,
	last_update ,
	active ,
	load_dts,
	record_source 
)
select
  customer_id ,
	store_id 	,
	first_name 	,
	last_name ,
	email ,
	address_id 	,
	activebool 	,
	create_date ,
	last_update ,
	active ,
	now() as load_dts,
	'dvdrental' as record_source
from {{source}}.customer sc
where not exists 
(
  select 1
  from stage.stg_customer ss 
  where ss.customer_id = sc.customer_id
    and ss.last_update = sc.last_update
)
