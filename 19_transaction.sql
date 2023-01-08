
CREATE TABLE accounts(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  balance INTEGER NOT NULL
)

INSERT INTO accounts(name, balance)
VALUES
  ('Gia', 100)
  ('Alyson', 100)


--to create a different isolated environment for doing transaction in which we want to 
-- run two query at once or fails both query as 
-- ex. sending money to someone account, in which first amount debited from my account and depositing account to others account
-- for that we need to start different session to do that
BEGIN; -- it will start a new isolated session

UPDATE accounts set balance = balance - 50 WHERE name = 'Gia'
UPDATE accounts set balance = balance + 50 WHERE name = 'Alyson'

COMMIT -- it will merge the above changes to main db
ROLLBACK | or any crash -- it will destroy the above connection and changes well



** LEARN ABOUT MIGRATION