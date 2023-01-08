`As we have created photo_tags and caption_tags different different tags bt utlimately we need to merge both table
so, cant we merge both table to avoid repeating UNION code

1) we can create new table and merge both table into new one 
- by doing this existing code will be break,
- there would be repetetion of id it start from 1

2) so here comes the solution by CREATING A VIEW
in this we will create a fake tags table by merging caption_tags & photo_tags and we can used VIEW table directly while writing query
- Create a fake table that has rows from other tables
- these can be exact rows as they exist on another table, or a computed value
- can reference the view in any place where we'd normally reference a table 
- view doesn't actually create a new table or move any data around
- doesn't have to be used for a union! can compute absolutely any values
`

-- creating tags table by combining two table and we can use it later by tags name
CREATE VIEW tags AS(
  SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
  UNION ALL
  SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tags
)

-- using view
SELECT username, COUNT(*)
FROM users
JOIN tags ON tags.user_id = users.id
GROUP BY username
ORDER BY COUNT(*) DESC;

-- get view 10 recent post 
CREATE VIEW recents_posts AS((
  SELECT * FROM posts ORDER BY created_at DESC LIMIT 10
))

-- get recent posts from view 
select * from recents_posts

-- updating VIEWS
CREATE OR REPLACE VIEW recents_post AS (
  SELECT * FROM posts ORDER BY created_at DESC LIMIT 15
)

-- delete view
DROP VIEW recent_posts



