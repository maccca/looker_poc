- view: marketplace_accounts
#   derived_table:
#     sql: |
#       SELECT
#         customer_id,
#         MIN(DATE(time)) AS first_order_date,
#         SUM(amount) AS lifetime_amount
#       FROM
#         order
#       GROUP BY
#         customer_id

# # You can specify the table name if it's different from the view name:
#   sql_table_name: my_schema_name.marketplace_accounts
#
#  fields:
# # #     Define your dimensions and measures here, like this:
# 
#   - dimension: marketplace_id
#     type: number
#     primary_key: true
#     sql: ${TABLE}.id
# 
#   - dimension: first_order
#     type: time
#     timeframes: [date, week, month]
#     sql: ${TABLE}.first_order_date
# 
#   - dimension: lifetime_amount
#     type: number
#     value_format: '0.00'
#     sql: ${TABLE}.lifetime_amount
#     - dimension: id
#       type: number
#       sql: ${TABLE}.id
#
#     - dimension: created
#       type: time
#       timeframes: [date, week, month, year]
#       sql: ${TABLE}.created_at
#
#     - measure: count
#       type: count


# # Or, you could make this view a derived table, like this:
#   derived_table:
#     sql: |
#       SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#
#  fields:
# #     Define your dimensions and measures here, like this:
#     - dimension: lifetime_orders
#       type: number
#       sql: ${TABLE}.lifetime_orders
#
#     - dimension: most_recent_purchase
#       type: time
#       timeframes: [date, week, month, year]
#       sql: ${TABLE}.most_recent_purchase_at
#
#     - measure: total_lifetime_orders
#       type: sum
#       sql: ${lifetime_orders}
