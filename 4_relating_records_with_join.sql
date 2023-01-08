-- JOIN -> produces values by merging two rows from different related tables
-- aggreagte -> looks at many rows & calculate a single values
-- -> words like 'most', 'average', 'least' are the sign that you need to use an aggregation

-- order of table matters when we use left join / right join

-- four different types of joins (ref-4_join_types.pdf )
-- inner join(default), left join, right join, full join 

-- get all comments content along with username
SELECT contents, username FROM COMMENTS
  JOIN users ON users.id = comments.user_id;

-- get all comments content along with photo url (use of as)
SELECT comments.id as contents_id ,contents, url FROM comments
JOIN photos  as p on p.id =  comments.photo_id

-- get all comments which is created same user of photots
-- to find who commented in their own photos
SELECT url ,contents
FROM comments
FULL JOIN photos ON photos.id = comments.user_id
WHERE comments.user_id = photos.user_id;

-- join three table on the basis of user id
SELECT url ,contents, username
  FROM comments
  JOIN photos ON photos.id = comments.photo_id
  JOIN users ON users.id = comments.user_id AND users.id = photos.user_id;

