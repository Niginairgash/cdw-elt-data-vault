create table core.hub_address(
	address_hk 		UUID not null,
	address_bk 		text not null,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null,
	primary key (address_hk)
);
