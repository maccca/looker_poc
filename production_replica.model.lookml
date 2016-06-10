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