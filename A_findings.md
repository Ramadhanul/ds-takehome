Dari analisis kolom `decoy_flag` dan `decoy_noise`, ditemukan beberapa transaksi mencurigakan dari customer ID **2** dan **714**.

- ID **2** memiliki transaksi dengan `decoy_flag = A` pada 09/01/2024, melakukan pembayaran sebesar **507.01** dengan `decoy_noise` tinggi, yaitu **496.79**. Ini mengindikasikan deviasi besar dari pola normal.
  
- ID **714** melakukan transaksi dengan `decoy_flag = B` pada 21/01/2024, dengan nilai `decoy_noise` mencapai **705.01** untuk pembayaran senilai **667.68**. Nilai noise yang sangat tinggi ini menunjukkan kemungkinan data sintetis atau dimanipulasi.

Kedua transaksi ini menunjukkan pola outlier ekstrem yang sangat tidak umum dalam perilaku pelanggan normal