create table marts.dim_customer(
    customer_sk   serial primary key,
    customer_hk   char(32) not null,
  
    first_name 	  varchar(45),
	last_name 	  varchar(45),
	email 		  varchar(50),
	active 		  boolean,

	address_hk    char(32),

	hashdif		  char(32) not null,
	
    start_dts     timestamp not null,
    end_dts       timestamp,
    is_current    boolean not null default true
  );
