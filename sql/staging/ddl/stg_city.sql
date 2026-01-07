create table stage.stg_city(
	city_id 		integer,
	city 			varchar(50),
	country_id 		integer,
	last_update 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);