- view: fee_lists
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: cap
    type: number
    sql: ${TABLE}.cap

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: fee_type_id
    type: number
    # hidden: true
    sql: ${TABLE}.fee_type_id

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: max
    type: number
    sql: ${TABLE}.max

  - dimension: min
    type: number
    sql: ${TABLE}.min

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: to
    type: string
    sql: ${TABLE}."to"

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
    - fee_types.id
    - fee_types.name
    - fees.count

