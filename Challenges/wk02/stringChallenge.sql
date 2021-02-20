
-- Challenge 1: Reverse and uppercase the following sentence

-- "Why does my cat look at me with such hatred"
SELECT
  UPPER(REVERSE('Why does my cat look at me with such hatred'));

-- Challenge 2: What does this print out?

-- SELECT
--   REPLACE
--   (
--     CONCAT('I', ' ', 'like', ' ', 'cats'), 
--     ' ', 
--     '-'
--   );

-- This prints out "I-like-cats"

-- Challenge 3: Replace spaces in titles with '->' and gives this table a title of title

SELECT
  REPLACE(title, ' ', '->')
  AS 'title'
FROM books;

-- Challenge 4: from table books print author's last name reguraly (with title of forwards) and last name as reverse (title of backwards)

SELECT
  author_lname AS 'forwards',
  REVERSE(author_lname) AS 'backwards'
FROM books;

-- Challenge 4: Print out author full name together in Upper case and name of title is full name in caps

SELECT
  UPPER(CONCAT_WS(' ', author_fname, author_lname))
  AS 'full name in caps'
FROM books;

-- Challenge 5: title is 'blurb' will display the title + 'was released in' + date

SELECT
  CONCAT_WS(' ', title, 'was released in', released_year)
  AS blurb
FROM books;

-- Challenge 6: Print the book titles (table name title) and the length of each title (table name character count)

SELECT
  title AS 'title',
  CHAR_LENGTH (title) AS 'character count'
FROM books;

-- Challenge 7: short title (first ten character), author (lastname, firstname), quantity (# in stock)

SELECT
  CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
  CONCAT_WS (',', author_lname, author_fname) AS 'author',
  CONCAT_WS(' ', stock_quantity, 'in stock'
) AS 'quantity'
FROM books;

