
- view: taigan_report
  derived_table:
    sql: |
      SELECT
      ms.marketplace_id as "Marketplace ID",
      ms.name as "Item Name",
      ms.external_id as "Item ID", 
      stm.name as "Item Status",
      pt.name as "Item Type", 
      te.uuid as "Transaction ID",
      ter.uuid as "Related Transaction ID",
      st.name as "Transaction Status",
      te.amount as "Transaction Amount", 
      ms.cost as "Item Amount",
      ms.created_at as "Item Created On",
      ms.updated_at as "Item Updated on", 
      te.created_at as "Transaction Created On",
      te.updated_at as "Transaction Updated On", 
      tb.updated_at as "Transaction Batched On",
      CASE at.name
        WHEN 'Milestone Account' THEN 'Item Account'
        ELSE at.name
        END as "Payment Type",
      ub.firstname || ' ' || ub.lastname as "Buyer Name", -- May not be null safe
      ub.email as "Buyer Email",
      ub.uuid as "Buyer Id", 
      us.firstname || ' ' || us.lastname as "Seller Name",
      us.email as "Seller Email",
      us.uuid as "Seller ID"
      FROM transaction_entries te
      LEFT OUTER JOIN transaction_entries ter ON te.related_transaction_id = ter.id
      LEFT OUTER JOIN statuses st ON te.status_id = st.id
      LEFT OUTER JOIN accounts ac ON te.account_id = ac.id
      LEFT OUTER JOIN account_types at ON ac.account_type_id = at.id
      LEFT OUTER JOIN milestones ms ON ac.milestone_id = ms.id
      LEFT OUTER JOIN statuses stm ON ms.state = stm.id
      LEFT OUTER JOIN payment_types pt ON ms.payment_type_id = pt.id
      LEFT OUTER JOIN users ub ON ms.client_id = ub.id
      LEFT OUTER JOIN users us ON ms.contractor_id = us.id
      LEFT OUTER JOIN transaction_pendings tp ON te.transaction_pending_id = tp.id
      LEFT OUTER JOIN transaction_batches tb ON tp.transaction_batch_id = tb.id
      LEFT OUTER JOIN transaction_references tr ON tr.account_id = ac.id
      WHERE {% condition marketplace_filter %} marketplaces.name {% endcondition %}

  fields:
  - filter: marketplace_filter
    type: string

  - measure: count
    type: count
    drill_fields: detail*

  - dimension: item_name
    type: string
    label: "Item Name"
    sql: ${TABLE}."Item Name"

  - dimension: item_id
    type: string
    label: "Item ID"
    sql: ${TABLE}."Item ID"

  - dimension: item_status
    type: string
    label: "Item Status"
    sql: ${TABLE}."Item Status"

  - dimension: item_type
    type: string
    label: "Item Type"
    sql: ${TABLE}."Item Type"

  - dimension: transaction_id
    type: string
    label: "Transaction ID"
    sql: ${TABLE}."Transaction ID"

  - dimension: related_transaction_id
    type: string
    label: "Related Transaction ID"
    sql: ${TABLE}."Related Transaction ID"

  - dimension: transaction_status
    type: string
    label: "Transaction Status"
    sql: ${TABLE}."Transaction Status"

  - dimension: transaction_amount
    type: number
    label: "Transaction Amount"
    sql: ${TABLE}."Transaction Amount"

  - dimension: item_amount
    type: number
    label: "Item Amount"
    sql: ${TABLE}."Item Amount"

  - dimension_group: item_created_on
    type: time
    label: "Item Created On"
    sql: ${TABLE}."Item Created On"

  - dimension_group: item_updated_on
    type: time
    label: "Item Updated on"
    sql: ${TABLE}."Item Updated on"

  - dimension_group: transaction_created_on
    type: time
    label: "Transaction Created On"
    sql: ${TABLE}."Transaction Created On"

  - dimension_group: transaction_updated_on
    type: time
    label: "Transaction Updated On"
    sql: ${TABLE}."Transaction Updated On"

  - dimension_group: transaction_batched_on
    type: time
    label: "Transaction Batched On"
    sql: ${TABLE}."Transaction Batched On"

  - dimension: payment_type
    type: string
    label: "Payment Type"
    sql: ${TABLE}."Payment Type"

  - dimension: buyer_name
    type: string
    label: "Buyer Name"
    sql: ${TABLE}."Buyer Name"

  - dimension: buyer_email
    type: string
    label: "Buyer Email"
    sql: ${TABLE}."Buyer Email"

  - dimension: buyer_id
    type: string
    label: "Buyer Id"
    sql: ${TABLE}."Buyer Id"

  - dimension: seller_name
    type: string
    label: "Seller Name"
    sql: ${TABLE}."Seller Name"

  - dimension: seller_email
    type: string
    label: "Seller Email"
    sql: ${TABLE}."Seller Email"

  - dimension: seller_id
    type: string
    label: "Seller ID"
    sql: ${TABLE}."Seller ID"

  - dimension: marketplace_id
    type: string
    label: "Marketplace ID"
    sql: ${TABLE}."Marketplace ID"
    
  sets:
    detail:
      - item_name
      - item_id
      - item_status
      - item_type
      - transaction_id
      - related_transaction_id
      - transaction_status
      - transaction_amount
      - item_amount
      - item_created_on_time
      - item_updated_on_time
      - transaction_created_on_time
      - transaction_updated_on_time
      - transaction_batched_on_time
      - payment_type
      - buyer_name
      - buyer_email
      - buyer_id
      - seller_name
      - seller_email
      - seller_id
      - marketplace_id

