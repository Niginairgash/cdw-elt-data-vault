create table stage.stg_payment(
	payment_id 		integer,
	customer_id 	integer,
	staff_id 		integer,
	rental_id 		integer,
	amount 			numeric(5, 2),
	payment_date 	timestamp,
	load_dts 		timestamp not null,
	record_source 	varchar(50) not null
);