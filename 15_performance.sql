-- -> we should avoid full table scan to improve performance
-- -> pg has to load many(or all) rows from the heap file(HD) to memory(RAM)

* data strcuture that efficiently tells us what block/index a record is stored at


ex. select * from users where username ='Riann'

-- create index on users table in username field
CREATE INDEX ON users (username);
CREATE INDEX username_index ON users (username);

-- delete index on users table in username field
DROP INDEX users_username_idx;

-- check the exact time took to query the data
EXPLAIN ANALYZE SELECT * from users where username='Emily30'
-- by doing indexing in this field we get data around 16x faster than without index

-- query to get size of db & index
SELECT pg_size_pretty(pg_relation_size('users'));
-- users db -> 880kb and indexed db -> 184kb


-- ** so creating index always is also not good idea as it causes more space as data is
-- stored in tree format, so we have to carefully indexed any row

-- * downside of creating indexes
-- can be large, stores data from at least one column of the real table
-- slow down insert/update/delete - the index has to be updated
-- index might not actually get used

-- types of indexes
-- 1) B-tree -> general purpose index (99% of time we uses this)
-- 2) Hash -> speed up simple equality checks
-- 3) GiST -> geometry, full-text search
-- 4) sp-gist -> clustered data
-- 5) GIN -> for column that contains arrays or JSON data
-- 6) BRIN -> specialized for really large dataset


** postgress automatically creates an index for the primary key column of every table
** postgress automatically creates an index for any 'unique' contraint
** these dont get listed under indexes in PGADMIN


-- check all the indexes in db (default one as well)
SELECT relname, relkind FROM pg_class where relkind = 'i';

-- lifecycle of query
SELECT * FROM users where username = 'Alyson14'
-> above query is transformed into postgresql understanding language using (PARSER)
-> then passes to (REWRITE) decompose views into underlying table references 
-> then passes to (PLANNER-> most imp) as in this process it confirm that which method would be used to get
data in faster and effient manner
-> then (EXECUTER) run the query

* EXPLAIN -> Build a query plan and display info about it
* EXPLAIN ANALYZE -> Build a query plan, run it, and info about it
these are for benchmarking + evaluating queries, not for use in real data fetching

