Section 5: CRUD Commands

# CRUD Commands

## Syllabus
- Intro to CRUD
- Preparing Our Data
- Introduction to `SELECT` --------- READ
- Introduction to `WHERE`	--------- READ
- Introduction to `Aliases` --------- READ
- The `Update` Command
- Introduction to `DELETE`

#
## Let's Talk CRUD
- CRUD is an acronym that stands for 
	- C = 'Create'
	- R = 'Read'
	- U = 'Update'
	- D = 'Delete'
- They're 4 basic actions we do to **manipulate our data**
	- We already demonstrated **(C)reate** when creating users using the `INPUT` command
	- We also seen and demonstrated **(R)ead** when we display our data in our tables using `SELECT` command
- How do we change some info
	- Update
- How do we delete info
	- Delete

#
## Introduction to CRUD
- CRUD otherwise known as CREATE, READ, UPDATE, DELETE
	- These are the 4 main operations that we perform on our data

### (C)reate
- We do this through `INSERT` command
```
INSERT INTO cats (name, age)
VALUE ('Milo', 2);
```
### Example table we will be using
```
CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  );
```

```
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
```


| ID  | Name | Breed | Age
| ------------- | ------------- | ------------- | ------------- 
| 1  | Ringo   |Tabby | 4
| 2  | Cindy  |Maine Coon | 10
| 3  | Dumbledore  |Maine Coon | 11
| 4  | Egg  |Persian | 4
| 5  | Misty  |Tabby | 13
| 6  | George Michael  |Ragdoll | 9
| 7  | Jackson  |Sphynx | 7


### (R)ead
- How do we retrieve and search data in a database?
	- We use the `SELECT` command
- Remeber this?
	- `SELECT * FROM cats`

- Lets break it down
	- `*` means **Give me all columns from specified tables**
		- Uses default order

### SELECT Expression
- We can get specific using this command 
	- What columns do you want?
	- `SELECT nameOfColumn FROM tableName`

- Example:

`SELECT name FROM cats;`

| Name 
| ----- 
| Ringo   
|Cindy 
| Dumbledore 
| Egg 
| Misty  
| George Michael  
| Jackson  

### Multiple SELECT Expression
- you can select multiple columns simply by adding a `,` between the columns
	- `SELECT nameOfColumn, nameOfColumn2, nameOfColumn2  FROM tableName;`

#
## Introduction to `WHERE`
- `This` allows us to get specific
	- (e.g. I want all cats that are 4 years old)

- example

```
SELECT * FROM cats WHERE age = 4;
```

- By default `WHERE` command is case insensitive

#
## Introduction to `ALIASES`
- We can specify how are data should be displayed back to us
- We use the `AS` command to create an alias (changes the column name)

- example
```
SELECT cat_id AS id, name FROM cats;
```

- multiple `AlIASES`
```
SELECT cat_id AS 'kitty breed', name AS 'cat name' FROM cats;
```

#
## Introduction to `ALIASES`
- How do we alter existing data?
```
UPDATE tableName SET columnName = newValue
WHERE columnName = oldValue;
```

- Example (change Breed name of tabby into Shorthair )

```
UPDATE cats SET breed = 'Shorthair'
WHERE breed = 'Tabby';
```

- Another example (change misty age from 13 to 14)

```
UPDATE cats SET age = 14
WHERE name = 'Misty';
```
#
## Introduction to `DELETE`
- How do you delete data.... Well it's pretty similar to selecting things

- example

```
DELETE FROM cats WHERE name = 'Egg';
```


- Delete all data in table
	- `DELETE FROM tableName;`
#
## Command List

1. `SELECT nameOfColumn FROM tableName`
2. `SELECT nameOfColumn, nameOfColumn2 FROM tableName;`
3. `SELECT nameOfColumn AS newColumnName FROM tableName`
4. 
```
SELECT nameOfColumn1 AS newColumnName1, nameofColumn2 AS newColumnName2 FROM 
tableName
```
6. 
```
UPDATE tableName SET columnName = newValue
WHERE columnName = oldValue;
```
7. 
```
DELETE FROM tableName Where columnName = Value;
```
8. `DELETE FROM tableName;`
