- explore: test_pdt_child
- view: test_pdt_child
  derived_table:
    sql: |
      SELECT
        user_id as user_id
        , COUNT(*) as lifetime_orders
      FROM orders
      GROUP BY user_id
    indexes: [user_id]
    sql_trigger_value: SELECT 1
    
  fields:
  
  - dimension: user_id
    primary_key: true
    type: number