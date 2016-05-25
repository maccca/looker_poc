- view: fed_ach_participants
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension_group: change
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.change_date

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: customer_name
    type: string
    sql: ${TABLE}.customer_name

  - dimension: data_view_code
    type: number
    sql: ${TABLE}.data_view_code

  - dimension: institution_status_code
    type: number
    sql: ${TABLE}.institution_status_code

  - dimension: new_routing_number
    type: string
    sql: ${TABLE}.new_routing_number

  - dimension: office_code
    type: string
    sql: ${TABLE}.office_code

  - dimension: phone_area_code
    type: string
    sql: ${TABLE}.phone_area_code

  - dimension: phone_prefix
    type: string
    sql: ${TABLE}.phone_prefix

  - dimension: phone_suffix
    type: string
    sql: ${TABLE}.phone_suffix

  - dimension_group: published
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.published_on

  - dimension: record_type_code
    type: string
    sql: ${TABLE}.record_type_code

  - dimension: routing_number
    type: string
    sql: ${TABLE}.routing_number

  - dimension: servicing_frb_number
    type: string
    sql: ${TABLE}.servicing_frb_number

  - dimension: state_code
    type: string
    sql: ${TABLE}.state_code

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: zip
    type: string
    sql: ${TABLE}.zip

  - dimension: zip_extension
    type: string
    sql: ${TABLE}.zip_extension

  - measure: count
    type: count
    drill_fields: [id, customer_name]

