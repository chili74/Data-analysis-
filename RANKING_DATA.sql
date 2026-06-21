--Ranking 

--which customers generate the highest sales revenue 

select top 5 
p.product_name,
sum(s.sales_amount) as total_revenue 
from sales s
left join products p on s.product_key = p.product_key
group by p.product_name 
order by total_revenue asc;


select * from (
  select 
  p.product_name,
  sum(s.sales_amount) as total_revenue
  row_number( ) over (order by sum(s.sales_amount) desc) as revenue_rank
  from sales s
  left join products p on s.product_key = p.product_key
  group by p.product_name) t
where revenue_rank <= 5