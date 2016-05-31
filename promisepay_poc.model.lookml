- connection: prelive-copy

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


- explore: legal_entities
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

- explore: marketplaces
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
      
- explore: users
  joins:
    - join: legal_entities
      type: left_outer
      sql_on: ${users.id} = ${legal_entities.principal_id}
      relationship: one_to_many
    
- explore: agreements

- explore: transaction_pendings

- explore: milestones

- explore: transaction_entries
  joins:
    - join: accounts
      type: left_outer
      sql_on: ${transaction_entries.account_id} = ${accounts.id}
      relationship: many_to_one

- explore: accounts
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
# 
# 
# - explore: addresses
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${addresses.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${users.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: agreements
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${agreements.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: api_keys
#   joins:
#     - join: user_auths
#       type: left_outer 
#       sql_on: ${api_keys.user_auth_id} = ${user_auths.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${user_auths.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${user_auths.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: user_roles
#       type: left_outer 
#       sql_on: ${user_auths.user_role_id} = ${user_roles.id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: app_log_types
# 
# - explore: app_logs
#   joins:
#     - join: app_log_types
#       type: left_outer 
#       sql_on: ${app_logs.app_log_type_id} = ${app_log_types.id}
#       relationship: many_to_one
# 
# 
# - explore: batch_responses
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${batch_responses.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: business_informations
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${business_informations.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
# 
# - explore: companies
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${companies.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${users.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: countries
# 
# - explore: currencies
# 
# - explore: dfat_controlled_entities
# 
# - explore: direct_debit_authorities
#   joins:
#     - join: accounts
#       type: left_outer 
#       sql_on: ${direct_debit_authorities.account_id} = ${accounts.id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${accounts.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${accounts.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: account_types
#       type: left_outer 
#       sql_on: ${accounts.account_type_id} = ${account_types.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${users.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
# 
# - explore: disputes
#   joins:
#     - join: milestones
#       type: left_outer 
#       sql_on: ${disputes.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${disputes.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${milestones.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: encryption_keys
# 
# - explore: events
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${events.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${users.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: feature_configurations
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${feature_configurations.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${feature_configurations.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${feature_configurations.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
# 
# - explore: fed_ach_participants
# 
# - explore: fee_lists
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${fee_lists.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: fee_types
#       type: left_outer 
#       sql_on: ${fee_lists.fee_type_id} = ${fee_types.id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: fee_types
# 
# - explore: fees
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${fees.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: fee_lists
#       type: left_outer 
#       sql_on: ${fees.fee_list_id} = ${fee_lists.id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${fees.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: fee_types
#       type: left_outer 
#       sql_on: ${fee_lists.fee_type_id} = ${fee_types.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
# 
# - explore: ironman_callback_responses
#   joins:
#     - join: ironman_callbacks
#       type: left_outer 
#       sql_on: ${ironman_callback_responses.ironman_callback_id} = ${ironman_callbacks.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${ironman_callbacks.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: ironman_callbacks
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${ironman_callbacks.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: legal_entities
# 
# - explore: legal_entity_responses
# 
# - explore: marketplace_addons
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${marketplace_addons.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: marketplace_paypals
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${marketplace_paypals.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: marketplaces
#   joins:
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: milestones
#   joins:
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${milestones.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: notes
#   joins:
#     - join: transaction_pendings
#       type: left_outer 
#       sql_on: ${notes.transaction_pending_id} = ${transaction_pendings.bundle_transaction_pending_id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${transaction_pendings.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${transaction_pendings.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: ofac_sdn_controlled_entities
# 
# - explore: payment_restrictions
#   joins:
#     - join: milestones
#       type: left_outer 
#       sql_on: ${payment_restrictions.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${payment_restrictions.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: payment_types
# 
# - explore: paypal_payment_responses
#   joins:
#     - join: paypal_payments
#       type: left_outer 
#       sql_on: ${paypal_payment_responses.paypal_payment_id} = ${paypal_payments.id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${paypal_payment_responses.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${milestones.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: paypal_payments
#   joins:
#     - join: milestones
#       type: left_outer 
#       sql_on: ${paypal_payments.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${milestones.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: refunds
#   joins:
#     - join: milestones
#       type: left_outer 
#       sql_on: ${refunds.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${refunds.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${milestones.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: schedule_types
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${schedule_types.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: schedules
#   joins:
#     - join: schedule_types
#       type: left_outer 
#       sql_on: ${schedules.schedule_type_id} = ${schedule_types.id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${schedules.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${schedule_types.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
# 
# - explore: schema_migrations
# 
# - explore: security_checks
# 
# - explore: sessions
#   joins:
#     - join: milestones
#       type: left_outer 
#       sql_on: ${sessions.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: token_auths
#       type: left_outer 
#       sql_on: ${sessions.token_auth_id} = ${token_auths.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${milestones.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: token_auth_types
#       type: left_outer 
#       sql_on: ${token_auths.token_auth_type_id} = ${token_auth_types.id}
#       relationship: many_to_one
# 
#     - join: user_auths
#       type: left_outer 
#       sql_on: ${token_auths.user_auth_id} = ${user_auths.id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${user_auths.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: user_roles
#       type: left_outer 
#       sql_on: ${user_auths.user_role_id} = ${user_roles.id}
#       relationship: many_to_one
# 
# 
# - explore: statuses
# 
# - explore: sub_merchant_responses
#   joins:
#     - join: sub_merchants
#       type: left_outer 
#       sql_on: ${sub_merchant_responses.sub_merchant_id} = ${sub_merchants.id}
#       relationship: many_to_one
# 
#     - join: accounts
#       type: left_outer 
#       sql_on: ${sub_merchants.account_id} = ${accounts.id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${accounts.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${accounts.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: account_types
#       type: left_outer 
#       sql_on: ${accounts.account_type_id} = ${account_types.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${users.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
# 
# - explore: sub_merchants
#   joins:
#     - join: accounts
#       type: left_outer 
#       sql_on: ${sub_merchants.account_id} = ${accounts.id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${accounts.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${accounts.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: account_types
#       type: left_outer 
#       sql_on: ${accounts.account_type_id} = ${account_types.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${users.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
# 
# - explore: token_auth_types
# 
# - explore: token_auths
#   joins:
#     - join: token_auth_types
#       type: left_outer 
#       sql_on: ${token_auths.token_auth_type_id} = ${token_auth_types.id}
#       relationship: many_to_one
# 
#     - join: user_auths
#       type: left_outer 
#       sql_on: ${token_auths.user_auth_id} = ${user_auths.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${user_auths.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${user_auths.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: user_roles
#       type: left_outer 
#       sql_on: ${user_auths.user_role_id} = ${user_roles.id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: transaction_batches
# 
# - explore: transaction_check_responses
#   joins:
#     - join: transaction_checks
#       type: left_outer 
#       sql_on: ${transaction_check_responses.transaction_check_id} = ${transaction_checks.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${transaction_checks.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${transaction_checks.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${transaction_checks.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
# 
# - explore: transaction_checks
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${transaction_checks.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${transaction_checks.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${transaction_checks.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
# 
# - explore: transaction_entries
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${transaction_entries.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: transaction_pendings
#       type: left_outer 
#       sql_on: ${transaction_entries.transaction_pending_id} = ${transaction_pendings.bundle_transaction_pending_id}
#       relationship: many_to_one
# 
#     - join: fees
#       type: left_outer 
#       sql_on: ${transaction_entries.fee_id} = ${fees.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${transaction_entries.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: accounts
#       type: left_outer 
#       sql_on: ${transaction_entries.account_id} = ${accounts.id}
#       relationship: many_to_one
# 
#     - join: fee_lists
#       type: left_outer 
#       sql_on: ${fees.fee_list_id} = ${fee_lists.id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${fees.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: fee_types
#       type: left_outer 
#       sql_on: ${fee_lists.fee_type_id} = ${fee_types.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: account_types
#       type: left_outer 
#       sql_on: ${accounts.account_type_id} = ${account_types.id}
#       relationship: many_to_one
# 
# 
# - explore: transaction_invitations
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${transaction_invitations.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${users.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: transaction_pendings
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${transaction_pendings.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${transaction_pendings.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: transaction_references
#   joins:
#     - join: transaction_pendings
#       type: left_outer 
#       sql_on: ${transaction_references.transaction_pending_id} = ${transaction_pendings.bundle_transaction_pending_id}
#       relationship: many_to_one
# 
#     - join: accounts
#       type: left_outer 
#       sql_on: ${transaction_references.account_id} = ${accounts.id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${transaction_pendings.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${transaction_pendings.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
#     - join: milestones
#       type: left_outer 
#       sql_on: ${accounts.milestone_id} = ${milestones.id}
#       relationship: many_to_one
# 
#     - join: account_types
#       type: left_outer 
#       sql_on: ${accounts.account_type_id} = ${account_types.id}
#       relationship: many_to_one
# 
#     - join: agreements
#       type: left_outer 
#       sql_on: ${milestones.agreement_id} = ${agreements.id}
#       relationship: many_to_one
# 
#     - join: payment_types
#       type: left_outer 
#       sql_on: ${milestones.payment_type_id} = ${payment_types.id}
#       relationship: many_to_one
# 
# 
# - explore: uploads
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${uploads.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${uploads.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: user_auths
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${user_auths.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: users
#       type: left_outer 
#       sql_on: ${user_auths.user_id} = ${users.id}
#       relationship: many_to_one
# 
#     - join: user_roles
#       type: left_outer 
#       sql_on: ${user_auths.user_role_id} = ${user_roles.id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
# - explore: user_roles
# 
# - explore: users
#   joins:
#     - join: marketplaces
#       type: left_outer 
#       sql_on: ${users.marketplace_id} = ${marketplaces.alt_marketplace_id}
#       relationship: many_to_one
# 
#     - join: business_informations
#       type: left_outer 
#       sql_on: ${marketplaces.business_information_id} = ${business_informations.id}
#       relationship: many_to_one
# 
# 
