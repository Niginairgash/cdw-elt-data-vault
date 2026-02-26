insert into core.link_staff_address(link_staff_address_hk, staff_hk, address_hk, load_dts, record_source)
select
  MD5(concat(sss.staff_id, '#', ssa.address_id)) as link_staff_address_hk,
  MD5(sss.staff_id)   as staff_hk,
  MD5(ssa.address_id) as address_hk,
  now()               as load_dts,
  'dvdrental'         as record_source
from stage.stg_staff sss
join stage.stg_address ssa on sss.address_id = ssa.address_id
where not exists(
  select 1 
  from core.link_staff_address lsa
  where lsa.link_staff_address_hk = hashkey(concat(sss.staff_id, '#', ssa.address_id))
);
