CREATE TABLE accounts (
    user_id serial PRIMARY KEY,
    username character varying(12),
    city character varying(128),
    transactions_completed integer,
    transactions_attempted integer,
    account_balance numeric(12,2)
);

INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('shawn', 'chicago', 5, 10, 355.80),
('cherise', 'minneapolis', 9, 9, 4000.00),
('larry', 'minneapolis', 3, 4, 77.01),
('dallas', 'new york', 6, 12, 0.99),
('anthony', 'chicago', 0, 0, 0.00),
('travis', 'miami', 1, 100, 500000.34),
('davey', 'chicago', 9, 99, 98.04),
('ora', 'phoenix', 88, 90, 3.33),
('grace', 'miami', 7, 9100, 34.78),
('hope', 'phoenix', 4, 10, 50.17);


--get all users from chicago--
select * from accounts where city = 'chicago';

--get all users with usernames that contian the letter a--
select * from accounts where username like '%a%';

--new customer bonus--
update accounts set account_balance = 10.00 where transactions_attempted = 0 and account_balance = 0;

--9 or more trancactions attempted--
select * from accounts where transactions_attempted > 9;

--3 users with highest balance--
select username, account_balance from accounts order by account_balance desc limit 3;

--3 users with lowest balance--
select username, account_balance from accounts order by account_balance asc limit 3;

--all users over 100 balance--
select * from accounts where account_balance > 100;

--add a new bank record--
INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance)
VALUES ('mike', 'minneapolis', 12, 24, 250.00);

--delete miami/phoenix less than 5 transactions--
select * from accounts where transactions_completed < 5 and (city = 'miami' or city = 'phoenix');
delete from accounts where transactions_completed < 5 and (city = 'miami' or city = 'phoenix');
