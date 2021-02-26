# Creating Databases And Tables

## Syllabus

- Creating Databases
- Dropping Databases
- Using Databases
- Introduction To Tables
- Basic Datatypes

#

## Creating New Databases in MySQL

- command that will **list current databases** in MySQL server
  `show databases;`

- command that will **create database**
  `CREATE DATABSE nameOfDatabase;`

- **Helpful note** you can clear the screen `ctrl-l`

## Dropping/Deleting Databases in MySQL

- command that will **delete database**
  `DROP DATABASE nameOfDatabase;`

- **Helpful note** if you forget to add a semicolon `;` in your code. It will not run but go to next line. In the empty line simply add a semicolon and the code you enter will work after you hit enter
  - `;` indicates query is done

## Using Databases

- So now I can both create and delete databases.... How do I use them?
- The command tells MySQL **which database we want to be working with**
  `USE databaseName;`

      - when you enter this command you'll get the prompt

  `Database changed`

- This command that will tell you **the currently used database**
  `SELECT database();`

      - So when you hit enter. You'll see the database you are currently using or if you are not using any it'll show `null` as database

```
+-----------------+
| database()      |
+-----------------+
| dog_walking_app |
+-----------------+
```

- if you are not using any it'll show `null` as database

```
+-----------------+
| database()      |
+-----------------+
| null			  |
+-----------------+
```

#

## Introduction To Tables

- It's important to understand that a database is just a collection of tables
  - That is where the data is stored (well for relational databases at least...)
    - relational databases uses tabular data
- **Tables** are a collection of related data held in a structured format within a database
  - basically tables hold data!

### Let's breakdown A Table and It's Parts

| Name   | Breed         | Age |
| ------ | ------------- | --- |
| Blue   | Scottish Fold | 1   |
| Rocket | Persian       | 3   |
| Monty  | Tabby         | 10  |
| Sam    | Munchkin      | 5   |

1. when we refer to **Columns** (Header)

| Name | Breed | Age |
| ---- | ----- | --- |

2. **Rows** are the actual data

|          |                   |       |
| -------- | ----------------- | ----- |
| **Blue** | **Scottish Fold** | **1** |
| Rocket   | Persian           | 3     |
| Monty    | Tabby             | 10    |
| Sam      | Munchkin          | 5     |

- Databases are made up of lots of tables
  - it can get super complex (i.e. Take facebooks database for consideration)

#

## Data Types

### The Importance Of Data Types

| Name   | Breed         | Age           |
| ------ | ------------- | ------------- |
| Blue   | Scottish Fold | 1             |
| Rocket | Persian       | 3             |
| Monty  | Tabby         | ten           |
| Sam    | Munchkin      | I am yung cat |

- This example has **Inconsistent Data** which isn't allowed in SQL
  - If you want to do something with the data like calculation with the age in the example you'll get an error with certain values due to inconsistent data types... this is limiting the processing power of our database
- When you create a new table you need specify datatypes (i.e Name has to be text, Age has to be an integer)

### Different Data Types

- **Numeric Types** (Used for representing numbers)
  - INT
  - SMALLINT
  - TINYNIT
  - MEDIUMINT
  - BIGINT
  - DECIMAL
  - NUMERIC
  - FLOAT
  - DOUBLE
  - BIT
- **String Types** (Used for representing characters/text)
  - CHAR
  - VARCHAR
  - BINARY
  - VARBINARY
  - BLOB
  - TINYBLOB
  - MEDIUMBLOB
  - LONGBLOB
  - TEXT
  - TINYTEXT
  - MEDIUMTEXT
  - LONGTEXT
  - ENUM
- **Date Types** (Used for representing dates)
  - DATE
  - DATETIME
  - TIMESTAMP
  - TIME
  - YEAR

### The reality of Data Types

- There's alot and you don't have to use all of them everytime
- For now I'll focus on most common types

- **Numeric Types** (Used for representing numbers)

  - **INT**
    - `int`

- **String Types** (Used for representing characters/text)
  - **VARCHAR**

### INT

- **INT** represents whole numbers
  - it's max value is -4294967295 to 4294967295

### varchar

- **varchar** is a way of representing text or strings and it's variable length
  - Between 1 and 255 characters
  - e.g 'Coffee!!' or 'Hi my name is computer!' or '99'
- When you use varchar you need to specify length
  - `varchar(100)`

#

## Creating Tables

### Basic Syntax for Creating Table

```
CREATE TABLE tableName
	(
		columnName dataType,
		columnName dataType,
	);
```

- example:

CREATE TABLE cats
(
name VARCHAR(100),
age int
);

### How do we know it works?

- Command **shows the current tables of the database being used**
  `SHOW tables;`

- Command **shows the current columns of the specified table in the database currently being used**
  `SHOW COLUMNS FROM tableNAME`
  OR
  `DESC tableName`

#

## Deleting Tables

- Command to **delete tables in your database**
  `DROP TABLE tableName`

#

## Command List

1. `SHOW DATABASES;`
2. `CREATE DATABASE yourDatabaseName;`
3. `DROP DATABASE yourDatabaseName;`
4. `USE yourDatabaseName;`
5. `SELECT database();`
6. `CREATE TABLE tableName (columnName dataType, columnName dataType);`
7. `SHOW tables`
8. `SHOW COLUMNS FROM tableNAME`
9. `DESC tableName`
