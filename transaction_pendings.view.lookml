- view: transaction_pendings
  fields:

  - dimension: bundle_transaction_pending_id
    primary_key: true
    type: number
    sql: ${TABLE}.bundle_transaction_pending_id

  - dimension: account_from_id
    type: number
    sql: ${TABLE}.account_from_id

  - dimension: account_to_id
    type: number
    sql: ${TABLE}.account_to_id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: currency_id
    type: number
    sql: ${TABLE}.currency_id

  - dimension: id
    type: number
    sql: ${TABLE}.id

  - dimension: legal_entity_id
    type: number
    sql: ${TABLE}.legal_entity_id

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: reference_amount
    type: number
    sql: ${TABLE}.reference_amount

  - dimension: refunded_id
    type: number
    sql: ${TABLE}.refunded_id

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension: transaction_batch_id
    type: number
    sql: ${TABLE}.transaction_batch_id

  - dimension: transaction_type
    type: number
    sql: ${TABLE}.transaction_type

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: user_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_id

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - bundle_transaction_pending_id
    - users.id
    - users.lastname
    - users.firstname
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.alt_marketplace_id
    - notes.count
    - transaction_entries.count
    - transaction_references.count

