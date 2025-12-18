with src as (
  select * from {{ ref("raw_payments") }}
)
select
  cast(payment_id as integer) as payment_id,
  cast(order_id as integer) as order_id,
  cast(paid_ts as timestamp) as paid_ts,
  cast(amount_cents as double) / 100.0 as amount,
  lower(trim(method)) as method,
  lower(trim(status)) as status
from src
