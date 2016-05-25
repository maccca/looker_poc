- view: agreements
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: state
    type: number
    sql: ${TABLE}.state

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
    - feature_configurations.count
    - milestones.count

