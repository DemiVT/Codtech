-- Create Tables
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    category VARCHAR(100)
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    address TEXT,
    phone_number VARCHAR(15)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Sample Data
INSERT INTO Products (product_name, price, stock_quantity, category)
VALUES 
    ('Laptop', 999.99, 10, 'Electronics'),
    ('Smartphone', 499.99, 25, 'Electronics'),
    ('Desk Chair', 89.99, 15, 'Furniture');

INSERT INTO Customers (name, email, address, phone_number)
VALUES 
    ('Alice Smith', 'alice.smith@example.com', '123 Main St', '555-5678'),
    ('Bob Johnson', 'bob.johnson@example.com', '456 Oak St', '555-8765');

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES 
    (1, '2024-08-25', 999.99),
    (2, '2024-08-26', 589.98);

INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES 
    (1, 1, 1, 999.99),
    (2, 2, 1, 499.99),
    (2, 3, 1, 89.99);

-- Interactive Queries
-- 1. Find Products by Category
SELECT * FROM Products WHERE category = 'Electronics';

-- 2. Get Total Sales by Product
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

-- 3. List All Orders with Customer Details
SELECT o.order_id, c.name AS customer_name, o.order_date, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

-- 4. Check Stock Levels for Products
SELECT product_name, stock_quantity FROM Products;
