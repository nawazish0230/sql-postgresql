-- DISTINCT gives unique value from table
SELECT DISTINCT department FROM products;

-- gives unique value count
SELECT COUNT(DISTINCT department) FROM products;

-- get unique combination of name and department, here department may repeat
SELECT DISTINCT department, name FROM products;