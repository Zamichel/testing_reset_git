- scoping: true
- connection: red_flight
- persist_for: 2000 hours
- template: liquid
#- case_sensitive: false

- include: "*.lookml"

- explore: flights
  view: flights
  joins:
    - join: carriers
      foreign_key: flights.carrier

    - join: origin
      from: commercial_airports
      foreign_key: origin

    - join: destination
      from: commercial_airports
      foreign_key: destination

    - join: aircraft
      foreign_key: flights.tail_num
      fields: aircraft.export

    - join: aircraft_flights_facts
      foreign_key: flights.tail_num

    - join: aircraft_models
      foreign_key: aircraft.aircraft_model_code

    - join: aircraft_types
      foreign_key: aircraft_models.aircraft_type_id
 
     
- explore: airports
  view: airports
  
- explore: aircraft
  view: aircraft
  joins:
    - join: aircraft_models
      foreign_key: aircraft.aircraft_model_code

    - join: aircraft_types
      foreign_key: aircraft_models.aircraft_type_id
 
    - join: aircraft_flights_facts
      foreign_key: aircraft.tail_number

- explore: accidents
#   connection: faa
  view: accidents
  joins:
    - join: aircraft
      foreign_key: registration_number
      
- explore: route_picker
  always_filter: 
    code: 'ABE'
  fields: [route_picker.1st_stop, route_picker.1st_carrier, route_picker.1st_distance, route_picker.1st_state_location,
           route_picker.2nd_stop, route_picker.2nd_carrier, route_picker.2nd_distance, route_picker.2nd_state_location,
           route_picker.3rd_stop, route_picker.3rd_carrier, route_picker.3rd_distance, route_picker.3rd_state_location,
           route_picker.count_flights, route_picker.code]
  joins:
    - join: leg_1
      from: flights_xref
      relationship: one_to_many
      sql_on: ${route_picker.code} = ${leg_1.origin}
      fields: []
      
    - join: leg_2
      from: flights_xref
      relationship: one_to_many
      sql_on: ${leg_1.destination} = ${leg_2.origin}
      fields: []

    - join: leg_3
      from: flights_xref
      relationship: one_to_many
      sql_on: ${leg_2.destination} = ${leg_3.origin}
      fields: []

#     - join: leg_4
#       from: flights_xref
#       relationship: one_to_many
#       sql_on: ${leg_3.destination} = ${leg_4.origin}
#       fields: []
#       
