create table marts.dim_staff(
  staff_sk       serial primary key,
  staff_hk       char(32) not null,

  first_name 		 varchar(45),
	last_name 		 varchar(45),
	email 			   varchar(50),
	active 			   boolean,

  start_dts      timestamp not null,
  end_dts        timestamp,
  is_current     boolean not null default true
);  
