--Part-to-whole 
with caregory_sales as (
select 
p.category,
sum(s.sales_amount) as total_sales
from sales s
left join products p
on p.product_key = s.product_key
group by category)

select
category,
total_sales,
sum(total_sales) over() as sales_overall,
concat(round((cast (total_sales as float) / sum(total_sales) over())*100, 2), '%') as sales_percentage
from caregory_sales
order by total_sales 



