create table marts.fact_payment(
    payment_pk     serial primary key,
    payment_hk     char(32) not null unique, 
    customer_sk    int not null references marts.dim_customer(customer_sk),
    staff_sk       int not null references marts.dim_staff(staff_sk),
    rental_sk      int not null references marts.dim_rental(rental_sk),
    date_pk        int not null references marts.dim_date(date_pk),
    amount         numeric(5,2) not null,
    payment_cnt    int not null
  );
