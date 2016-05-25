- view: paypal_payment_responses
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: build
    type: string
    sql: ${TABLE}.build

  - dimension: correlation_id
    type: string
    sql: ${TABLE}.correlationId

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: milestone_id
    type: number
    # hidden: true
    sql: ${TABLE}.milestone_id

  - dimension: paypal_payment_id
    type: number
    # hidden: true
    sql: ${TABLE}.paypal_payment_id

  - dimension: paypal_timestamp
    type: string
    sql: ${TABLE}.paypal_timestamp

  - dimension: response_body
    type: string
    sql: ${TABLE}.response_body

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, paypal_payments.id, milestones.id, milestones.name]

