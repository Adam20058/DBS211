Section 9: Aggregate Functions

# Section 9: Aggregate Functions

## MODIFICATIONS

- turn off ONLY_FULL_GROUP_BY
	- `SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));`

## Syllabus
- `COUNT` Function
- `GROUP BY` Command
- `MIN` and `MAX`
- Subqueries: A problem with `MIN` and `MAX`
- Using `MIN` and `MAX` with `GROUP BY`
- `SUM` function
- `AVG` function

## Summary of Section
- I'll cover different ways of performing analysis of data
	- Finding Averages
	- Getting the sum of a cluster of data
	- Grouping things together

#
## Aggregate Functions
- **Aggregate Functions** are built-in functions in MySQl that will allows us to aggregate/combine data in get meaning out of it
	- (e.g "Find the average page length of each author")

#
## `COUNT`
- `COUNT` function will count whatever you tell it to count
	- `SELECT COUNT(columnName) FROM tableName;`
- How many books in database table books?
	- `SELECT COUNT(*) FROM books;`
- How many author_fnames?
	- `SELECT COUNT(author_fname) FROM books;`
- How many unique author_fnames?
	- `SELECT COUNT(DISTINCT author_fname) FROM books;` 
- How many unique authors are in my database?
	- ` SELECT COUNT(DISTINCT author_fname, author_lname)  FROM books;`
- How many titles contain "the"?
	```
	SELECT 
		COUNT(DISTINCT title) 
	FROM 
		books
	WHERE 
		title
	LIKE
		'%the%';
	```
#
## `GROUP BY` Command
- `GROUP BY` summarizes or aggregates identical data into single rows
	- (e.g. "Take all of our books and group them by the year they were released?" or "Take all of movies and group them by genre and tell us how many per genre?")

```
SELECT 
	title, author_lname 
FROM 
	books
GROUP BY
	author_lname
```
- The above query at first glance will look like only unique author last name displayed and will fail to show some other titles made by authors
	- What really is happening is that we just created a sort of super rows of information (titles associated with author last name are all under that unique author name in a single super row even if it's not visibly displayed)

- When data is grouped you can do things such as `COUNT`
	- Count how many books each author has written?
```
SELECT
	author_lname, 
	COUNT(*) AS 'no. books'
FROM 
	books
GROUP BY author_lname;
```

- `COUNT(*)` is referring to the group super rows in this case 

#
## `MIN` and `MAX`
- The `MIN` function returns the smallest value of selected column
- The `MAX` function returns the largest value of selected column

- Let's try a example using `MIN`
	- "What was the earliest year a book was released within our table"

```
SELECT
	MIN(released_year)
FROM
	books;
```

- `MAX` follows the same sort of structure/syntax
- Let's try an example using `MAX`
	- "What's the most pages in a book in our table?"

```
SELECT
	MAX(pages)
FROM 
	books;
```
#
## Subqueries: A problem with `MIN` and `MAX`
- Here's a trick question
	- What if I want the title of the longest book?

```
SELECT
	MAX(pages), title
FROM
	books;
```

- the query above is incorrect. It will return the correct number of pages but the value won't be related to the title at all hence incorrect info
	- But why though?
		- Well the MAX info is independent from the other column

- Here's a correct Solution
	- it involves something called **subquery**
		- Basically it allows us to run one query inside of another

```
SELECT 
	*
FROM
	books
WHERE
	pages = (SELECT 
				MIN(pages)
			FROM
				books);
	
```
### Issue with subqueries
- However there is an issue with this method for datasets much larger than this example

- The issue is that this method is slow 
	- It's slow, Since it's running two seperate queries are happening

### Solution 
- Use `ORDER BY`

```
SELECT
	*
FROM
	books
ORDER BY
	pages ASC
LIMIT
	1;
```

- it's faster method since it's running one query instead of two queries
	- Technically in our case it doesn't matter since I'm dealing with a much smaller dataset 

#
## Using `MIN` and `MAX` in Conjection with `GROUP BY` 

- "Find the year each author published their first book?"

```
SELECT
  author_fname,
  author_lname,
  MIN(released_year)
FROM
  books
GROUP BY 
  author_fname, 
  author_lname;
```

#
## `SUM` function
- `SUM` function simply returns the total sum of a numerical column

- Let's take this example
	- "Sum of all pages in the entire database?"

```
SELECT
	SUM(pages)
FROM
	books;
```

### Example of using sum in conjunction with `GROUP BY`
- "Sum all pages each author has written?"

```
SELECT
  author_fname,
  author_lname,
  SUM(pages)
FROM
  books
GROUP BY 
  author_fname,
  author_lname;
```

#
## `AVG` function
- The `AVG` function returns the average value of a numeric column.
- Example "Calculate the average release year of all books"

```
SELECT
	AVG(released_year)
FROM
	books;
```

- You'll discover this will not return just a whole number instead it'll return a number with upto 4 decimal points

#
## Command List

1. `SELECT COUNT(*) FROM tableName;`
2. `SELECT COUNT(columnName) FROM tableName;`
3. 
```
SELECT 
	columnName
FROM
	tableName
GROUP BY condition/columnName;	
```
4. 

```
SELECT 
	MIN(columnName)
FROM
	tableName;
```
5. 

```
SELECT 
	MAX(columnName)
FROM
	books;
```
6.  

```
SELECT
	columnName
FROM
	tableName
WHERE
	columnName (
				SELECT
					MIN(columnName)
				FROM
					tableName
				);
```

7. 

```
SELECT
	MIN(columnName)
FROM
	tableName
GROUP BY 
	columnName;
```

8. 

```
SELECT
	AVG(columnName)
FROM
	tableName;
```