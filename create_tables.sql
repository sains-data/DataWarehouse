
-- CREATE TABLES: STAR SCHEMA

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
    Total_Discount FLOAT,
    FOREIGN KEY (Customer_ID) REFERENCES Dim_Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID),
    FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID),
    FOREIGN KEY (Payment_Method_ID) REFERENCES Dim_Payment_Method(Payment_Method_ID)
);
