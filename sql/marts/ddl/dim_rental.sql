create table marts.dim_rental(
  rental_sk     serial primary key,
  rental_hk     char(32) not null,
  rental_date   timestamp not null,
  return_date   timestamp,
  
  start_dts     timestamp not null,
  end_dts       timestamp,
  is_current    boolean not null default true
  );
