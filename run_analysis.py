import sqlite3
import pandas as pd

# Load CSV ke SQLite
conn = sqlite3.connect(":memory:")
df = pd.read_csv("data/e_commerce_transactions.csv")
df.to_sql("transactions", conn, index=False, if_exists="replace")

# Baca query dari analysis.sql
with open("analysis.sql", "r") as f:
    query_rfm = f.read()

# Jalankan query
rfm_result = pd.read_sql_query(query_rfm, conn)

# Tampilkan hasil
print("Contoh hasil RFM segmentation:")
print(rfm_result.head())

# Simpan ke CSV
rfm_result.to_csv("output_rfm.csv", index=False)
print("✅ Hasil RFM disimpan ke output_rfm.csv")
