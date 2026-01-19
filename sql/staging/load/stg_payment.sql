insert into stage.stg_payment( 
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    payment_date,
    load_dts,
    record_source
)
select
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    payment_date,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.payment p
where not exists (
    select 1
    from stage.stg_payment sp
    where sp.payment_id = p.payment_id
);