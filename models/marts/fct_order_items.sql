with oi as (
  select * from {{ ref("stg_order_items") }}
),
o as (
  select * from {{ ref("stg_orders") }}
)
select
  oi.order_item_id,
  oi.order_id,
  o.customer_id,
  o.order_date,
  o.status,
  oi.product_id,
  oi.quantity,
  oi.unit_price,
  (oi.quantity * oi.unit_price) as line_revenue
from oi
join o using (order_id)
