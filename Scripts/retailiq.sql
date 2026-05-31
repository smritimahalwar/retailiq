CREATE DATABASE retailiq;
USE retailiq;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    registration_date DATE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    brand VARCHAR(50),
    cost_price DECIMAL(10,2),
    selling_price DECIMAL(10,2)
);
CREATE TABLE sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    rating DECIMAL(3,2)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    seller_id INT,
    order_date DATE,
    delivery_date DATE,
    status VARCHAR(20),
    payment_mode VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(4,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 'Delhi', 'Delhi', 28, 'Male', '2021-01-15'),
(2, 'Priya Mehta', 'priya@gmail.com', 'Mumbai', 'Maharashtra', 32, 'Female', '2021-03-22'),
(3, 'Amit Kumar', 'amit@gmail.com', 'Bangalore', 'Karnataka', 26, 'Male', '2021-02-10'),
(4, 'Sneha Patel', 'sneha@gmail.com', 'Ahmedabad', 'Gujarat', 35, 'Female', '2020-11-05'),
(5, 'Rohit Singh', 'rohit@gmail.com', 'Delhi', 'Delhi', 29, 'Male', '2021-06-18'),
(6, 'Neha Gupta', 'neha@gmail.com', 'Mumbai', 'Maharashtra', 24, 'Female', '2022-02-28'),
(7, 'Vikram Rao', 'vikram@gmail.com', 'Chennai', 'Tamil Nadu', 40, 'Male', '2020-09-12'),
(8, 'Pooja Joshi', 'pooja@gmail.com', 'Chennai', 'Tamil Nadu', 37, 'Female', '2021-04-30'),
(9, 'Arjun Nair', 'arjun@gmail.com', 'Bangalore', 'Karnataka', 27, 'Male', '2021-08-14'),
(10, 'Kavya Reddy', 'kavya@gmail.com', 'Hyderabad', 'Telangana', 31, 'Female', '2020-12-01'),
(11, 'Sanjay Verma', 'sanjay@gmail.com', 'Pune', 'Maharashtra', 45, 'Male', '2021-05-20'),
(12, 'Anita Desai', 'anita@gmail.com', 'Jaipur', 'Rajasthan', 29, 'Female', '2021-07-11'),
(13, 'Kiran Bose', 'kiran@gmail.com', 'Kolkata', 'West Bengal', 33, 'Male', '2020-08-19'),
(14, 'Divya Menon', 'divya@gmail.com', 'Kochi', 'Kerala', 27, 'Female', '2022-01-05'),
(15, 'Suresh Iyer', 'suresh@gmail.com', 'Chennai', 'Tamil Nadu', 38, 'Male', '2021-09-25'),
(16, 'Meera Pillai', 'meera@gmail.com', 'Trivandrum', 'Kerala', 30, 'Female', '2021-11-14'),
(17, 'Ravi Teja', 'ravi@gmail.com', 'Hyderabad', 'Telangana', 25, 'Male', '2022-03-08'),
(18, 'Swati Shah', 'swati@gmail.com', 'Ahmedabad', 'Gujarat', 34, 'Female', '2020-10-17'),
(19, 'Nikhil Jain', 'nikhil@gmail.com', 'Jaipur', 'Rajasthan', 28, 'Male', '2021-12-22'),
(20, 'Fatima Khan', 'fatima@gmail.com', 'Mumbai', 'Maharashtra', 31, 'Female', '2022-04-10');

INSERT INTO products VALUES
(1, 'iPhone 14', 'Electronics', 'Smartphones', 'Apple', 55000, 79000),
(2, 'Samsung Galaxy S23', 'Electronics', 'Smartphones', 'Samsung', 40000, 59999),
(3, 'Sony WH-1000XM5', 'Electronics', 'Headphones', 'Sony', 18000, 29999),
(4, 'Dell Inspiron 15', 'Electronics', 'Laptops', 'Dell', 45000, 65000),
(5, 'Nike Air Max', 'Fashion', 'Footwear', 'Nike', 3500, 8999),
(6, 'Levis 501 Jeans', 'Fashion', 'Clothing', 'Levis', 1500, 3999),
(7, 'Whirlpool Washing Machine', 'Appliances', 'Washing Machines', 'Whirlpool', 18000, 28999),
(8, 'LG Refrigerator', 'Appliances', 'Refrigerators', 'LG', 25000, 38999),
(9, 'Prestige Cooker', 'Kitchen', 'Cookware', 'Prestige', 800, 1999),
(10, 'Philips Air Fryer', 'Kitchen', 'Appliances', 'Philips', 4000, 7999),
(11, 'Adidas Running Shoes', 'Fashion', 'Footwear', 'Adidas', 3000, 7499),
(12, 'HP LaserJet Printer', 'Electronics', 'Printers', 'HP', 8000, 13999),
(13, 'Bajaj Mixer Grinder', 'Kitchen', 'Appliances', 'Bajaj', 1200, 2999),
(14, 'Woodland Casual Shoes', 'Fashion', 'Footwear', 'Woodland', 2000, 4999),
(15, 'Oneplus Nord CE3', 'Electronics', 'Smartphones', 'Oneplus', 22000, 32999),
(16, 'Boat Rockerz 450', 'Electronics', 'Headphones', 'Boat', 1200, 2999),
(17, 'Raymond Formal Shirt', 'Fashion', 'Clothing', 'Raymond', 800, 2499),
(18, 'Nikon D3500 Camera', 'Electronics', 'Cameras', 'Nikon', 28000, 42999),
(19, 'Godrej Almirah', 'Furniture', 'Storage', 'Godrej', 8000, 14999),
(20, 'Nilkamal Chair', 'Furniture', 'Seating', 'Nilkamal', 1500, 3499);

INSERT INTO sellers VALUES
(1, 'TechMart India', 'Delhi', 'Delhi', 4.5),
(2, 'FashionHub', 'Mumbai', 'Maharashtra', 4.2),
(3, 'ApplianceKing', 'Bangalore', 'Karnataka', 4.7),
(4, 'MegaShop', 'Chennai', 'Tamil Nadu', 4.0),
(5, 'QuickDeals', 'Hyderabad', 'Telangana', 4.3),
(6, 'SmartBazaar', 'Pune', 'Maharashtra', 4.6),
(7, 'ValueStore', 'Kolkata', 'West Bengal', 3.9),
(8, 'PrimeSeller', 'Jaipur', 'Rajasthan', 4.4),
(9, 'EliteMart', 'Ahmedabad', 'Gujarat', 4.1),
(10, 'BestDeals', 'Kochi', 'Kerala', 4.8);

INSERT INTO orders VALUES
(1, 1, 1, '2023-01-05', '2023-01-10', 'Delivered', 'Credit Card'),
(2, 2, 2, '2023-01-08', '2023-01-14', 'Delivered', 'UPI'),
(3, 3, 3, '2023-01-12', '2023-01-18', 'Delivered', 'Debit Card'),
(4, 4, 4, '2023-01-15', '2023-01-21', 'Delivered', 'COD'),
(5, 5, 5, '2023-01-20', '2023-01-26', 'Delivered', 'Credit Card'),
(6, 6, 6, '2023-02-02', '2023-02-08', 'Delivered', 'UPI'),
(7, 7, 7, '2023-02-07', '2023-02-13', 'Delivered', 'Net Banking'),
(8, 8, 8, '2023-02-11', '2023-02-17', 'Delivered', 'Credit Card'),
(9, 9, 9, '2023-02-14', '2023-02-20', 'Cancelled', 'UPI'),
(10, 10, 10, '2023-02-18', '2023-02-24', 'Delivered', 'COD'),
(11, 11, 1, '2023-03-01', '2023-03-07', 'Delivered', 'Credit Card'),
(12, 12, 2, '2023-03-05', '2023-03-11', 'Delivered', 'UPI'),
(13, 13, 3, '2023-03-10', '2023-03-16', 'Delivered', 'Debit Card'),
(14, 14, 4, '2023-03-14', '2023-03-20', 'Returned', 'Credit Card'),
(15, 15, 5, '2023-03-18', '2023-03-24', 'Delivered', 'UPI'),
(16, 1, 6, '2023-04-02', '2023-04-08', 'Delivered', 'Net Banking'),
(17, 2, 7, '2023-04-06', '2023-04-12', 'Delivered', 'COD'),
(18, 3, 8, '2023-04-10', '2023-04-16', 'Cancelled', 'UPI'),
(19, 4, 9, '2023-04-15', '2023-04-21', 'Delivered', 'Credit Card'),
(20, 5, 10, '2023-04-19', '2023-04-25', 'Delivered', 'UPI'),
(21, 6, 1, '2023-05-03', '2023-05-09', 'Delivered', 'Credit Card'),
(22, 7, 2, '2023-05-07', '2023-05-13', 'Delivered', 'Debit Card'),
(23, 8, 3, '2023-05-11', '2023-05-17', 'Delivered', 'UPI'),
(24, 9, 4, '2023-05-15', '2023-05-21', 'Delivered', 'COD'),
(25, 10, 5, '2023-05-20', '2023-05-26', 'Returned', 'Credit Card'),
(26, 11, 6, '2023-06-01', '2023-06-07', 'Delivered', 'UPI'),
(27, 12, 7, '2023-06-05', '2023-06-11', 'Delivered', 'Net Banking'),
(28, 13, 8, '2023-06-09', '2023-06-15', 'Delivered', 'Credit Card'),
(29, 14, 9, '2023-06-13', '2023-06-19', 'Cancelled', 'UPI'),
(30, 15, 10, '2023-06-17', '2023-06-23', 'Delivered', 'COD'),
(31, 16, 1, '2023-07-02', '2023-07-08', 'Delivered', 'Credit Card'),
(32, 17, 2, '2023-07-06', '2023-07-12', 'Delivered', 'UPI'),
(33, 18, 3, '2023-07-10', '2023-07-16', 'Delivered', 'Debit Card'),
(34, 19, 4, '2023-07-14', '2023-07-20', 'Delivered', 'Credit Card'),
(35, 20, 5, '2023-07-18', '2023-07-24', 'Cancelled', 'UPI'),
(36, 1, 6, '2023-08-01', '2023-08-07', 'Delivered', 'Net Banking'),
(37, 2, 7, '2023-08-05', '2023-08-11', 'Delivered', 'COD'),
(38, 3, 8, '2023-08-09', '2023-08-15', 'Delivered', 'Credit Card'),
(39, 4, 9, '2023-08-13', '2023-08-19', 'Returned', 'UPI'),
(40, 5, 10, '2023-08-17', '2023-08-23', 'Delivered', 'Credit Card'),
(41, 6, 1, '2023-09-02', '2023-09-08', 'Delivered', 'UPI'),
(42, 7, 2, '2023-09-06', '2023-09-12', 'Delivered', 'Debit Card'),
(43, 8, 3, '2023-09-10', '2023-09-16', 'Delivered', 'Credit Card'),
(44, 9, 4, '2023-09-14', '2023-09-20', 'Cancelled', 'COD'),
(45, 10, 5, '2023-09-18', '2023-09-24', 'Delivered', 'UPI'),
(46, 11, 6, '2023-10-03', '2023-10-09', 'Delivered', 'Credit Card'),
(47, 12, 7, '2023-10-07', '2023-10-13', 'Delivered', 'Net Banking'),
(48, 13, 8, '2023-10-11', '2023-10-17', 'Delivered', 'UPI'),
(49, 14, 9, '2023-10-15', '2023-10-21', 'Returned', 'Credit Card'),
(50, 15, 10, '2023-10-19', '2023-10-25', 'Delivered', 'COD');

INSERT INTO order_items VALUES
(1, 1, 1, 1, 0.05),
(2, 1, 3, 1, 0.00),
(3, 2, 6, 2, 0.10),
(4, 3, 7, 1, 0.05),
(5, 4, 9, 3, 0.00),
(6, 5, 2, 1, 0.08),
(7, 6, 5, 2, 0.10),
(8, 7, 4, 1, 0.05),
(9, 8, 8, 1, 0.00),
(10, 9, 16, 2, 0.15),
(11, 10, 13, 1, 0.00),
(12, 11, 1, 1, 0.05),
(13, 12, 11, 2, 0.10),
(14, 13, 15, 1, 0.08),
(15, 14, 18, 1, 0.00),
(16, 15, 2, 1, 0.05),
(17, 16, 10, 1, 0.10),
(18, 17, 6, 3, 0.15),
(19, 18, 12, 1, 0.00),
(20, 19, 5, 2, 0.10),
(21, 20, 9, 4, 0.00),
(22, 21, 3, 1, 0.05),
(23, 22, 4, 1, 0.08),
(24, 23, 7, 1, 0.00),
(25, 24, 14, 2, 0.10),
(26, 25, 1, 1, 0.05),
(27, 26, 17, 3, 0.00),
(28, 27, 8, 1, 0.05),
(29, 28, 2, 1, 0.10),
(30, 29, 16, 2, 0.15),
(31, 30, 13, 2, 0.00),
(32, 31, 15, 1, 0.05),
(33, 32, 11, 1, 0.10),
(34, 33, 19, 1, 0.00),
(35, 34, 5, 2, 0.08),
(36, 35, 3, 1, 0.05),
(37, 36, 10, 2, 0.10),
(38, 37, 6, 1, 0.00),
(39, 38, 4, 1, 0.05),
(40, 39, 20, 2, 0.10),
(41, 40, 1, 1, 0.05),
(42, 41, 9, 3, 0.00),
(43, 42, 2, 1, 0.08),
(44, 43, 7, 1, 0.05),
(45, 44, 16, 2, 0.15),
(46, 45, 13, 1, 0.00),
(47, 46, 15, 1, 0.05),
(48, 47, 11, 2, 0.10),
(49, 48, 18, 1, 0.00),
(50, 49, 8, 1, 0.05),
(51, 50, 5, 2, 0.10),
(52, 11, 16, 1, 0.05),
(53, 12, 9, 2, 0.00),
(54, 13, 6, 1, 0.10),
(55, 14, 3, 1, 0.05),
(56, 15, 10, 2, 0.08),
(57, 16, 14, 1, 0.00),
(58, 17, 17, 2, 0.10),
(59, 18, 19, 1, 0.05),
(60, 19, 13, 3, 0.00),
(61, 20, 2, 1, 0.08),
(62, 21, 11, 2, 0.10),
(63, 22, 20, 1, 0.00),
(64, 23, 15, 1, 0.05),
(65, 24, 4, 1, 0.10),
(66, 25, 12, 1, 0.05),
(67, 26, 8, 1, 0.00),
(68, 27, 5, 2, 0.10),
(69, 28, 1, 1, 0.05),
(70, 29, 7, 1, 0.00);

USE retailiq;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;

-- BASIC BUSINESS OVERVIEW 

-- How many orders do we have by status..?
SELECT status, COUNT(*) AS total_orders
FROM orders
GROUP BY status
ORDER BY total_orders DESC;

-- What are the most used payment method?
SELECT payment_mode, COUNT(*) AS total_orders
FROM orders
GROUP BY payment_mode
ORDER BY total_orders DESC;

-- Which cities hav emost customers?
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- How many products do w ehave per category ?
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;

-- REVENUE AND PROFIT ANALYSIS 

-- Total revenue per category 
SELECT p.category,
       SUM(p.selling_price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Total profit per category 
SELECT p.category,
       SUM((p.selling_price - p.cost_price) * oi.quantity) AS total_profit,
       ROUND(SUM((p.selling_price - p.cost_price) * oi.quantity) / 
       SUM(p.selling_price * oi.quantity) * 100, 2) AS profit_margin_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY total_profit DESC;

-- Top 5 best selling products by revenue 
SELECT p.product_name, p.category,
       SUM(oi.quantity) AS units_sold,
       SUM(p.selling_price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 5;

-- Monthly revenue trend 
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(p.selling_price * oi.quantity) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY month
ORDER BY month;

-- Revenue lost due to cancellation and returns 
SELECT o.status,
       COUNT(*) AS total_orders,
       SUM(p.selling_price * oi.quantity) AS lost_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status IN ('Cancelled', 'Returned')
GROUP BY o.status;

-- LETS DO CUSTOMER ANALYSIS

-- Top 5 customers by total spending 
SELECT c.customer_name, c.city,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(p.selling_price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_spent DESC
LIMIT 5;

-- Customer spending by gender 
SELECT c.gender,
       COUNT(DISTINCT c.customer_id) AS total_customers,
       SUM(p.selling_price * oi.quantity) AS total_revenue,
       ROUND(AVG(p.selling_price * oi.quantity), 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.gender;

-- Which age group spends the most 
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 32 THEN '26-32'
        WHEN age BETWEEN 33 AND 40 THEN '33-40'
        ELSE '40+'
    END AS age_group,
    COUNT(DISTINCT c.customer_id) AS customers,
    SUM(p.selling_price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY age_group
ORDER BY total_spent DESC;

-- Customers who never placed an oder 
SELECT c.customer_name, c.city, c.registration_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Repeat customers vs one time buyers 
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'One-time Buyer'
        WHEN order_count = 2 THEN 'Repeat Buyer'
        ELSE 'Loyal Customer'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders
    WHERE status = 'Delivered'
    GROUP BY customer_id
) AS customer_orders
GROUP BY customer_type;

-- Revenue by state
SELECT c.state,
       SUM(p.selling_price * oi.quantity) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.state
ORDER BY total_revenue DESC;

-- Top seller performance 
SELECT s.seller_name, s.rating,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(p.selling_price * oi.quantity) AS total_revenue
FROM sellers s
JOIN orders o ON s.seller_id = o.seller_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY s.seller_id, s.seller_name, s.rating
ORDER BY total_revenue DESC;

-- Delivery time analysis 
SELECT 
    ROUND(AVG(DATEDIFF(delivery_date, order_date)), 1) AS avg_delivery_days,
    MIN(DATEDIFF(delivery_date, order_date)) AS fastest_delivery,
    MAX(DATEDIFF(delivery_date, order_date)) AS slowest_delivery
FROM orders
WHERE status = 'Delivered';

-- Discount impact on revenue 
SELECT 
    CASE 
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.05 THEN 'Low (upto 5%)'
        WHEN discount <= 0.10 THEN 'Medium (6-10%)'
        ELSE 'High (10%+)'
    END AS discount_tier,
    COUNT(*) AS total_items,
    SUM(p.selling_price * oi.quantity) AS gross_revenue,
    SUM(p.selling_price * oi.quantity * (1 - oi.discount)) AS net_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY discount_tier
ORDER BY net_revenue DESC;