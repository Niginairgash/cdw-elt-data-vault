create table core.link_staff_store(
	link_staff_store_hk char(32) not null,
	staff_hk 			char(32) not null,
	store_hk 			char(32) not null,
	load_dts 			timestamp not null,
	record_source 		varchar(50) not null,
	primary key (link_staff_store_hk)
);
