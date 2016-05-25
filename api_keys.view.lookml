- view: api_keys
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: access_token
    type: string
    sql: ${TABLE}.access_token

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: environment
    type: string
    sql: ${TABLE}.environment

  - dimension: key_type
    type: string
    sql: ${TABLE}.key_type

  - dimension: role
    type: string
    sql: ${TABLE}.role

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: user_auth_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_auth_id

  - measure: count
    type: count
    drill_fields: [id, user_auths.id]

