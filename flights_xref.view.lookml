- view: flights_xref
  derived_table:
    sql: |
      SELECT 
        origin, 
        destination,
        carrier,
        distance,
        state
      FROM ontime 
      INNER JOIN airports 
      ON destination = airports.code
      GROUP BY 1,2,3,4,5

  fields:
    - dimension: derived_key
      hidden: true
      sql: ${origin} || ${destination} || ${carrier}
  
    - dimension: origin
    - dimension: destination
    - dimension: carrier
    - dimension: distance
    - dimension: state
    
    - measure: count
      type: count


# #     Define your dimensions and measures here, like this:
#     - dimension: profit
#       type: number
#       sql: ${TABLE}.profit
#
#     - measure: total_profit
#       type: sum
#       sql: ${profit}
