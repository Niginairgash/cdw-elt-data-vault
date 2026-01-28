update core.sat_film caf
set
  end_dts = now(),
  is_current = false
from stage.stg_film ssf
where caf.film_hk = hashkey(ssf.film_id)
  and caf.is_current = true
  and caf.hashdiff <> md5(concat(
    coalesce(ssf.title,''), '#',
    coalesce(ssf.release_year::text,''), '#',
    coalesce(ssf.rental_duration::text,''), '#',
    coalesce(ssf.rental_rate::text,''), '#',
    coalesce(ssf.length::text,''), '#',
    coalesce(ssf.replacement_cost::text,''), '#',
    coalesce(ssf.rating,'')
  ));

insert into core.sat_film (film_hk, title, release_year, rental_duration, rental_rate, length, replacement_cost, rating, load_dts, record_source, start_dts, end_dts, is_current, hashdiff)
select
  hashkey(ssf.film_id)  as film_hk,
  ssf.title             as title,
  ssf.release_year      as release_year, 
  ssf.rental_duration   as rental_duration, 
  ssf.rental_rate       as rental_rate, 
  ssf.length            as length, 
  ssf.replacement_cost  as replacement_cost, 
  ssf.rating            as rating, 
  now()                 as load_dts, 
  'dvdrental'           as record_source, 
  now()                 as start_dts, 
  null                  as end_dts, 
  true                  as is_current, 
  md5(concat(
    coalesce(ssf.title, ''), '#',
    coalesce(ssf.release_year::text, ''), '#',
    coalesce(ssf.rental_duration::text, ''), '#',
    coalesce(ssf.rental_rate::text, ''), '#',
    coalesce(ssf.length::text, ''), '#',
    coalesce(ssf.replacement_cost::text, ''), '#',
    coalesce(ssf.rating, '')
  )) as hashdiff
from stage.stg_film ssf
where not exists (
    select 1
    from core.sat_film csf
    where csf.film_hk =  hashkey(ssf.film_id)
      and csf.is_current = true
      and csf.hashdiff = md5(concat(
                        coalesce(ssf.title, ''), '#',
                        coalesce(ssf.release_year::text, ''), '#',
                        coalesce(ssf.rental_duration::text, ''), '#',
                        coalesce(ssf.rental_rate::text, ''), '#',
                        coalesce(ssf.length::text, ''), '#',
                        coalesce(ssf.replacement_cost::text, ''), '#',
                        coalesce(ssf.rating, '')
                      ))
  );
