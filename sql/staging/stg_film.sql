create table stage.stg_film(
	film_id 			integer,
	title 				varchar(255),
	description 		text ,
	release_year 		varchar(4),
	language_id 		integer,
	rental_duration 	integer,
	rental_rate 		numeric(4, 2) ,
	length 				integer,
	replacement_cost 	numeric(5, 2),
	rating 				varchar(20) ,
	last_update 		timestamp,
	special_features 	text[],
	load_dts 			timestamp not null,
	record_source 		varchar(50) not null
);