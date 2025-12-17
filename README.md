# dbt-ecommerce-mart
DBT Ecommerce Mart is a local-first dbt + DuckDB analytics warehouse for e-commerce data. It turns raw CSV data (customers, orders, order items, products, payments) into a production-style modeling layer: staging → intermediate → marts, with data tests, an incremental fact table, and SCD snapshots for customer history
