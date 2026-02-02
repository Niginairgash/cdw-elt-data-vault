with src as (
  select
    hc.customer_hk,
  
    case
      when sc.active = true then 'ACTIVE'
      else "INACTIVE"
    end as customer_status,
  
    sc.active as is_active,

    md5(concat(
      coalesce(sc.active::text, ''), '#',
      case
        when sc.active = true then 'ACTIVE'
        else 'INACTIVE'
      end
    )) as hashdiff,

  from core.hub_customer hc
  join core.sat_customer sc
    on hc.customer_hk = sc.customer_hk
    and sc.is_currenr = true 
)

update bv.sat_customer_status old
set 
  end_dts = now(),
  is_current = false
from src
where old.customer_hk = src.customer_hk
  and old.is_current = true
  and old.hashdiff <> src.hashdiff;

insert into bv.sat_customer_status (
  customer_hk,
  customer_status,
  is_active,
  load_dts,
  start_dts,
  end_dts,
  is_current,
  hashdiff
  )
select
  customer_hk,
  customer_status,
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
  from bv.sat_customer_status s 
  where s.customer_hk = src.customer_hk
    and s.is_current = true
    and s.hashdiff = src.hashdiff
);
