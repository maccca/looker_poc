
- view: goodguys_airtasker_disbursements
  derived_table:
    sql: |
      WITH monthly_fee_report AS (SELECT 
      te1.account_id as account_from_id,
      te2.account_id as account_to_id,
      te2.amount as amount
      FROM transaction_entries te1
      LEFT JOIN transaction_entries te2
      ON te1.related_transaction_id = te2.id
      WHERE te1.account_id IN (
        SELECT transaction_pendings.account_from_id FROM
          (SELECT accounts.id as account_id
          FROM accounts WHERE accounts.legal_entity_id = 35714) al
        INNER JOIN transaction_pendings ON al.account_id = transaction_pendings.account_to_id
        WHERE state IN (12000, 12200))
      )
      SELECT 
        transaction_entries.updated_at AS "updated_at",
        transaction_entries.amount AS "amount",
        to_account_milestones.description AS "description",
        to_account_milestones.external_id AS "item_id"
      FROM monthly_fee_report
      LEFT JOIN accounts AS from_accounts ON monthly_fee_report.account_from_id = from_accounts.id
      LEFT JOIN accounts AS to_accounts ON monthly_fee_report.account_to_id = to_accounts.id
      LEFT JOIN milestones AS from_account_milestones ON from_accounts.milestone_id = from_account_milestones.id
      LEFT JOIN milestones AS to_account_milestones ON to_accounts.milestone_id = to_account_milestones.id
      LEFT JOIN transaction_entries AS transaction_entries ON to_accounts.id = transaction_entries.account_id
      
      WHERE (to_account_milestones.client_id = 35367) AND (to_account_milestones.state = 22500) AND (transaction_entries.amount >= 0)
      GROUP BY 1,2,3,4
      ORDER BY 1 ASC

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension_group: updated_at
    type: time
    sql: ${TABLE}.updated_at

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: item_id
    type: string
    sql: ${TABLE}.item_id

  sets:
    detail:
      - updated_at_time
      - amount
      - description
      - item_id

