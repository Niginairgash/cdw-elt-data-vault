create table core.sat_link_payment(
	link_payment_hk 	char(32) not null,
	amount 				    numeric(5,2) not null,
	payment_date 		  timestamp not null,
	load_dts  			  timestamp not null,
	record_source 		varchar(50) not null
);
