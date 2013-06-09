- dashboard: flights_facts
  title: Fun Flight Facts
  layout: tile
  elements:

    - name: airports_by_elevation_tier
      type: piechart
      base_view: airports
      group: airports.elevation_tier
      measure: airports.count
      sorts: airports.elevation_tier
      ugly_fish: hello
      height: 3
      width: 3


    - name: airports_by_control_tower
      type: piechart
      base_view: airports
      group: airports.control_tower
      measure: airports.count
      height: 4
      width: 4

    - name: flights_by_carrier
      type: piechart
      base_view: flights
      group: carriers.name
      measure: flights.count
      height: 5
      width: 5

    - name: flights_by_origin
      type: piechart
      base_view: flights
      group: origin.city
      measure: flights.count
      height: 3
      width: 3

    - name: california_flights_by_california_destination
      type: piechart
      base_view: flights
      group: destination.city
      measure: flights.count
      filters:
        origin.state: CA
        destination.state: CA
      height: 4
      width: 4

    - name: california_vs_new_york_vs_texas
      type: piechart
      base_view: flights
      group: origin.state
      measure: flights.count
      filters:
        origin.state: CA,NY,TX
      height: 3
      width: 3

    - name: flights_by_departure_hour
      type: time_series
      base_view: flights
      time_dimension: flights.depart_hour
      measures: [flights.count, flights.late_count,flights.verylate_count]
      filters:
        flights.depart_time: 2001-01-01 for 1 days

    # - name: flight_today
    #   type: number
    #   base_view: flights
    #   field: flights.count
    #   filters:
    #     flights.depart_time: "2001-01-01 for 1 days"
