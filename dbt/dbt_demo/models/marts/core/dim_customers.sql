with customers as (

  select * from {{ ref('stg_jaffle_shop_customers') }}

), orders as (

  select * from {{ ref('stg_jaffle_shop_orders') }}

), payments as (

  select * from {{ ref('stg_jaffle_shop_orders_value') }}

), customer_orders as (

  select
    customer_id,
    min(order_date) as first_order,
    max(order_date) as last_order,
    count(*) as no_of_orders
  from orders
  group by 1

), customer_amounts as (

  select
    orders.customer_id,
    sum(payments.total_amount) as total_amount
  from orders
  left join payments on orders.order_id = payments.order_id
  group by 1

), final as (

  select 
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    customers.full_name,
    customer_orders.first_order,
    customer_orders.last_order,
    customer_orders.no_of_orders,
    customer_amounts.total_amount
  from customers
  left join customer_orders on customers.customer_id = customer_orders.customer_id
  left join customer_amounts on customers.customer_id = customer_amounts.customer_id

)

select * from final
