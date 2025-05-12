# Laporan Perancangan dan Implementasi Gudang Data

## Judul

**Perancangan dan Implementasi Gudang Data: Studi Kasus Penjualan Ritel Fashion**

## A. Profil Industri dan Permasalahan Bisnis

Industri fashion ritel mengalami pertumbuhan signifikan namun menghadapi tantangan dalam mengoptimalkan penjualan online akibat pengalaman pengguna yang buruk dan kesulitan dalam pencarian produk. Pendekatan **omnichannel** dan teknologi seperti chatbot dan pencarian berbasis AI diusulkan untuk meningkatkan pengalaman pelanggan.

## B. Arsitektur Gudang Data

Berikut arsitektur empat lapis yang diterapkan:

### 1. **Sumber Data (Data Sources)**

* **CSV File** dari sistem transaksi penjualan fashion
* Sumber eksternal seperti Kaggle atau GitHub
* Format data: tabular, termasuk informasi pelanggan, produk, tanggal, dan metode pembayaran

### 2. **Staging Area**

* Penyimpanan sementara data mentah
* Dilakukan proses:

  * Validasi format tanggal
  * Menangani nilai kosong seperti *review rating*
  * Standarisasi nama produk dan metode pembayaran

### 3. **Gudang Data (Data Warehouse)**

* Data dimuat ke dalam skema bintang dengan:

  * **Tabel Fakta**: Transaksi Penjualan
  * **Tabel Dimensi**: Pelanggan, Pembayaran, Item, dan Tanggal
* Data diolah menjadi bentuk ringkasan dan metadata untuk kemudahan analisis

### 4. **Data Mart & Klien**

* Data dipisah sesuai divisi pengguna:

  * **Sales Data Mart**: untuk tim penjualan
  * **Finance Data Mart**: untuk tim keuangan
  * **Customer Experience Data Mart**: untuk tim marketing
* Digunakan untuk proses **data mining**, **reporting**, dan **analytics** melalui alat BI seperti Power BI atau Tableau

## C. Skema Gudang Data (Star Schema)

### Tabel Dimensi

| Tabel Dimensi | Atribut               | Deskripsi                            |
| ------------- | --------------------- | ------------------------------------ |
| Pelanggan     | Customer Reference ID | ID unik pelanggan                    |
|               | Customer Name         | Nama pelanggan                       |
|               | Customer Address      | Alamat pelanggan                     |
|               | Customer Email        | Email pelanggan                      |
| Pembayaran    | Payment Method ID     | ID metode pembayaran                 |
|               | Payment Method        | Jenis pembayaran (Cash, Credit Card) |
| Item          | Item ID               | ID produk                            |
|               | Item Purchased        | Nama produk yang dibeli              |
| Tanggal       | Date Key              | ID tanggal pembelian                 |
|               | Date Purchase         | Tanggal pembelian                    |

### Tabel Fakta

| Tabel Fakta         | Atribut                    | Deskripsi                            |
| ------------------- | -------------------------- | ------------------------------------ |
| Transaksi Penjualan | Transaction ID             | ID unik transaksi                    |
|                     | Payment Method ID (FK)     | Relasi ke Dimensi Pembayaran         |
|                     | Customer Reference ID (FK) | Relasi ke Dimensi Pelanggan          |
|                     | Item ID (FK)               | Relasi ke Dimensi Item               |
|                     | Date Key (FK)              | Relasi ke Dimensi Tanggal            |
|                     | Purchase Amount (USD)      | Jumlah uang pembelian dalam USD      |
|                     | Review Rating              | Rating pelanggan terhadap produk     |
|                     | Total Discount             | Diskon yang diberikan pada transaksi |

## D. ETL Pipeline

### Extract

* Menggunakan Python `pandas` untuk membaca data dari file CSV
* Contoh:

```python
import pandas as pd
data = pd.read_csv('Fashion_Retail_Sales.csv')
```

### Transform

* Pembersihan nilai kosong
* Normalisasi format tanggal
* Konversi teks ke format baku (e.g., "credit card" → "Credit Card")

### Load

* Menggunakan SQLAlchemy untuk memasukkan ke PostgreSQL/MySQL

```python
from sqlalchemy import create_engine
engine = create_engine('postgresql://user:password@localhost/db')
data.to_sql('purchases', engine)
```

## E. Skrip SQL Query

### 1. Total Penjualan per Item

```sql
SELECT Item_Purchased, SUM(Purchase_Amount_USD) AS Total_Sales
FROM Purchases
GROUP BY Item_Purchased
ORDER BY Total_Sales DESC;
```

### 2. Rata-rata Rating Produk

```sql
SELECT Item_Purchased, AVG(Review_Rating) AS Avg_Rating
FROM Purchases
GROUP BY Item_Purchased
HAVING AVG(Review_Rating) IS NOT NULL;
```

### 3. Total Penjualan Berdasarkan Metode Pembayaran

```sql
SELECT Payment_Method, SUM(Purchase_Amount_USD) AS Total_Sales
FROM Purchases
GROUP BY Payment_Method;
```

## F. Kesimpulan

Gudang data dirancang untuk menjawab kebutuhan berbagai stakeholder, memfasilitasi analisis bisnis yang lebih baik melalui data yang terstruktur. Implementasi ETL yang sistematis membantu meningkatkan akurasi informasi dan mendukung pengambilan keputusan strategis dalam industri fashion retail.
