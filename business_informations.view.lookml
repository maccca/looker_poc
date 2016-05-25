- view: business_informations
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: addons
    type: string
    sql: ${TABLE}.addons

  - dimension: avg_transaction_value
    type: string
    sql: ${TABLE}.avg_transaction_value

  - dimension: bank_account_holder
    type: string
    sql: ${TABLE}.bank_account_holder

  - dimension: bank_account_number
    type: string
    sql: ${TABLE}.bank_account_number

  - dimension: bank_account_type
    type: string
    sql: ${TABLE}.bank_account_type

  - dimension: bank_holder_type
    type: string
    sql: ${TABLE}.bank_holder_type

  - dimension: bank_name
    type: string
    sql: ${TABLE}.bank_name

  - dimension: bank_routing_number
    type: string
    sql: ${TABLE}.bank_routing_number

  - dimension: business_model_description
    type: string
    sql: ${TABLE}.business_model_description

  - dimension: company_country
    type: string
    sql: ${TABLE}.company_country

  - dimension: company_phone
    type: string
    sql: ${TABLE}.company_phone

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: customer_support_email
    type: string
    sql: ${TABLE}.customer_support_email

  - dimension: incorporation_date
    type: string
    sql: ${TABLE}.incorporation_date

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: monthly_chargebacks
    type: string
    sql: ${TABLE}.monthly_chargebacks

  - dimension: monthly_disputes
    type: string
    sql: ${TABLE}.monthly_disputes

  - dimension: monthly_refunds
    type: string
    sql: ${TABLE}.monthly_refunds

  - dimension: monthly_transactions
    type: string
    sql: ${TABLE}.monthly_transactions

  - dimension: payments_flow
    type: string
    sql: ${TABLE}.payments_flow

  - dimension: principal_government_number
    type: string
    sql: ${TABLE}.principal_government_number

  - dimension: principal_name
    type: string
    sql: ${TABLE}.principal_name

  - dimension: transaction_time
    type: string
    sql: ${TABLE}.transaction_time

  - dimension: unique_users
    type: string
    sql: ${TABLE}.unique_users

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - bank_name
    - principal_name
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.alt_marketplace_id
    - marketplaces.count

