-- Challenge
/*
Step 1. Create a database: shirts_db
Step 2. Create a new table called: shirts
Step 3. Shirts table will have 5 columns:
  
  i) shirt_id
    INT NOT NULL AUTO_INCREMENT PRIMARY KEY
  
  ii) article
    VARCHAR(100) NOT NULL 
  
  iii) color
    VARCHAR(100) NOT NULL
  
  iv) shirt_size
    VARCHAR(100) NOT NULL
  
  v) last_worn
      INT NOT NULL 

Step 4. Insert this data

('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15)

Step 5. Add a new shirt:

Purple, polo shirt, Medium size, last worn 50 days ago

*/
CREATE DATABASE shirts_db;

USE shirts_db;

CREATE TABLE shirts
(
  shirt_id INT NOT NULL
  AUTO_INCREMENT PRIMARY KEY,
  article VARCHAR
  (100) NOT NULL,
  color VARCHAR
  (100) NOT NULL,
  shirt_size VARCHAR
  (100) NOT NULL,
  last_worn INT NOT NULL
);

  INSERT INTO shirts
    (article, color, shirt_size, last_worn)
  VALUES
    ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);

  INSERT INTO shirts
    (article, color, shirt_size, last_worn)
  VALUES
    ('polo shirt', 'purple', 'M', 50);

/*
Question 1. SELECT all shirts but only print out article and color?

SELECT article, color FROM shirts;

Question 2. Select all medium shirts and print out everything but shirt_id?

SELECT article, color, shirt_size, last_worn FROM shirts
WHERE shirt_size = 'M' ;


Question 3.  UPDATE all polo shirts change their size to l

UPDATE shirts SET shirt_size = 'L'
WHERE article = 'polo shirt';


Question 4.  UPDATE the shirt last worn 15 days ago and CHANGE last worn to 0

UPDATE shirts SET last_worn = 0
WHERE last_worn = 15;

Question 5.  UPDATE all the white shirts and change size to 'XS' and color to 'off white'

UPDATE shirts SET shirt_size = 'XS', color = 'off white'
WHERE color = 'white';

Question 6.  Delete all old shirts
  - last worn 200 days ago

DELETE FROM shirts WHERE last_worn = 200;

Question 6.  Delete all tank tops

DELETE FROM shirts WHERE article = 'tank top';

Question 7.  Delete all shirts

DELETE FROM shirts;

Question 7.  Delete all shirt table

DROP TABLE shirts;




*/