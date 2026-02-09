with src as (
  select
    lp.payment_hk,
    sp.amount,

    (sp.amount > 5) as is_high_value,

    md5(concat(
      sp.amount::text, '#',
      (sp.amount > 5)::text
    )) as hashdiff

  from core.link_payment lp
  join core.sat_link_payment sp
    on lp.payment_hk = sp.payment_hk
   and sp.is_current = true
)

update bv.sat_payment_metrics old
set
  end_dts = now(),
  is_current = false
from src
where old.payment_hk = src.payment_hk
  and old.is_current = true
  and old.hashdiff <> src.hashdiff;

insert into bv.sat_payment_metrics (
  payment_hk,
  amount,
  is_high_value,
  load_dts,
  record_source,
  start_dts,
  end_dts,
  is_current,
  hashdiff
)
select
  payment_hk,
  amount,
  is_high_value,
  now(),
  'dvdrental',
  now(),
  null,
  true,
  hashdiff
from src
where not exists (
  select 1
  from bv.sat_payment_metrics s
  where s.payment_hk = src.payment_hk
    and s.is_current = true
    and s.hashdiff = src.hashdiff
);
