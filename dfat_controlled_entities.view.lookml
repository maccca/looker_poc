- view: dfat_controlled_entities
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: additional_information
    type: string
    sql: ${TABLE}.additional_information

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: citizenship
    type: string
    sql: ${TABLE}.citizenship

  - dimension: committees
    type: string
    sql: ${TABLE}.committees

  - dimension_group: control
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.control_date

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: date_of_birth
    type: string
    sql: ${TABLE}.date_of_birth

  - dimension_group: dfat_published
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.dfat_published_date

  - dimension: dfat_type
    type: string
    sql: ${TABLE}.dfat_type

  - dimension: listing_information
    type: string
    sql: ${TABLE}.listing_information

  - dimension: name_of_individual_or_entity
    type: string
    sql: ${TABLE}.name_of_individual_or_entity

  - dimension: name_type
    type: string
    sql: ${TABLE}.name_type

  - dimension: place_of_birth
    type: string
    sql: ${TABLE}.place_of_birth

  - dimension: reference
    type: string
    sql: ${TABLE}.reference

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id]

