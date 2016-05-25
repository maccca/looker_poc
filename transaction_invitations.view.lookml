- view: transaction_invitations
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: account_from_id
    type: number
    sql: ${TABLE}.account_from_id

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

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: email_to
    type: string
    sql: ${TABLE}.email_to

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: user_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [id, users.id, users.lastname, users.firstname]

