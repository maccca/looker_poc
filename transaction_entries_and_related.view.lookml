
- view: transaction_entries_and_related
  derived_table:
    sql: |
      SELECT 
      a.account_id as account_from_id,
      b.account_id as account_to_id,
      a.currency_id as currency_id,
      a.amount as amount
      FROM transaction_entries a
      LEFT JOIN transaction_entries b
      ON a.related_transaction_id = b.related_transaction_id

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

