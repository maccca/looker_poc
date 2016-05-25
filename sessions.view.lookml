- view: sessions
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: milestone_id
    type: number
    # hidden: true
    sql: ${TABLE}.milestone_id

  - dimension: token_auth_id
    type: number
    # hidden: true
    sql: ${TABLE}.token_auth_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: [id, milestones.id, milestones.name, token_auths.id]

