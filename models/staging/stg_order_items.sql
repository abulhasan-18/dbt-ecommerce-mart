with src as (
  select * from {{ ref("raw_order_items") }}
)
select
  cast(order_item_id as integer) as order_item_id,
  cast(order_id as integer) as order_id,
  cast(product_id as integer) as product_id,
  cast(quantity as integer) as quantity,
  cast(unit_price_cents as double) / 100.0 as unit_price
from src
