create table stage.stg_category(
	category_id 	integer,
	"name" 			varchar(25),
	last_update 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);