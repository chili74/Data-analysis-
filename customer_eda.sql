SELECT country, COUNT(customer_key) AS customer_count
FROM customers
GROUP BY country
order BY customer_count DESC;

SELECT GENDER, COUNT(customer_key) AS customer_count
FROM customers
GROUP BY GENDER
ORDER BY customer_count DESC;

SELECT category, COUNT(product_key) AS product_count
FROM products
GROUP BY category
ORDER BY product_count DESC;

SELECT category, AVG(cost) AS average_cost
FROM products
GROUP BY category
ORDER BY average_cost DESC;

SELECT category, SUM(sales_amount) AS total_sales
from sales
left join products on sales.product_key = products.product_key
group by category 
order by total_sales DESC;

SELECT c.customer_key, c.first_name, c.last_name, sum(s.sales_amount) AS total_sales
from sales s
left join customers c on s.customer_key = c.customer_key
group by c.customer_key, c.first_name, c.last_name
order by total_sales DESC;

SELECT c.country, sum(quantity) AS total_quantity
from sales 
left join customers c on sales.customer_key = c.customer_key
group by c.country
order by total_quantity DESC;

