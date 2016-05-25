- view: transaction_checks
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: action
    type: string
    sql: ${TABLE}.action

  - dimension_group: actioned
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.actioned_at

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: data
    type: string
    sql: ${TABLE}.data

  - dimension: external_milestone_id
    type: string
    sql: ${TABLE}.external_milestone_id

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: milestone_id
    type: number
    # hidden: true
    sql: ${TABLE}.milestone_id

  - dimension: purchasing_account_id
    type: number
    sql: ${TABLE}.purchasing_account_id

  - dimension: purchasing_entity_id
    type: number
    sql: ${TABLE}.purchasing_entity_id

  - dimension: redreqid
    type: string
    sql: ${TABLE}.redreqid

  - dimension: result
    type: string
    sql: ${TABLE}.result

  - dimension: spreedlytoken
    type: string
    sql: ${TABLE}.spreedlytoken

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: user_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.alt_marketplace_id
    - milestones.id
    - milestones.name
    - users.id
    - users.lastname
    - users.firstname
    - transaction_check_responses.count

