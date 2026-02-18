insert into marts.dim_film(
  film_hk,
  title,
	release_year,
	rental_duration,
	rental_rate,
	length,
	replacement_cost,
	rating,
  start_dts,
  end_dts,
  is_current
)
select 
  sf.film_hk,
  sf.title,
	sf.release_year,
	sf.rental_duration,
	sf.rental_rate,
	sf.length,
	sf.replacement_cost,
	sf.rating,
  sf.start_dts,
  sf.end_dts,
  sf.is_current
from core.sat_film sf
where not exists(
  select 1 
  from  marts.dim_film df
  where df.film_hk = sf.film_hk
    and df.start_dts = sf.start_dts
)
