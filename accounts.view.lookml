- view: accounts
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: account_type_id
    type: number
    sql: ${TABLE}.account_type_id
        
  - dimension: account_type
    type: string
    sql: CASE 
          WHEN ${TABLE}.account_type_id = 1000 THEN 'Assembly Payments Account'
          WHEN ${TABLE}.account_type_id = 1100 THEN 'Wire Transfer'
          WHEN ${TABLE}.account_type_id = 1200 THEN 'BPay'
          WHEN ${TABLE}.account_type_id = 2000 THEN 'Digital Wallet'
          WHEN ${TABLE}.account_type_id = 3000 THEN 'Item Account'
          WHEN ${TABLE}.account_type_id = 9100 THEN 'Bank Account'
          WHEN ${TABLE}.account_type_id = 9110 THEN 'Bank Account (International)'
          WHEN ${TABLE}.account_type_id = 9200 THEN 'Credit Card'
          WHEN ${TABLE}.account_type_id = 9300 THEN 'PayPal Payout'
          WHEN ${TABLE}.account_type_id = 9400 THEN 'PayPal PayIn'
          ELSE 'Null'
        END
        
  - dimension: active
    type: yesno
    sql: ${TABLE}.active = 'true'

  - dimension: amount
    type: number
    sql: ${TABLE}.amount / 100.00
    value_format_name: usd

  - dimension: bank_account_details
    type: string
    sql: ${TABLE}.bank_account_details

  - dimension: bank_account_secure
    type: string
    sql: ${TABLE}.bank_account_secure

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: currency_id
    type: number
    sql: ${TABLE}.currency_id

  - dimension: disbursement_account_id
    type: number
    sql: ${TABLE}.disbursement_account_id

  - dimension: external_token
    type: string
    sql: ${TABLE}.external_token

  - dimension: legal_entity_id
    type: number
    sql: ${TABLE}.legal_entity_id

  - dimension: milestone_id
    type: number
    # hidden: true
    sql: ${TABLE}.milestone_id
    
  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: payout_currency_id
    type: number
    sql: ${TABLE}.payout_currency_id

  - dimension: paypal_email
    type: string
    sql: ${TABLE}.paypal_email

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

  - measure: count
    type: count
    drill_fields: detail*
    
  - measure: total_amount
    type: sum
    sql: ${TABLE}.amount*1.0 / 100
    value_format_name: usd


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - users.id
    - users.lastname
    - users.firstname
    - milestones.id
    - milestones.name
    - account_types.name
    - account_types.id
    - direct_debit_authorities.count
    - sub_merchants.count
    - transaction_entries.count
    - transaction_references.count

