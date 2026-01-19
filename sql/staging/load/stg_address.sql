insert into stage.stg_address(
    address_id,
    address,
    address2,
    district,
    city_id,
    postal_code,
    phone,
    last_update,
    load_dts,
    record_source
)
select
    address_id,
    address,
    address2,
    district,
    city_id,
    postal_code,
    phone,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.address a
where not exists(
    select 1
    from stage.stg_address sa
    where sa.address_id = a.address_id
        and sa.last_update = a.last_update
);