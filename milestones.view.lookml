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
    
  - dimension: invoice_url
    type: string
    # hidden: false
    sql: ${TABLE}.invoice_url

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
    
  - dimension: state_name
    label: 'Status'
    type: string
    sql: CASE 
          WHEN ${state} = 22000 THEN 'Pending'
          WHEN ${state} = 22100 THEN 'Payment Requested'
          WHEN ${state} = 22110 THEN 'Wire/BPAY Transfer Pending'
          WHEN ${state} = 22111 THEN 'PayPal Pending'
          WHEN ${state} = 22150 THEN 'Direct Debit Transfer Pending'
          WHEN ${state} = 22175 THEN 'Credit Card Payment Held'
          WHEN ${state} = 22180 THEN 'Payment Authorized'
          WHEN ${state} = 22190 THEN 'Payment Denied'
          WHEN ${state} = 22195 THEN 'Payment Voided'
          WHEN ${state} = 22200 THEN 'Payment Deposited'
          WHEN ${state} = 22300 THEN 'Release Requested'
          WHEN ${state} = 22400 THEN 'Dispute Raised'
          WHEN ${state} = 22410 THEN 'Dispute Resolution Requested'
          WHEN ${state} = 22420 THEN 'Dispute Escalated'
          WHEN ${state} = 22500 THEN 'Payment Released'
          WHEN ${state} = 22575 THEN 'Cancelled'
          WHEN ${state} = 22600 THEN 'Refunded'
          WHEN ${state} = 22610 THEN 'Refund Pending'
          WHEN ${state} = 22650 THEN 'Refund Flagged'
          WHEN ${state} = 22670 THEN 'Off Platform Refunded'
          WHEN ${state} = 22700 THEN 'Partial Release Requested'
          WHEN ${state} = 22800 THEN 'Partial Payment Released'
          WHEN ${state} = 22680 THEN 'Chargeback'
          ELSE 'No Status'
        END
           
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
    
  - dimension: bpay_crn
    label: 'BPAY CRN'
    type: string
    sql: CASE WHEN ${marketplace_id} = '120' THEN ${id} + 10001401200000
               ELSE ${id} + 914012000
         END     
    
  - measure: total_cost
    type: sum
    sql: ${cost} / 100
    value_format: '$#,##0.00'
    drill_fields: summary_detail*

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

