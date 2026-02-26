create table core.link_staff_store(
	link_staff_store_hk UUID not null,
	staff_hk 			UUID not null,
	store_hk 			UUID not null,
	load_dts 			timestamp not null,
	record_source 		varchar(50) not null,
	primary key (link_staff_store_hk)
);
