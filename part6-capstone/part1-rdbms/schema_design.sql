DROP DATABASE IF EXISTS assignment_part1;
CREATE DATABASE IF NOT EXISTS assignment_part1;
USE assignment_part1;

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

INSERT INTO customers (customer_id, customer_name, customer_email, customer_city) VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai'),
('C006', 'Neha Gupta', 'neha@gmail.com', 'Delhi'),
('C007', 'Arjun Nair', 'arjun@gmail.com', 'Bangalore'),
('C008', 'Kavya Rao', 'kavya@gmail.com', 'Hyderabad');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
('P001', 'Laptop', 'Electronics', 55000.00),
('P002', 'Mouse', 'Electronics', 800.00),
('P003', 'Desk Chair', 'Furniture', 8500.00),
('P004', 'Notebook', 'Stationery', 120.00),
('P005', 'Headphones', 'Electronics', 3200.00),
('P006', 'Standing Desk', 'Furniture', 22000.00),
('P007', 'Pen Set', 'Stationery', 250.00),
('P008', 'Webcam', 'Electronics', 2100.00);

INSERT INTO sales_reps (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001');

INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date, sales_rep_id) VALUES
('ORD1027', 'C002', 'P004', 4, '2023-11-02', 'SR02'),
('ORD1114', 'C001', 'P007', 2, '2023-08-06', 'SR01'),
('ORD1153', 'C006', 'P007', 3, '2023-02-14', 'SR01'),
('ORD1002', 'C002', 'P005', 1, '2023-01-17', 'SR02'),
('ORD1118', 'C006', 'P007', 5, '2023-11-10', 'SR02'),
('ORD1132', 'C003', 'P007', 5, '2023-03-07', 'SR02'),
('ORD1037', 'C002', 'P007', 2, '2023-03-06', 'SR03'),
('ORD1075', 'C005', 'P003', 3, '2023-04-18', 'SR03'),
('ORD1083', 'C006', 'P007', 2, '2023-07-03', 'SR01'),
('ORD1091', 'C001', 'P006', 3, '2023-07-24', 'SR01'),
('ORD1162', 'C006', 'P004', 3, '2023-09-29', 'SR03'),
('ORD1185', 'C003', 'P008', 1, '2023-06-15', 'SR03'),
('ORD1076', 'C004', 'P006', 5, '2023-05-16', 'SR03'),
('ORD1133', 'C001', 'P004', 1, '2023-10-16', 'SR03'),
('ORD1061', 'C006', 'P001', 4, '2023-10-27', 'SR01'),
('ORD1098', 'C007', 'P001', 2, '2023-10-03', 'SR03'),
('ORD1131', 'C008', 'P001', 4, '2023-06-22', 'SR02'),
('ORD1137', 'C005', 'P007', 1, '2023-10-05', 'SR02'),
('ORD1022', 'C005', 'P002', 5, '2023-10-15', 'SR01'),
('ORD1054', 'C002', 'P001', 1, '2023-04-04', 'SR03');