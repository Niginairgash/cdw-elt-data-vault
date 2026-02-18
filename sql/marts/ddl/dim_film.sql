create table marts.dim_film(
  film_sk 			serial primary key,
  film_hk 			char(32) not null,

  title 			varchar(255),
  release_year 		varchar(4),
  rental_duration 	integer,
  rental_rate 		numeric(4, 2),
  length 			integer,
  replacement_cost 	numeric(5,2),
  rating 			varchar(20),

  hashdif		  	char(32) not null,
	
  start_dts 	  	timestamp not null,
  end_dts   	  	timestamp,
  is_current 	  	boolean not null default true  
);
