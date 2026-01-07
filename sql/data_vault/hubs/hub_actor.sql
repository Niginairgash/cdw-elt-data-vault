create table core.hub_actor (
    actor_hk        char(32) not null,
    actor_bk        integer not null,
    load_dts        timestamp not null,
    record_source   varchar(50) not null
);
