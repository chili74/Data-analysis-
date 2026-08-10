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
case when current_sales - avg(current_sales) over (partition by product_name) > 0 then 'Above average' 
     when current_sales - avg(current_sales) over (partition by product_name) < 0 then 'Below average' 
     else 'average' 
end avg_change,
lag(current_sales) over(partition by product_name order by order_year) py_sales,
current_sales - lag(current_sales) over (partition by product_name order by order_year) as diff_py,
case when current_sales - lag(current_sales) over (partition by product_name order by order_year) > 0 then 'Increase'
     when current_sales - lag(current_sales) over (partition by product_name order by order_year) < 0 then 'Decrease'
     else 'No Change'
end py_avg_change
from yearly_product_sales
order by product_name, order_year;
