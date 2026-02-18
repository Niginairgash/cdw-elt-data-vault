insert into marts.dim_staff(
  staff_hk,
  first_name,
  last_name,
  email,
  active,
  start_dts,
  end_dts,
  is_current
)
select
  ss.staff_hk,
  ss.first_name,
  ss.last_name,
  ss.email,
  ss.active,
  ss.start_dts,
  ss.end_dts,
  ss.is_current
from core.sat_staff ss
where not exists(
  select 1
  from marts.dim_staff ds
  where ss.staff_hk = ds.staff_hk
    and ss.start_dts = ds.start_dts
)
