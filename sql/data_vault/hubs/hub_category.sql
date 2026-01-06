create table core.hub_category (
    category_hk   char(32) not null,
    category_id   integer not null,
    load_dts      timestamp not null,
    record_source varchar(50) not null
);