create table stage.stg_inventory(
	inventory_id 	integer,
	film_id 		integer,
	store_id 		integer,
	last_update 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);