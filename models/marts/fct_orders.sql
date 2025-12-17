with orders as (
  select * from {{ ref("stg_orders") }}
),
rev as (
  select * from {{ ref("int_order_revenue") }}
)
select
  o.order_id,
  o.customer_id,
  o.order_date,
  o.status,
  r.gross_revenue
from orders o
left join rev r using (order_id)
