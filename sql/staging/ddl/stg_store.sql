create table stage.stg_store(
	store_id 		integer,
	manager_staff_id integer,
	address_id 		integer,
	last_update 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);