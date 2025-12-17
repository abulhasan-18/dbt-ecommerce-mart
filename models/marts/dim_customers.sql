with c as (
  select * from {{ ref("stg_customers") }}
),
o as (
  select * from {{ ref("fct_orders") }}
)
select
  c.customer_id,
  c.full_name,
  c.email,
  c.city,
  c.state,
  c.created_date,

  count(case when o.status = 'completed' then 1 end) as completed_orders,
  coalesce(sum(case when o.status = 'completed' then o.gross_revenue end), 0) as lifetime_value,
  min(case when o.status = 'completed' then o.order_date end) as first_order_date,
  max(case when o.status = 'completed' then o.order_date end) as last_order_date

from c
left join o using (customer_id)
group by 1,2,3,4,5,6
