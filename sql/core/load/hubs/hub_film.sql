insert into core.hub_film(film_hk, film_bk, load_dts, record_source)
select
    hashkey(s.film_id) as film_hk,
    s.film_id as film_bk,
    now() as load_dts,
    'ods_system' as record_source
from stage.stg_film s
where not exists (
    select 1
    from core.hub_film h
    where h.film_hk = hashkey(s.film_id)
);
