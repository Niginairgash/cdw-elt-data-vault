create table if not exists bv.sat_rental_status(
  rental_hk bytea not null,
  rental_status varchar(50) not null,
  is_active boolean not null,

  load_dts timestamp not null,
  record_source varchar(50) not null,

  start_dts timestamp not null,
  end_dts timestamp,
  is_current boolean not null,

  hashdiff bytea not null,
   constraint pk_sat_rental_status
      primary key(rental_hk, start_dts)
)
