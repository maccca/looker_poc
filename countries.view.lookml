- view: countries
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: currency_id
    type: number
    sql: ${TABLE}.currency_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: three_code
    type: string
    sql: ${TABLE}.three_code

  - dimension: two_code
    type: string
    sql: ${TABLE}.two_code

  - measure: count
    type: count
    drill_fields: [id, name]

