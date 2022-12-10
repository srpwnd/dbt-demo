with payments as (

  select * from {{ ref('base_jaffle_shop_payments') }}

), filtered as (

  select * from payments
  where amount > 0

)

select * from filtered
