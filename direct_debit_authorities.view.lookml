- view: direct_debit_authorities
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: account_id
    type: string
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: bank_bsb
    type: string
    sql: ${TABLE}.bank_bsb

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: debit_user_id
    type: string
    sql: ${TABLE}.debit_user_id

  - dimension: state
    type: string
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
    drill_fields: [id, accounts.id]

