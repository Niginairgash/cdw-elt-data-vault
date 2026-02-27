create table core.sat_inventory(
	inventory_hk 	UUID not null,
	last_update   timestamp not null,
  load_dts 		  timestamp not null,
  record_source varchar(50) not null,
    
  start_dts 		timestamp not null,
  end_dts 		  timestamp,
  is_current 		boolean not null default true,
	hashdiff    	char(32) not null
);
