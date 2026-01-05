create table stage.stg_customer(
	customer_id 	int,
	store_id 		integer,
	first_name 		varchar(45),
	last_name 		varchar(45),
	email 			varchar(50),
	address_id 		integer,
	activebool 		boolean,
	create_date 	date,
	last_update 	timestamp,
	active 			int4,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);
