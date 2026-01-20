insert into core.hub_actor (actor_key, actor_id, load_dts, record_source)
select
    hashkey(actor_id) as actor_key,
    actor_id,
    now() as load_dts,
    'ods_system' as record_source
from stage.stg_actor s
where not exists (  
    select 1 
    from core.hub_actor h 
    where h.actor_id = hashkey(s.actor_id)
);
