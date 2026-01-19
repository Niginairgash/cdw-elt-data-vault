insert into stage.stg_store(
    store_id,
    manager_staff_id,
    address_id,
    last_update,
    load_dts,
    record_source
)
select
    store_id,
    manager_staff_id,
    address_id,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.store s
where not exists(
    select 1
    from stage.stg_store ss
    where ss.store_id = s.store_id
        and ss.last_update = s.last_update
);