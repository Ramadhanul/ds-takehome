import sqlite3
import pandas as pd
from pathlib import Path

# Load CSVs
transactions_df = pd.read_csv("data/e_commerce_transactions.csv")
credit_df = pd.read_csv("data/credit_scoring.csv")

# Buat database SQLite in-memory
conn = sqlite3.connect("analysis.db")

# Simpan ke dalam database
transactions_df.to_sql("transactions", conn, if_exists="replace", index=False)
credit_df.to_sql("credit", conn, if_exists="replace", index=False)

# Load dan jalankan SQL dari analysis.sql
sql_path = Path("analysis.sql")
with open(sql_path, "r") as f:
    full_sql = f.read()

# Pisah per statement
queries = [q.strip() for q in full_sql.strip().split(";") if q.strip()]

# Eksekusi dan cetak hasil tiap query
for i, query in enumerate(queries):
    print(f"\n--- Query {i+1} ---")
    try:
        result = pd.read_sql_query(query, conn)
        print(result.head(10))  # tampilkan 10 baris pertama
    except Exception as e:
        print("Error:", e)

conn.close()
