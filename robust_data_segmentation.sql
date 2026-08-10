--Data segmentation 

select c.customer_key,
sum(s.sales_amount) as total_speanding,
min(order_date) as first_order,
max(order_date) as last_order,
datediff(year, min(order_date), max(order_date)) as lifespan 
from sales s
left join customers c 
on s.customer_key = c.customer_key 
group by c.customer_key 