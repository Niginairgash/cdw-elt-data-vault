create table stage.stg_film_category(
	film_id 		integer,
	category_id 	integer,
	last_update 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);