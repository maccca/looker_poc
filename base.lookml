- explore: goodguys_airtasker_disbursements_base
  extension: required

- explore: legal_entities_base
  access_filter_fields: [marketplaces.id]
  view_label: ''
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
      view_label: 'Items'
      type: left_outer 
      sql_on: ${accounts.legal_entity_id} = ${milestones.contractor_legal_entity_id}
      relationship: many_to_one

    - join: countries
      view_label: 'Countries'
      type: left_outer 
      sql_on: ${legal_entities.country_id} = ${countries.id}
      relationship: many_to_one

    - join: currencies
      view_label: 'Currency'
      type: left_outer
      sql_on: ${legal_entities.currency_id} = ${currencies.id}
      relationship: many_to_one

- explore: marketplaces_base
  access_filter_fields: [marketplaces.id]
  view_label: ''
  extension: required
  joins:
    - join: legal_entities
      view_label: 'Users'
      type: inner
      sql_on: ${marketplaces.legal_entity_id} = ${legal_entities.id}
      relationship: one_to_one
  
    - join: users
      type: left_outer
      sql_on: ${legal_entities.principal_id} = ${users.id}
      relationship: many_to_one
      
    - join: milestones
      view_label: 'Items'
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
      view_label: ''
      type: left_outer
      sql_on: ${accounts.id} = ${transaction_entries.account_id}
      relationship: many_to_one
      
    - join: fee_lists
      type: left_outer
      sql_on: ${marketplaces.id} = ${fee_lists.marketplace_id}
      relationship: many_to_one  
      
- explore: users_base
  access_filter_fields: [marketplaces.id]
  extension: required
  view_label: ''
  joins:
    - join: legal_entities
      view_label: 'Users'
      type: left_outer
      sql_on: ${users.id} = ${legal_entities.principal_id}
      relationship: one_to_many
      
    - join: marketplaces
      view_label: 'Marketplaces'
      type: left_outer
      sql_on: ${users.marketplace_id} = ${marketplaces.id}
      relationship: many_to_one
      
    - join: user_auths
      view_label: 'User Auths'
      from: user_auths
      type: left_outer
      sql_on: ${users.id} = ${user_auths.user_id}
      relationship: one_to_one
    
- explore: agreements_base
  access_filter_fields: [marketplaces.id]
  extension: required
  joins:
    - join: marketplaces
      view_label: 'Marketplaces'
      type: left_outer
      sql_on: ${agreements.marketplace_id} = ${marketplaces.id}
      relationship: many_to_one
  
- explore: transaction_pendings_base
  access_filter_fields: [marketplaces.id]
  extension: required
  view_label: ''
  joins:
    - join: accounts_from
      view_label: 'Accounts From'
      from: accounts
      type: inner
      sql_on: ${transaction_pendings.account_from_id} = ${accounts_from.id}
      relationship: many_to_one
      
    - join: accounts_to
      view_label: 'Accounts To'
      from: accounts
      type: inner
      sql_on: ${transaction_pendings.account_to_id} = ${accounts_to.id}
      relationship: many_to_one
      
    - join: transaction_entries
      view_label: 'Transaction Entries'
      type: left_outer
      relationship: many_to_many
      sql_on: ${transaction_entries.transaction_pending_id} = ${transaction_pendings.id} 
      
    - join: transaction_pendings_relationship
      view_label: 'Bundle Transaction Pendings'
      from: transaction_pendings
      type: left_outer
      relationship: many_to_many
      sql_on: ${transaction_pendings.bundle_transaction_pending_id} = ${transaction_pendings.id} 
 
    - join: transaction_entries_relationship
      view_label: 'Transaction Entries Related'
      from: transaction_entries
      relationship: many_to_many
      sql_on: ${transaction_entries.id} = ${transaction_entries_relationship.related_transaction_id}
      
    - join: legal_entities
      view_label: 'Legal Entities From'
      type: left_outer
      sql_on: ${accounts_from.legal_entity_id} = ${legal_entities.id}
      relationship: many_to_one
      
    - join: users
      view_label: 'Users From'
      type: left_outer
      sql_on: ${users.id} = ${legal_entities.principal_id}
      relationship: many_to_one
      
    - join: user_auths
      view_label: 'User Auths From'
      type: left_outer
      sql_on: ${user_auths.user_id} = ${users.id}
      relationship: many_to_one
    
    - join: marketplaces
      view_label: 'Marketplaces'
      sql_on: ${transaction_pendings.marketplace_id} = ${marketplaces.id}
      relationship: one_to_one

    - join: currencies
      view_label: 'Currencies'
      type: left_outer
      sql_on: ${accounts_from.currency_id} = ${currencies.id}
      relationship: one_to_one

    - join: milestones_to
      view_label: 'Items To'
      from: milestones
      type: left_outer
      sql_on: ${accounts_to.milestone_id} = ${milestones_to.id}
      relationship: many_to_many

#     - join: milestones_from
#       view_label: 'Items From'
#       from: milestones
#       type: left_outer
#       sql_on: ${accounts_from.milestone_id} = ${milestones_from.id}
#       relationship: many_to_many
    
    - join: milestone_account
      view_label: 'Items Account'
      from: accounts
      type: left_outer
      sql_on: ${transaction_entries.account_id} = ${milestone_account.id}
      relationship: many_to_many
    
    - join: milestones_from
      view_label: 'Items From'
      from: milestones
      type: left_outer
      sql_on: ${milestone_account.milestone_id} = ${milestones_from.id}
      relationship: many_to_many

# LEFT JOIN accounts AS milestone_account ON transaction_entries.account_id = milestone_account.id
# LEFT JOIN milestones AS milestones_from ON milestone_account.milestone_id = milestones_from.id
    
    - join: milestones_reference
      view_label: 'Reference Item'
      from: milestones
      type: left_outer
      sql_on: ${transaction_pendings.reference_milestone_id} = ${milestones_reference.id}
      relationship: one_to_one
      
    - join: transaction_references
      view_label: 'Transaction References'
      from: transaction_references
      type: left_outer
      sql_on: ${transaction_pendings.id} = ${transaction_references.transaction_pending_id}
      relationship: many_to_one
      
    - join: transaction_references_to
      view_label: 'Transaction References To'
      from: transaction_references
      type: left_outer
      sql_on: ${accounts_to.id} = ${transaction_references_to.account_id}
      relationship: many_to_one
      
    - join: transaction_references_from
      view_label: 'Transaction References From'
      from: transaction_references
      type: left_outer
      sql_on: ${accounts_from.id} = ${transaction_references_from.account_id}
      relationship: many_to_one
      
- explore: monthly_fee_report_base
  access_filter_fields: [marketplaces.id]
  extension: required
  joins:
    - join: marketplaces
      view_label: 'Marketplaces'
      type: left_outer
      sql_on: ${monthly_fee_report.marketplace_id} = ${marketplaces.id}
      relationship: many_to_one
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
      view_label: "Items (from acct)"
      from: milestones
      sql_on: ${from_accounts.milestone_id} = ${from_account_milestones.id}
      relationship: one_to_many
      
    - join: to_account_milestones
      view_label: "Items (to acct)"
      from: milestones
      sql_on: ${to_accounts.milestone_id} = ${to_account_milestones.id}
      relationship: one_to_many
      
    
- explore: milestones_base
  access_filter_fields: [marketplaces.id]
  extension: required
  view_label: ''
  joins:
    - join: contractor_legal_entities
      view_label: 'Users (Merchant)'
      from: legal_entities
      type: left_outer
      sql_on: ${contractor_legal_entities.id} = ${milestones.contractor_legal_entity_id}
      relationship: many_to_one
      
    - join: addresses
      view_label: 'Addresses (Merchant)'
      from: addresses
      type: left_outer
      sql_on: ${addresses.user_id} = ${milestones.contractor_id}
      relationship: one_to_many

    - join: accounts
      type: left_outer
      sql_on: ${contractor_legal_entities.id} = ${accounts.legal_entity_id}
      relationship: one_to_many
      
    - join: milestone_account
      view_label: 'Milestone Account'
      from: accounts
      type: left_outer
      sql_on: ${milestones.id} = ${milestone_account.milestone_id}
      relationship: one_to_one

    - join: milestones_balance
      type: inner
      view_label: "Items"
      sql_on: ${milestones_balance.milestone_id} = ${milestones.id}
      relationship: one_to_one

    - join: client_legal_entities
      view_label: 'Users (Purchaser)'
      from: legal_entities
      type: left_outer
      sql_on: ${client_legal_entities.id} = ${milestones.client_legal_entity_id}
      relationship: many_to_one   
      
    - join: marketplaces
      type: left_outer
      sql_on: ${marketplaces.id} = ${milestones.marketplace_id}
      relationship: one_to_many

    - join: contractor_user
      view_label: 'Users (Merchant)'
      from: users
      type: left_outer
      sql_on: ${contractor_legal_entities.principal_id} = ${contractor_user.id}
      relationship: many_to_one
      
    - join: client_user
      view_label: 'Users (Purchaser)'
      from: users
      type: left_outer
      sql_on: ${client_legal_entities.principal_id} = ${client_user.id}
      relationship: many_to_one
      
    - join: transaction_references
      view_label: 'References'
      from: transaction_references
      type: left_outer
      sql_on: ${milestone_account.id} = ${transaction_references.account_id}
      relationship: one_to_one  
      
    - join: item_transactions
      view_label: 'Transaction Entries'
      from: transaction_entries
      type: left_outer
      sql_on: ${milestone_account.id} = ${item_transactions.account_id}
      relationship: one_to_many
      
    - join: item_related_transactions
      view_label: 'Transaction Entries'
      from: transaction_entries
      type: left_outer
      sql_on: ${item_related_transactions.id} = ${item_transactions.related_transaction_id} AND ${item_related_transactions.amount} < 0 
      relationship: one_to_many  
      
    - join: payment_account
      view_label: 'Payment Account'
      from: accounts
      type: inner
      sql_on: ${payment_account.id} = ${item_related_transactions.account_id}
      relationship: one_to_one
    
    - join: currencies
      type: left_outer
      sql_on: ${accounts.currency_id} = ${currencies.id}
      relationship: many_to_one

- explore: transaction_entries_base
  access_filter_fields: [marketplaces.id]
  from: transaction_entries
  view: transaction_entries
  view_label: ''
  extension: required
#  access_filter_fields: [transaction_entries.marketplace_id]
  joins:
    - join: account_types
      type: left_outer 
      sql_on: ${accounts.account_type_id} = ${account_types.id}
      relationship: many_to_one
  
    - join: transaction_entries_relationship
      view_label: ''
      from: transaction_entries
      relationship: one_to_one
      sql_on: ${transaction_entries.id} = ${transaction_entries_relationship.related_transaction_id}
      
    - join: transaction_pendings
      view_label: ''
      sql_on: ${accounts.id} = ${transaction_pendings.account_to_id}
      relationship: one_to_many
      
    - join: payouts
      from: transaction_pendings
      view_label: 'Batch Transactions'
      sql_on: ${transaction_entries.transaction_pending_id} = ${transaction_pendings.id}
      relationship: one_to_many
      
    - join: accounts
      type: left_outer
      sql_on: ${transaction_entries.account_id} = ${accounts.id}
      relationship: many_to_one
      
    - join: milestones
      view_label: 'Items'
      type: left_outer 
      sql_on: ${accounts.milestone_id} = ${milestones.id}
      relationship: many_to_one
      
    - join: related_accounts
      view_label: 'Related Accounts'
      from: accounts
      type: left_outer
      sql_on: ${transaction_entries_relationship.account_id} = ${related_accounts.id}
      relationship: many_to_one
      
    - join: related_marketplaces
      view_label: 'Related Marketplaces'
      from: marketplaces
      sql_on: ${transaction_entries_relationship.marketplace_id} = ${related_marketplaces.id}
      relationship: one_to_one
      
    - join: legal_entities
      view_label: 'Users'
      type: left_outer
      sql_on: ${accounts.legal_entity_id} = ${legal_entities.id}
      relationship: many_to_one
    
    - join: marketplaces
      sql_on: ${transaction_entries.marketplace_id} = ${marketplaces.id}
      relationship: one_to_one

    - join: currencies
      type: left_outer
      sql_on: ${transaction_entries.currency_id} = ${currencies.id}
      relationship: one_to_one

- explore: public_transaction_entries_base
  from: transaction_entries
  view: transaction_entries
  view_label: ''
  extension: required
  joins:
    - join: account_types
      type: left_outer 
      sql_on: ${accounts.account_type_id} = ${account_types.id}
      relationship: many_to_one
  
    - join: transaction_entries_relationship
      view_label: 'Transaction Entries Relationship'
      from: transaction_entries
      relationship: one_to_one
      sql_on: ${transaction_entries.id} = ${transaction_entries_relationship.related_transaction_id}
      
    - join: transaction_pendings
      view_label: ''
      sql_on: ${accounts.id} = ${transaction_pendings.account_to_id}
      relationship: one_to_many
      
    - join: accounts
      type: left_outer
      sql_on: ${transaction_entries.account_id} = ${accounts.id}
      relationship: many_to_one
      
    - join: milestones
      view_label: 'Items'
      type: left_outer 
      sql_on: ${accounts.milestone_id} = ${milestones.id}
      relationship: many_to_one
      
    - join: related_accounts
      view_label: 'Related Accounts'
      from: accounts
      type: left_outer
      sql_on: ${transaction_entries_relationship.account_id} = ${related_accounts.id}
      relationship: many_to_one
      
    - join: related_marketplaces
      view_label: 'Related Marketplaces'
      from: marketplaces
      sql_on: ${transaction_entries_relationship.marketplace_id} = ${related_marketplaces.id}
      relationship: one_to_one
      
    - join: legal_entities
      view_label: 'Users'
      type: left_outer
      sql_on: ${accounts.legal_entity_id} = ${legal_entities.id}
      relationship: many_to_one
    
    - join: marketplaces
      sql_on: ${transaction_entries.marketplace_id} = ${marketplaces.id}
      relationship: one_to_one

    - join: currencies
      type: left_outer
      sql_on: ${transaction_entries.currency_id} = ${currencies.id}
      relationship: one_to_one

- explore: security_checks_base
  access_filter_fields: [marketplaces.id]
  extension: required
  joins: 
    - join: legal_entities
      view_label: 'Users'
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
  access_filter_fields: [marketplaces.id]
  view_label: ''
  extension: required
  joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${accounts.user_id} = ${users.id}
#       relationship: many_to_one

    - join: legal_entities
      view_label: 'Users'
      type: left_outer 
      sql_on: ${accounts.legal_entity_id} = ${legal_entities.id}
      relationship: many_to_one
      
    - join: contractor_legal_entities
      view_label: 'Users (Merchant)'
      from: legal_entities
      type: left_outer
      sql_on: ${contractor_legal_entities.id} = ${milestones.contractor_legal_entity_id}
      relationship: many_to_one

    - join: client_legal_entities
      view_label: 'Users (Purchaser)'
      from: legal_entities
      type: left_outer
      sql_on: ${client_legal_entities.id} = ${milestones.client_legal_entity_id}
      relationship: many_to_one 
      
    - join: client_user_auths
      view_label: 'User Auths (Purchaser)'
      from: user_auths
      type: left_outer
      sql_on: ${client_legal_entities.principal_id} = ${client_user_auths.user_id}
      relationship: one_to_one
      
    - join: contractor_user_auths
      view_label: 'User Auths (Merchant)'
      from: user_auths
      type: left_outer
      sql_on: ${contractor_legal_entities.principal_id} = ${contractor_user_auths.user_id}
      relationship: one_to_one
   
#    - join: to_account_milestones
#       view_label: "Milestones (to acct)"
#       from: milestones
#       sql_on: ${to_accounts.milestone_id} = ${to_account_milestones.id}
#       relationship: one_to_many
      
    - join: milestones
      view_label: 'Items'
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
      view_label: ''
      type: left_outer
      sql_on: ${accounts.id} = ${transaction_entries.account_id}
      relationship: many_to_one

    - join: transaction_pendings
      view_label: ''
      type: left_outer
      sql_on: ${accounts.id} = ${transaction_pendings.account_to_id}
      relationship: many_to_one
    
    - join: transaction_references
      view_label: 'TransactionReferences'
      type: left_outer
      sql_on: ${accounts.id} = ${transaction_references.account_id}
      relationship: many_to_one
      
- explore: ironman_callback_responses_base
  access_filter_fields: [marketplaces.id]
  extension: required
  from: ironman_callback_responses
  joins: 
    - join: ironman_callbacks
      view_label: 'Callbacks'
      type: left_outer
      sql_on: ${ironman_callback_responses.ironman_callback_id} = ${ironman_callbacks.id}::text
      relationship: one_to_many
    - join: marketplaces
      type: left_outer 
      sql_on: ${ironman_callbacks.marketplace_id} = ${marketplaces.id}
      relationship: many_to_one

- explore: transaction_check_responses_base
  access_filter_fields: [marketplaces.id]
  extension: required
  from:  transaction_check_responses
  joins: 
    - join: transaction_checks
      view_label: 'TransactionChecks'
      type: left_outer
      sql_on: ${transaction_check_responses.transaction_check_id} = ${transaction_checks.id}
      relationship: one_to_many
    - join: marketplaces
      type: left_outer 
      sql_on: ${transaction_checks.marketplace_id} = ${marketplaces.id}
      relationship: many_to_one
    - join: milestones
      view_label: 'Items'
      #type: left_outer 
      sql_on: ${transaction_checks.transaction_checkable_id} = ${milestones.id}
      relationship: one_to_one
  
    - join: accounts
      type: left_outer
      sql_on: ${milestones.id} = ${accounts.milestone_id}
      relationship: one_to_many
      
    - join: transaction_entries
      type: left_outer
      sql_on: ${accounts.id} = ${transaction_entries.account_id}
      relationship: many_to_one
    - join: currencies
      type: left_outer
      sql_on: ${accounts.currency_id} = ${currencies.id}
      relationship: many_to_one
      


- explore: taigan_report_base
  access_filter_fields: [marketplaces.id]
  extension: required
  from: taigan_report
  joins:
    - join: marketplaces
      view_label: 'Marketplaces'
      type: left_outer
      sql_on: ${taigan_report.marketplace_id} = ${marketplaces.id}
      relationship: many_to_one

- explore: feature_configurations_base
  access_filter_fields: [marketplaces.id]
  view_label: ''
  extension: required
  joins:
    - join: marketplaces
      view_label: 'Marketplaces'
      type: full_outer
      sql_on: ${marketplace_id} = ${marketplaces.id}
      relationship: many_to_one

- explore: countries_currencies_base
  view_label: ''
  extension: required
  joins:
    - join: currencies
      view_label: 'Currency'
      type: left_outer
      sql_on: ${currency_id} = ${currencies.id}
      relationship: many_to_one

- explore: payment_restrictions_base
  view_label: ''
  extension: required
  joins:
    - join: marketplaces
      view_label: 'Marketplaces'
      type: left_outer
      sql_on: ${marketplace_id} = ${marketplaces.id}
      relationship: many_to_one
    - join: countries
      view_label: 'Countries'
      type: left_outer
      sql_on: ${country_id} = ${countries.id}
      relationship: many_to_one
    - join: legal_entities
      view_label: 'Legal Entities'
      type: left_outer
      sql_on: ${legal_entity_id} = ${legal_entities.id}
      relationship: many_to_one
    - join: users
      view_label: 'Users'
      type: left_outer
      sql_on: ${legal_entities.principal_id} = ${users.id}
      relationship: many_to_one
    - join: milestones
      view_label: 'Milestones'
      type: left_outer
      sql_on: ${milestone_id} = ${milestones.id}
      relationship: many_to_one
