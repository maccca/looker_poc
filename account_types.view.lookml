- view: account_types
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: active
    type: yesno
    sql: ${TABLE}.active

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name, accounts.count]

