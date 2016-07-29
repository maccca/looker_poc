
- view: monthly_fee_report
  derived_table:
    sql: |
      SELECT 
      te1.account_id as account_from_id,
      te2.account_id as account_to_id,
      te2.amount as amount,
      te2.marketplace_id as marketplace_id
      FROM transaction_entries te1
      LEFT JOIN transaction_entries te2
      ON te1.related_transaction_id = te2.id
      WHERE te1.account_id IN (
        SELECT transaction_pendings.account_from_id FROM
          (SELECT accounts.id as account_id
          FROM
          marketplaces 
          LEFT JOIN legal_entities
          ON marketplaces.legal_entity_id = legal_entities.id
          LEFT JOIN accounts
          ON legal_entities.id = accounts.legal_entity_id
          WHERE {% condition marketplace_filter %} marketplaces.name {% endcondition %}
          AND active = 't'
          AND account_type_id >= 9100 
          AND account_type_id < 9199) al
        INNER JOIN transaction_pendings ON al.account_id = transaction_pendings.account_to_id
        WHERE state IN (12000, 12200))

  fields:
  - filter: marketplace_filter
    type: string
    
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

  - dimension: marketplace_id
    type: number
    sql: ${TABLE}.marketplace_id
    
  sets:
    detail:
      - account_from_id
      - account_to_id
      - currency_id
      - amount
      - marketplace_id

