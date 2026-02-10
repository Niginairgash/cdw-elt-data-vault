create table marts.fact_rental(
  rental_pk     serial primary key,
  customer_sk   int not null references marts.dim_customer(customer_sk),
  staff_sk      int not null references marts.dim_staff(staff_sk),
  film_sk       int not null references marts.dim_film(film_sk),
  date_pk       int not null references marts.dim_date(date_pk),
  rental_status varchar(20) not null,
  rental_cnt    int not null,
  amount        numeric(10,2)
);
