Four relationship
- Many to one
- one to Many
- many to Many
- one to one

CREATE TABLE users(
  id serial PRIMARY KEY,
  username VARCHAR(50)
);

INSERT INTO
  users (username)
VALUES
  ('monahan93'), ('pferr'), ('9stroman'), ('simons');

SELECT * FROM users;

-- creating photos with user foriegn key
CREATE TABLE photos(
  id serial PRIMARY KEY,
  url VARCHAR(50),
  user_id INTEGER REFERENCES users(id) 
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE --for cascade delete -> useful when we want to delete comments on delete of post
  user_id INTEGER REFERENCES users(id) ON DELETE SET NULL --set null on delete -> useful when we want to keep the photos bt want to delete user on instagram
);

-- insert into photos along with forign key (userId)
INSERT INTO 
  photos (url, user_id)
VALUES
  ('http:/one.jpg', 4),
  ('http:/two.jpg', 1),
  ('http:/25.jpg', 1),
  ('http:/36.jpg', 1),
  ('http:/754.jpg', 2),
  ('http:/35.jpg', 3),
  ('http:/256.jpg', 4);

-- delete any table
DROP TABLE photos;

-- join photos table with user table and get data
SELECT url, username FROM photos
  JOIN users ON users.id = photos.user_id

-- if someone want to delete user which id is saved in photos
On delete option      -> what will happen
ON DELETE RESTRICT    -> throw an error
ON DELETE NO ACTION   -> throw an error
ON DELETE CASCADE     -> delete the photo too
ON DELETE SET NULL    -> set the 'user_id' of the photo to 'NULL'
ON DELETE SET DEFAULT -> set the 'user_id' of the photo to default value, if ONE is not provided

