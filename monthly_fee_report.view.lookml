
- view: monthly_fee_report
  derived_table:
    sql: |
      SELECT y.* FROM (
      SELECT 
      te1.id as account_from_id,
      te2.id as account_to_id,
      te2.amount as amount
      FROM transaction_entries te1
      LEFT JOIN transaction_entries te2 ON te1.related_transaction_id = te2.id) y
      LEFT JOIN 
      (SELECT transaction_pendings.* FROM
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
      WHERE state IN (12000, 12200)) x
      ON y.account_from_id = x.account_from_id
      GROUP BY 1,2,3
      ORDER BY 1

  fields:
  - filter: marketplace_filter
    type: string
    
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: account_from_id
    type: string
    sql: ${TABLE}.account_from_id

  - dimension: account_to_id
    type: string
    sql: ${TABLE}.account_to_id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  sets:
    detail:
      - te_from_id
      - te_to_id
      - amount

