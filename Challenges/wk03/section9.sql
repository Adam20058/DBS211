-- *************************************************************************************************************************
-- *************************************************************************************************************************
-- CREATE DATABASE section9;
-- USE section9;

-- CREATE TABLE books
-- (
--   book_id INT NOT NULL
--   AUTO_INCREMENT,
-- 		title VARCHAR
--   (100),
-- 		author_fname VARCHAR
--   (100),
-- 		author_lname VARCHAR
--   (100),
-- 		released_year INT,
-- 		stock_quantity INT,
-- 		pages INT,
-- 		PRIMARY KEY
--   (book_id)
-- 	);

--   INSERT INTO books
--     (title, author_fname, author_lname, released_year, stock_quantity, pages)
--   VALUES
--     ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
--     ('Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304),
--     ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
--     ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
--     ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
--     ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
--     ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
--     ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
--     ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
--     ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
--     ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
--     ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
--     ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
--     ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
--     ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
--     ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

--   INSERT INTO books
--     (title, author_fname, author_lname, released_year, stock_quantity, pages)
--   VALUES
--     ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
--     ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
--     ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
-- *************************************************************************************************************************
-- ****                                      EXCERCISE 1: The count function                                            ****
-- *************************************************************************************************************************

-- QUESTIONS
-- 1. How many books in our table "books"?

-- SELECT
--   COUNT(*)
-- FROM
--   books;

-- 2. How many unique author first names are in the table "books"?
-- SELECT
--   COUNT(DISTINCT author_fname)
-- FROM
--   books;

-- 3. How many unique authors (first name and last name) are in the table "books"?

-- SELECT
--   COUNT(DISTINCT author_fname, author_lname
-- )
--   AS 'No. of Authors'
-- FROM
--   books;

-- 4. How many titles contain "the"?

-- SELECT
--   COUNT(*)
-- FROM
--   books
-- WHERE
--   title 
-- LIKE 
--   '%the%';


-- *************************************************************************************************************************
-- ****                                      EXCERCISE 2: Group BY                                                      ****
-- *************************************************************************************************************************

-- SELECT
--   author_lname,
--   COUNT(*) AS 'No. books'
-- FROM
--   books
-- GROUP BY
--   author_lname;


-- SELECT
--   author_fname, author_lname, COUNT(*)
-- FROM
--   books
-- GROUP BY
--   author_fname, author_lname;

-- 1. Group By released year. Display how many books were released per year?

-- SELECT
--   released_year, COUNT(*)
-- FROM
--   books
-- GROUP BY
--   released_year
-- ORDER By
--   released_year;

-- 2. Group By released year. Display 'In' year books were released?

-- SELECT
--   CONCAT_WS(
-- ' ','In', released_year, COUNT(*), 'book(s) released'
-- ) AS 'Year'
-- FROM
--   books
-- GROUP BY
--   released_year
-- ORDER By
--   released_year DESC;


-- *************************************************************************************************************************
-- ****                                      EXCERCISE 3: MIN and MAX                                                   ****
-- *************************************************************************************************************************

-- 1. Find the first year any book was released in our table?

-- SELECT
--   MIN(released_year), title
-- FROM
--   books;

-- 2. Find the book with the shortest amount of pages?

-- SELECT
--   MIN(pages)
-- FROM
--   books;

-- 3. Find the book with the most amount of pages?

-- SELECT
--   MAX(pages)
-- FROM
--   books;

-- *************************************************************************************************************************
-- ****                          EXCERCISE 4: Subqueries: A problem with `MIN` and `MAX`                                ****
-- *************************************************************************************************************************

-- 1. Find the title of the book with the least amount of pages?
-- SELECT
--   title, pages
-- FROM
--   books
-- WHERE
-- 	pages = (SELECT
--   MIN(pages)
-- FROM
--   books);

-- 2. Find the title of the book with the most amount of pages?

-- SELECT
--   title, pages
-- FROM
--   books
-- WHERE
--   pages = (
--     SELECT
--   MIN(pages)
-- FROM
--   books
-- );

-- 3. Use alternate and faster method to answer question 2?
-- SELECT
--   title, pages
-- FROM
--   books
-- ORDER BY
--   pages ASC
-- LIMIT
--   1;

-- *************************************************************************************************************************
-- ****                        EXCERCISE 5: Using `MIN` and `MAX` in Conjection with `GROUP BY`                         ****
-- *************************************************************************************************************************

-- 1. Find the year each author published their first book?

-- SELECT
--   author_fname,
--   author_lname,
--   MIN(released_year)
-- FROM
--   books
-- GROUP BY 
--   author_fname, 
--   author_lname;

-- 2. Find the longest page count for each author ?
-- SELECT
--   author_fname,
--   author_lname,
--   MAX(pages)
-- FROM
--   books
-- GROUP BY 
--   author_fname,
--   author_lname;

-- 2. Find the longest page count for each author, author alias for full name, and longest book alias?
-- SELECT
--   CONCAT_WS(' ', author_fname, author_lname) AS author,
--   MAX(pages) AS 'longest book'
-- FROM
--   books
-- GROUP BY
--   author_fname,
--   author_lname;

-- *************************************************************************************************************************
-- ****                        EXCERCISE 6: SUM Function                                                                ****
-- *************************************************************************************************************************

-- 1. Return the sum of all pages in the entire database?

-- SELECT
--   SUM(pages)
-- FROM
--   books;

-- 2. Sum all pages each author has written?

SELECT
  author_fname,
  author_lname,
  SUM(pages)
FROM
  books
GROUP BY 
  author_fname,
  author_lname;