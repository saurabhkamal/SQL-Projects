use Project

select * from [dbo].[orders_data]

select * from orders_data

--1. List all the distinct cities where orders have been shipped.
select distinct city from orders_data

--2. Calculate the total selling price and profits for all orders.
select[Order Id], sum(quantity*Unit_Selling_Price) as 'Total Selling Price',
      cast(sum(quantity*unit_profit) as decimal(10,2)) as 'Total Profit'
from orders_data
group by [Order Id]
order by [Total Profit] desc

-- 3. Finding all orders from the 'Technology' that were shipped using 'second class' ship mode, ordered by order date
select [order id],[order date],[category],[ship mode]
from orders_data
where [category] = 'Technology' and [ship mode] = 'Second Class'
order by [order date]

-- 4. Finding the average order value
select cast(avg(quantity * unit_selling_price) as decimal(10,2)) as Avg_Order_Value
from orders_data

-- 5. Finding the city with the highest total quantity of products ordered.
select top 5 city, sum(quantity) as 'Total Quantity'
from orders_data
group by city
order by [Total Quantity] desc

-- 6. Rank Orders in each region by quantity in descending order.
select [order id],region,quantity as 'Total_Quantity',
dense_rank() over(partition by region order by quantity desc) as rnk
from orders_data
order by region, rnk

-- 7. List the total value for the orders placed in the first quarter of any year.
-- Extracting month
select [order id], [order date], month([order date]) as month
from orders_data

select YEAR([Order Date]) AS [Year], sum(Quantity*unit_selling_price) as 'Total Value'
from orders_data
where month([order date]) in (1,2,3)
group by YEAR([Order Date])
order by [Total Value]

-- 8. Top 10 highest profit generating products
select top 10 [product id], cast(sum([Total Profit]) as decimal(10,2)) as profit
from orders_data
group by [Product Id]
order by profit desc

-- alternate -> using window function
with cte as (
select [Product Id], sum([Total Profit]) as profit,
       ROW_NUMBER() over (order by sum([Total Profit]) desc) as rn
from orders_data
group by [Product Id]
)
select [product id], profit
from cte 
where rn<=10

select * from orders_data

-- 9. Finding top 3 highest selling products in each region

with cte as(
select region, [product id], sum(quantity*Unit_Selling_Price) as sales,
	   row_number() over(partition by region order by sum(quantity*unit_selling_price) desc) as rn
from [orders_data]
group by region, [Product Id]
)
select * 
from cte
where rn<=3

--10. Finding top 3 highest selling products in each region according to quantity

with cte as(
select region, [product id], quantity,
	   row_number() over(partition by region order by quantity desc) as rn
from [orders_data]
group by region, [product id], Quantity
)
select *
from cte
where rn<=3

-- 11. Finding Total Sales in each Region

select * from orders_data

select region, cast(sum(unit_selling_price*quantity) as decimal (10,2)) as [total sales]
from orders_data
group by region
order by [total sales] desc

-- 12. Finding top 5 highest selling products in each region according to sales
select * from orders_data

with cte as(
select  region, [product id], sum(unit_selling_price*quantity) as sales,
        row_number() over(partition by region order by sum(quantity*unit_selling_price) desc) as rn
from [orders_data]
group by region, [product id]
) 
select * 
from cte
where rn<=5

-- 13. Finding month over month growth comparison for 2022 and 2023 sales (Jan 2022 vs Jan 2023)

with cte as (
select year([order date]) as order_year, 
	   month([order date]) as order_month,
       sum(quantity*unit_selling_price) as sales
from orders_data
group by year([order date]), month([order date])
)
select order_month,
	cast(sum(case when order_year=2022 then sales else 0 end) as decimal (10,2)) as sales_2022,
	cast(sum(case when order_year=2023 then sales else 0 end) as decimal (10,2)) as sales_2023
from cte
group by order_month
order by order_month


with cte as (
select year([order date]) as order_year, 
	   month([order date]) as order_month,
       sum(quantity*unit_selling_price) as sales
from orders_data
group by year([order date]), month([order date])
)
select 
	case order_month
	WHEN 1 THEN 'January'
	WHEN 2 THEN 'February'
	WHEN 3 THEN 'March'
	WHEN 4 THEN 'April'
	WHEN 5 THEN 'May'
	WHEN 6 THEN 'June'
	WHEN 7 THEN 'July'
	WHEN 8 THEN 'August'
	WHEN 9 THEN 'September'
	WHEN 10 THEN 'October'
	WHEN 11 THEN 'November'
	WHEN 12 THEN 'December'
end as month_name,
	cast(sum(case when order_year=2022 then sales else 0 end) as decimal (10,2)) as sales_2022,
	cast(sum(case when order_year=2023 then sales else 0 end) as decimal (10,2)) as sales_2023,
	CONCAT(
        cast(
            (SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) -
             SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END)) * 100.0 /
            NULLIF(SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END), 0)
        AS DECIMAL(10,2)), '%'
    ) AS YoY_growth_percentage
from cte
group by order_month
order by order_month

-- 14. For each category which month has the highest sale

select * from orders_data


with cte as(
select category, 
       year([order date]) as year,
       month([order date]) as month, 
	   sum(Quantity*Unit_selling_price) as Highest_Sale,
       row_number() over(partition by category order by sum(Quantity*Unit_selling_price) desc) as rn
from orders_data
group by category, year([order date]),month([order date])
)
select category, year, month,
	   Highest_Sale as [Highest Sale]
from cte
where rn = 1


with cte as(
select category, 
       year([order date]) as year,
       month([order date]) as month, sum(Quantity*Unit_selling_price) as Highest_Sale,
       row_number() over(partition by category order by sum(Quantity*Unit_selling_price) desc) as rn
from orders_data
group by category, year([order date]), month([order date])
)
select category,
	case month
	WHEN 1 THEN 'January'
	WHEN 2 THEN 'February'
	WHEN 3 THEN 'March'
	WHEN 4 THEN 'April'
	WHEN 5 THEN 'May'
	WHEN 6 THEN 'June'
	WHEN 7 THEN 'July'
	WHEN 8 THEN 'August'
	WHEN 9 THEN 'September'
	WHEN 10 THEN 'October'
	WHEN 11 THEN 'November'
	WHEN 12 THEN 'December'
end as month_name,
Highest_Sale as [Highest Sale]
from cte
where rn = 1

====================================================END OF CODE=============================================================