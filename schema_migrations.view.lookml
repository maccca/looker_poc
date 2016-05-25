- view: schema_migrations
  fields:

  - dimension: version
    type: string
    sql: ${TABLE}.version

  - measure: count
    type: count
    drill_fields: []

