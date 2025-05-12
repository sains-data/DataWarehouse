# LAPORAN MISI KEDUA PERGUDANGAN DATA


## FASHION RETAIL SALES

**Perancangan dan Implementasi Gudang Data: Studi Kasus Penjualan Ritel Fashion**
## A. Ringkasan Kebutuhan dari Misi

### 1. Kebutuhan Bisnis
- Menganalisis perilaku pelanggan untuk mengetahui tren dan preferensi pasar.  
- Mengidentifikasi produk yang paling banyak dibeli.  
- Mengetahui metode pembayaran yang paling sering digunakan.  
- Memonitor pendapatan berdasarkan waktu (harian, mingguan, bulanan, tahunan).  
- Mendukung evaluasi efektivitas strategi penjualan berdasarkan waktu, produk, dan karakteristik pelanggan.

### 2. Kebutuhan Data
- **Fakta (Transaksi):** informasi pembelian, tanggal, item, jumlah pembayaran, rating, review, metode pembayaran.  
- **Dimensi Pelanggan:** identitas, nama, alamat, segmentasi pelanggan.  
- **Dimensi Produk:** ID produk, nama item, kategori.  
- **Dimensi Waktu:** hari, minggu, bulan, tahun.  
- **Dimensi Pembayaran:** jenis metode pembayaran.

### 3. Kebutuhan Teknis
- Skema bintang (star schema).  
- Proses ETL (extract, transform, load).  
- Integrasi data yang bersih dan konsisten.  
- Skalabilitas sistem.  
- Kemudahan akses dan analisis.

---

## B. Skema Konseptual Multidimensi

### 1. Tujuan Bisnis
- Menganalisis perilaku pembelian pelanggan.  
- Melihat item paling banyak dibeli.  
- Mengukur performa produk berdasarkan rating/review.  
- Mengetahui metode pembayaran yang paling sering digunakan.  
- Memonitor pendapatan berdasarkan waktu.

### 2. Desain Konseptual Awal
- **Fakta:** Purchase Fact  
- **Dimensi:**  
  - Customer (Reference ID)  
  - Produk / Item  
  - Tanggal  
  - Metode Pembayaran

### 3. Cek Ketersediaan Data dan Spesifikasi Mapping

---

## C. Penjelasan Tiap Komponen

### 1. Logical Schema
- **Fakta:** Transaksi Penjualan  
- **Dimensi:** Tanggal, Pelanggan, Pembayaran, Item

### 2. Denormalisasi
- Penggabungan tabel untuk meningkatkan performa query.  
- Tabel fakta menggabungkan informasi dari dimensi-dimensi terkait.

### 3. Star Schema
![Diagram Gudang Data](https://github.com/mine2710/Tubes-Data-Warehouse/blob/main/fix.drawio.png)
Skema ini mendukung analisis data yang efisien karena setiap tabel dimensi dihubungkan langsung dengan tabel fakta tanpa adanya hierarki yang kompleks, yang membuatnya lebih mudah untuk melakukan query analitik

### 4. ETL Logical Planning
- **Extract:** Data diambil dari Kaggle (CSV).  
- **Transform:** Pembersihan dan pemetaan ke tabel dimensi.  
- **Load:** Dimensi dan fakta dimuat ke Data Warehouse.

### Mapping Tabel
| Field Asli                | Tipe Data     | Mapping             |
|--------------------------|---------------|----------------------|
| Customer Reference ID    | Integer        | Customer_ID → Dim_Customer |
| Item Purchased           | String         | Item_Name → Dim_Product |
| Date Purchase            | Date/Float     | Purchase_Date → Dim_Date |
| Review Rating            | Integer        | Review_Score → Fact_Purchase |
| Payment Method           | String         | Payment_Method → Dim_Payment_Method |
| Purchase Amount (USD)    | Float          | Purchase_Amount → Fact_Purchase |

---

## D. Justifikasi Desain Konseptual

- **Dimensi Pelanggan:** membantu segmentasi dan analisis konsumen.  
- **Dimensi Tanggal:** membantu identifikasi tren dan musim.  
- **Dimensi Pembayaran:** memahami preferensi metode pembayaran.  
- **Dimensi Item:** memantau performa produk dan keputusan restock/promosi.

---

## E. Kesesuaian dengan Sumber Data

### 1. Identifikasi Sumber Data
- Sistem Transaksi Penjualan  
- Sistem Informasi Pelanggan  
- Sistem Informasi Produk  
- Sistem Pembayaran  
- Dataset eksternal (Kaggle)

### 2. Mapping Data
- Tabel fakta: jumlah pembayaran, rating, review  
- Dim_Tanggal: tanggal transaksi  
- Dim_Pelanggan: ID dan info personal  
- Dim_Item: ID, nama, kategori produk  
- Dim_Pembayaran: preferensi metode pembayaran

### 3. Ketersediaan Data
- Sebagian besar tersedia dari Kaggle  
- Potensi kekurangan:  
  - Nilai review bisa kosong  
  - Segmentasi pelanggan bisa tidak lengkap

### 4. Kualitas Data
- Akurasi transaksi dan pembayaran penting  
- Kelengkapan dimensi wajib  
- Konsistensi dijaga melalui proses ETL

---
