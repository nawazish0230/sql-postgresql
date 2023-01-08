=> COMMON TABLE EXPRESSION

-- query to get username and tags when it created from caption_tags, photo_tags and users table
select username, tags.created_at
from users
join (
	select user_id, created_at from caption_tags
	union all
	select user_id, created_at from photo_tags
) as tags on tags.user_id = users.id
where tags.created_at  < '2010-01-07'


=> CTE way to writing same query
with tags as(
	select user_id, created_at from caption_tags
	union all
	select user_id, created_at from photo_tags
)
select username, tags.created_at
from users
join tags on tags.user_id = users.id
where tags.created_at  < '2010-01-07'

=> by doing this way nothing would be changed and time taken to execute query would also be the same
-> defined with a 'WITH' before a main query
-> produces a table that we can refer to anywhere else (name tags)
-> simple form used to make a query easier to understand
-> * recursive forms used to write queries that are otherwise impossible to write 


'=> Important notes on Recursive CTE
1) very, very different from simple CTE
2) useful anytime you have a tree or graph-type structure
3) must have 'UNION' keyword simple CTE dont have to use a union
4) this is super, super advanced, I dont expect you to be able to write your
own recursive CTEs, just understand that they exist'

*RECURSIVE 
WITH RECURSIVE countdown(val) AS (
  SELECT 3 as val  -- Initial, non recursive query
  UNION
  SELECT val - 1 FROM countdown WHERE val > 1   --Recursive query
)
SELECT * from countdown


-- when we need to show list of 1st connection follower and then 2nd connection and so on..
WITH RECURSIVE suggestions(leader_id, follower_id, depth) AS (
		SELECT leader_id, follower_id, 1 AS depth
		FROM followers
		WHERE follower_id = 1
	UNION
		SELECT followers.leader_id, followers.follower_id, depth + 1
		FROM followers
		JOIN suggestions ON suggestions.leader_id = followers.follower_id
		WHERE depth < 2
)
SELECT DISTINCT users.id, users.username
FROM suggestions
JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1