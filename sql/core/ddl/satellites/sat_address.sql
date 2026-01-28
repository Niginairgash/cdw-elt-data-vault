create table core.sat_address(
	address_hk 		char(32) not null,
	
	address       	varchar(50),
    address2       	varchar(50),
    district       	varchar(20),
    postal_code    	varchar(10),
    phone          	varchar(20),
    
    load_dts 		timestamp not null,
    record_source 	varchar(50) not null,
    
    start_dts 		timestamp not null,
    end_dts 		timestamp,
    is_current 		boolean not null default true,
	hashdiff    	char(32) not null
);
