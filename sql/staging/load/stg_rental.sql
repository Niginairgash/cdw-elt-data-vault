insert into stage.stg_rental( 
    rental_id,
    rental_date,
    inventory_id,
    customer_id,
    return_date,
    staff_id,
    last_update,
    load_dts,
    record_source
)
select
    rental_id,
    rental_date,
    inventory_id,
    customer_id,
    return_date,
    staff_id,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.rental r
where not exists (
    select 1
    from stage.stg_rental sr
    where sr.rental_id = r.rental_id
        and sr.last_update = r.last_update
);