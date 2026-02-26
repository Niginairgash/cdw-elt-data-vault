create table core.sat_link_rental(
	link_rental_hk 		UUID not null,
	rental_date 		timestamp not null,
	return_date 		timestamp,
	load_dts  			timestamp not null,
	record_source 		varchar(50) not null
);
