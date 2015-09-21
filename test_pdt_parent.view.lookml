- explore: test_pdt_parent
- view: test_pdt_parent
  derived_table:
    sql: |
      SELECT
        user_id as user_id
        , COUNT(*) as lifetime_orders
        , MAX(orders.date) as most_recent_purchase_date
      FROM orders
      GROUP BY user_id
    indexes: [user_id]
    sql_trigger_value: SELECT 1

  fields:
  
  - dimension: user_id
    primary_key: true
    type: number
