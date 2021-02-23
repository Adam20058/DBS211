-- Refining Selection Excercises

--   book_id, title, author_fname, author_lname, released_year, stock_quantity ,pages 

-- 1. Select all story collections. So titles that contain stories

-- SELECT title
-- FROM books
-- WHERE title LIKE '%stories%';

-- 2. Find the longest book. Print out the title and page count

-- SELECT title, pages
-- FROM books
-- ORDER BY pages DESC
-- LIMIT 1;

-- 3. Print a summary containing the title and year for the 3 most recent books

-- SELECT
--   CONCAT_WS (' - ', title, released_year)
--   AS 'summary'
-- FROM books
-- ORDER BY released_year DESC
-- LIMIT
-- 3;

-- 4. Find all book with an author_lname that contains a space(" "). show title and autho last name

-- SELECT
--   title, author_lname
-- FROM books
-- WHERE author_lname LIKE '% %';

-- 5. Find the 3 books with the lowest stock. Select title, year and stock?????????????

SELECT
  title, released_year, stock_quantity
FROM books
ORDER BY 3,2
LIMIT 3;

-- 6. Print the title and author_lname sorted first by author_lname and then by title???????????

SELECT
  title
, author_lname
FROM books
ORDER BY 2,1;

-- 7. Make this happen title of table "yell"
SELECT
  CONCAT_WS
  (
    '_',
    'MY FAVOURITE AUTHOR IS',
    UPPER(author_fname),
    UPPER(author_lname),
    '!'
  )
  AS 'yell'
FROM books
ORDER BY author_lname;