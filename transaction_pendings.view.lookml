- view: transaction_pendings
  fields:

  - dimension: bundle_transaction_pending_id
    type: number
    sql: ${TABLE}.bundle_transaction_pending_id

  - dimension: account_from_id
    type: number
    sql: ${TABLE}.account_from_id

  - dimension: account_to_id
    type: number
    sql: ${TABLE}.account_to_id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: currency_id
    type: number
    sql: ${TABLE}.currency_id

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

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

  - dimension: state
    type: number
    sql: ${TABLE}.state
    
  - dimension: state_name
    label: 'Status'
    type: string
    sql: CASE 
          WHEN ${state} = 12000 THEN 'Successful'
          WHEN ${state} = 12010 THEN 'Pending Successful'
          WHEN ${state} = 12200 THEN 'Batched'
          WHEN ${state} = 12360 THEN 'Invalid Account Details'
          WHEN ${state} = 12370 THEN 'Failed Direct Debit'
          WHEN ${state} = 12700 THEN 'Processing with Bank'
          WHEN ${state} = 12900 THEN 'Errored'
          ELSE 'No Status'
        END

  - dimension: transaction_batch_id
    type: number
    sql: ${TABLE}.transaction_batch_id

  - dimension: reference_milestone_id
    type: number
    sql: ${TABLE}.reference_milestone_id
    
  - dimension: transaction_type
    type: number
    sql: ${TABLE}.transaction_type

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
    
  - dimension: formatted_amount
    label: 'Amount'
    view_label: ''
    type: number
    sql: abs(${TABLE}.amount*1.0 / 100)
    value_format_name: usd

  - measure: count
    type: count
    drill_fields: detail*
    
  - measure: total_amount
    type: sum
    sql: ${amount}


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - bundle_transaction_pending_id
    - users.id
    - users.lastname
    - users.firstname
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.alt_marketplace_id
    - notes.count
    - transaction_entries.count
    - transaction_references.count

