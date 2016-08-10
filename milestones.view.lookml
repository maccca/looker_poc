- view: milestones
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id
    
  - dimension: days_in_month
    type: number
    hidden: false
    sql: |
      DATE_PART('days', 
        DATE_TRUNC('month', NOW()) 
        + '1 MONTH'::INTERVAL 
        - '1 DAY'::INTERVAL
      ) * 86400
  
  - dimension: current_day_index
    type: number
    hidden: false
    sql: | 
      (extract(days from NOW())*86400
      + extract(hours from NOW())*3600 
      + extract(minutes from NOW())*60 
      + extract(seconds from NOW()) )

  - dimension: agreement_id
    type: number
    # hidden: false
    sql: ${TABLE}.agreement_id

  - dimension: buyer_email
    type: string
    sql: ${TABLE}.buyer_email

  - dimension: buyer_url
    type: string
    sql: ${TABLE}.buyer_url

  - dimension: client_id
    type: number
    sql: ${TABLE}.client_id

  - dimension: client_legal_entity_id
    type: number
    sql: ${TABLE}.client_legal_entity_id

  - dimension: contractor_id
    type: number
    sql: ${TABLE}.contractor_id

  - dimension: contractor_legal_entity_id
    type: number
    sql: ${TABLE}.contractor_legal_entity_id

  - dimension: cost
    type: number
    sql: |
      CASE WHEN ${TABLE}.cost > 100000000 THEN 100000000 ELSE ${TABLE}.cost END

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month, day_of_month]
    sql: ${TABLE}.created_at

  - dimension: deposit_reference
    type: string
    sql: ${TABLE}.deposit_reference

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: dispute_user_id
    type: number
    sql: ${TABLE}.dispute_user_id

  - dimension_group: due
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.due_date

  - dimension: external_id
    type: string
    sql: ${TABLE}.external_id

  - dimension: hold_for
    type: number
    sql: ${TABLE}.hold_for

  - dimension: ignore_email_reminders
    type: yesno
    sql: ${TABLE}.ignore_email_reminders

  - dimension: ignore_sms_reminders
    type: yesno
    sql: ${TABLE}.ignore_sms_reminders

  - dimension: marketplace_id
    type: number
    # hidden: false
    sql: ${TABLE}.marketplace_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: payment_type_id
    type: number
    # hidden: false
    sql: ${TABLE}.payment_type_id

  - dimension: previous_state_id
    type: number
    sql: ${TABLE}.previous_state_id

  - dimension: release_flag
    type: yesno
    sql: ${TABLE}.release_flag

  - dimension: seller_color_1
    type: string
    sql: ${TABLE}.seller_color_1

  - dimension: seller_color_2
    type: string
    sql: ${TABLE}.seller_color_2

  - dimension: seller_email
    type: string
    sql: ${TABLE}.seller_email

  - dimension: seller_logo_url
    type: string
    sql: ${TABLE}.seller_logo_url

  - dimension: seller_url
    type: string
    sql: ${TABLE}.seller_url

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension: tax_invoice
    type: yesno
    sql: ${TABLE}.tax_invoice

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: uuid
    type: string
    sql: ${TABLE}.uuid
    links:
    - label: Ops Center
      url: https://ops.promisepay.com/milestones/{{ value }}
      icon_url: http://downoruprightnow.com/favicon/promisepay.com.jpg
    html: |
      <a href="https://ops.promisepay.com/milestones/{{ value }}">{{ value }}</a>

  - measure: count
    type: count
    drill_fields: summary_detail*
    
  - measure: total_cost
    type: sum
    sql: ${cost} / 100
    value_format: '$#,##0.00'

  - measure: latest_created_date
    type: string
    sql: MAX(${created_date})
    
  - measure: percent_through_month
    type: number
    hidden: false
    sql: ${max_current_day}/${max_days_in_month}
    
  - measure: max_current_day
    type: max
    hidden: false
    sql: ${current_day_index}
    
  - measure: max_days_in_month
    type: max
    hidden: false
    sql: ${days_in_month}

#   - measure: latest_description
#     value: ${description}
#     type: string
#     sql: MAX(${created_date})

  # ----- Sets of fields for drilling ------
  sets:
    summary_detail:
    - created_time
    - id
    - name
    - description
    - cost
  
    detail:
    - id
    - name
    - cost
    - agreements.id
    - agreements.name
    - payment_types.name
    - payment_types.id
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.id
    - accounts.count
    - disputes.count
    - feature_configurations.count
    - fees.count
    - payment_restrictions.count
    - paypal_payment_responses.count
    - paypal_payments.count
    - refunds.count
    - schedules.count
    - sessions.count
    - transaction_checks.count

