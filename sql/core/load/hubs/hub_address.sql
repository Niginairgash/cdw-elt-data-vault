insert into core.hub_address (address_hk, address_bk, load_dts, record_source)
select
    MD5(s.address_id) as address_hk,
    s.address_id as address_bk,
    now() as load_dts,
    'dvdrental' as record_source
from stage.stg_address s
where not exists (  
    select 1 
    from core.hub_address h 
    where h.address_bk = s.address_id);
