- explore: goodguys_airtasker_disbursements_base
  extension: required

- explore: legal_entities_base
  extension: required
  joins:
    - join: users
      type: left_outer
      sql_on: ${legal_entities.principal_id} = ${users.id}
      relationship: many_to_one
      
    - join: accounts
      type: left_outer
      sql_on: ${legal_entities.id} = ${accounts.legal_entity_id}
      relationship: one_to_many
      
    - join: marketplaces
      type: left_outer
      sql_on: ${users.marketplace_id} = ${marketplaces.id}
      relationship: many_to_one
      
    - join: milestones
      type: left_outer 
      sql_on: ${accounts.legal_entity_id} = ${milestones.contractor_legal_entity_id}
      relationship: many_to_one

- explore: marketplaces_base
  extension: required
  joins:
    - join: legal_entities
      type: inner
      sql_on: ${marketplaces.legal_entity_id} = ${legal_entities.id}
      relationship: one_to_one
  
    - join: users
      type: left_outer
      sql_on: ${legal_entities.principal_id} = ${users.id}
      relationship: many_to_one
      
    - join: milestones
      type: left_outer
      sql_on: ${marketplaces.id} = ${milestones.marketplace_id}
      relationship: one_to_many
      
    - join: accounts
      type: left_outer
      sql_on: ${milestones.contractor_legal_entity_id} = ${accounts.legal_entity_id}
      relationship: one_to_many
      
    - join: currencies
      type: left_outer
      sql_on: ${accounts.currency_id} = ${currencies.id}
      relationship: many_to_one      
      
    - join: transaction_entries
      type: left_outer
      sql_on: ${accounts.id} = ${transaction_entries.account_id}
      relationship: many_to_one
      
- explore: users_base
  extension: required
  joins:
    - join: legal_entities
      type: left_outer
      sql_on: ${users.id} = ${legal_entities.principal_id}
      relationship: one_to_many
    
- explore: agreements_base
  extension: required
  
- explore: transaction_pendings_base
  extension: required
  joins:
    - join: accounts_from
      from: accounts
      type: inner
      sql_on: ${transaction_pendings.account_from_id} = ${accounts_from.id}
      relationship: many_to_one
      
    - join: accounts_to
      from: accounts
      type: inner
      sql_on: ${transaction_pendings.account_to_id} = ${accounts_to.id}
      relationship: many_to_one
      
    - join: transaction_entries
      type: left_outer
      relationship: many_to_many
      sql_on: ${transaction_entries.transaction_pending_id} = ${transaction_pendings.id} 
 
    - join: transaction_entries_relationship
      from: transaction_entries
      relationship: many_to_many
      sql_on: ${transaction_entries.id} = ${transaction_entries_relationship.related_transaction_id}
      
    - join: legal_entities
      type: left_outer
      sql_on: ${accounts_from.legal_entity_id} = ${legal_entities.id}
      relationship: many_to_one
    
    - join: marketplaces
      sql_on: ${legal_entities.id} = ${marketplaces.legal_entity_id}
      relationship: one_to_one

    - join: currencies
      type: left_outer
      sql_on: ${transaction_entries.currency_id} = ${currencies.id}
      relationship: one_to_one

    - join: milestones_to
      from: milestones
      type: left_outer
      sql_on: ${accounts_to.milestone_id} = ${milestones_to.id}
      relationship: many_to_many

    - join: milestones_from
      from: milestones
      type: left_outer
      sql_on: ${accounts_from.milestone_id} = ${milestones_from.id}
      relationship: many_to_many

- explore: monthly_fee_report_base
  extension: required
  joins:
    - join: from_accounts
      from: accounts
      sql_on: ${monthly_fee_report.account_from_id} = ${from_accounts.id}
      relationship: many_to_one

#     - join: account_lookup
#       type: inner
#       view_label: "Transaction Pendings"
#       sql_on: ${account_lookup.account_id} = ${transaction_pendings.account_to_id}     
#       relationship: many_to_one
#       fields: []
      
    - join: to_accounts
      from: accounts
      sql_on: ${monthly_fee_report.account_to_id} = ${to_accounts.id}
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
      
    
- explore: milestones_base
  extension: required
  joins:
    - join: contractor_legal_entities
      from: legal_entities
      type: left_outer
      sql_on: ${contractor_legal_entities.id} = ${milestones.contractor_legal_entity_id}
      relationship: many_to_one

    - join: accounts
      type: left_outer
      sql_on: ${contractor_legal_entities.id} = ${accounts.legal_entity_id}
      relationship: one_to_many

    - join: milestones_balance
      type: inner
      view_label: "Milestones"
      sql_on: ${milestones_balance.milestone_id} = ${milestones.id}
      relationship: one_to_one

    - join: client_legal_entities
      from: legal_entities
      type: left_outer
      sql_on: ${client_legal_entities.id} = ${milestones.client_legal_entity_id}
      relationship: many_to_one   
      
    - join: marketplaces
      type: left_outer
      sql_on: ${marketplaces.id} = ${milestones.marketplace_id}
      relationship: one_to_many

    - join: contractor_user
      from: users
      type: left_outer
      sql_on: ${contractor_legal_entities.principal_id} = ${contractor_user.id}
      relationship: many_to_one
      
    - join: client_user
      from: users
      type: left_outer
      sql_on: ${client_legal_entities.principal_id} = ${client_user.id}
      relationship: many_to_one

- explore: transaction_entries_base
  from: transaction_entries
  view: transaction_entries
  extension: required
#  access_filter_fields: [transaction_entries.marketplace_id]
  joins:
    - join: transaction_entries_relationship
      from: transaction_entries
      relationship: one_to_one
      sql_on: ${transaction_entries.id} = ${transaction_entries_relationship.related_transaction_id}
      
    - join: transaction_pendings
      sql_on: ${accounts.id} = ${transaction_pendings.account_to_id}
      relationship: one_to_many
      
    - join: accounts
      type: left_outer
      sql_on: ${transaction_entries.account_id} = ${accounts.id}
      relationship: many_to_one
      
    - join: milestones
      type: left_outer 
      sql_on: ${accounts.milestone_id} = ${milestones.id}
      relationship: many_to_one
      
    - join: related_accounts
      from: accounts
      type: left_outer
      sql_on: ${transaction_entries_relationship.account_id} = ${related_accounts.id}
      relationship: many_to_one
      
    - join: related_marketplaces
      from: marketplaces
      sql_on: ${transaction_entries_relationship.legal_entity_id} = ${related_marketplaces.legal_entity_id}
      relationship: one_to_one
      
    - join: legal_entities
      type: left_outer
      sql_on: ${accounts.legal_entity_id} = ${legal_entities.id}
      relationship: many_to_one
    
    - join: marketplaces
      sql_on: ${transaction_entries.legal_entity_id} = ${marketplaces.legal_entity_id}
      relationship: one_to_one

    - join: currencies
      type: left_outer
      sql_on: ${transaction_entries.currency_id} = ${currencies.id}
      relationship: one_to_one

- explore: security_checks_base
  extension: required
  joins: 
    - join: legal_entities
      type: left_outer
      sql_on: ${legal_entities.uuid} = ${security_checks.external_id}
      relationship: many_to_many
      
    - join: users
      type: left_outer
      sql_on: ${legal_entities.principal_id} = ${users.id}
      relationship: many_to_one
      
    - join: companies
      type: left_outer
      sql_on: ${legal_entities.company_id} = ${companies.id}
      relationship: many_to_one
      
    - join: accounts
      type: left_outer
      sql_on: ${legal_entities.id} = ${accounts.legal_entity_id}
      relationship: one_to_many
      
    - join: marketplaces
      type: left_outer
      sql_on: ${users.marketplace_id} = ${marketplaces.id}
      relationship: many_to_one
      
- explore: accounts_base
  extension: required
  joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${accounts.user_id} = ${users.id}
#       relationship: many_to_one

    - join: legal_entities
      type: left_outer 
      sql_on: ${accounts.legal_entity_id} = ${legal_entities.id}
      relationship: many_to_one
      
    - join: contractor_legal_entities
      from: legal_entities
      type: left_outer
      sql_on: ${contractor_legal_entities.id} = ${milestones.contractor_legal_entity_id}
      relationship: many_to_one

    - join: client_legal_entities
      from: legal_entities
      type: left_outer
      sql_on: ${client_legal_entities.id} = ${milestones.client_legal_entity_id}
      relationship: many_to_one 
   
#    - join: to_account_milestones
#       view_label: "Milestones (to acct)"
#       from: milestones
#       sql_on: ${to_accounts.milestone_id} = ${to_account_milestones.id}
#       relationship: one_to_many
      
    - join: milestones
      type: left_outer 
      sql_on: ${accounts.milestone_id} = ${milestones.id}
      relationship: many_to_one

    - join: account_types
      type: left_outer 
      sql_on: ${accounts.account_type_id} = ${account_types.id}
      relationship: many_to_one

    - join: users
      type: left_outer
      sql_on: ${legal_entities.principal_id} = ${users.id}
      relationship: many_to_one   

    - join: marketplaces
      type: left_outer 
      sql_on: ${milestones.marketplace_id} = ${marketplaces.id}
      relationship: many_to_one

    - join: payment_types
      type: left_outer 
      sql_on: ${milestones.payment_type_id} = ${payment_types.id}
      relationship: many_to_one
      
    - join: currencies
      type: left_outer
      sql_on: ${accounts.currency_id} = ${currencies.id}
      relationship: many_to_one
      
    - join: transaction_entries
      type: left_outer
      sql_on: ${accounts.id} = ${transaction_entries.account_id}
      relationship: many_to_one

    - join: transaction_pendings
      type: left_outer
      sql_on: ${accounts.id} = ${transaction_pendings.account_to_id}
      relationship: many_to_one