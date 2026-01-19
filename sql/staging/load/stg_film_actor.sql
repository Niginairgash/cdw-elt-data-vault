insert into stage.stg_film_actor(
    actor_id,
    film_id,
    last_update,
    load_dts,
    record_source
)
select
    actor_id,
    film_id,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.film_actor fa
where not exists(
    select 1
    from stage.stg_film_actor sfa
    where sfa.actor_id = fa.actor_id
        and sfa.film_id = fa.film_id
        and sfa.last_update = fa.last_update
);