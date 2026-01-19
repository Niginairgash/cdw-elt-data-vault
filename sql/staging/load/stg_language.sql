insert into stage.stg_language(
    language_id,
    name,
    last_update,
    load_dts,
    record_source
)
select
    language_id,
    name,
    last_update,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.language l
where not exists(
    select 1
    from stage.stg_language sl
    where sl.language_id = l.language_id
        and sl.last_update = l.last_update
);