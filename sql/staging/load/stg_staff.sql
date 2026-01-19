insert into stage.stg_staff( 
    staff_id,
    first_name,
    last_name,
    address_id,
    email,
    store_id,
    active,
    username,
    password,
    last_update,
    load_dts,
    record_source
)  
select
    staff_id,
    first_name,
    last_name,
    address_id,
    email,
    store_id,
    active,
    username,
    password,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.staff s
where not exists(
    select 1
    from stage.stg_staff ss
    where ss.staff_id = s.staff_id
        and ss.last_update = s.last_update
);