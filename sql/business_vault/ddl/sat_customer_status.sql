create table if not exists bv.sat_customer_status (
    customer_hk     bytea        not null,
    
    customer_status varchar(50)  not null, -- ACTIVE / INACTIVE / LOST
    is_active        boolean      not null,

    load_dts         timestamp    not null,
    record_source    varchar(50)  not null,

    start_dts        timestamp    not null,
    end_dts          timestamp,
    is_current       boolean      not null,

    hashdiff         bytea        not null,

    constraint pk_sat_customer_status
        primary key (customer_hk, start_dts)
);
