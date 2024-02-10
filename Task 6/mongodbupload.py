import pandas as pd

# Read the CSV file
df = pd.read_csv('Cropped and Cleansed Data.csv')

# Take the first 10,000 rows
df = df.head(10000)

df = df.rename(columns={'Site_ID': 'Site_id'})
# Write the cropped data to a new CSV file
df.to_csv('Cropped MongoDB.csv', index=False,encoding='utf-8')