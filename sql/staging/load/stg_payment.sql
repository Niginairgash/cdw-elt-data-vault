insert into stg_payment
select
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    payment_date,
    now() as load_dts,
    'dvdrental' as record_source
from {{source}}.payment
where payment_date >= (select coalesce(max(load_dts), '1900-01-01') from stg_payment);