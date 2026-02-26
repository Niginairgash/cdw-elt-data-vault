insert into core.hub_actor (actor_hk, actor_bk, load_dts, record_source)
select
    MD5(s.actor_id) as actor_hk,
    s.actor_id as actor_bk,
    now() as load_dts,
    'dvdrental' as record_source
from stage.stg_actor s
where not exists (  
    select 1 
    from core.hub_actor h 
    where h.actor_bk = s.actor_id

);
