create table core.link_film_actor(
	link_film_actor_hk 	char(32) not null,
	film_hk 			char(32) not null,
	actor_hk 			char(32) not null,	
	load_dts  		timestamp not null,
	record_source 	varchar(50) not null,
	primary key (link_film_actor_hk)
);
