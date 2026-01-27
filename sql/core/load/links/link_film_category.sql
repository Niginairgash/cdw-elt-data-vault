insert into core.link_film_category(link_film_category_hk, film_hk, category_hk, load_dts, record_source)
select
  hashkey(concat(sfc.film_id, '#', sfc.category_id)) as link_film_category_hk,
  hashkey(sfc.film_id) as film_hk,
  hashkey(sfc.category_id) as category_hk,
  now() as load_dts,
  'dvdrental' as record_source
from stage.stg_film_category sfc
where not exists(
  select 1
  from core.link_film_category lfc
  where lfc.link_film_category_hk = hashkey(concat(sfc.film_id, '#', sfc.category_id))
);
