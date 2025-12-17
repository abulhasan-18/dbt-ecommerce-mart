with orders as (
  select * from {{ ref("stg_orders") }}
),
items as (
  select * from {{ ref("stg_order_items") }}
)
select
  i.order_id,
  o.customer_id,
  o.order_date,
  sum(i.quantity * i.unit_price) as gross_revenue
from items i
join orders o using (order_id)
where o.status = 'completed'
group by 1,2,3
