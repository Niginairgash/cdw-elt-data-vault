insert into stage.stg_actor
select
    actor_id,
	first_name 		,
	last_name 		,
	last_update 	,
	now() as load_dts ,
    'dvdrental' as record_source
from {{source}}.actor;