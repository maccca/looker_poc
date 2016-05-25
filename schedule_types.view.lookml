- view: schedule_types
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: days_til_due
    type: number
    sql: ${TABLE}.days_til_due

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: [id, marketplaces.name, marketplaces.short_name, marketplaces.alt_marketplace_id, schedules.count]

