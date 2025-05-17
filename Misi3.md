# Kelompok 24 - Misi 3

## Laporan Tugas Misi Ketiga: Pergudangan Data RC - Fashion Retail Sales

### Disusun oleh:
1. Sofyan Fauzi Dzaki Arif - 122450116  
2. Sylviani Primaastuti Amanda - 121450042  
3. Rahma Neliyana - 122450036  
4. Renta Siahaan - 122450070  
5. Diana Syafithri - 122450141  

Program Studi Sains Data  
Fakultas Sains  
Institut Teknologi Sumatera  

---

## 1. Pendahuluan

### 1.1 Latar Belakang
... (Bagian ini berisi latar belakang penggunaan data warehouse dan skema bintang pada data penjualan fashion retail).

### 1.2 Rumusan Masalah
1. Bagaimana membangun sistem data warehouse untuk data penjualan fashion?
2. Bagaimana merancang struktur data menggunakan skema bintang?
3. Bagaimana menerapkan proses ETL yang efektif?
4. Bagaimana pemanfaatan hasil data warehouse untuk keputusan strategis?

### 1.3 Ruang Lingkup
Proyek mencakup pengolahan data statis dari Kaggle, dengan tahapan ETL, skema bintang, dan visualisasi dengan tools seperti PostgreSQL, Python, dan PowerBI/Tableau.

---

## 2. Alur Aliran Data

1. **Start** - Awal proses aliran data.  
2. **Data Source** - Data CSV dari Kaggle: pelanggan, produk, transaksi, metode pembayaran, ulasan.  
3. **Staging Area** - Pembersihan data null, duplikat, format tanggal, dll.  
4. **Transformasi Data** - Standarisasi tipe data dan pemetaan ke tabel dimensi dan fakta.  
5. **Load ke Data Warehouse** - Skema bintang: satu tabel fakta dan beberapa tabel dimensi.  
6. **Data Mart** - Pengelompokan data untuk kebutuhan analisis tertentu.  
7. **Client** - Akses pengguna untuk data mining, reporting, analytics.

---

## 3. Arsitektur Sistem

Menggunakan arsitektur 3-tier:  
- **Data Sources**  
- **Staging Area**  
- **Data Warehouse**  
  - Raw Data  
  - Meta Data  
  - Summary Data  
- **Data Mart**  
- **Client** (mining, reporting, analytics)

---

## 4. ETL Pipeline

### Extract
- Data dari Kaggle (CSV)  
- Atribut: customer_ID, Nama, Alamat, Item_ID, Kategori, Tanggal, Metode pembayaran, Total Bayar, Rating, Review

### Transform
- Pembersihan data (null, duplikat, format tanggal, konsistensi)
- Standarisasi tipe data
- Pemetaan ke:
  - `Dim_Customer`: id, nama, alamat  
  - `Dim_Product`: nama item, kategori  
  - `Dim_Date`: tanggal, hari, bulan, tahun  
  - `Dim_Payment_Method`: metode pembayaran  
  - `Fact_Purchase`: jumlah, rating

### Load
- Menggunakan skema bintang:
  - Tabel fakta: `Fact_Purchase`
  - Tabel dimensi: `Dim_Customer`, `Dim_Product`, `Dim_Date`, `Dim_Payment_Method`
- Validasi relasi dengan foreign key

---

## 5. Tools

- **PostgreSQL**: untuk data warehouse
- **DBeaver/pgAdmin**: manajemen database visual
- **Python**: ETL dengan pandas, numpy, sqlalchemy
- **Power BI/Tableau**: visualisasi dan dashboard

---

## 6. Skrip Query

### Struktur Tabel Skema Bintang (PostgreSQL)

```sql
CREATE TABLE Dim_Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Customer_Address VARCHAR(200),
    Customer_Email VARCHAR(100)
);

CREATE TABLE Dim_Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Product_Category VARCHAR(100)
);

CREATE TABLE Dim_Date (
    Date_ID INT PRIMARY KEY,
    Date DATE,
    Day INT,
    Month INT,
    Year INT
);

CREATE TABLE Dim_Payment_Method (
    Payment_Method_ID INT PRIMARY KEY,
    Payment_Method VARCHAR(50)
);

CREATE TABLE Fact_Purchase (
    Transaction_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Date_ID INT,
    Payment_Method_ID INT,
    Purchase_Amount FLOAT,
    Review_Rating FLOAT,
    FOREIGN KEY (Customer_ID) REFERENCES Dim_Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID),
    FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID),
    FOREIGN KEY (Payment_Method_ID) REFERENCES Dim_Payment_Method(Payment_Method_ID)
);
```

### Contoh Query Analitik

**Total Penjualan per Produk**  
```sql
SELECT P.Product_Name, SUM(F.Purchase_Amount) AS Total_Sales
FROM Fact_Purchase F
JOIN Dim_Product P ON F.Product_ID = P.Product_ID
GROUP BY P.Product_Name
ORDER BY Total_Sales DESC;
```

**Rata-Rata Rating Produk**  
```sql
SELECT P.Product_Name, AVG(F.Review_Rating) AS Average_Rating
FROM Fact_Purchase F
JOIN Dim_Product P ON F.Product_ID = P.Product_ID
WHERE F.Review_Rating IS NOT NULL
GROUP BY P.Product_Name
ORDER BY Average_Rating DESC;
```

**Total Penjualan per Metode Pembayaran**  
```sql
SELECT M.Payment_Method, SUM(F.Purchase_Amount) AS Total_Sales
FROM Fact_Purchase F
JOIN Dim_Payment_Method M ON F.Payment_Method_ID = M.Payment_Method_ID
GROUP BY M.Payment_Method
ORDER BY Total_Sales DESC;
```

**Total Penjualan Bulanan**  
```sql
SELECT D.Month, D.Year, SUM(F.Purchase_Amount) AS Monthly_Sales
FROM Fact_Purchase F
JOIN Dim_Date D ON F.Date_ID = D.Date_ID
GROUP BY D.Year, D.Month
ORDER BY D.Year, D.Month;
```

**Pelanggan dengan Total Pembelian Terbanyak**  
```sql
SELECT C.Customer_Name, SUM(F.Purchase_Amount) AS Total_Spent
FROM Fact_Purchase F
JOIN Dim_Customer C ON F.Customer_ID = C.Customer_ID
GROUP BY C.Customer_Name
ORDER BY Total_Spent DESC
LIMIT 10;
```

---