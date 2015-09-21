- explore: test_pdt_parent
- view: test_pdt_parent
  derived_table:
    sql: |
      SELECT
        user_id as user_id
        , COUNT(*) as lifetime_orders
      FROM orders
      GROUP BY user_id
    indexes: [user_id]
    sql_trigger_value: SELECT MAX(user_id) FROM ${test_pdt_child.SQL_TABLE_NAME}

  fields:
  
  - dimension: user_id
    primary_key: true
    type: number
