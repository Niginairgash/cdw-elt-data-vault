insert into marts.dim_customer(
  customer_hk, 
  first_name, 
  last_name, 
  email, 
  active, 
  hashdif,
	start_dts,
  end_dts,
  is_current
)
  select
    sc.customer_hk,
  	sc.first_name,
  	sc.last_name,
  	sc.email,
  	sc.active,
    sс.hashdif,
  	sc.start_dts,
  	sc.end_dts,
  	sc.is_current
  from core.sat_customer sc 
where not exists (
  select 1
  from marts.dim_customer dc
  where  sc.customer_hk = dc.customer_hk
    and  sc.start_dts   = dc.start_dts
)
