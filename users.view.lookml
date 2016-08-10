- view: users
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: color_1
    type: string
    sql: ${TABLE}.color_1

  - dimension: color_2
    type: string
    sql: ${TABLE}.color_2

  - dimension_group: confirmation_sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.confirmation_sent_at

  - dimension: confirmation_token
    type: string
    sql: ${TABLE}.confirmation_token

  - dimension_group: confirmed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.confirmed_at

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: current_sign_in
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.current_sign_in_at

  - dimension: current_sign_in_ip
    type: string
    sql: ${TABLE}.current_sign_in_ip

  - dimension: dob
    type: string
    sql: ${TABLE}.dob

  - dimension: drivers_license_number
    type: string
    sql: ${TABLE}.drivers_license_number

  - dimension: drivers_license_state
    type: string
    sql: ${TABLE}.drivers_license_state

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: encrypted_password
    type: string
    sql: ${TABLE}.encrypted_password

  - dimension: failed_attempts
    type: number
    sql: ${TABLE}.failed_attempts

  - dimension: firstname
    type: string
    sql: ${TABLE}.firstname

  - dimension: flags
    type: string
    sql: ${TABLE}.flags

  - dimension: government_number
    type: string
    sql: ${TABLE}.government_number

  - dimension_group: last_sign_in
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_sign_in_at

  - dimension: last_sign_in_ip
    type: string
    sql: ${TABLE}.last_sign_in_ip

  - dimension: lastname
    type: string
    sql: ${TABLE}.lastname

  - dimension_group: locked
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.locked_at

  - dimension: logo_url
    type: string
    sql: ${TABLE}.logo_url

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: mobile
    type: string
    sql: ${TABLE}.mobile

  - dimension: mobile_pin
    type: string
    sql: ${TABLE}.mobile_pin

  - dimension: mobile_pin_override
    type: string
    sql: ${TABLE}.mobile_pin_override

  - dimension: mobile_verified
    type: yesno
    sql: ${TABLE}.mobile_verified

  - dimension: phone
    type: string
    sql: ${TABLE}.phone

  - dimension_group: remember_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.remember_created_at

  - dimension_group: reset_password_sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reset_password_sent_at

  - dimension: reset_password_token
    type: string
    sql: ${TABLE}.reset_password_token

  - dimension: sign_in_count
    type: number
    sql: ${TABLE}.sign_in_count

  - dimension: state
    type: number
    sql: ${TABLE}.state

  - dimension: time_zone
    type: string
    sql: ${TABLE}.time_zone

  - dimension: unconfirmed_email
    type: string
    sql: ${TABLE}.unconfirmed_email

  - dimension: unlock_token
    type: string
    sql: ${TABLE}.unlock_token

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
    drill_fields: summary_detail*


  # ----- Sets of fields for drilling ------
  sets:
    summary_detail:
    - created_time
    - firstname
    - lastname
    - email
    
    detail:
    - id
    - lastname
    - firstname
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.alt_marketplace_id
    - accounts.count
    - addresses.count
    - companies.count
    - disputes.count
    - events.count
    - refunds.count
    - transaction_checks.count
    - transaction_entries.count
    - transaction_invitations.count
    - transaction_pendings.count
    - uploads.count
    - user_auths.count

