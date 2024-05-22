SELECT * FROM etl_db.retail_orders;

-- Find top 10 highest revenue generating products
SELECT product_id, SUM(quantity*sale_price) AS revenue
FROM retail_orders
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;

-- Find top 5 highest selling products in each region
WITH cte as
(SELECT region, product_id, SUM(quantity) AS qty_sold
FROM retail_orders
GROUP BY region, product_id
ORDER BY region, qty_sold DESC),

cte2 as
(select *, DENSE_RANK() over(partition by region order by qty_sold desc) as d_rank
from cte)

select region, product_id, qty_sold
from cte2
where d_rank <= 5;

-- Find MoM growth comparison for 2022 and 2023 sales, e.g. Jan 2022 vs. Jan 2023
with cte as
(select month(order_date) AS order_month, 
	   year(order_date) AS order_year, 
       sum(sale_price*quantity) as sales
from retail_orders
group by order_month, order_year
order by order_month)

select order_month, 
	   sum(case when order_year = 2022 then sales else 0 end) as '2022 sales',
	   sum(case when order_year = 2023 then sales else 0 end) as '2023 sales'
from cte
group by order_month;

-- For each category which month had highest sales
with cte as
(select category, date_format(order_date, "%M %Y") as mon_yr, sum(sale_price) as sales
from retail_orders
group by category, mon_yr)

select Category, mon_yr as HighestSellingMonth, Sales from
(select *, dense_rank() over(partition by category order by sales desc) as d_rank
from cte) d
where d.d_rank = 1;

-- Find which sub-category saw highest growth by profit in 2023 compared to 2022
with cte as
(select sub_category, 
		sum(case when year(order_date) = 2022 then profit else 0 end) as `2022 profit`,
	    sum(case when year(order_date) = 2023 then profit else 0 end) as `2023 profit`
from retail_orders
group by sub_category)

select Sub_category, `Growth%` from
(select *, round(((`2023 profit`-`2022 profit`)/`2022 profit`)*100, 2) as `Growth%`
from cte) d
order by `Growth%` DESC
LIMIT 1;
