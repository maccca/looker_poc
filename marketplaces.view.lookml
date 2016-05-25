- view: marketplaces
  fields:

  - dimension: alt_marketplace_id
    type: string
    sql: ${TABLE}.alt_marketplace_id

  - dimension: alt_marketplace_auth
    type: string
    sql: ${TABLE}.alt_marketplace_auth

  - dimension: alternate_environment_id
    type: string
    sql: ${TABLE}.alternate_environment_id

  - dimension: bcc_email
    type: string
    sql: ${TABLE}.bcc_email

  - dimension: business_information_id
    type: number
    # hidden: true
    sql: ${TABLE}.business_information_id

  - dimension: cc_hold_for
    type: number
    sql: ${TABLE}.cc_hold_for

  - dimension: color_1
    type: string
    sql: ${TABLE}.color_1

  - dimension: color_2
    type: string
    sql: ${TABLE}.color_2

  - dimension: color_3
    type: string
    sql: ${TABLE}.color_3

  - dimension: color_4
    type: string
    sql: ${TABLE}.color_4

  - dimension: color_5
    type: string
    sql: ${TABLE}.color_5

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: custom_stylesheet
    type: string
    sql: ${TABLE}.custom_stylesheet

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: legal_entity_id
    type: number
    sql: ${TABLE}.legal_entity_id

  - dimension: logo_url
    type: string
    sql: ${TABLE}.logo_url

  - dimension: mobile
    type: string
    sql: ${TABLE}.mobile

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: payment_frequency
    type: string
    sql: ${TABLE}.payment_frequency

  - dimension: seller_merchants
    type: yesno
    sql: ${TABLE}.seller_merchants

  - dimension: sending_email
    type: string
    sql: ${TABLE}.sending_email

  - dimension: short_name
    type: string
    sql: ${TABLE}.short_name

  - dimension: soft_descriptors
    type: yesno
    sql: ${TABLE}.soft_descriptors

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid

  - dimension: website
    type: string
    sql: ${TABLE}.website

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - name
    - short_name
    - business_informations.bank_name
    - business_informations.principal_name
    - business_informations.id
    - agreements.count
    - batch_responses.count
    - business_informations.count
    - feature_configurations.count
    - fee_lists.count
    - fees.count
    - ironman_callbacks.count
    - marketplace_addons.count
    - marketplace_paypals.count
    - milestones.count
    - payment_restrictions.count
    - schedule_types.count
    - transaction_checks.count
    - transaction_entries.count
    - transaction_pendings.count
    - uploads.count
    - user_auths.count
    - users.count

