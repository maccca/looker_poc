
- view: transaction_entries_and_related
  derived_table:
    sql: |
      SELECT 
      te1.account_id as account_from_id,
      te2.account_id as account_to_id,
      te2.amount as amount
      FROM transaction_entries te1
      LEFT JOIN transaction_entries te2
      ON te1.related_transaction_id = te2.id
      

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: account_from_id
    type: number
    sql: ${TABLE}.account_from_id

  - dimension: account_to_id
    type: number
    sql: ${TABLE}.account_to_id

  - dimension: currency_id
    type: number
    sql: ${TABLE}.currency_id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  sets:
    detail:
      - account_from_id
      - account_to_id
      - currency_id
      - amount

