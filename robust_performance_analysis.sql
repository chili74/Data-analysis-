--performance analysis

with yearly_product_sales as (
select 
year(s.order_date) as order_year,
p.product_name,
sum(s.sales_amount) as current_sales
from sales s
left join products p on s.product_key = p.product_key
where s.order_date is not null 
group by year(s.order_date), p.product_name
)

select 
order_year,
product_name,
current_sales,
avg(current_sales) over (partition by product_name) as avg_sale,
current_sales - avg(current_sales) over (partition by product_name) as avg_diff,
case when current_sales - avg(current_sales) over (partition by product_name) > 0 then 'above average' 
     when current_sales - avg(current_sales) over (partition by product_name) < 0 then 'below average' 
     else 'average' 
end sales_performance
from yearly_product_sales
order by product_name, order_year;