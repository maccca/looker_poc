- view: security_checks
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: check_type
    type: string
    sql: ${TABLE}.check_type

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: environment
    type: string
    sql: ${TABLE}.environment

  - dimension: external_id
    type: string
    sql: ${TABLE}.external_id

  - dimension: log
    type: string
    sql: ${TABLE}.log

  - dimension: operator
    type: string
    sql: ${TABLE}.operator

  - dimension: payload
    type: string
    sql: ${TABLE}.payload

  - dimension: rating
    type: number
    sql: ${TABLE}.rating

  - dimension: response
    type: string
    sql: ${TABLE}.response

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: [id]

