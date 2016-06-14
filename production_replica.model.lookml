- connection: production-replica

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards
- include: "base.lookml"

- explore: transaction_entries
  extends: transaction_entries_base
  
- explore: milestones
  extends: milestones_base
  
- explore: accounts
  extends: accounts_base
  
- explore: transaction_pendings
  extends: transaction_pendings_base
  
- explore: legal_entities
  extends: legal_entities_base
  
- explore: marketplaces
  extends: marketplaces_base
  
- explore: users
  extends: users_base
  
- explore: agreements
  extends: agreements_base
  
- explore: security_checks
  extends: security_checks_base
  
- explore: transaction_entries_and_related
  extends: transaction_entries_and_related_base
  
- explore: monthly_fee_report
  joins:
    - join: from_accounts
      from: accounts
      sql_on: ${monthly_fee_report.account_from_id} = ${from_accounts.id}
      relationship: many_to_one
      fields: []
      
    - join: to_accounts
      from: accounts
      sql_on: ${monthly_fee_report.account_from_id} = ${to_accounts.id}
      relationship: many_to_one
      fields: []
      
    - join: from_account_milestones
      view_label: "Milestones (from acct)"
      from: milestones
      sql_on: ${from_accounts.milestone_id} = ${from_account_milestones.id}
      relationship: one_to_many
      
    - join: to_account_milestones
      view_label: "Milestones (to acct)"
      from: milestones
      sql_on: ${to_accounts.milestone_id} = ${to_account_milestones.id}
      relationship: one_to_many
      
    

      
  