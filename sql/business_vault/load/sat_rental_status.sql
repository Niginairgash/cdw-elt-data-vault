with src as (
  select
    hr.rental_hk,

    case
      when sr.return_date is null then 'IN_PROGRESS'
      else 'RETURNED'
    end as rental_status,

    (sr.return_date is null) as is_active,

    md5(concat(
      case
        when sr.return_date is null then 'IN_PROGRESS'
        when sr.return_date <= sr.rental_date + interval '1 day' * sr.rental_duration
             then 'RETURNED'
        else 'OVERDUE'
      end, '#',
      (sr.return_date is null)::text
    )) as hashdiff

  from core.link_rental hr
  join core.sat_link_rental sr
    on hr.rental_hk = sr.rental_hk
   and sr.is_current = true
)

update bv.sat_rental_status old
set 
  end_dts = now(),
  is_current = false
from src
where old.rental_hk = src.rental_hk
  and old.is_current = true
  and old.hashdiff <> src.hashdiff;

insert into bv.sat_rental_status (
  rental_hk,
  rental_status,
  is_active,
  load_dts,
  record_source,
  start_dts,
  end_dts,
  is_current,
  hashdiff
  )
select
  rental_hk,
  rental_status,
  is_active,
  now() as load_dts,
  'dvdrental' as record_source,
  now() as start_dts,
  null as end_dts,
  true as is_current,
  hashdiff
from src
where not exists(
  select 1
  from bv.sat_rental_status s 
  where s.rental_hk = src.rental_hk
    and s.is_current = true
    and s.hashdiff = src.hashdiff
);

