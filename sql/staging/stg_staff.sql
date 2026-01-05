create table stage.stg_staff(
	staff_id 		integer,
	first_name 		varchar(45),
	last_name 		varchar(45),
	address_id 		integer,
	email 			varchar(50),
	store_id 		integer,
	active 			boolean,
	username 		varchar(16),
	"password" 		varchar(40),
	last_update 	timestamp,
	picture 		bytea,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);