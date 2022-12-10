with orders as (

  select * from {{ ref('stg_jaffle_shop_orders') }}

), payments as (

  select * from {{ ref('stg_jaffle_shop_orders_value') }}

), final as (

  select 
    orders.order_id,
    orders.order_date,
    orders.customer_id,
    orders.status,
    payments.total_amount,
    payments.coupon_amount
  from orders
  left join payments on orders.order_id = payments.order_id

)

select * from final
