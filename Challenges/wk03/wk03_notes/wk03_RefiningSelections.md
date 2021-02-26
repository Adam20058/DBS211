Section 8: Refining Our Selections

# Refining Our Selections

## Syllabus
- Using `DISTINCT`
- Sorting Data with `ORDER BY`
- Using `LIMIT`
- Part 1: Better Searches with `LIKE` 
- Part 2: `LIKE` and more Wildcards 

#
## Using `DISTINCT`
- `DISTINCT` is used in conjunction with `SELECT`
- The `SELECT DISTINCT` statement is used to return only distinct (different) values.
- Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.

- example: If I wanted to select only the unique author last name in a table (no repeats/duplicates)
	- `SELECT DISTINCT auhtor_lname FROM books`

#
## Sorting Data with `ORDER BY`
- The `ORDER BY` keyword is used to sort the result-set in ascending or descending order.
- The `ORDER BY` keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.

- example query:
	- `SELECT author_lname FROM books ORDER BY author_lname;`
		- Result would be list of author last name by alphabetical order 

- Ascending by default 
	- You can change this by adding `DESC`

- example query of ORDER BY Descending:
	- `SELECT author_lname FROM books ORDER BY author_lname DESC;`
- Shortcut
	- `SELECT title, author_fname, author_lname FROM books ORDER BY 2;`
		- ORDERS BY the # selected columNames
			- So 2 in this case = author_fname according to selection order in the query I made

#
## Using `LIMIT`
- `LIMIT` allows us to specify a number for how many results that we want to select (i.e. I want the top 2 best selling books)
- Often used in conjunction with `ORDER BY`

- example query:
	- `SELECT title FROM Book LIMIT 3;`
		- Result will show first 3 book titles

- This super useful to use when used in conjunction with key words such as `ORDER BY`
- Example query: 
```
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 5;
```
		- Result will return 5 of the most recently released titles 
		
### Pagination
- **Pagination** is dividing a resultset into discrete pages with the help of the query.
	- Take for instance if you have a blog site with hundreds of articles in it's database... You don't want it all to be displayed since its too much info to display. Instead you may want up first 5 posts and a next button which will take you to post 6 - 11 and so forth.
	- DESC LIMIT 0,5;

#
## Part 1: Better Searches With `LIKE` 
- Allows us to do better searching
- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

- example: A person comes to a book store looking for a book. But they can't remember the title only that the author is probably David or dan or dave
	- You'll simply look up books made by authors whose first name start wit Da
- We use a wildcard in conjuction with the `LIKE` operator
	- `%` The percent sign represents zero, one, or multiple characters
- Example query
	- `SELECT author_fname, title FROM books WHERE author_fname LIKE '%da%';`
	- The % symbols are wildcards. They find any characters between them
		- %da any strings that have characters da at the end
		- da% gives us any string that start with da
#
## Part 2: `LIKE` And More Wild Cards

- Another wildcard we use in conjuction with the `LIKE` operator
	- `_` The underscore represents a single character
	-  `SELECT title, stock_quantity WHERE stock_quantity LIKE '____';`
		-  This show books where stock quantity is 4 digits long (i.e. 1000)

### How would we select a book with `%` or `_` in it?
- We use an **escape character** which is `\`

- example query:
	- `SELECT title FROM books WHERE title LIKE '%\%%';`
	- Result will find a title with % in it

- Another example query
	- `SELECT title FROM books WHERE title LIKE '%\_%';`
#
## Command List

1. `SELECT DISTINCT columnName FROM tableName;`
2. `SELECT columnName FROM tableName ORDER BY columnName;`
3. `SELECT columnName FROM tableName ORDER BY columnName DESC;`
4. `SELECT columnName FROM tableName LIMIT #;`
5. 
```
SELECT columnName1, columnName2 
FROM tableName 
ORDER BY columnName
LIMIT #;
```
6.
```
SELECT columnName1, columnName2 
FROM tableName 
ORDER BY columnName
LIMIT #,#;
```
7. 
```
SELECT columnName 
FROM tableName 
WHERE columnName
LIKE '%characters%'
```
8. 
```
SELECT columnName 
FROM tableName 
WHERE columnName
LIKE '%characters'
```
7. 
```
SELECT columnName 
FROM tableName 
WHERE columnName
LIKE '___'
```
