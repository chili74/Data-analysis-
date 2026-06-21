create view products_report as 
with base_query as (
select 
s.order_number,
s.order_date,
s.customer_key,
s.sales_amount,
s.quantity,
p.product_key,
p.product_name,
p.category,
p.subcategory,
p.cost

from sales s
left join products p 
on p.product_key = s.product_key
where order_date is not null

),

product_aggregations as ( 

--summarising key metrics at customer level

select 
product_key, 
product_name,
category,
subcategory,
cost,
sum(sales_amount) as total_sales,
sum(quantity) as total_quantity,
count(distinct order_number) as total_orders,
count(distinct customer_key) as total_customers,
max(order_date) as last_sale_date,
datediff(month, min(order_date), max(order_date)) as lifespan, 
round(avg(cast(sales_amount as float) / nullif(quantity, 0)), 1) as avg_selling_price
from base_query
group by product_key, 
         product_name, 
         category,
         subcategory,
         cost
) 
select 
product_key,
product_name,
category,
subcategory,
cost,
last_sale_date,
datediff(month, last_sale_date, getdate()) as days_since_last_order,
case 
     when total_sales >= 50000 then 'High Value'
     when total_sales >= 10000 then 'Medium Value'
     else 'Low Value'
end as product_segment,
lifespan,
total_orders,
total_sales,
total_quantity,
total_customers,
avg_selling_price,

--compute average order value
case 
     when total_orders = 0 then 0
     else total_sales / total_orders 
end as avg_order_value,

--compute average monthly sales
case 
     when lifespan = 0 then 0
     else total_sales / lifespan 
end as avg_monthly_sales

from product_aggregations;