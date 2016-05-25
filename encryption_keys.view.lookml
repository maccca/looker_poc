- view: encryption_keys
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: active
    type: yesno
    sql: ${TABLE}.active

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: key_type
    type: string
    sql: ${TABLE}.key_type

  - dimension: legal_entity_id
    type: number
    sql: ${TABLE}.legal_entity_id

  - dimension: private_key
    type: string
    sql: ${TABLE}.private_key

  - dimension: private_password
    type: string
    sql: ${TABLE}.private_password

  - dimension: public_key
    type: string
    sql: ${TABLE}.public_key

  - dimension: public_key_compressed
    type: string
    sql: ${TABLE}.public_key_compressed

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id]

