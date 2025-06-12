import pandas as pd
import sqlite3

# Baca CSV
df = pd.read_csv('data/e_commerce_transactions.csv')

# Buat koneksi database SQLite
conn = sqlite3.connect('data/ecommerce.db')

# Simpan ke tabel bernama 'transactions'
df.to_sql('transactions', conn, if_exists='replace', index=False)

print("✅ Data berhasil dimasukkan ke dalam database SQLite.")
conn.close()
