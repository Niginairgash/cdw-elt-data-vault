create table stage.stg_film_actor(
	actor_id 		integer,
	film_id 		integer,
	last_update 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);