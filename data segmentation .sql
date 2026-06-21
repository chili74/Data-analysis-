/* segment products into cost ranges and 
count how many products fall into eacg segmenty*/

with product_segments as ( 
SELECT 
product_key, 
product_name,
cost, 
Case when cost < 100 then 'Below 100'
     when cost between 100 and 500 then '100-500'
     when cost between 500 and 1000 then '500-1000' 
     else 'above 1000' 
End cost_range 
from products) 

select 
cost_range,
count(product_key) as total_products 
from product_segments
group by cost_range
order by total_products desc 


/* GRoup custromers into three based on 
-VIP 
-Regular
-New 
and find the total number of customers by each group */


with customer_spending as (
select 
c.customer_key,
sum(s.sales_amount) as total_spending,
max(s.order_date) as latest_order_date,
min(s.order_date) as oldest_order_date,
datediff(day, min(s.order_date), max(s.order_date)) as lifespan
From customers c
left join sales s on c.customer_key = s.customer_key
group by c.customer_key
order by total_spending desc
)
select 
customer_key,
total_spending,
lifespan,
case when total_spending >= 5000 then 'VIP'
     when total_spending between 1000 and 5000 then 'Regular'
     else 'New' 
end as customer_segment
from customer_spending;



--gemini
WITH customer_spending AS (
    SELECT 
        c.customer_key,
        COALESCE(SUM(s.sales_amount), 0) AS total_spending,
        MAX(s.order_date) AS latest_order_date,
        MIN(s.order_date) AS oldest_order_date,
        DATEDIFF(day, MIN(s.order_date), MAX(s.order_date)) AS lifespan
    FROM customers c
    LEFT JOIN sales s ON c.customer_key = s.customer_key
    GROUP BY c.customer_key
)
SELECT 
    customer_key,
    total_spending,
    lifespan,
    CASE 
        WHEN total_spending >= 5000 THEN 'VIP'
        WHEN total_spending >= 1000 THEN 'Regular'
        ELSE 'New' 
    END AS customer_segment
FROM customer_spending
ORDER BY total_spending DESC;


WITH customer_spending AS (
    SELECT 
        c.customer_key,
        COALESCE(SUM(s.sales_amount), 0) AS total_spending,
        MAX(s.order_date) AS latest_order_date,
        MIN(s.order_date) AS oldest_order_date,
        DATEDIFF(day, MIN(s.order_date), MAX(s.order_date)) AS lifespan
    FROM customers c
    LEFT JOIN sales s ON c.customer_key = s.customer_key
    GROUP BY c.customer_key
)
    SELECT 
        customer_segment,
        count(customer_key) as total_customers
    from( 
       SELECT customer_key,
        CASE 
            WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
            WHEN lifespan >= 12 AND total_spending  <= 5000 THEN 'Regular'
            ELSE 'New' 
        END AS customer_segment
    FROM customer_spending )t
group by customer_segment
order by total_customers desc