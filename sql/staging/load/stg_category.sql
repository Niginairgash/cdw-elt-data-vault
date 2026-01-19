insert into stage.stg_category(
    category_id,
    name,
    last_update,
    load_dts,
    record_source
)
select
    category_id,
    name,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.category c
where not exists(
    select 1
    from stage.stg_category sc
    where sc.category_id = c.category_id
        and sc.last_update = c.last_update
);