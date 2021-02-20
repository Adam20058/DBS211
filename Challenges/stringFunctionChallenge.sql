-- Test to run sql file outside of terminal
CREATE DATABASE section7;
USE section7;
CREATE TABLE cats
(
  cat_id INT NOT NULL
  AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR
  (100),
  age INT
);

  INSERT INTO cats
    (name,age)
  VALUES('Milo', 6)
  ,
    ('Leo', 10);

