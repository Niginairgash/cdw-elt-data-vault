create table stage.stg_address(
	address_id 		integer,
	address 		varchar(50),
	address2 		varchar(50),
	district 		varchar(20),
	city_id 		integer,
	postal_code 	varchar(10),
	phone 			varchar(20),
	last_update 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);