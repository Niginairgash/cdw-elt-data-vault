insert into stage.stg_country(
    country_id,
    country,
    last_update,
    load_dts,
    record_source
)
select
    country_id,
    country,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.country c
where not exists(
    select 1
    from stage.stg_country sc
    where sc.country_id = c.country_id
        and sc.last_update = c.last_update
);