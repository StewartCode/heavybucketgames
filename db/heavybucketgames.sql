DROP TABLE interests;
DROP TABLE games;
DROP TABLE customers;

CREATE TABLE games
(
  id SERIAL8 primary key,
  title VARCHAR(255),
  genre VARCHAR(255),
  release_date VARCHAR(255)
);

CREATE TABLE customers
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE interests
(
  id SERIAL8 primary key,
  game_id INT8 references games(id) ON DELETE CASCADE,
  customer_id INT8 references customers(id) ON DELETE CASCADE
);
