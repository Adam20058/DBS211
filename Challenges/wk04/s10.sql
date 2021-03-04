-- DROP TABLE IF EXISTS `thingies`;
-- CREATE TABLE
-- IF NOT EXISTS `thingies`
-- (
--   price FLOAT
-- );


-- DATA FOR SECTION 10

-- CREATE TABLE people
-- (
--   name VARCHAR(100),
--   birthdate DATE,
--   birthtime TIME,
--   birthdt DATETIME
-- );

-- INSERT INTO people
--   (name, birthdate, birthtime, birthdt)
-- VALUES
--   ('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
-- VALUES
--   ('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');

-- INSERT INTO people
--   (name, birthdate, birthtime, birthdt)
-- VALUES
--   ('Microwave', CURDATE(), CURTIME(), NOW());

-- it just extracts the day by formatting dates
-- SELECT name, DAY(birthdate)
-- FROM people;

-- SELECT name, DAYOFYEAR(birthdate)
-- FROM people;

--  How would we take this date 04-21-3017 to convert to April 21st 2017

SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate))
FROM people;