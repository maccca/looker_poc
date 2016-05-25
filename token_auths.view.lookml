- view: token_auths
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: expiry
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expiry

  - dimension: token
    type: string
    sql: ${TABLE}.token

  - dimension: token_auth_type_id
    type: number
    # hidden: true
    sql: ${TABLE}.token_auth_type_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: user_auth_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_auth_id

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: [id, token_auth_types.name, token_auth_types.id, user_auths.id, sessions.count]

