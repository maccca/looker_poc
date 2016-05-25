- view: events
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: action
    type: string
    sql: ${TABLE}.action

  - dimension: call
    type: string
    sql: ${TABLE}.call

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: resource_id
    type: number
    sql: ${TABLE}.resource_id

  - dimension: resource_type
    type: string
    sql: ${TABLE}.resource_type

  - dimension: response
    type: string
    sql: ${TABLE}.response

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

