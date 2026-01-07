create table core.sat_staff(
	staff_hk 		char(32) not null,	
	first_name 		varchar(45),
	last_name 		varchar(45),
	email 			varchar(50),
	active 			boolean,
	
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null,
	
	start_dts 		timestamp not null,
	end_dts 		timestamp,
	is_current 		boolean not null default true
);