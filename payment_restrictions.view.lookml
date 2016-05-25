- view: payment_restrictions
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: country_id
    type: number
    sql: ${TABLE}.country_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: default_restriction
    type: yesno
    sql: ${TABLE}.default_restriction

  - dimension: direction
    type: string
    sql: ${TABLE}.direction

  - dimension: enabled
    type: yesno
    sql: ${TABLE}.enabled

  - dimension: legal_entity_id
    type: number
    sql: ${TABLE}.legal_entity_id

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: max
    type: number
    sql: ${TABLE}.max

  - dimension: milestone_id
    type: number
    # hidden: true
    sql: ${TABLE}.milestone_id

  - dimension: min
    type: number
    sql: ${TABLE}.min

  - dimension: payment_method
    type: string
    sql: ${TABLE}.payment_method

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: user_role
    type: string
    sql: ${TABLE}.user_role

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - milestones.id
    - milestones.name
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.alt_marketplace_id

