# BAB I PENDAHULUAN

## 1.1 Latar Belakang

Di era digital saat ini, industri ritail khususnya sektor fashion, menghadapi perubahan besar dalam pola operasional dan pengambilan keputusan bisnis. Perubahan ini dipicu oleh semakin tingginya volume dan kompleksitas data yang dihasilkan dari aktivitas transaksi harian, interaksi pelanggan, serta integrasi dengan berbagai kanal digital. Salah satu tantangan utama dalam ekosistem digital ini adalah bagaimana mengelola data penjualan, data pelanggan, data produk, serta metode pembayaran yang tersebar di berbagai sistem dan platform menjadi satu kesatuan informasi yang terstruktur dan dapat dianalisis secara efektif. 

Untuk menjawab tantangan tersebut, dibutuhkan sistem manajemen data yang mampu menyimpan, mengolah, dan menyajikan data dalam bentuk yang mendukung kebutuhan analisis dan pengambilan keputusan strategis secara efisien dan akurat. Salah satu solusi yang relevan dan banyak diterapkan dalam konteks ini adalah sistem data warehouse.

Data warehouse adalah sistem penyimpanan data terpusat yang dirancang khusus untuk keperluan analisis dan pelaporan bisnis. Tidak seperti sistem basis data operasional yang bersifat transaksional (OLTP), data warehouse mendukung pemrosesan analitik (OLAP) yang memungkinkan pengguna menggali data historis dan melakukan analisis dalam berbagai dimensi. Salah satu pendekatan populer dalam perancangan struktur data warehouse adalah penggunaan skema bintang (star schema), yaitu model data yang menyusun satu tabel fakta utama dan beberapa tabel dimensi terkait seperti pelanggan, produk, waktu, dan metode pembayaran. Desain ini bersifat denormalisasi, sederhana, dan memungkinkan eksekusi kueri dengan performa tinggi. 

Keunggulan skema bintang terletak pada kemampuannya dalam menyederhanakan struktur data sehingga mempermudah pengguna non-teknis dalam melakukan eksplorasi data untuk analisis bisnis. Dengan demikian, pendekatan ini sangat cocok diterapkan dalam sistem analitik penjualan ritel, di mana kebutuhan akan laporan cepat dan fleksibel menjadi prioritas utama.

Dalam proyek ini, digunakan data penjualan dari sektor fashion ritel yang bersumber dari platform Kaggle dalam format Comma-Separated Values (CSV). Dataset ini mencakup atribut-atribut penting seperti ID transaksi, nama produk, kategori, harga, jumlah pembelian, metode pembayaran, serta data pelanggan dan tanggal transaksi. Data ini kemudian diproses melalui tahapan ETL (Extract, Transform, Load) yaitu proses ekstraksi data dari sumber mentah, transformasi ke dalam format yang sesuai dan konsisten, serta pemuatan ke dalam data warehouse yang telah dirancang menggunakan struktur skema bintang. Penerapan tahapan ETL secara efektif tidak hanya memastikan kualitas dan konsistensi data, tetapi juga mendukung pengambilan keputusan yang berbasis pada data historis yang valid. Proses ini penting karena kesalahan dalam tahap ETL dapat menyebabkan distorsi informasi analitis, yang dapat berdampak pada pengambilan keputusan bisnis yang tidak tepat.

## 1.2 Tujuan

Berdasarkan latar belakang tersebut, dapat dirumuskan beberapa tujuan yang menjadi fokus utama dalam proyek ini, yaitu: 

1. Membangun data warehouse yang mengintegrasikan data penjualan fashion dari berbagai entitas, seperti pelanggan, produk, transaksi, dan metode pembayaran terstruktur.
2. Merancang skema bintang untuk mendukung analisis multimedia secara lebih efisien dalam mempermudah eksplorasi data dan penyusunan laporan penjualan.
3. Mengimplementasikan proses ETL yang efektif guna memastikan kualitas, konsistensi dan kelengkapan data sebelum dimuat ke dalam data warehouse.
4. Memanfaatkan data warehouse untuk menghasilkan informasi analitis dalam proses pengambilan keputusan, segmentasi pelanggan, dan efektivitas metode pembayaran. 

## Ruang Lingkup

Proyek yang dilakukan mencakup pengolahan data statis dari platform Kaggle, dengan melalui beberapa tahapan penting dalam pembangunan data warehouse, yaitu proses ETL (Extract, Transform, Load), perancangan skema bintang (star schema), serta pembuatan visualisasi data. Dalam implementasinya, proyek ini memanfaatkan berbagai tools dan teknologi, seperti PostgreSQL untuk pengelolaan basis data, Python untuk proses transformasi dan manipulasi data, serta Power BI atau Tableau sebagai alat bantu visualisasi untuk menyajikan informasi analitis yang dapat digunakan dalam mendukung pengambilan keputusan strategis.

# BAB II METODOLOGI

Metodologi yang digunakan pada proyek ini adalah metode Waterfall, yang terdiri dari beberapa tahapan:

1. **Misi 1: Analisis Kebutuhan**  
   Misi ini berfokus pada profil bisnis dan masalah bisnis, identifikasi stakeholder dan tujuan bisnis, analisis permasalahan industri fashion, serta mengidentifikasi sumber data yang akan digunakan.
   
2. **Misi 2: Desain Sistem**  
   Desain sistem berfokus pada perancangan sistem skema konseptual multidimensional dengan menggunakan skema bintang, dengan melakukan penentuan tabel fakta dan tabel dimensi. Tabel dimensi terdiri dari tabel produk, pelanggan, waktu, dan metode pembayaran dalam melakukan transaksi. Sedangkan tabel fakta adalah transaksi penjualan dari produk retail.
   
3. **Misi 3: Implementasi dan ETL**  
   Misi ini menjadi inti dari realisasi sistem dengan menggunakan semua desain dari misi sebelumnya untuk diimplementasikan dalam sistem basis data yang siap untuk digunakan. Proses ETL sangat penting digunakan supaya data bersih dan valid sesuai dengan kebutuhan untuk melakukan skema bintang. Proses ELT (Extract, Load, Transform) dilakukan untuk mengambil data mentah, transformasi, pemetaan, serta pemuatan data ke dalam database PostgreSQL menggunakan skema bintang yang terisi dan siap dianalisis. Pada tahap ini akan berfokus pada pembuatan struktur database.

4. **Misi 4: Pengujian dan Visualisasi**  
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
a. Menganalisis perilaku pelanggan untuk mengetahui tren dan preferensi pasar.  
b. Mengidentifikasi item atau produk yang paling banyak dibeli.  
c. Mengetahui metode pembayaran yang paling sering digunakan pelanggan.  
d. Memonitor pendapatan berdasarkan rentang waktu tertentu (harian, mingguan, bulanan, dan tahunan).  
e. Mendukung evaluasi efektivitas strategi penjualan berdasarkan waktu, produk, dan karakteristik pelanggan.

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

# BAB IV IMPLEMENTASI DAN EVALUASI SISTEM

## 4.1 Proses Implementasi  
## 4.2 Hasil Implementasi  
## 4.3 Evaluasi  

# BAB V PENUTUP

## 5.1 Kesimpulan  
## 5.2 Rencana Pengembangan  
## 5.3 Profil Tim Proyek
