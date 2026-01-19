insert into stage.stg_actor(
	actor_id,
	first_name,
	last_name,
	last_update,
	load_dts,
	record_source
)
select
    actor_id,
	first_name 		,
	last_name 		,
	last_update 	,
	now() as load_dts ,
    'dvdrental' as record_source
from {{source}}.actor a
where not exists(
	select 1
	from stage.stg_actor sa
	where sa.actor_id = a.actor_id
		and sa.last_update = a.last_update
);
