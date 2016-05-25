- view: addresses
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: addressline1
    type: string
    sql: ${TABLE}.addressline1

  - dimension: addressline2
    type: string
    sql: ${TABLE}.addressline2

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: company_id
    type: number
    sql: ${TABLE}.company_id

  - dimension: country_id
    type: number
    sql: ${TABLE}.country_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: postcode
    type: string
    sql: ${TABLE}.postcode

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: user_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_id

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: [id, users.id, users.lastname, users.firstname]

