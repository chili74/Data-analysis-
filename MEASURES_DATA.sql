--MEASURES EXPLORATION

--MEASURE: Total Sales Amount
SELECT SUM(sales_amount) AS Total_Sales_Amount FROM sales;

--MEASURE: Total Quantity Sold
SELECT SUM(quantity) AS Total_Quantity FROM sales;

--MEASURE: Average Price
SELECT AVG(price) AS Average_Price FROM sales;

--MEASURE: Total Orders and Unique Sales Days
SELECT COUNT(DISTINCT order_number) AS Total_Orders FROM sales;
SELECT COUNT(DISTINCT order_date) AS Total_Days_of_Sales FROM sales;

--MEASURE: Total Sales Transactions and Unique Products
SELECT COUNT(order_date) AS Total_Sales_Transactions FROM sales;
	
--MEASURE: Total Products Sold and Unique Products Sold
SELECT COUNT(PRODUCT_NAME) AS Total_Products FROM sales;
SELECT COUNT(DISTINCT PRODUCT_NAME) AS Unique_Products FROM sales;

--MEASURE: Total Customers and Unique Customers
SELECT COUNT(DISTINCT CUSTOMER_KEY) AS Unique_Customers FROM sales;

--MEASURE: Total Sales Amount and Unique Sales Amounts
SELECT SUM(sales_amount) AS Total_Sales_Amount FROM sales;
SELECT COUNT(DISTINCT sales_amount) AS Unique_Sales_Amounts FROM sales;


--GENERATE A REPORT THAT SHOWS ALL KETY METRICS OF THE BUSINESS

SELECT 'TOTAL SALES AMOUNT' AS Metric, SUM(sales_amount) AS Value FROM sales
UNION ALL
SELECT 'TOTAL QUANTITY SOLD', SUM(quantity) FROM sales
UNION ALL
SELECT 'AVERAGE PRICE', AVG(price) FROM sales
UNION ALL
SELECT 'TOTAL ORDERS', COUNT(DISTINCT order_number) FROM sales
UNION ALL
SELECT 'TOTAL DAYS OF SALES', COUNT(DISTINCT order_date) FROM sales
UNION ALL
SELECT 'TOTAL SALES TRANSACTIONS', COUNT(order_date) FROM sales;
