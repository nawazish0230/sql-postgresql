UNION -> Join together the two queries and remove duplicate;
UNION ALL -> Join together the two queries ;
INTERSECT -> find the rows common in the result of two queries remove duplicates;
INTERSECT ALL -> find the rows common in the result of two queries;
EXCEPT (order matters)-> find the rows that are present in first query but not in second query remove duplicates;
EXCEPT ALL (order matters)-> find the rows that are present in first query but not in second query;

-- find the 4 product with the highest price & and 4 product with the heightest price/weight ratio
-- * (ALL) if we dont want to remove duplicate
(SELECT * FROM products
  ORDER BY price DESC
  LIMIT 4)
UNION ALL
(SELECT * FROM products
  ORDER BY price/weight DESC
  LIMIT 4)


(SELECT * FROM products
  ORDER BY price DESC
  LIMIT 4)
INTERSECT
(SELECT * FROM products
  ORDER BY price/weight DESC
  LIMIT 4)


(SELECT * FROM products
  ORDER BY price DESC
  LIMIT 4)
EXCEPT
(SELECT * FROM products
  ORDER BY price/weight DESC
  LIMIT 4)