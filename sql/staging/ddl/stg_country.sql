create table stage.stg_country(
	country_id 		integer,
	country 		varchar(50),
	last_update 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);