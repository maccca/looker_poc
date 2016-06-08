- view: legal_entities
  fields:

  - dimension: external_legal_entity_id
    type: string
    sql: ${TABLE}.external_legal_entity_id

  - dimension: accepted_credit_cards
    type: yesno
    sql: ${TABLE}.accepted_credit_cards

  - dimension: annual_credit_card_volume
    type: number
    view_label: next_kyc_threshold
    sql: ${TABLE}.annual_credit_card_volume

  - dimension: company_id
    type: number
    sql: ${TABLE}.company_id

  - dimension: country_id
    type: number
    sql: ${TABLE}.country_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: currency_id
    type: number
    sql: ${TABLE}.currency_id

  - dimension: deposit_reference
    type: string
    sql: ${TABLE}.deposit_reference

  - dimension: disbursement_account_id
    type: number
    sql: ${TABLE}.disbursement_account_id

  - dimension: entity_type
    type: string
    sql: ${TABLE}.entity_type

  - dimension: hold
    type: yesno
    sql: ${TABLE}.hold

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: kyc_state
    type: number
    sql: ${TABLE}.kyc_state

  - dimension: name
    type: string
    sql: ${TABLE}.name
    links:
    - label: Ops Center
      url: https://ops.promisepay.com/legal_entities/{{ uuid._value }}
      icon_url: http://downoruprightnow.com/favicon/promisepay.com.jpg

  - dimension: payment_account_id
    type: number
    sql: ${TABLE}.payment_account_id

  - dimension: principal_id
    type: number
    sql: ${TABLE}.principal_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid::varchar
    links:
    - label: Ops Center
      url: https://ops.promisepay.com/legal_entities/{{ value }}
      icon_url: http://downoruprightnow.com/favicon/promisepay.com.jpg

  - measure: count
    type: count
    drill_fields: [external_legal_entity_id, name]
