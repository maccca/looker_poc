- view: notes
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: external
    type: yesno
    sql: ${TABLE}.external

  - dimension: legal_entity_uuid
    type: string
    sql: ${TABLE}.legal_entity_uuid

  - dimension: milestone_uuid
    type: string
    sql: ${TABLE}.milestone_uuid

  - dimension: note
    type: string
    sql: ${TABLE}.note

  - dimension: transaction_pending_id
    type: string
    # hidden: true
    sql: ${TABLE}.transaction_pending_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, transaction_pendings.bundle_transaction_pending_id]

