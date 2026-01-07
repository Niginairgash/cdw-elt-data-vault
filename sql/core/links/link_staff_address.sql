create table core.link_staff_address(
	link_staff_address_hk 	char(32) not null,
	staff_hk 				char(32) not null,
	address_hk 				char(32) not null,
	load_dts 				timestamp not null,
	record_source 			varchar(50) not null,
	primary key(link_staff_address_hk)
);