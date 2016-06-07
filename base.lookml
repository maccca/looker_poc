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

- explore: milestones_base
  extension: required
  joins:
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
      
    - join: marketplaces
      type: left_outer
      sql_on: ${marketplaces.id} = ${milestones.marketplace_id}
      relationship: one_to_many

- explore: transaction_entries_base
  extension: required
#  access_filter_fields: [transaction_entries.marketplace_id]
  joins:
    - join: accounts
      type: left_outer
      sql_on: ${transaction_entries.account_id} = ${accounts.id}
      relationship: many_to_one
      
    - join: legal_entities
      type: left_outer
      sql_on: ${accounts.legal_entity_id} = ${legal_entities.id}
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
      
    - join: milestones
      type: left_outer 
      sql_on: ${accounts.legal_entity_id} = ${milestones.contractor_legal_entity_id}
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