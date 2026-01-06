create table core.link_rental(
	link_rental_hk 	char(32) not null,
    customer_hk 	char(32) not null,
    inventory_hk 	char(32) not null,
    staff_hk 		char(32) not null,
	load_dts  		timestamp not null,
	record_source 	varchar(50) not null,
	primary key (link_rental_hk)
);