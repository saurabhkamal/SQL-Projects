SELECT * FROM ecommerce.order_items; 

select orders.order_id, orders.customer_id, count(order_items.orders_id) as oc
from orders join order_items
on orders.order_id = order_items.order_id
group by orders.order_id, orders.customer_id;


select upper(products.product_category) category,
round(sum(payments.payment_value), 2) sales
from products join order_items
on products.product_id = order_items.product_id
join payments
on payments.order_id = order_items.order_id
group by category;

select sum(payment_value) from payments;

select upper(products.product_category) category,
round((sum(payments.payment_value) / (select sum(payment_value) from payments))*100,2) sales_percentage
from products join order_items
on products.product_id = order_items.product_id
join payments
on payments.order_id = order_items.order_id
group by category
order by sales_percentage desc;