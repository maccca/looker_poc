- view: transaction_batches
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: count_credits
    type: number
    sql: ${TABLE}.count_credits

  - dimension: count_debits
    type: number
    sql: ${TABLE}.count_debits

  - dimension: count_exported_transactions
    type: number
    sql: ${TABLE}.count_exported_transactions

  - dimension: count_imported_transactions
    type: number
    sql: ${TABLE}.count_imported_transactions

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: exported
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.exported_at

  - dimension_group: imported
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.imported_at

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: total_credits
    type: number
    sql: ${TABLE}.total_credits

  - dimension: total_debits
    type: number
    sql: ${TABLE}.total_debits

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, name]

