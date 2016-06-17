- view: milestones_balance
  derived_table:
    sql: |
      SELECT milestones.id as milestone_id, accounts.amount as milestone_balance
      FROM milestones
      LEFT JOIN accounts
      ON milestones.id = accounts.milestone_id
      WHERE accounts.amount > 0
      
  fields:
  - dimension: milestone_balance
    type: number
    hidden: false
    sql: ${TABLE}.milestone_balance

  - dimension: milestone_id
    type: number
    hidden: true
    sql: ${TABLE}.milestone_id
