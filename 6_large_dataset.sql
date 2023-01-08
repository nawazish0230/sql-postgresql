-- write the query to show number of paid & unpaid orders
select paid, count(*)
  FROM orders
  GROUP BY paid;

-- join together the users & orders tables, print the first_name, last_name, paid, of each user then whether or not they have paid for thier order
select first_name, last_name, paid 
  FROM users
  JOIN orders ON orders.user_id = users.id;

-- sorting on the basis of price
SELECT * FROM products
  ORDER BY price DESC;

-- sorting on the basis of alphabet
SELECT * FROM products
  ORDER BY name;

-- sorting on sub items if price is same
SELECT * FROM products
  ORDER BY price, weight;

-- skipping the item by given number
SELECT * FROM users
  OFFSET 40;

-- limiting the item by given number and offset as well (pagination)
SELECT * FROM users
  LIMIT 5 OFFSET 40 ;

-- get 5 most expensive  product
SELECT * FROM products
  ORDER BY price DESC
	LIMIT 5;

-- Write a query that shows the names of only the second and third most expensive phones.
select name from phones
  order by price desc
  limit 2 offset 1;