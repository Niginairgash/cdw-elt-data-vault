insert into core.link_film_actor (link_film_actor_hk, film_hk, actor_hk, load_dts, record_source)
select
    hashkey(concat(s.film_id, '#', s.actor_id)) as link_film_actor_hk,
    hashkey(s.film_id) as film_hk,
    hashkey(s.actor_id) as actor_hk,
    now() as load_dts,
    'dvdrental' as record_source
from stage.stg_film_actor s
where not exists (  
    select 1 
    from core.link_film_actor h 
    where h.link_film_actor_hk = hashkey(concat(s.film_id, '#', s.actor_id))
);
