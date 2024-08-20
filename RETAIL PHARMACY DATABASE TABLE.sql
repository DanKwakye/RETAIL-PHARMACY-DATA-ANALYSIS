USE pharmacy;

-- Drop tables if they exist to avoid conflicts during creation
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Drugs;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Staff;

-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  -- AUTO_INCREMENT used for unique IDs
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50),
    phonenumber VARCHAR(20) NOT NULL, 
    drugname VARCHAR(50) NOT NULL,
    drug_type VARCHAR(50) NOT NULL,
    gender VARCHAR(45),
    supplier_name VARCHAR(50)
);

-- Create Suppliers Table (without address column)
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,  -- AUTO_INCREMENT used for unique IDs
    suppliername VARCHAR(50) NOT NULL,
    contactperson VARCHAR(50) NOT NULL,
    phonenumber VARCHAR(20) NOT NULL,  
    email VARCHAR(50)
);

-- Create Drugs Table
CREATE TABLE Drugs (
    drug_id INT AUTO_INCREMENT PRIMARY KEY,  -- AUTO_INCREMENT used for unique IDs
    drugname VARCHAR(50) NOT NULL,
    suppliername VARCHAR(50),
    expirydate DATE,
    drugtype VARCHAR(50),
    unitprice DECIMAL(10,2),
    stockquantity INT,
    dosage VARCHAR(50)
);

-- Create Stock Table
CREATE TABLE Stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,  -- AUTO_INCREMENT used for unique IDs
    drug_id INT NOT NULL,
    deliverydate DATE,
    drugtype VARCHAR(50),
    quantity INT,
    remainingstock INT,
    expirydate DATE,
    FOREIGN KEY (drug_id) REFERENCES Drugs(drug_id)
);

-- Create Staff Table
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,  -- AUTO_INCREMENT used for unique IDs
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL
);

-- Create Sales Table
CREATE TABLE Sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,  -- AUTO_INCREMENT used for unique IDs
    customer_id INT NOT NULL,
    drugname VARCHAR(50) NOT NULL,
    suppliername VARCHAR(50),
    drug_type VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2),  -- Precomputed in CSV
    staff_id INT NOT NULL,
    sales_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);
