create table core.link_customer_address(
	link_customer_address_hk 	char(32) not null,
	customer_hk 				char(32) not null,
	address_hk 					char(32) not null,
	load_dts 					timestamp not null,
	record_source 				varchar(50) not null,
	primary key(link_customer_address_hk)
);