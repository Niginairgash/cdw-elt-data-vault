insert into core.hub_store (store_hk, store_bk, load_dts, record_source)
select
    MD5(s.store_id) as store_hk,
    s.store_id as store_bk,
    now() as load_dts,
    'dvdrental' as record_source
from stage.stg_store s
where not exists (  
    select 1 
    from core.hub_store h 
    where h.store_bk = s.store_id
);
