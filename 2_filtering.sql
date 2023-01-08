-- we can use 
-- ==, <=, >=, <>,  <, BETWEEN, IN, NOT IN

SELECT name, area FROM cities WHERE area > 3000

SELECT name, area FROM cities WHERE area BETWEEN 2000 AND 3000

SELECT name, area FROM cities WHERE name IN ('Delhi', 'Jaipur')
SELECT name, area FROM cities WHERE name = 'Delhi' OR name = 'Jaipur'

SELECT name, area FROM cities WHERE name NOT IN ('Delhi')

SELECT name, area FROM cities WHERE area NOT IN (2000, 3000) OR name = 'Delhi';

-- calculating on the fly
SELECT name, population/area as population_density FROM cities WHERE population/area > 500;

-- updating
UPDATE cities SET population = 40000 WHERE name = 'Ranchi';

-- deleting item
DELETE FROM cities WHERE name = 'Delhi';