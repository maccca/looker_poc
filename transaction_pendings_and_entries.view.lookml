- view: transaction_pendings_and_entries
  derived_table:
    sql: |
      SELECT 
      
      FROM transaction_pendings
      UNION
      SELECT
      
      FROM transaction_entries
      