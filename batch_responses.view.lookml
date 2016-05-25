- view: batch_responses
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: batch_id
    type: number
    sql: ${TABLE}.batch_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: external_transaction_id
    type: number
    sql: ${TABLE}.external_transaction_id

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: response_body
    type: string
    sql: ${TABLE}.response_body

  - dimension: response_code
    type: number
    sql: ${TABLE}.response_code

  - dimension: response_description
    type: string
    sql: ${TABLE}.response_description

  - dimension: transaction_id
    type: number
    sql: ${TABLE}.transaction_id

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, marketplaces.name, marketplaces.short_name, marketplaces.alt_marketplace_id]

