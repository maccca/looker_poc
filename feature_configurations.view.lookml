- view: feature_configurations
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: agreement_id
    type: number
    # hidden: true
    sql: ${TABLE}.agreement_id

  - dimension: config
    type: string
    sql: ${TABLE}.config

  - dimension: country_id
    type: number
    sql: ${TABLE}.country_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: default_feature
    type: yesno
    sql: ${TABLE}.default_feature

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

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

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
    - name
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.alt_marketplace_id
    - milestones.id
    - milestones.name
    - agreements.id
    - agreements.name

