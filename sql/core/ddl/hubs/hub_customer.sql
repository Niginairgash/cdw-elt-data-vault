create table core.hub_customer (
    customer_hk   UUID not null,
    customer_bk   text not null,
    load_dts      timestamp not null,
    record_source varchar(50) not null,
    primary key (customer_hk)
);
