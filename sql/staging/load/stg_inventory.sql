insert into stage.stg_inventory(
    inventory_id,
    film_id,
    store_id,
    last_update,
    load_dts,
    record_source
)
select
    inventory_id,
    film_id,
    store_id,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.inventory i
where not exists(
    select 1
    from stage.stg_inventory si
    where si.inventory_id = i.inventory_id
        and si.last_update = i.last_update
);