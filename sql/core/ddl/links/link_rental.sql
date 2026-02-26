create table core.link_rental(
	link_rental_hk 	UUID not null,
    customer_hk 	UUID not null,
    inventory_hk 	UUID not null,
    staff_hk 		UUID not null,
	load_dts  		timestamp not null,
	record_source 	varchar(50) not null,
	primary key (link_rental_hk)
);
