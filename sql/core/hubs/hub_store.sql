create table core.hub_store (
    store_hk        char(32) not null,
    store_bk        text not null,
    load_dts        timestamp not null,
    record_source   varchar(50) not null
);