create table core.hub_film (
    film_hk       UUID not null,
    film_bk       text not null,
    load_dts      timestamp not null,
    record_source varchar(50) not null,
    primary key (film_hk)
);
