create table core.link_inventory(
  link_inventory_hk UUID not null,
  inventory_hk      UUID not null,
  film_hk           UUID not null,
  store_hk          UUID not null,
	load_dts 		      timestamp not null,
	record_source 	  varchar(50) not null,
  primary key(link_inventory_hk)
);
