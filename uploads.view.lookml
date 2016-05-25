- view: uploads
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: error_lines
    type: number
    sql: ${TABLE}.error_lines

  - dimension: import_errors
    type: string
    sql: ${TABLE}.import_errors

  - dimension: import_file_content_type
    type: string
    sql: ${TABLE}.import_file_content_type

  - dimension: import_file_file_name
    type: string
    sql: ${TABLE}.import_file_file_name

  - dimension: import_file_file_size
    type: number
    sql: ${TABLE}.import_file_file_size

  - dimension_group: import_file_updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.import_file_updated_at

  - dimension: marketplace_id
    type: number
    # hidden: true
    sql: ${TABLE}.marketplace_id

  - dimension: new_lines
    type: number
    sql: ${TABLE}.new_lines

  - dimension: processed_lines
    type: number
    sql: ${TABLE}.processed_lines

  - dimension: total_lines
    type: number
    sql: ${TABLE}.total_lines

  - dimension: update_lines
    type: number
    sql: ${TABLE}.update_lines

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
    - import_file_file_name
    - users.id
    - users.lastname
    - users.firstname
    - marketplaces.name
    - marketplaces.short_name
    - marketplaces.alt_marketplace_id

