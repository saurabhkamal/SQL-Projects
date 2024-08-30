SELECT * FROM ecommerce.sellers;

select year(orders.order_purchase_timestamp) as years,
round(sum(payments.payment_value), 2) as payment 
from orders join payments
on orders.order_id = payments.order_id
group by years
order by years;

with a as (select customers.customer_id,
min(orders.order_purchase_timestamp) as first_order
from customers join orders
on customers.customer_id = orders.customer_id
group by customers.customer_id
)
select a.customer_id, count(distinct orders.order_purchase_timestamp)
from a join orders
on orders.customer_id = a.customer_id
and orders.order_purchase_timestamp > a.first_order
and orders.order_purchase_timestamp < date_add(a.first_order, interval 6 month)
group by a.customer_id;



with a as (select customers.customer_id,
min(orders.order_purchase_timestamp) as first_order
from customers join orders
on customers.customer_id = orders.customer_id
group by customers.customer_id
)
select a.customer_id, count(distinct orders.order_purchase_timestamp)
from a join orders
on orders.customer_id = a.customer_id
and orders.order_purchase_timestamp > a.first_order
and orders.order_purchase_timestamp < date_add(a.first_order, interval 8 month)
group by a.customer_id;


with a as (select customers.customer_id,
min(orders.order_purchase_timestamp) as first_order
from customers join orders
on customers.customer_id = orders.customer_id
group by customers.customer_id
)
select a.customer_id, count(distinct orders.order_purchase_timestamp)
from a join orders
on orders.customer_id = a.customer_id
and orders.order_purchase_timestamp > a.first_order
and orders.order_purchase_timestamp < date_add(a.first_order, interval 18 month)
group by a.customer_id;


with a as (select customers.customer_id,
min(orders.order_purchase_timestamp) as first_order
from customers join orders
on customers.customer_id = orders.customer_id
group by customers.customer_id
),
b as (select a.customer_id, count(distinct orders.order_purchase_timestamp) next_order
from a join orders
on orders.customer_id = a.customer_id
and orders.order_purchase_timestamp > a.first_order
and orders.order_purchase_timestamp < date_add(a.first_order, interval 6 month)
group by a.customer_id)
select 100 * (count(distinct a.customer_id) / count(distinct b.customer_id))
from a left join b
on a.customer_id = b.customer_id;
