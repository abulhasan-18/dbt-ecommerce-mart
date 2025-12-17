with src as (
  select * from {{ ref("raw_orders") }}
)
select
  cast(order_id as integer) as order_id,
  cast(customer_id as integer) as customer_id,
  cast(order_ts as timestamp) as order_ts,
  cast(order_ts as date) as order_date,
  lower(trim(status)) as status
from src
