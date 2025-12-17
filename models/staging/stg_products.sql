with src as (
  select * from {{ ref("raw_products") }}
)
select
  cast(product_id as integer) as product_id,
  trim(product_name) as product_name,
  trim(category) as category,
  cast(price_cents as double) / 100.0 as price,
  cast(is_active as boolean) as is_active
from src
