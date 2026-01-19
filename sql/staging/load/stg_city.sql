insert into stage.stg_city(
    city_id,
    city,
    country_id,
    last_update,
    load_dts,
    record_source
)
select
    city_id,
    city,
    country_id,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.city c
where not exists(  
    select 1
    from stage.stg_city sc
    where sc.city_id = c.city_id
        and sc.last_update = c.last_update
);