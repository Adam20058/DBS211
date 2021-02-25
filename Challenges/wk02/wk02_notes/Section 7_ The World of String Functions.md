Section 7: The World of String Functions

# The World of String Functions

## Syllabus
- Introduction
- Running SQL Files
- Working with `CONCAT`
- Introducing `SUBSTRING`
- Introducing `Replace`
- Using `REVERSE`
- Working with `CHAR LENGTH`
- Changing case with `UPPER` and `LOWER`

#
## Brief
- So in this section we will be talking **String Functions**
	- Basically they are a way we expand our data and working with text or strings

#
## Running SQL Files 
- You can run sql files outside of CLI (command line)
	- benefits are that is much easier to work with and make quick edits

- simply create a file with an extension .sql and add all of the commands to create your tables, databases etc.
- then change directory on CLI (terminal) into the folder containing your sql file
- then open mysql application
- from there enter the command `source fileName.sql`

#
## Working with `CONCAT`

### `CONCAT` Command
- `CONCAT` Combine pieces of data for cleaner output
- The way that `CONCAT` works is that we pass in multiple arguements or pieces of data and it will combine them 
	- `CONCAT (x, y, z)`
	- to add a space when combining two values
		- `CONCAT (column1, ' ', column2)`
- You can't run this string function on it's own

```
SELECT 
	CONCAT ('columName1', 'columnName2')'
FROM tableName;
```

- This is cool
- But the issue will be the name of this info will be something like this columnName1, columnName2. 
- Basically the combination of the two columns we concatenated 

### `AS` Command
- Doesn't look pretty there is a way to change the name of the info for the concatenated data

```
SELECT 
	CONCAT ('columnName1', 'columnName2')
AS 'newName' FROM tableName
```
- the `AS` command can change the the name of the column when selected
	- `SELECT columnName1 AS 'New Column Name' FROM tableName;`

### `CONCAT_WS` String Function

- CONCAT_WS 
	- Stands for concat with seperator
- The purpose of this string function is for time where you might concat data seperating with a symbol (**the seperator**) repetively
	- it acts as a shortcut for these circumstances

- without concat_ws example:
```
SELECT 
	CONCAT(title, '-', author_fname, '-', author_lname)
FROM books;
```

- **with** concat_ws example:

```
SELECT 
	CONCAT_WS('-',' title, author_fname, author_lname)
FROM books;
```
#
## Introduction to `Substring`
- The string function`SUBSTRING` allows us to select individual parts/subsection of a string

`SELECT SUBSTRING ('Hello World', 1, 4);`
`--- output would be Hell`
- the number are indices that refers to characters position in the string

`SELECT SUBSTRING ('Hello World', 7);`
`-- Output would be World`
	- everything before the seven indice is negated

### Negative index Substring
- `SELECT SUBSTRING ('Hello World', -3);`
	- `--- output is rld`
		- starts from backwards

### How to include this with my columns in a table
- Here's an example

```
SELECT 
	SUBSTRING(columnName, 1, 10)
FROM tableName;
```

### SUBSTRING shorcut
- You can use the shortcu `SUBSTR` instead of `SUBSTRING`

#
## `REPLACE` String Function

- The `REPLACE()` function replaces all occurrences of a substring within a string, with a new substring.
	- It is case sensitive

- `SELECT REPLACE ('Hello World', 'l', '7');`
	- `--- OUPUT would be He77o Wor7d`

- It's capable of replacing multiple things

- `SELECT REPLACE ('Cheese Bread Coffee Milk', ' ', ' and ');`
	- `--- Output = Cheese and Bread and Coffee and Milk`

#
## `REVERSE` String Function

- `REVERSE` string function that reverses strings

- `SELECT REVERSE('Hello World');`
	- `--- Output = dlroW olleH`

#
## `CHAR_LENGTH` String Function

- `CHAR_LENGTH` string function simply tells you how much characters are in a given string
	- `SELECT CHAR_LENGTH('String');`
		- `--- Output = 11 characters`

#
## Changing case with `UPPER` and `LOWER`
- `UPPER` string function will change all characters in string to upper case
- `SELECT UPPER ('Hello World');`
	- `--- Output = HELLO WORLD`

- `LOWER` string function will change all characters in string to lower case
- `SELECT Lower ('Hello World');`
	- `--- Output = hello world`

#
## Extra Note: Order
- Order is very important to be aware about. Take this example for instance:

	- `SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps"
FROM books;`
		- this works
		
- Since Upper only takes one argument and CONCAT takes 2 or more arguments thet can't be switched in that way 
	- unless you add a upper string function to every string within CONCAT
		- This needless and not needed simply have UPPER() first
#
## Command List
1. `CONCAT (x, y, z)`
2. `CONCAT (column1, ' ', column2)`
3.  
```
SELECT 
	CONCAT ('columName1', 'columnName2');'
FROM tableName;
```
4.
```
SELECT 
	CONCAT ('columnName1', 'columnName2')
AS 'newName' FROM tableName
```
5. `SELECT columnName1 AS 'New Column Name' FROM tableName;`
6. 
```
SELECT 
	CONCAT_WS('-',' ColumName1, ColumName2, ColumName3)
FROM tableName;
```
7. 
```
SELECT 
	SUBSTRING(columnName, 1, 10)
FROM tableName;
```
8. 
```
SELECT
	CONCAT(SUBSTRING(columnName, 1,10)) 
	AS 'new title name'
FROM tableName;
```
9.  
```
SELECT
	REPLACE (columnName, 'originalValue', 'newValue')
FROM tableName;
```
10. 
```
SELECT
    SUBSTRING(REPLACE(columnName, 'originalValue', 'newValue'), 1, 10) AS 'New Name'
FROM tableName;
```

11. 
```
SELECT 
	REVERSE (ColumnName)
FROM tableName;
```

12. 
```
SELECT 
	CONCAT (ColumnName, REVERSE(ColumnName))
FROM tableName;
```

13. `SELECT CHAR_LENGTH('String');`

14. `SELECT UPPER ('string');`

15. `SELECT LOWER ('string');`
