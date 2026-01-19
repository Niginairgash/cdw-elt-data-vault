create table stage.stg_language(
	language_id 	integer,
	"name" 			bpchar(20),
	last_update 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);
