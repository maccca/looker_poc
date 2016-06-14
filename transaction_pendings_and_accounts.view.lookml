
- view: transaction_pendings_and_accounts
  derived_table:
    sql: |
      
      SELECT transaction_pendings.* FROM
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
      WHERE state IN (12000, 12200)

  fields:
  
  - filter: marketplace_filter
    type: string
    
    
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: id
    type: string
    sql: ${TABLE}.id

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

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

  - dimension: refunded_id
    type: number
    sql: ${TABLE}.refunded_id

  - dimension_group: created_at
    type: time
    sql: ${TABLE}.created_at

  - dimension_group: updated_at
    type: time
    sql: ${TABLE}.updated_at

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension: transaction_batch_id
    type: number
    sql: ${TABLE}.transaction_batch_id

  - dimension: transaction_type
    type: number
    sql: ${TABLE}.transaction_type

  - dimension: reference_amount
    type: number
    sql: ${TABLE}.reference_amount

  - dimension: legal_entity_id
    type: number
    sql: ${TABLE}.legal_entity_id

  - dimension: marketplace_id
    type: number
    sql: ${TABLE}.marketplace_id

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - dimension: bundle_transaction_pending_id
    type: number
    sql: ${TABLE}.bundle_transaction_pending_id

  sets:
    detail:
      - id
      - user_id
      - account_from_id
      - account_to_id
      - currency_id
      - amount
      - refunded_id
      - created_at_time
      - updated_at_time
      - state
      - transaction_batch_id
      - transaction_type
      - reference_amount
      - legal_entity_id
      - marketplace_id
      - uuid
      - bundle_transaction_pending_id

