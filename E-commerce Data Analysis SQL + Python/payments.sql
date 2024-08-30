SELECT * FROM ecommerce.payments;


select
	(sum(case
		when payment_installments > 1 then 1 else 0 end))/count(*)*100
from payments;

select customer_id, order_purchase_timestamp, payment,
avg(payment) over(partition by customer_id order by order_purchase_timestamp
rows between 2 preceding and current row) as mov_avg
from
(
select orders.customer_id, orders.order_purchase_timestamp, 
payments.payment_value as payment
from payments join orders
on payments.order_id = orders.order_id) as a;


select years, months, payment, 
sum(payment) over (order by years, months) cumulative_sales from
(select year(orders.order_purchase_timestamp) as years,
month(orders.order_purchase_timestamp) as months,
round(sum(payments.payment_value), 2) as payment 
from orders join payments
on orders.order_id = payments.order_id
group by years, months order by years, months) as a;


select year(orders.order_purchase_timestamp) as years,
	   month(orders.order_purchase_timestamp) as months,
       round(sum(payments.payment_value), 2) as payment
from orders
join payments
on orders.order_id = payments.order_id
group by years, months
order by years, months;

select years, months, payment,
	   sum(payment) over(order by years, months) cumulative_sales
from(select year(orders.order_purchase_timestamp) as years,
	   month(orders.order_purchase_timestamp) as months,
       round(sum(payments.payment_value), 2) as payment
from orders
join payments
on orders.order_id = payments.order_id
group by years, months
order by years, months) as a;

select year(orders.order_purchase_timestamp) as years,
       round(sum(payments.payment_value), 2) as payment
from orders
join payments
on orders.order_id = payments.order_id
group by years
order by years;

with a as(
select year(orders.order_purchase_timestamp) as years,
       round(sum(payments.payment_value), 2) as payment
from orders
join payments
on orders.order_id = payments.order_id
group by years
order by years
)
select years,
	   payment,
       lag(payment, 1) over(order by years) previous_year,
       round(((payment - lag(payment, 1) over(order by years)) / lag(payment, 1) over(order by years)) * 100, 2) as yoy_growth
from a;


