- view: transaction_check_responses
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: body
    type: string
    sql: ${TABLE}.body

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: redbody
    type: string
    sql: ${TABLE}.redbody

  - dimension: redcode
    type: string
    sql: ${TABLE}.redcode

  - dimension: redreqid
    type: string
    sql: ${TABLE}.redreqid

  - dimension: redresponse
    type: string
    sql: ${TABLE}.redresponse

  - dimension: response
    type: string
    sql: ${TABLE}.response

  - dimension: spreedlytoken
    type: string
    sql: ${TABLE}.spreedlytoken

  - dimension: transaction_check_id
    type: number
    # hidden: true
    sql: ${TABLE}.transaction_check_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, transaction_checks.id]

  - dimension: EBT_ACCT_TYPE
    type: string
    sql: ${TABLE}.redbody::json ->> 'EBT_ACCT_TYPE'