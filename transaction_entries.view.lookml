- view: transaction_entries
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: account_id
    type: number
    # hidden: true
    sql: ${TABLE}.account_id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: balance
    type: number
    sql: ${TABLE}.balance

  - dimension_group: completed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.completed_at

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.created_at

  - dimension: is_mtd
    type: yesno
    sql: |
      (EXTRACT(MONTH FROM ${created_raw}) = EXTRACT(MONTH FROM CURRENT_TIMESTAMP) AND
       EXTRACT(YEAR FROM ${created_raw}) = EXTRACT(YEAR FROM CURRENT_TIMESTAMP))

  - dimension: currency_id
    type: number
    sql: ${TABLE}.currency_id

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: external_reference
    type: string
    sql: ${TABLE}.external_reference

  - dimension: fee_id
    type: number
    # hidden: true
    sql: ${TABLE}.fee_id

  - dimension: is_refund
    type: number
    sql: ${TABLE}.is_refund

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

  - dimension: related_transaction_id
    type: number
    sql: ${TABLE}.related_transaction_id

  - dimension: status_id
    type: number
    sql: ${TABLE}.status_id

  - dimension: transaction_batch_id
    type: number
    sql: ${TABLE}.transaction_batch_id

  - dimension: transaction_pending_id
    type: number
    # hidden: true
    sql: ${TABLE}.transaction_pending_id

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
    
  - dimension: currency_control
    sql_case:
      USD: ${currency_id} = 2 AND ${accounts.id = 4}
      AUD: ${currency_id} = 1 AND ${accounts.id = 3} 

  - measure: count
    type: count
    drill_fields: detail*

  - measure: total_amount
    type: sum
    sql: abs(${amount}*1.0 / 100)
    value_format_name: usd
    
  - measure: total_difference
    type: sum
    sql: ${amount}*1.0 / 100
    value_format_name: usd

  - measure: total_amount_in_millions
    type: sum
    sql: ${amount} * 1.0 / (100 * 1000000)
    value_format: '#.000 "M"'

  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - users.id
    - users.lastname
    - users.firstname
    - transaction_pendings.bundle_transaction_pending_id
    - fees.id
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.alt_marketplace_id
    - accounts.id

