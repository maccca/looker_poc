- view: app_logs
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: app_log_type_id
    type: number
    # hidden: true
    sql: ${TABLE}.app_log_type_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: detail
    type: string
    sql: ${TABLE}.detail

  - dimension: loggable_id
    type: number
    sql: ${TABLE}.loggable_id

  - dimension: loggable_type
    type: string
    sql: ${TABLE}.loggable_type

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, name, app_log_types.id, app_log_types.name]

