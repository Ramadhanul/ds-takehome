# ds-takehome

## Deskripsi Proyek

Proyek ini merupakan bagian dari tes Data Scientist yang mencakup tiga bagian utama:

- **Bagian A – SQL Analytics**: Analisis transaksi e-commerce untuk segmentasi pelanggan, deteksi anomali, dan repeat purchase.
- **Bagian B – Python Modeling**: Pembuatan model risiko kredit dengan Logistic Regression dan Gradient Boosting, disertai interpretasi SHAP dan scorecard.
- **Bagian C – R Statistical Check**: Validasi model dengan Hosmer-Lemeshow Test dan kurva kalibrasi menggunakan R.


## Cara Menjalankan Proyek

### Prasyarat
- Python ≥ 3.11
- R ≥ 4.3

## Panduan Menjalankan Proyek

### Bagian A – SQL Analytics

1. **Buka dan jalankan `analysis.sql`** menggunakan `run_analysis.py`, jangan lupa ubah path data sesuai lokasi data anda!
2. File ini mencakup:
   - Perhitungan RFM + segmentasi pelanggan.
   - Deteksi anomali berdasarkan `decoy_flag` dan `decoy_noise`.
   - Analisis repeat purchase bulanan.
3. **Insight dan temuan anomali ditulis dalam** `A_findings.md`.

---

### Bagian B – Python Modeling

1. Buka `notebooks/B_modeling.ipynb` menggunakan Jupyter Notebook atau VSCode.
2. Jalankan sel-sel kode untuk:
   - EDA & preprocessing (drop fitur leakage).
   - Pembuatan model baseline (Logistic Regression).
   - Peningkatan model menggunakan Gradient Boosting.
   - Konversi probabilitas ke skor (skala industri 300–850).
   - Interpretasi SHAP dan visualisasi top-10 fitur (`shap_top10_features.png`).
   - Rekomendasi keputusan IDR 5 juta (`decision_slide.pdf`).

---

### Bagian C – R Statistical Check

1. **Buka R atau RStudio**.
2. Jalankan script `validation.r` dengan:
```r
source("validation.R")