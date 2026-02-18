insert into marts.dim_address(
  address_hk,
  address,
  address2,
  district,
  postal_code,
  phone,
  start_dts,
  end_dts,
  is_current 
)
select 
  sa.address_hk,
  sa.address,
  sa.address2,
  sa.district,
  sa.postal_code,
  sa.phone,
  sa.start_dts,
  sa.end_dts,
  sa.is_current 
from core.sat_address sa
where not exists(
  select 1 
  from marts.dim_address da
  where da.address_hk = sa.address_hk
    and da.start_dts = sa.start_dts
)
