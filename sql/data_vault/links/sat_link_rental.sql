create table core.sat_link_rental(
	link_rental_hk 	char(32) not null,
	rental_date 		date not null,
	return_date 		date,
	load_dts  			timestamp not null,
	record_source 		varchar(50) not null
);
