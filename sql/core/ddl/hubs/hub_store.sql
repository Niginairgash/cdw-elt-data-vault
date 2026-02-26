create table core.hub_store (
    store_hk        UUID not null,
    store_bk        text not null,
    load_dts        timestamp not null,
    record_source   varchar(50) not null,
    primary key (store_hk)
);
