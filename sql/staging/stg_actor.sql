create table stage.stg_actor(
	actor_id 		integer,
	first_name 		varchar(45),
	last_name 		varchar(45),
	last_update 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);