- view: companies
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: charge_tax
    type: yesno
    sql: ${TABLE}.charge_tax

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: legal_entity_id
    type: number
    sql: ${TABLE}.legal_entity_id

  - dimension: legal_name
    type: string
    sql: ${TABLE}.legal_name

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: phone
    type: string
    sql: ${TABLE}.phone

  - dimension: tax_number
    type: string
    sql: ${TABLE}.tax_number

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


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - name
    - legal_name
    - users.id
    - users.lastname
    - users.firstname

