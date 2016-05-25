- view: marketplace_paypals
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: paypal_chained_app_id
    type: string
    sql: ${TABLE}.paypal_chained_app_id

  - dimension: paypal_chained_app_verified
    type: yesno
    sql: ${TABLE}.paypal_chained_app_verified

  - dimension: paypal_email
    type: string
    sql: ${TABLE}.paypal_email

  - dimension: paypal_password
    type: string
    sql: ${TABLE}.paypal_password

  - dimension: paypal_signature
    type: string
    sql: ${TABLE}.paypal_signature

  - dimension: paypal_user_id
    type: string
    sql: ${TABLE}.paypal_user_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: [id, marketplaces.name, marketplaces.short_name, marketplaces.alt_marketplace_id]

