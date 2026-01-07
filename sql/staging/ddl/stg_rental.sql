create table stage.stg_rental(
	rental_id integer,
	rental_date timestamp,
	inventory_id integer,
	customer_id integer,
	return_date timestamp,
	staff_id integer,
	last_update timestamp,
	load_dts timestamp not null,
	record_source varchar(50) not null
);
