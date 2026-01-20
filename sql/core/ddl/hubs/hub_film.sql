create table core.hub_film (
    film_hk       char(32) not null,
    film_bk       text not null,
    load_dts      timestamp not null,
    record_source varchar(50) not null,
    primary key (film_hk)
);