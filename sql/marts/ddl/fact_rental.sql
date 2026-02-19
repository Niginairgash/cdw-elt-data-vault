-- =========================================
-- FACT RENTAL TABLE
-- =========================================

create table marts.fact_rental(
  rental_pk     serial primary key,
  rental_hk     char(32) not null,
  customer_sk   int not null references marts.dim_customer(customer_sk),
  staff_sk      int not null references marts.dim_staff(staff_sk),
  film_sk       int not null references marts.dim_film(film_sk),
  date_pk       int not null references marts.dim_date(date_pk),
  rental_status varchar(20) not null,
  rental_cnt    int not null,
  amount        numeric(10,2),
  unique (rental_hk)
);

-- =========================================
-- INDEXES
-- =========================================

create index if not exists idx_fact_rental_date_pk
  on marts.fact_rental(date_pk);

create index if not exists idx_fact_rental_customer_sk
  on marts.fact_rental(customer_sk);

create index if not exists idx_fact_rental_film_sk
  on marts.fact_rental(film_sk);

create index if not exists idx_fact_rental_staff_sk
  on marts.fact_rental(staff_sk);
