- view: ironman_callback_responses
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: ironman_callback_id
    type: string
    # hidden: true
    sql: ${TABLE}.ironman_callback_id

  - dimension: payload
    type: string
    sql: ${TABLE}.payload

  - dimension: response
    type: string
    sql: ${TABLE}.response

  - dimension: response_code
    type: number
    sql: ${TABLE}.response_code

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - measure: count
    type: count
    drill_fields: [id, ironman_callbacks.id]

