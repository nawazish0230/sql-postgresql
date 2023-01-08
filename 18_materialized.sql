`Views ->
Query that gets executed every time you refer to it.

Materialized Views ->
Query that gets executed only at very specific times, but the results are saved and can be reference without rerunning it
`

-- for each week, show the number of likes that posts and comments recieved. Use the post and comment created_at date, not when the like was received
-- we need to do 3 way join (left join)

SELECT 
  data_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
  COUNT(posts.id) AS num_likes_for_posts,
  COUNT(comments.id) AS num_comments_for_posts,
FROM likes
LEFT JOIN posts ON posts.id = likes.post_id
LEFT JOIN comments ON comments.id = likes.comment_id
GROUP BY week;
ORDER BY week;

-- using this we will get number of likes and comments in each week


-- create materialized view
CREATE MATERIALIZED VIEW weekly_likes AS (
  SELECT 
    data_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
    COUNT(posts.id) AS num_likes_for_posts,
    COUNT(comments.id) AS num_comments_for_posts,
  FROM likes
  LEFT JOIN posts ON posts.id = likes.post_id
  LEFT JOIN comments ON comments.id = likes.comment_id
  GROUP BY week;
  ORDER BY week;
) WITH DATA;

SELECT * from weekly_likes;

-- update materialized view data
REFRESH MATERIALIZED VIEW weekly_likes;


