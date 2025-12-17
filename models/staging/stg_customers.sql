with src as (
  select * from {{ ref("raw_customers") }}
)
select
  cast(customer_id as integer) as customer_id,
  trim(full_name) as full_name,
  lower(trim(email)) as email,
  trim(city) as city,
  trim(state) as state,
  cast(created_at as date) as created_date
from src
