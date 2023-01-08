-- using the old table itself

-- * order of keyword
-- 1. FROM -> species starting set of rows to work with
-- 2. JOIN -> merges in data from additional tables
-- 3. WHERE -> filters the set of rows
-- 4. GROUP BY -> groups rows by a unique set of values
-- 4. HAVING -> filters the set of groups

-- Grouping ->
-- reduces many rows to down to fewer rows
-- done by using GROUP BY keywork

-- aggregate ->
-- reduces many values down to one
-- done by using aggeregate functions

SELECT user_id
  FROM COMMENTS
  GROUP BY user_id;

-- COUNT() -> returns the number of values in a group of values
-- SUM() -> finds the sum of a group of numbers
-- AVG() -> finds the average of a group of numbers
-- MIN() -> returns the minimum value from the group of numbers
-- MAX() -> returns the maximum value from the group of numbers


SELECT SUM(id)
  FROM comments 

-- combing aggerate and grouping can do wonders
-- as we can can show here no. of comments each users has done
-- we must use (*) wherever there is count to get all value including null one
SELECT user_id, COUNT(*) as num_comments_created
	FROM COMMENTS
  GROUP BY user_id;

-- get comments counts by photos
select photo_id, COUNT(*)
  FROM comments
  GROUP BY photo_id;

-- get author name along with number of book he is written from two table
select name, COUNT(*)
  FROM books
  JOIN authors ON author.id = book.author_id
  GROUP BY authors.name;


-- find the number of comments for each photo where the photo_id is less than 3 and the photo has more than 2 comments
select photo_id, COUNT(*)
  FROM comments
  WHERE comments.photo_id < 3
  GROUP BY photo_id
  HAVING COUNT(*) > 2;

-- find the users(user_ids) where the user has commented on the first 50 photos and the user added more than 20 comments on those photos
select user_id, COUNT(*)
  FROM comments
  WHERE comments.photo_id < 50
  GROUP BY user_id
  HAVING COUNT(*) > 20;

-- Given a table of phones, print the names of manufacturers and total revenue (price * units_sold) for all phones.  Only print the manufacturers who have revenue greater than 2,000,000 for all the phones they sold.
select manufacturer, SUM(price * units_sold) 
  from phones
  group by manufacturer
  having SUM(price * units_sold) > 2000000