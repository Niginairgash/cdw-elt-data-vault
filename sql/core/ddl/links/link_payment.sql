create table core.link_payment(
	link_payment_hk UUID not null,
	customer_hk 	UUID not null,
	staff_hk 		UUID not null,
	link_rental_hk	UUID not null,
	load_dts  		timestamp not null,
	record_source 	varchar(50) not null,
	primary key (link_payment_hk)
);
