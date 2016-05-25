- view: sub_merchants
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: account_id
    type: number
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension: amex_number
    type: string
    sql: ${TABLE}.amex_number

  - dimension: billing_descriptor
    type: string
    sql: ${TABLE}.billing_descriptor

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: discover_number
    type: string
    sql: ${TABLE}.discover_number

  - dimension: gateway
    type: string
    sql: ${TABLE}.gateway

  - dimension: legal_entity_id
    type: number
    sql: ${TABLE}.legal_entity_id

  - dimension: max_transaction_amount
    type: number
    sql: ${TABLE}.max_transaction_amount

  - dimension: merchant_category
    type: string
    sql: ${TABLE}.merchant_category

  - dimension: merchant_identity_string
    type: string
    sql: ${TABLE}.merchant_identity_string

  - dimension: merchant_number
    type: string
    sql: ${TABLE}.merchant_number

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
    drill_fields: [id, accounts.id, sub_merchant_responses.count]

