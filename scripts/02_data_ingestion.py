import pandas as pd
import mysql.connector

df = pd.read_csv("data/jobs.csv")

conn = mysql.connector.connect(
    host="localhost",
    user="job_user",
    password="job_pass",
    database="job_market_db"
)

cursor = conn.cursor()

# Insert companies
companies = df[["company_location", "company_size"]].drop_duplicates()

for _, row in companies.iterrows():
    cursor.execute(
        "INSERT INTO companies (company_location, company_size) VALUES (%s, %s)",
        tuple(row)
    )

conn.commit()
cursor.close()
conn.close()
