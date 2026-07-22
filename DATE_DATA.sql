--date exploration


SELECT 
MAX(birthdate) AS 'Youngest Customer Birthdate',
MIN(birthdate) AS 'Oldest Customer Birthdate',
datediff(year, MIN(birthdate), MAX(birthdate)) AS 'Age Difference in Years'
FROM customers




SELECT 
MAX(birthdate) AS 'Youngest Customer Birthdate',
DATEDIFF(year, MAX(birthdate), GETDATE()) AS 'Youngest Customer Age in Years',
MIN(birthdate) AS 'Oldest Customer Birthdate',
DATEDIFF(year, MIN(birthdate), GETDATE()) AS 'Oldest Customer Age in Years'
FROM customers;


--FIND FIRST AND LAST ORDERS
SELECT
MIN(order_date) AS 'First Order Date',
MAX(order_date) AS 'Last Order Date',
DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS 'Days Between First and Last Order'
FROM sales;