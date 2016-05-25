- view: paypal_payments
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: execution_status
    type: string
    sql: ${TABLE}.execution_status

  - dimension: milestone_id
    type: number
    # hidden: true
    sql: ${TABLE}.milestone_id

  - dimension: pay_key
    type: string
    sql: ${TABLE}.pay_key

  - dimension: payer_id
    type: string
    sql: ${TABLE}.payer_id

  - dimension: paypal_transaction_id
    type: string
    sql: ${TABLE}.paypal_transaction_id

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
    drill_fields: [id, milestones.id, milestones.name, paypal_payment_responses.count]

