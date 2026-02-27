create table core.hub_inventory (
    inventory_hk    UUID not null,
    inventory_bk    text not null,
    load_dts        timestamp not null,
    record_source   varchar(50) not null,
    primary key (inventory_hk)
);
