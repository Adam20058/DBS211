# Inserting Data + Retrieving Data
## Syllabus
- Inserting Data
- Introduction to SELECT 
- Multiple INSERT
- MySQL Warnings
- NULL and NOT_NULL
- Setting Default Values
- A Primer On Primary Keys

#
## Inserting Data
- the command for **inserting data into a table in the current Database**
```
INSERT INTO tableName(columnName1, columnName2.......)
VALUES (dataForColumnName1,dataForColumnName1......);

```
#
## Introduction to `SELECT`

### How to know data works when you insert it?

- Command to **view any of our data in specific table**
`SELECT * FROM tableName`

#
## Multiple Insert
- Command to do a **bulk insert list**
```
INSERT INTO tableName (columnName1, columnName2.......)
Value (data,data,.....)
	  ,(data,data,.....)
	  ,(data,data,.....);
	
```
#
## MySQL Warnings
- When we enter commands sometimes we can run across warning at ouput
	- `Query OK, 3 rows affected, 3 warnings (0.00 sec)`
- Command to **show warnings**
`SHOW WARNINGS;`

#
## NUll and NOT_NULL
- **NULL** means the value is not known
	- it doesn't mean zero
	- when you use `DESC tableName` or `SHOW COLUMNS FROM tableName` and see YES under the **NULL** category of each field it means it permitted to be null (have unnamed value)

### Now the question is how to prevent this from happening and ensuring there is a value for each field?

- Answer is NOT_NULL
- What we can specify when we actually define a table that a field is not null

- e.g.

```
CREATE TABLE cats2 
(
	name VARCHAR(100) NOT NULL;
	age INT NOT NULL;
)
```

- So in this example I'm ensuring that inserting a null value into a column will not be permitted for both the age and the name column of this table.

#
## Setting Default Values
- It's helpful to set default values. So if something isn't specified there will be a fallback values

- e.g.

```
CREATE TABLE cats3 
(
	name VARCHAR(100) DEFAULT 'unnamed',
	age INT DEFAULT 99
);
```

- another example: Is it redundant????

```
CREATE TABLE cats4
(
	name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
	age INT NOT NULL DEFAULT 99
);
```

- it's not redundant to specify a default value and making sure the values are not null
- since just adding a default value doesn't prevent you from getting null values that are explicit
#
## A Primer On Primer Keys
- The goal is for all of our data to be uniquely identifiable 
- There are times where we have data that looks the same 
	- Two cats both name 'Helena'
- How do we know to differentiate between data that looks the same
	- We use ids referred to us **Primary Keys**
- **Primary Keys**
	- Are a unique identifier on a **Row** 

- e.g.

```
CREATE TABLE unique_cats (
	cat_id INT NOT NULL,	
	name VARCHAR(100),
	age INT,
	PRIMARY KEY (cat_id);
)
```
#
## AUTO_INCREMENT
- So it kind of sucks creating a new id each time and keeping track of all the numbers used so far.
	- That's where auto increment helps out
- **Auto-increment**
	-  allows a unique number to be generated automatically when a new record is inserted into a table.


```
CREATE TABLE unique_cats2 (
	cat_id INT NOT NULL AUTO_INCREMENT,	
	name VARCHAR(100),
	age INT,
	PRIMARY KEY (cat_id);
)
```

#
## Command List
1. 
```
INSERT INTO tableName(colunmName1, columnName2......)
VALUES (dataForColumnName1,dataForColumnName1......)
		,(data1, data2, datan.........)
;
```
2. `SELECT * FROM tableName;`
3. `SHOW WARNINGS;`
4. 
```
CREATE TABLE tableName 
(
	columnName DATATYPE NOT NULL,
	columnName DATATYPE NOT NULL
);
```
5. 
```
CREATE TABLE cats4
(
	name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
	age INT NOT NULL DEFAULT 99
);
```

6. 
```
CREATE TABLE unique_cats (
	cat_id INT NOT NULL,	
	name VARCHAR(100),
	age INT,
	PRIMARY KEY (cat_id);
)
```
7. 
```
CREATE TABLE unique_cats2 (
	cat_id INT NOT NULL AUTO_INCREMENT,	
	name VARCHAR(100),
	age INT,
	PRIMARY KEY (cat_id);
)
```