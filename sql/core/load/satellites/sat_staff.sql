with src as(
  select
    hashkey(staff_id) as staff_hk,
    first_name,
    last_name,
    email,
    active,
    md5(concat(
      coalesce(first_name, ''), '#',
      coalesce(last_name, ''), '#',
      coalesce(email, ''), '#',
      coalesce(active::text, '')
    )) as hashdiff
  from stage.stg_staff
)
update core.sat_staff css
  set
  end_dts = now(),
  is_current = false
from src 
where css.staff_hk = src.staff_hk
  and css.is_current = true
  and css.hashdiff <> src.hashdiff;

insert into core.sat_staff(staff_hk, first_name, 	last_name, 	email, 	active,	load_dts, record_source, start_dts, end_dts, is_current, hashdiff)
select
    staff_hk,
    first_name,
    last_name,
    email,
    active,
    now() as load_dts, 
    'dvdrental' as record_source, 
    now() as start_dts, 
    null as end_dts, 
    true as is_current,
    hashdiff
from src
where not exists(
  select 1
  from core.sat_staff cs
  where cs.staff_hk   = src.staff_hk
    and cs.is_current = true
    and cs.hashdiff = src.hashdiff
);
