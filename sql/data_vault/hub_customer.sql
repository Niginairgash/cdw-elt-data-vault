create table core.hub_customer (
    customer_hk   char(32) not null,
    customer_id   integer not null,
    load_dts      timestamp not null,
    record_source varchar(50) not null
);