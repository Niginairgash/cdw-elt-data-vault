create table core.hub_actor (
    actor_hk        UUID not null,
    actor_bk        text not null,
    load_dts        timestamp not null,
    record_source   varchar(50) not null,
    primary key (actor_hk)
);
