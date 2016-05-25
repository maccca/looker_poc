- view: schedules
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: due
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.due_date

  - dimension: integer
    type: string
    sql: ${TABLE}.integer

  - dimension: milestone_id
    type: string
    # hidden: true
    sql: ${TABLE}.milestone_id

  - dimension: schedule_type_id
    type: number
    # hidden: true
    sql: ${TABLE}.schedule_type_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: [id, schedule_types.id, milestones.id, milestones.name]

