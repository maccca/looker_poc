- view: user_auths
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: external_id
    type: string
    sql: ${TABLE}.external_id

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: user_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_id

  - dimension: user_role_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_role_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.alt_marketplace_id
    - users.id
    - users.lastname
    - users.firstname
    - user_roles.name
    - user_roles.id
    - api_keys.count
    - token_auths.count

