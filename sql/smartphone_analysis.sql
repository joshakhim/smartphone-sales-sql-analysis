-- =========================================
-- SMARTPHONE SALES SQL ANALYSIS PROJECT
-- =========================================
CREATE DATABASE `Smartphones_Analysis`;
USE `Smartphones_Analysis`;
-- =========================================
-- CREATE TABLES
-- =========================================
CREATE TABLE smartphones(
phone_id INT PRIMARY KEY,
    brand VARCHAR(50),
    price INT, 
    ram_gb INT,
    storage_gb INT,
    battery_mah INT,
    rating DECIMAL(2,1),
    model VARCHAR(100)
);
CREATE TABLE sales(
sales_id INT PRIMARY KEY,
    model VARCHAR(100),
    phone_id INT,
    quantity INT
    );
-- =========================================
-- INSERT DATA
-- =========================================
INSERT INTO smartphones
(phone_id, brand, model, price, ram_gb, storage_gb, battery_mah, rating)
VALUES (1, 'Samsung', 'Galaxy S24', 889000, 12, 256, 5000, 4.7),
(2, 'Apple', 'iPhone 15', 1900000, 8, 256, 4200, 4.8),
(3, 'Vivo', 'Vivo X100', 790000, 12, 512, 5100, 4.5),
(4, 'Xiaomi', 'Redmi Note 13', 300000, 8, 256, 5000, 4.4),
(5, 'Samsung', 'Galaxy A54', 490000, 8, 128, 4800, 4.3),
(6, 'Apple', 'iPhone 14', 1450000, 6, 128, 4000, 4.6),
(7, 'Vivo', 'Vivo V30', 580000, 12, 256, 5000, 4.4),
(8, 'Xiaomi', 'Xiaomi 14', 1300000, 16, 512, 5200, 4.7);

INSERT INTO sales
(sales_id,  model, phone_id, quantity)
VALUES
(1, 'Galaxy A54', 1, 5),
(2, 'iPhone 15', 2, 3),
(3, 'Vivo X100', 3, 7),
(4, 'Redmi Note 13', 4, 10),
(5, 'Galaxy A54', 5, 6),
(6, 'iphone 14', 6, 2),
(7, 'Vivo V30',  7, 8),
(8, 'xiaomi 14', 8, 4);
-- =========================================
-- BASIC REVENUE ANALYSIS
-- =========================================
SELECT sm.brand, sm.model, sm.price, (sa.quantity * sm.price) total_revenue
FROM smartphones sm 
JOIN sales sa
	ON sm.phone_id = sa.phone_id
    ORDER BY total_revenue DESC;
-- =========================================
-- BRAND PERFORMANCE ANALYSIS
-- =========================================
SELECT brand, model, price, AVG(price)
OVER(PARTITION BY brand) avg_brand_price,
CASE
	WHEN price > AVG(price)
OVER(PARTITION BY brand)
	THEN 'above brand price'
    ELSE 'below brand price'
END AS performance
FROM smartphones;
-- =========================================
-- WINDOW FUNCTION ANALYSIS
-- =========================================
SELECT
    s.brand,
    s.model,
    sa.quantity,
    s.price,
    (sa.quantity * s.price) AS total_revenue, 
    RANK() OVER(
        ORDER BY (sa.quantity * s.price) DESC
    ) AS revenue_rank
FROM smartphones s
JOIN sales sa
ON s.phone_id = sa.phone_id;

-- =========================================
-- REVENUE CONTRIBUTION ANALYSIS
-- =========================================
WITH revenue_table AS
(
SELECT
    sm.brand,
    sm.model,
    SUM(sa.quantity * sm.price) AS total_revenue
FROM smartphones sm
JOIN sales sa
ON sm.phone_id = sa.phone_id
GROUP BY sm.brand, sm.model
)
SELECT
    brand,
    model,
    total_revenue,
ROUND(
    total_revenue * 100.0 /
    SUM(total_revenue) OVER(), 2
    ) AS revenue_percentage
FROM revenue_table
ORDER BY revenue_percentage DESC;
-- =========================================
-- CUMULATIVE REVENUE ANALYSIS
-- =========================================
WITH revenue_table AS
(
SELECT
    sm.brand,
    sm.model,
    SUM(sa.quantity * sm.price) AS total_revenue
FROM smartphones sm
JOIN sales sa
	ON sm.phone_id = sa.phone_id
GROUP BY sm.brand, sm.model
)
SELECT
    brand,
    model,
    total_revenue,
SUM(total_revenue) OVER(
        ORDER BY total_revenue DESC
    ) AS cumulative_revenue
FROM revenue_table;
