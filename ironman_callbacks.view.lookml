- view: ironman_callbacks
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: enabled
    type: yesno
    sql: ${TABLE}.enabled

  - dimension: http_method
    type: string
    sql: ${TABLE}.http_method

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: object_type
    type: string
    sql: ${TABLE}.object_type

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - measure: count
    type: count
    drill_fields: [id, marketplaces.name, marketplaces.short_name, marketplaces.alt_marketplace_id, ironman_callback_responses.count]

