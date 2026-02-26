insert into core.hub_staff (staff_hk, staff_bk, load_dts, record_source)
select
    MD5(s.staff_id) as staff_hk,
    s.staff_id as staff_bk,
    now() as load_dts,
    'dvdrental' as record_source
from stage.stg_staff s
where not exists (  
    select 1 
    from core.hub_staff h 
    where h.staff_bk = s.staff_id
);
