insert into core.hub_customer (customer_hk, customer_bk, load_dts, record_source)
select
    MD5(s.customer_id) as customer_hk,
    s.customer_id as customer_bk,
    now() as load_dts,
    'dvdrental' as record_source
from stage.stg_customer s
where not exists (  
    select 1 
    from core.hub_customer h 
    where h.customer_bk = s.customer_id
);
