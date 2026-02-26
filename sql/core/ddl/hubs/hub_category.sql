create table core.hub_category (
    category_hk   UUID not null,
    category_bk   text not null,
    load_dts      timestamp not null,
    record_source varchar(50) not null,
    primary key (category_hk)
);
