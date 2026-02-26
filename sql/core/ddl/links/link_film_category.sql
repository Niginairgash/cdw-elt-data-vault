create table core.link_film_category(
	link_film_category_hk 	UUID not null,
	film_hk 				UUID not null,
	category_hk 			UUID not null,	
	load_dts  				timestamp not null,
	record_source 			varchar(50) not null,
	primary key (link_film_category_hk)
);
