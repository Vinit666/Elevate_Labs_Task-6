-- sales_trend.sql

-- 1. Create the table (adjust data types as needed)
CREATE TABLE online_sales (
    order_id VARCHAR(20),
    order_date DATETIME,
    product_id VARCHAR(20),
    amount DECIMAL(10,2)
);

-- Note: Import the CSV (online_sales.csv) using MySQL Workbench’s Data Import Wizard or using LOAD DATA INFILE:
-- Example:
-- LOAD DATA INFILE '/path/to/online_sales.csv'
-- INTO TABLE online_sales
-- FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (order_id, order_date, product_id, amount);

-- 2. View Sample Data
SELECT * FROM online_sales LIMIT 10;

-- 3. Add Sample Data (Jan to Nov 2010)
INSERT INTO online_sales (order_id, order_date, amount, product_id)
VALUES
('100001', '2010-01-05', 120.50, 'P1001'),
('100002', '2010-01-12', 200.00, 'P1002'),
('100003', '2010-01-18', 150.75, 'P1003'),
('100004', '2010-01-20', 110.00, 'P1004'),
('100005', '2010-01-25', 90.25, 'P1005'),
('100006', '2010-01-30', 180.00, 'P1006'),
('100007', '2010-01-30', 250.00, 'P1007'),
('100008', '2010-01-15', 99.99, 'P1008'),
('100009', '2010-01-08', 77.77, 'P1009'),
('100010', '2010-01-22', 105.50, 'P1010'),
('100011', '2010-02-03', 130.00, 'P1011'),
('100012', '2010-02-10', 175.25, 'P1012'),
('100013', '2010-02-18', 165.50, 'P1013'),
('100014', '2010-02-21', 142.75, 'P1014'),
('100015', '2010-02-28', 195.00, 'P1015'),
('100016', '2010-03-02', 210.00, 'P1016'),
('100017', '2010-03-07', 185.00, 'P1017'),
('100018', '2010-03-15', 160.50, 'P1018'),
('100019', '2010-03-22', 145.75, 'P1019'),
('100020', '2010-03-29', 200.00, 'P1020'),
('100021', '2010-04-04', 100.00, 'P1021'),
('100022', '2010-04-11', 110.50, 'P1022'),
('100023', '2010-04-19', 95.25, 'P1023'),
('100024', '2010-04-24', 190.00, 'P1024'),
('100025', '2010-05-01', 220.75, 'P1025'),
('100026', '2010-05-06', 130.99, 'P1026'),
('100027', '2010-05-10', 120.50, 'P1027'),
('100028', '2010-05-15', 195.00, 'P1028'),
('100029', '2010-06-03', 175.25, 'P1029'),
('100030', '2010-06-12', 205.99, 'P1030'),
('100031', '2010-06-21', 88.00, 'P1031'),
('100032', '2010-07-08', 115.25, 'P1032'),
('100033', '2010-07-14', 178.90, 'P1033'),
('100034', '2010-07-20', 130.00, 'P1034'),
('100035', '2010-08-02', 160.75, 'P1035'),
('100036', '2010-08-10', 143.00, 'P1036'),
('100037', '2010-08-18', 170.00, 'P1037'),
('100038', '2010-09-05', 190.50, 'P1038'),
('100039', '2010-09-14', 99.99, 'P1039'),
('100040', '2010-09-23', 155.00, 'P1040'),
('100041', '2010-10-01', 215.00, 'P1041'),
('100042', '2010-10-11', 135.00, 'P1042'),
('100043', '2010-10-21', 185.50, 'P1043'),
('100044', '2010-11-06', 160.00, 'P1044'),
('100045', '2010-11-13', 200.00, 'P1045'),
('100046', '2010-11-26', 175.25, 'P1046');


-- 4. Monthly Revenue & Order Volume Analysis
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- 5. Top 3 Months by Revenue
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY order_year, order_month
ORDER BY monthly_revenue DESC
LIMIT 3;

