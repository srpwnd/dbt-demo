with customers as (

  select * from {{ ref('base_jaffle_shop_customers') }}

), enriched as (

  select 
    customer_id,
    first_name,
    last_name,
    first_name || ' ' || last_name as full_name
  from customers

)

select * from enriched
