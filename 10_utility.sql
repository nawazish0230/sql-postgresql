-- compute the cost to ship each item 
-- shipping is the maximum of (weight * $2) or $30
SELECT name, GREATEST(30, weight * 2) as cost_to_ship FROM products;

-- use of least
SELECT name, LEAST(400, price * 0.2) as cost_to_ship FROM products;

-- print each product and its price, also print a description of the price
-- if price > 600 then 'high' if price > 300 then 'medium' else 'cheap'
SELECT name, price,
	CASE
    WHEN price > 600 THEN 'high'
    WHEN price > 300 THEN 'low'
    ELSE 'cheap'
  END
FROM products