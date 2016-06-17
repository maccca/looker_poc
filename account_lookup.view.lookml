- view: account_lookup
  derived_table:
    sql: |
      SELECT accounts.id as account_id
      FROM
      marketplaces 
      LEFT JOIN legal_entities
      ON marketplaces.legal_entity_id = legal_entities.id
      LEFT JOIN accounts
      ON legal_entities.id = accounts.legal_entity_id
      WHERE {% condition marketplace_filter %} marketplaces.name {% endcondition %}
      AND active = 't'
      AND account_type_id >= 9100 
      AND account_type_id < 9199
      
  fields:
  
  - filter: marketplace_filter
    type: string
    
  - dimension: account_id
    type: number
    hidden: true
    sql: ${TABLE}.account_id