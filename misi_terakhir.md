# BAB I PENDAHULUAN

## 1.1 Latar Belakang

Di era digital saat ini, industri ritail, khususnya sektor fashion, menghadapi perubahan besar dalam pola operasional dan pengambilan keputusan bisnis. Perubahan ini dipicu oleh semakin tingginya volume dan kompleksitas data yang dihasilkan dari aktivitas transaksi harian, interaksi pelanggan, serta integrasi dengan berbagai kanal digital. Salah satu tantangan utama dalam ekosistem digital ini adalah bagaimana mengelola data penjualan, data pelanggan, data produk, serta metode pembayaran yang tersebar di berbagai sistem dan platform menjadi satu kesatuan informasi yang terstruktur dan dapat dianalisis secara efektif.

Untuk menjawab tantangan tersebut, dibutuhkan sistem manajemen data yang mampu menyimpan, mengolah, dan menyajikan data dalam bentuk yang mendukung kebutuhan analisis dan pengambilan keputusan strategis secara efisien dan akurat. Salah satu solusi yang relevan dan banyak diterapkan dalam konteks ini adalah sistem data warehouse.

Data warehouse adalah sistem penyimpanan data terpusat yang dirancang khusus untuk keperluan analisis dan pelaporan bisnis. Tidak seperti sistem basis data operasional yang bersifat transaksional (OLTP), data warehouse mendukung pemrosesan analitik (OLAP) yang memungkinkan pengguna menggali data historis dan melakukan analisis dalam berbagai dimensi. Salah satu pendekatan populer dalam perancangan struktur data warehouse adalah penggunaan skema bintang (star schema), yaitu model data yang menyusun satu tabel fakta utama dan beberapa tabel dimensi terkait seperti pelanggan, produk, waktu, dan metode pembayaran. Desain ini bersifat denormalisasi, sederhana, dan memungkinkan eksekusi kueri dengan performa tinggi.

Keunggulan skema bintang terletak pada kemampuannya dalam menyederhanakan struktur data sehingga mempermudah pengguna non-teknis dalam melakukan eksplorasi data untuk analisis bisnis. Dengan demikian, pendekatan ini sangat cocok diterapkan dalam sistem analitik penjualan ritel, di mana kebutuhan akan laporan cepat dan fleksibel menjadi prioritas utama.

Dalam proyek ini, digunakan data penjualan dari sektor fashion ritel yang bersumber dari platform Kaggle dalam format Comma-Separated Values (CSV). Dataset ini mencakup atribut-atribut penting seperti ID transaksi, nama produk, kategori, harga, jumlah pembelian, metode pembayaran, serta data pelanggan dan tanggal transaksi. Data ini kemudian diproses melalui tahapan ETL (Extract, Transform, Load) yaitu proses ekstraksi data dari sumber mentah, transformasi ke dalam format yang sesuai dan konsisten, serta pemuatan ke dalam data warehouse yang telah dirancang menggunakan struktur skema bintang. Penerapan tahapan ETL secara efektif tidak hanya memastikan kualitas dan konsistensi data, tetapi juga mendukung pengambilan keputusan yang berbasis pada data historis yang valid. Proses ini penting karena kesalahan dalam tahap ETL dapat menyebabkan distorsi informasi analitis, yang dapat berdampak pada pengambilan keputusan bisnis yang tidak tepat.

## 1.2 Tujuan

Berdasarkan latar belakang tersebut, dapat dirumuskan beberapa tujuan yang menjadi fokus utama dalam proyek ini, yaitu:

1. Membangun data warehouse yang mengintegrasikan data penjualan fashion dari berbagai entitas, seperti pelanggan, produk, transaksi, dan metode pembayaran terstruktur.
2. Merancang skema bintang untuk mendukung analisis multimedia secara lebih efisien dalam mempermudah eksplorasi data dan penyusunan laporan penjualan.
3. Mengimplementasikan proses ETL yang efektif guna memastikan kualitas, konsistensi, dan kelengkapan data sebelum dimuat ke dalam data warehouse.
4. Memanfaatkan data warehouse untuk menghasilkan informasi analitis dalam proses pengambilan keputusan, segmentasi pelanggan, dan efektivitas metode pembayaran.

## Ruang Lingkup

Proyek yang dilakukan mencakup pengolahan data statis dari platform Kaggle, dengan melalui beberapa tahapan penting dalam pembangunan data warehouse, yaitu proses ETL (Extract, Transform, Load), perancangan skema bintang (star schema), serta pembuatan visualisasi data. Dalam implementasinya, proyek ini memanfaatkan berbagai tools dan teknologi, seperti PostgreSQL untuk pengelolaan basis data, Python untuk proses transformasi dan manipulasi data, serta Power BI atau Tableau sebagai alat bantu visualisasi untuk menyajikan informasi analitis yang dapat digunakan dalam mendukung pengambilan keputusan strategis.

# BAB II METODOLOGI

Metodologi yang digunakan pada proyek ini adalah metode Waterfall, yang terdiri dari beberapa tahapan:

### 1. Misi 1: Analisis Kebutuhan
Misi ini berfokus pada profil bisnis dan masalah bisnis, identifikasi stakeholder dan tujuan bisnis, analisis permasalahan industri fashion, serta mengidentifikasi sumber data yang akan digunakan.

### 2. Misi 2: Desain Sistem
Desain sistem berfokus pada perancangan sistem skema konseptual multidimensional dengan menggunakan skema bintang, dengan melakukan penentuan tabel fakta dan tabel dimensi. Tabel dimensi terdiri dari tabel produk, pelanggan, waktu, dan metode pembayaran dalam melakukan transaksi. Sedangkan tabel fakta adalah transaksi penjualan dari produk retail.

### 3. Misi 3: Implementasi dan ETL
Misi ini menjadi inti dari realisasi sistem dengan menggunakan semua desain dari misi sebelumnya untuk diimplementasikan dalam sistem basis data yang siap untuk digunakan. Proses ETL sangat penting digunakan supaya data bersih dan valid sesuai dengan kebutuhan untuk melakukan skema bintang. Proses ELT (Extract, Load, Transform) dilakukan untuk mengambil data mentah, transformasi, pemetaan, serta pemuatan data ke dalam database PostgreSQL menggunakan skema bintang yang terisi dan siap dianalisis. Pada tahap ini akan berfokus pada pembuatan struktur database.

### 4. Misi 4: Pengujian dan Visualisasi
Menyusun dan menjalankan query di SQL Server, menjalankan query analitik, menulis dokumentasi, serta menyusun laporan akhir dan README GitHub.

## 2.1 Tools yang Digunakan

Tools yang digunakan pada proyek data warehouse ini di antaranya: PostgreSQL, DBeaver, Power BI, dan GitHub.

## 2.3 Tahapan Pengerjaan

# BAB III ANALISIS

## 3.1 Analisis Kebutuhan

### 3.1.1 Permasalahan Bisnis

Penjualan online tidak dapat dijangkau dengan mudah oleh pembeli, sehingga mereka mengalami kesulitan dalam menemukan produk yang mereka inginkan di e-commerce meskipun produk yang ditawarkan memiliki kualitas yang baik dan harga yang kompetitif. Hal ini disebabkan karena tampilan website ataupun aplikasi yang kurang user-friendly, sehingga pelanggan cenderung meninggalkan website tanpa melakukan pembelian.

### 3.1.2 Tujuan Bisnis

Bertujuan dalam proses pengambilan keputusan secara strategis oleh perusahaan retail fashion dengan penyediaan informasi cepat, tepat, dan relevan.

- a. Menganalisis perilaku pelanggan untuk mengetahui tren dan preferensi pasar.
- b. Mengidentifikasi item atau produk yang paling banyak dibeli.
- c. Mengetahui metode pembayaran yang paling sering digunakan pelanggan.
- d. Memonitor pendapatan berdasarkan rentang waktu tertentu (harian, mingguan, bulanan, dan tahunan).
- e. Mendukung evaluasi efektivitas strategi penjualan berdasarkan waktu, produk, dan karakteristik pelanggan.

### 3.1.3 Solusi yang Diusulkan

Memanfaatkan Aplikasi E-commerce agar memudahkan dalam melakukan pencarian produk serta untuk meningkatkan pengalaman pelanggan: Menerapkan fitur chatbots untuk membantu pelanggan dalam melakukan pencarian produk.

## 3.2 Perancangan Sistem

### 3.2.1 Skema Desain Konseptual

A. **Tujuan Bisnis**  
Dalam membangun gudang data, tujuan dari gudang data ini adalah untuk membantu perusahaan retail fashion:

1. Menganalisis perilaku pembelian pelanggan
2. Melihat item yang paling banyak dibeli
3. Mengukur performa produk berdasarkan rating review
4. Mengetahui metode pembayaran yang paling sering digunakan
5. Memonitor pendapatan harian, mingguan, bulanan, dll.

B. **Desain Konseptual Awal**

![Diagram Gudang Data](https://github.com/sains-data/DataWarehouse/blob/main/fix.drawio.png)

a. **Fakta**  
- Pembelian (Purchase Fact)

b. **Dimensi**  
- Customer (berbasis Reference ID)
- Produk / Item
- Tanggal
- Metode Pembayaran

c. **Cek Ketersediaan Data dan Spesifikasi Mapping**

| Field Asli                | Type Data | Mapping            | Tabel Dimensi/Fakta |
|---------------------------|-----------|--------------------|---------------------|
| Customer Reference ID      | Integer   | Customer_ID        | Dim_Customer        |
| Item Purchased             | String    | Item_Name          | Dim_Product         |
| Date Purchase              | Date (Float?) | Purchase_Date   | Dim_Date            |
| Review Rating              | Integer   | Review_Score       | Fact_Purchase       |
| Payment Method             | String    | Payment_Method     | Dim_Payment_Method  |
| Purchase Amount (USD)      | Float     | Purchase_Amount    | Fact_Purchase       |

### 3.2.2 Desain Logical

Logical schema merujuk pada struktur tabel yang dirancang untuk mengorganisir dan mengelola data di dalam Data Warehouse. Maka dari itu yang digunakan sebagai tabel fakta yaitu (Transaksi Penjualan), dan yang bertindak sebagai tabel dimensi yaitu: Dimensi Tanggal, Dimensi Pelanggan, Dimensi Pembayaran, dan Dimensi Item.

### 3.2.3 Desain Fiskal
Desain Fiskal diawali dengan tahap menentukan tabel yang akan dibuat berdasarkan desain konseptual. Dalam proyek ini terdiri dari tabel fakta dan tabel dimensi. Terdapat 1 tabel fakta yaitu Fact_Purchase(pembelian) dan 4 tabe dimensi : Dim_Customer, Dim_Product, Dim Date, da Dim_Payment_Method.Setiap kolom dan tabel ditentukan nama kolom dan tipe data berdasarkan jenis informasi yang terkandung di dalamnya  dengan tipe data yang sesuai dengan tujuan agar penyimpanan efisien  serta data yang valid. 
- Menentukan Primary Key dan Foreign Key setiap
Dengan tabel yang tersedia ditentukan primary key dan foreign key untuk relasi antar tabel. Primary key ditetapkan untuk memastikan setiap tabel memiliki baris data yang unik dan foreign key penting agar data yang tersedia bisa dianalisis secara terhubung.
- Menuliskan Skrip Query
##### Pembuatan Struktur Tabel

```sql
-- TABEL DIMENSI

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

-- TABEL FAKTA

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
- Total Penjualan Perproduk
```sql
SELECT P.Product_Name, SUM(F.Purchase_Amount) AS Total_Sales
FROM Fact_Purchase F
JOIN Dim_Product P ON F.Product_ID = P.Product_ID
GROUP BY P.Product_Name
ORDER BY Total_Sales DESC;
```
- Rata-rata Rating Produk
```sql
SELECT P.Product_Name, AVG(F.Review_Rating) AS Average_Rating
FROM Fact_Purchase F
JOIN Dim_Product P ON F.Product_ID = P.Product_ID
WHERE F.Review_Rating IS NOT NULL
GROUP BY P.Product_Name
ORDER BY Average_Rating DESC;
```
- Total Penjualan Per Metode Pembayaran
```sql
SELECT M.Payment_Method, SUM(F.Purchase_Amount) AS Total_Sales
FROM Fact_Purchase F
JOIN Dim_Payment_Method M ON F.Payment_Method_ID = M.Payment_Method_ID
GROUP BY M.Payment_Method
ORDER BY Total_Sales DESC;
```
- Total Penjualan Bulanan
```sql
SELECT D.Month, D.Year, SUM(F.Purchase_Amount) AS Monthly_Sales
FROM Fact_Purchase F
JOIN Dim_Date D ON F.Date_ID = D.Date_ID
GROUP BY D.Year, D.Month
ORDER BY D.Year, D.Month;
```
- Penjualan Terbanyak per Pelanggan
```sql
SELECT C.Customer_Name, SUM(F.Purchase_Amount) AS Total_Spent
FROM Fact_Purchase F
JOIN Dim_Customer C ON F.Customer_ID = C.Customer_ID
GROUP BY C.Customer_Name
ORDER BY Total_Spent DESC
LIMIT 10;
```
# BAB IV IMPLEMENTASI DAN EVALUASI SISTEM

## 4.1 Proses Implementasi
Pada tahap ini, implementasi sistem dimulai dengan pembuatan basis data yang mengintegrasikan data penjualan fashion dalam satu sistem. Proses ini mencakup penerapan skema bintang pada database PostgreSQL, yang telah dirancang pada tahap sebelumnya.
Langkah-langkah implementasi yang dilakukan adalah sebagai berikut:
1. Pembuatan Tabel dan Struktur Database:
   -Tabel fakta dan tabel dimensi diciptakan berdasarkan desain fiskal yang telah dibahas sebelumnya.
   -Tabel dimensi yang digunakan antara lain: Dim_Customer, Dim_Product, Dim_Date, dan Dim_Payment_Method.
   -Tabel fakta Fact_Purchase digunakan untuk menyimpan informasi tentang transaksi pembelian, yang mengandung atribut seperti ID transaksi, jumlah pembelian, dan metode pembayaran.
   -Setiap tabel dilengkapi dengan kolom-kolom yang sesuai dengan data yang ada pada dataset, seperti Customer_ID, Item_Name, dan Purchase_Amount.
   -Penggunaan primary key dan foreign key memastikan integritas data dan hubungan antar tabel.
2. Proses ETL (Extract, Transform, Load):
   -Extract: Data diekstrak dari file CSV yang berisi informasi penjualan produk fashion yang diambil dari platform Kaggle.
   -Transform: Data kemudian diproses dan dipetakan ke dalam format yang sesuai dengan skema bintang. Hal ini mencakup pengubahan format tanggal dan pengelompokan data berdasarkan kategori produk, pelanggan, dan waktu transaksi.
   -Load: Setelah transformasi, data dimuat ke dalam database PostgreSQL menggunakan query SQL untuk memastikan konsistensi dan kualitas data.
3. Pembuatan Visualisasi:
   Dengan menggunakan Tableau, dilakukan pembuatan visualisasi untuk mempermudah pemahaman data bagi pengguna non-teknis. Visualisasi ini mencakup grafik penjualan berdasarkan waktu, kategori produk, dan metode pembayaran.

## 4.2 Hasil Implementasi  
Setelah proses implementasi selesai, sistem data warehouse ini berhasil mengintegrasikan data penjualan fashion dengan struktur yang efisien. Hasil dari implementasi sistem ini adalah sebagai berikut:
1. Data yang Terstruktur: Semua data transaksi penjualan terorganisir dengan baik dalam tabel fakta dan dimensi yang sesuai dengan skema bintang. Hal ini memungkinkan analisis lebih lanjut yang mudah dan cepat.
2. Proses ETL yang Efektif: Tahapan ETL berjalan dengan baik, memastikan bahwa data yang dimuat ke dalam database konsisten dan bebas dari kesalahan. Hasilnya adalah sebuah data warehouse yang valid untuk analisis.
3. Pembuatan Laporan Penjualan: Dengan data yang telah dimuat ke dalam sistem, laporan penjualan dapat dihasilkan dengan cepat. Misalnya, laporan yang menunjukkan produk yang paling banyak dibeli, serta analisis berdasarkan waktu dan metode pembayaran yang digunakan oleh pelanggan.

## 4.3 Evaluasi  

# BAB V PENUTUP

## 5.1 Kesimpulan  
Proyek ini telah berhasil membangun sebuah sistem data warehouse untuk industri fashion ritel dengan menggunakan pendekatan skema bintang. Melalui penerapan proses ETL yang efektif dan desain basis data yang efisien, data penjualan dari berbagai entitas seperti pelanggan, produk, transaksi, dan metode pembayaran telah terintegrasi dengan baik. Sistem ini memberikan kemudahan dalam melakukan analisis data penjualan yang dapat mendukung pengambilan keputusan bisnis yang lebih tepat dan cepat.
## 5.2 Rencana Pengembangan
Ke depan, sistem data warehouse ini dapat dikembangkan dengan menambahkan fitur-fitur berikut:
1. Integrasi dengan Data Real-time: Menambahkan kemampuan untuk memproses data secara real-time sehingga laporan dapat diperbarui secara otomatis.
2. Peningkatan Visualisasi: Memperluas jenis visualisasi yang disediakan, seperti analisis prediktif menggunakan machine learning untuk meramalkan tren penjualan di masa depan.
3. Penyempurnaan Proses ETL: Menambahkan lebih banyak aturan pemrosesan untuk mengatasi data yang tidak lengkap atau tidak konsisten.
  
## 5.3 Profil Tim Proyek
Sofyan Fauzi Dzaki Arif			                122450116
Sylviani Primaastuti Ananda              	  121450042
Rahma Neliyana 			                        122450036
Renta Siahaan					                      122450070
Diana Syafithri 					                  122450141

