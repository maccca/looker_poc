- view: token_auth_types
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: code
    type: string
    sql: ${TABLE}.code

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name, token_auths.count]

