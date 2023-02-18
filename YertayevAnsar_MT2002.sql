1)
SELECT order_id, order_date, shipped_date, (SELECT contact_name from customers 
WHERE customers.customer_id = orders.customer_id) 
FROM orders
WHERE SHIPPED_DATE between '1996-12-01' and '1996-12-31'
ORDER BY order_id asc

2)
SELECT customer_id,contact_name,postal_code
FROM customers
WHERE postal_code NOT IN (SELECT postal_code FROM employees)

3)
SELECT customers.contact_name,orders.shipped_date,products.product_name,categories.category_name,order_details.unit_price,order_details.quantity,FLOOR(order_details.quantity*order_details.unit_price) as total_price
FROM categories
INNER JOIN products ON products.category_id=categories.category_id
INNER JOIN order_details On order_details.product_id=products.product_id
INNER JOIN orders ON orders.order_id=order_details.order_id
INNER JOIN customers ON customers.customer_id=orders.customer_id
WHERE categories.category_name = 'Dairy Products';
4)
SELECT avg(order_details.quantity*order_details.unit_price) as avg_price
FROM categories
INNER JOIN products ON products.category_id=categories.category_id
INNER JOIN order_details On order_details.product_id=products.product_id
WHERE order_details.quantity*order_details.unit_price>16 and products.units_in_stock>12
GROUP BY order_details.product_id

5)
SELECT order_id,order_details.quantity*order_details.unit_price as total_price 
FROM order_details
JOIN products ON order_details.product_id=products.product_id
WHERE product_name IN ('Queso Cabrales','Pavlova')
ORDER BY total_price asc



