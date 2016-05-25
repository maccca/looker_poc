- view: ofac_sdn_controlled_entities
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: address_list
    type: string
    sql: ${TABLE}.address_list

  - dimension: aka_list
    type: string
    sql: ${TABLE}.aka_list

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension_group: published
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.published_date

  - dimension: sdn_entry
    type: string
    sql: ${TABLE}.sdn_entry

  - dimension: sdn_type
    type: string
    sql: ${TABLE}.sdn_type

  - dimension: uid
    type: string
    sql: ${TABLE}.uid

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, first_name, last_name]

