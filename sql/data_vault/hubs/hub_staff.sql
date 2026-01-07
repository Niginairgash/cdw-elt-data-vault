create table core.hub_staff (
    staff_hk        char(32) not null,
    staff_bk        integer not null,
    load_dts        timestamp not null,
    record_source   varchar(50) not null
);