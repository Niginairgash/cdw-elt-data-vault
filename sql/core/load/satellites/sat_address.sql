with src as (
  select  
      address_id,
      address, 
      address2, 
      district, 
      postal_code, 
      phone,
      md5(concat(
        coalesce(address , ''), '#',
        coalesce(address2 , ''), '#',
        coalesce(district , ''), '#',
        coalesce(postal_code , ''), '#',
        coalesce(phone , '')
      )) as hashdiff
  from stage.stg_address
)
update core.sat_address csa
set
  end_dts = now(),
  is_current = false
from src
where csa.address_hk = MD5(src.address_id)
  and csa.is_current = true
  and csa.hashdiff <> src.hashdiff;

insert into core.sat_address(address_hk, address, address2, district, postal_code, phone, load_dts, record_source, start_dts, end_dts, is_current, hashdiff)
select
  MD5(address_id) as address_hk,
  src.address as address, 
  src.address2 as address2, 
  src.district as district, 
  src.postal_code as postal_code, 
  src.phone as phone, 
  now() as load_dts, 
  'dvdrental' as record_source, 
  now() as start_dts, 
  null as end_dts, 
  true as is_current, 
  src.hashdiff
from src 
where not exists(
  select 1
  from core.sat_address csa
  where csa.address_hk = MD5(src.address_id)
    and csa.is_current = true
    and csa.hashdiff = src.hashdiff
);
