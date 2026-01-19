insert into stage.stg_film(
  film_id ,
	title ,
	description ,
	release_year ,
	language_id ,
	rental_duration ,
	rental_rate ,
	length ,
	replacement_cost ,
	rating ,
	last_update ,
	special_features ,
	load_dts 	,
	record_source
)
select 
  film_id ,
	title ,
	description ,
	release_year ,
	language_id ,
	rental_duration ,
	rental_rate ,
	length ,
	replacement_cost ,
	rating ,
	last_update ,
	special_features ,
	now() as load_dts ,
  'dvdrental' as record_source
from {{ source }}.film f
where not exists (
  select 1 
  from stage.stg_film ss
  where ss.film_id = f.film_id)

