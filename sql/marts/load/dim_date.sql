insert into marts.dim_date (
    date_pk,
    full_date,
    year,
    month,
    day,
    quarter
)
select
    extract(year from d)::int * 10000
      + extract(month from d)::int * 100
      + extract(day from d)::int      as date_pk,
    d::date                           as full_date,
    extract(year from d)::int         as year,
    extract(month from d)::int        as month,
    extract(day from d)::int          as day,
    extract(quarter from d)::int      as quarter
from generate_series(
    '2000-01-01'::date,
    '2035-12-31'::date,
    interval '1 day'
) as d
where not exists (
    select 1
    from marts.dim_date dd
    where dd.full_date = d::date
);
