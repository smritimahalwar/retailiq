import pandas as pd
import mysql.connector

#  Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root1234",  # change this
    database="retailiq"
)

print("✅ Connected to MySQL!")

# Extract all tables
customers  = pd.read_sql("SELECT * FROM customers", conn)
products   = pd.read_sql("SELECT * FROM products", conn)
orders     = pd.read_sql("SELECT * FROM orders", conn)
order_items= pd.read_sql("SELECT * FROM order_items", conn)
sellers    = pd.read_sql("SELECT * FROM sellers", conn)

print(f"Customers: {len(customers)} rows")
print(f"Products:  {len(products)} rows")
print(f"Orders:    {len(orders)} rows")
print(f"Order Items: {len(order_items)} rows")
print(f"Sellers:   {len(sellers)} rows")

#  Merge into one master dataframe
'''df = order_items \
    .merge(orders,    on='order_id') \
    .merge(products,  on='product_id') \
    .merge(customers, on='customer_id') \
    .merge(sellers,   on='seller_id')'''
df = order_items \
    .merge(orders,    on='order_id',   suffixes=('_oi','_o')) \
    .merge(products,  on='product_id', suffixes=('_o','_p')) \
    .merge(customers, on='customer_id', suffixes=('_p','_c')) \
    .merge(sellers,   on='seller_id',  suffixes=('_c','_s'))

print(f"\n✅ Master dataframe shape: {df.shape}")
print(df.head())

#  Feature Engineering

# Revenue and profit columns
df['gross_revenue'] = df['selling_price'] * df['quantity']
df['net_revenue']   = df['gross_revenue'] * (1 - df['discount'])
df['profit']        = (df['selling_price'] - df['cost_price']) * df['quantity']
df['delivery_days'] = (pd.to_datetime(df['delivery_date']) -
                       pd.to_datetime(df['order_date'])).dt.days

# Age group
df['age_group'] = pd.cut(df['age'],
                          bins=[0, 25, 32, 40, 100],
                          labels=['18-25', '26-32', '33-40', '40+'])

# Month
df['order_month'] = pd.to_datetime(df['order_date']).dt.to_period('M').astype(str)

print("\n✅ Feature engineering done!")
print(df[['gross_revenue','net_revenue','profit','delivery_days']].describe())

#  Exporting CSV for Power BI

# 1. Master fact table
df_delivered = df[df['status'] == 'Delivered']
df_delivered.to_csv('fact_orders.csv', index=False)

# 2. Revenue by category
rev_category = df_delivered.groupby('category').agg(
    total_revenue=('net_revenue','sum'),
    total_profit=('profit','sum'),
    units_sold=('quantity','sum')
).reset_index()
rev_category['profit_margin'] = (rev_category['total_profit'] /
                                  rev_category['total_revenue'] * 100).round(2)
rev_category.to_csv('revenue_by_category.csv', index=False)

# 3. Monthly trend
monthly = df_delivered.groupby('order_month').agg(
    total_orders=('order_id','nunique'),
    total_revenue=('net_revenue','sum')
).reset_index()
monthly.to_csv('monthly_trend.csv', index=False)

# 4. Customer summary
customer_summary = df_delivered.groupby(
    ['customer_name','city_c','state_c','gender','age_group']
).agg(
    total_orders=('order_id','nunique'),
    total_spent=('net_revenue','sum')
).reset_index()
customer_summary.to_csv('customer_summary.csv', index=False)

# 5. Seller performance
seller_perf = df_delivered.groupby(['seller_name','city_s','state_s','rating']).agg(
    total_orders=('order_id','nunique'),
    total_revenue=('net_revenue','sum')
).reset_index()
seller_perf.to_csv('seller_performance.csv', index=False)

# 6. Order status summary
status_summary = df.groupby('status').agg(
    total_orders=('order_id','nunique'),
    total_revenue=('gross_revenue','sum')
).reset_index()
status_summary.to_csv('order_status.csv', index=False)

print("\n✅ All CSVs exported successfully!")
print("Files created:")
print("  → fact_orders.csv")
print("  → revenue_by_category.csv")
print("  → monthly_trend.csv")
print("  → customer_summary.csv")
print("  → seller_performance.csv")
print("  → order_status.csv")

conn.close()
print("\n✅ Connection closed.")