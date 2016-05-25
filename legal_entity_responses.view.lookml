- view: legal_entity_responses
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: external_legal_entity_id
    type: string
    sql: ${TABLE}.external_legal_entity_id

  - dimension: external_principal_id
    type: string
    sql: ${TABLE}.external_principal_id

  - dimension: external_transaction_id
    type: string
    sql: ${TABLE}.external_transaction_id

  - dimension: legal_entity_id
    type: number
    sql: ${TABLE}.legal_entity_id

  - dimension: response_body
    type: string
    sql: ${TABLE}.response_body

  - dimension: response_code
    type: string
    sql: ${TABLE}.response_code

  - dimension: response_description
    type: string
    sql: ${TABLE}.response_description

  - dimension: response_type
    type: string
    sql: ${TABLE}.response_type

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id]

