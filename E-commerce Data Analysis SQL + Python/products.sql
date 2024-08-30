SELECT * FROM ecommerce.products;

select products.product_category,
count(order_items.product_id),
round(avg(order_items.price), 2)
from products join order_items
on products.product_id = order_items.product_id
group by products.product_category;

select products.product_category,
count(products.product_id),
round(avg(order_items.price),2)
from products
join order_items
on products.product_id = order_items.product_id
group by products.product_category;

select sum(payments.payment_value) from payments;

select sum(payment_value) from payments;

select round((sum(payments.payment_value) / (select sum(payment_value) from payments)) * 100, 2) 
as sales_percentage 
from payments;

select upper(products.product_category) category,
round((sum(payments.payment_value) / (select sum(payment_value) from payments)) * 100, 2) 
sales_percentage
from payments join order_items
on payments.order_id = order_items.order_id
join products
on products.product_id = order_items.product_id
group by category
order by sales_percentage desc; 
