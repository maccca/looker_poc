- view: sub_merchant_responses
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: external_sub_merchant_id
    type: string
    sql: ${TABLE}.external_sub_merchant_id

  - dimension: external_transaction_id
    type: string
    sql: ${TABLE}.external_transaction_id

  - dimension: merchant_ident
    type: string
    sql: ${TABLE}.merchant_ident

  - dimension: response_body
    type: string
    sql: ${TABLE}.response_body

  - dimension: response_type
    type: string
    sql: ${TABLE}.response_type

  - dimension: sub_merchant_id
    type: number
    # hidden: true
    sql: ${TABLE}.sub_merchant_id

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, sub_merchants.id]

