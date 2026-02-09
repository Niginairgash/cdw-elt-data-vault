create table bv.sat_payment_metrics (
  payment_hk bytea not null,

  amount numeric(10,2) not null,
  is_high_value boolean not null,

  load_dts timestamp not null,
  record_source varchar(50) not null,

  start_dts timestamp not null,
  end_dts timestamp,
  is_current boolean not null,

  hashdiff bytea not null,

  constraint pk_sat_payment_metrics
    primary key (payment_hk, start_dts)
);
