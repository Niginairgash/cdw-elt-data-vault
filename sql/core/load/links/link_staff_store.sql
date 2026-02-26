insert into core.link_staff_store(link_staff_store_hk, staff_hk, store_hk, load_dts, record_source)
select
  MD5(concat(sss.staff_id, '#', ss.store_id)) as link_staff_store_hk,
  MD5(sss.staff_id)  as staff_hk,
  MD5(ss.store_id)   as store_hk,
  now()              as load_dts,
  'dvdrental'        as record_source
from stage.stg_staff sss
join stage.stg_store ss on sss.store_id = ss.store_id
where not exists(
  select 1
  from core.link_staff_store lss
  where lss.link_staff_store_hk =  hashkey(concat(sss.staff_id, '#', ss.store_id))   
);
