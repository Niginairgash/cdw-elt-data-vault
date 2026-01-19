insert into stage.stg_film_category(
    film_id,
    category_id,
    last_update,
    load_dts,
    record_source
)
select
    film_id,
    category_id,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.film_category fc
where not exists(
    select 1
    from stage.stg_film_category sfc
    where sfc.film_id = fc.film_id
        and sfc.category_id = fc.category_id
        and sfc.last_update = fc.last_update
);