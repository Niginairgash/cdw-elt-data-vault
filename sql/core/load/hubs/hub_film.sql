insert into core.hub_film(film_hk, film_bk, load_dts, record_source)
select
    MD5(s.film_id) as film_hk,
    s.film_id as film_bk,
    now() as load_dts,
    'dvdrental' as record_source
from stage.stg_film s
where not exists (
    select 1
    from core.hub_film h
    where h.film_bk = s.film_id
);

