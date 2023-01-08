https://pg-sql.com/

-- for creating table
CREATE TABLE cities(
  name VARCHAR(50),
  country VARCHAR(50),
  population INTEGER,
  area INTEGER
)

-- insert value
INSERT INTO cities(name, country, population, area)
	VALUES
  ('Delhi', 'India', 2081123, 2240),
  ('Bangalore', 'India', 2040123, 2540),
  ('Jaipur', 'India', 1091543, 3240),
  ('Ranchi', 'India', 33435, 4240),

SELECT name || ', ' || place as location from <tablename>
SELECT concat(UPPER(name), ', ' , place) as location from <tablename>
SELECT UPPER(concat(name, ', ' , place)) as location from <tablename>

-- update table column 
ALTER TABLE products
ALTER COLUMN price
SET NOT NULL;

-- update table data
UPDATE products
SET price = 999
WHERE price is NULL