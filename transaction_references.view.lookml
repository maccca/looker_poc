- view: transaction_references
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: account_id
    type: number
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: reference
    label: 'OPS Centre'
    type: string
    sql: ${TABLE}.reference

  - dimension: transaction_pending_id
    type: number
    # hidden: true
    sql: ${TABLE}.transaction_pending_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: [id, transaction_pendings.bundle_transaction_pending_id, accounts.id]

