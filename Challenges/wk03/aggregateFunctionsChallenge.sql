-- Aggregate Function Challenge

--  Columns:
--  book_id, title, author_fname, author_lname, released_year, stock_quantity ,pages 

-- 1. Print the number of books in the database?

-- SELECT
--   COUNT(*)
-- FROM books;

-- 2. Print out how many books were released in each year?

-- SELECT
--   released_year AS 'Year',
--   COUNT(title) AS 'No. of Books'
-- FROM
--   books
-- GROUP BY
--   released_year
-- ORDER BY
--   released_year DESC;

-- 3. Print out the total number of books in stock?
-- SELECT
--   SUM(stock_quantity) AS 'Total Stock'
-- FROM
--   books;

-- 4. Find the average released_year each author?
-- SELECT
--   author_fname,
--   author_lname,
--   AVG(released_year)
-- FROM
--   books
-- GROUP BY
--   author_fname,
--   author_lname;

-- 4. Answer question 4 but combine first name and last name of author as just author and order the years accordingly?
-- SELECT
--   CONCAT_WS
--     (
--       ' ',
--       author_fname,
--       author_lname
--     ) AS 'Author',
--   AVG(released_year)
-- FROM
--   books
-- GROUP BY
--   author_fname,
--   author_lname
-- ORDER BY
--   AVG(released_year);

-- 5. Find the full name of the author who wrote the longest book in the databases?

-- SELECT
--   CONCAT_WS
--     (
--       ' ',
--       author_fname,
--       author_lname
--     ) AS 'Author',
--   title,
--   MAX(pages)
-- FROM
--   books
-- GROUP BY
--   author_fname,
--   author_lname, title
-- ORDER BY
--   MAX(pages) DESC
-- LIMIT 
--   1;

-- 6. Print out year released AS 'year', number of books released in that year AS '# of books', average number of pages for those books released in that year?
SELECT
  released_year AS 'year',
  COUNT(*) AS '# of books',
  AVG(pages) AS 'avg pages'
FROM
  books
GROUP BY 
  released_year
ORDER BY
  released_year ASC;

