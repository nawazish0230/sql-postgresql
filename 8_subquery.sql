-- list the price & name of the product that are more expensive than product in 'toys' department
SELECT * FROM products
	WHERE price > (
	SELECT MAX(price) FROM products WHERE department = 'Toys'
)

-- in this place we can write that type of query where send only one row & one column
-- we can add subquery as we are getting only one value from subquery
select name, price, (SELECT price FROM products
WHERE id = 3) as id_3_price
FROM products

-- write sub query in from clause
select name, price_weight_ratio
  FROM (SELECT name, price/weight as price_weight_ratio FROM products) AS p
  WHERE price_weight_ratio > 50;

-- find the average number of orders for all users
SELECT AVG(order_count)
	FROM (
  SELECT user_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY user_id
) as p

-- write sub query with join to find user name from different table
SELECT first_name
	FROM users
	JOIN (
    SELECT user_id FROM orders WHERE product_id = 3
  ) as o ON o.user_id = users.id;


-- show the id of orders that involve a product with a price/weight ratio greater than 200
SELECT id from orders 
  WHERE product_id IN (SELECT id FROM products WHERE price/weight > 200);

-- show the name of all the product with the price greater than the average product price 
SELECT name, price FROM products
	WHERE price > (SELECT AVG(price) from products);

-- show the name of all the product that are not in the same department as products with a price less than 100
SELECT name, department
FROM products
WHERE department NOT IN (
  SELECT department
  FROM products
  WHERE price < 100
)

-- show the name, department, price of the products that are not expensive than all products in the industrial department
SELECT name, department, price
FROM products
WHERE price > ALL (
  SELECT price
  FROM products
  WHERE department='Industrial'
)

-- show the name of the products that are more expensive than at least one product in the industrial department
SELECT name, department, price
FROM products
WHERE price > SOME(ANY) (
  SELECT price
  FROM products
  WHERE department='Industrial'
)

-- show the name, department, price of the most expensive product each department
SELECT name, department, price
FROM products AS p1
WHERE p1.price = (
  SELECT MAX(price)
  FROM products as p2
  WHERE p1.department=p2.department
)

-- use of select without from
SELECT (
  SELECT MAX(price) FROM products
) / (
  SELECT AVG(price) FROM products
)