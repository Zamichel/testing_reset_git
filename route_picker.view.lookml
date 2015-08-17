- view: route_picker
  extends: airports
  
  fields:
  
    - dimension: 1st_stop
      sql: ${leg_1.destination}
    
    - dimension: 1st_carrier
      sql: ${leg_1.carrier}
      
    - dimension: 1st_distance
      type: number
      sql: ${leg_1.distance}
      
    - dimension: 1st_state_location
      sql: ${leg_1.state}
      
    - dimension: 2nd_stop
      sql: ${leg_2.destination}
      
    - dimension: 2nd_carrier
      sql: ${leg_2.carrier}
      
    - dimension: 2nd_distance
      type: number
      sql: ${leg_2.distance}
      
    - dimension: 2nd_state_location
      sql: ${leg_2.state}
      
    - dimension: 3rd_stop
      sql: ${leg_3.destination}
      
    - dimension: 3rd_carrier
      sql: ${leg_3.carrier}
      
    - dimension: 3rd_distance
      type: number
      sql: ${leg_3.distance}
      
    - dimension: 3rd_state_location
      sql: ${leg_3.state}
      
    - measure: count_flights
      sql: COUNT(${code})

