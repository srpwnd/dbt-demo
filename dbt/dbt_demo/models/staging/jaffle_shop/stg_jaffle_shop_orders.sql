with orders as (

  select * from {{ ref('base_jaffle_shop_orders') }}

)

select * from orders
