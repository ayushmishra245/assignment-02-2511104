DROP DATABASE IF EXISTS assignment_part3;
CREATE DATABASE assignment_part3;
USE assignment_part3;

-- Dimension Table: Date
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day_num INT NOT NULL,
    month_num INT NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    quarter_num INT NOT NULL,
    year_num INT NOT NULL
);

-- Dimension Table: Store
CREATE TABLE dim_store (
    store_key INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);

-- Dimension Table: Product
CREATE TABLE dim_product (
    product_key INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Fact Table: Sales
CREATE TABLE fact_sales (
    sales_key INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id VARCHAR(20) NOT NULL,
    date_key INT NOT NULL,
    store_key INT NOT NULL,
    product_key INT NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    units_sold INT NOT NULL,
    sales_amount DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key)
);

-- =========================
-- Cleaned Sample Data Load
-- =========================
-- Dates standardized to YYYY-MM-DD
-- Category standardized to Electronics / Clothing / Groceries
-- Missing store_city values resolved from store_name

INSERT INTO dim_date (date_key, full_date, day_num, month_num, month_name, quarter_num, year_num) VALUES
(20230113, '2023-01-13', 13, 1, 'January', 1, 2023),
(20230117, '2023-01-17', 17, 1, 'January', 1, 2023),
(20230120, '2023-01-20', 20, 1, 'January', 1, 2023),
(20230205, '2023-02-05', 5, 2, 'February', 1, 2023),
(20230208, '2023-02-08', 8, 2, 'February', 1, 2023),
(20230220, '2023-02-20', 20, 2, 'February', 1, 2023),
(20230321, '2023-03-21', 21, 3, 'March', 1, 2023),
(20230428, '2023-04-28', 28, 4, 'April', 2, 2023),
(20230521, '2023-05-21', 21, 5, 'May', 2, 2023),
(20230522, '2023-05-22', 22, 5, 'May', 2, 2023);

INSERT INTO dim_store (store_key, store_name, store_city) VALUES
(1, 'Mumbai Central', 'Mumbai'),
(2, 'Pune FC Road', 'Pune'),
(3, 'Chennai Anna', 'Chennai'),
(4, 'Delhi South', 'Delhi'),
(5, 'Bangalore MG', 'Bangalore');

INSERT INTO dim_product (product_key, product_name, category, unit_price) VALUES
(1, 'Jeans', 'Clothing', 2317.47),
(2, 'Pulses 1kg', 'Groceries', 31604.47),
(3, 'Phone', 'Electronics', 48703.39),
(4, 'Headphones', 'Electronics', 39854.96),
(5, 'Milk 1L', 'Groceries', 43374.39),
(6, 'Laptop', 'Electronics', 42343.15),
(7, 'Tablet', 'Electronics', 23226.12);

INSERT INTO fact_sales (transaction_id, date_key, store_key, product_key, customer_id, units_sold, sales_amount) VALUES
('TXN5021', 20230113, 1, 1, 'CUST036', 16, 37079.52),
('TXN5026', 20230117, 2, 2, 'CUST029', 9, 284440.23),
('TXN5003', 20230220, 4, 7, 'CUST007', 14, 325165.68),
('TXN5018', 20230208, 5, 4, 'CUST015', 15, 597824.40),
('TXN5002', 20230205, 3, 3, 'CUST019', 20, 974067.80),
('TXN5025', 20230321, 2, 2, 'CUST032', 19, 600484.93),
('TXN5013', 20230428, 1, 5, 'CUST015', 10, 433743.90),
('TXN5028', 20230522, 5, 3, 'CUST030', 13, 633144.07),
('TXN5012', 20230521, 5, 6, 'CUST044', 13, 550461.95),
('TXN5024', 20230120, 1, 4, 'CUST024', 8, 318839.68);