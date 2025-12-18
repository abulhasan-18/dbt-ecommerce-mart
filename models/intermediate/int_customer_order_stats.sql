with rev as (
  select * from {{ ref("int_order_revenue") }}
)
select
  customer_id,
  count(*) as completed_orders,
  sum(gross_revenue) as lifetime_value,
  min(order_date) as first_order_date,
  max(order_date) as last_order_date
from rev
group by 1
