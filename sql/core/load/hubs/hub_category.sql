insert into core.hub_category (category_hk, category_bk, load_dts, record_source)
select
    hashkey(s.category_id) as category_hk,
    s.category_id as category_bk,
    now() as load_dts,
    'dvdrental' as record_source
from stage.stg_category s
where not exists (  
    select 1 
    from core.hub_category h 
    where h.category_bk = s.category_id
);