Section 2: Introduction

# Introduction
[![Repository Status](https://img.shields.io/badge/Repository%20Status-Maintained-dark%20green.svg)](https://github.com/Adam20058/Rock-Paper-Scissors)
[![Author](https://img.shields.io/badge/Author-Adam%20Jemal-blue.svg)](https://www.linkedin.com/in/adamjemal/)

## Syllabus
- What is a Databse?
	- Database Vs. Database Management System
	- Why do they matter?
	- Why MySQL?
#
## Let's talk Databases
- A database is a 
	- collection of data
	- Method for **accessing** and **manipulating** the data 

## Database Vs. Database Management System
- on it's own the **database** is just a repository/collection of data
	- You can't do much with it such as (e.g. update information0
``**Your app => Database**``

- **Database Management System** allows us to interface with the database. 
	- So your app talks with the DBMS, the DBMS communicates with the DB in order to access the data and update the dat.

``**Your app => DBMS => Database**``

## Wrap-up: What is a Database? 
- **Database** - It's a structure set of computerized data with an accessible interface

#

## What is the difference between MySQL and SQL:

### What is SQL?
- **SQL** (Structured Query Language)
	- It's the language we use when we talk to our database. Basically the way we interact, access, and manipulate data in our databases
	- It exists seperately from DBMS
	
### How does SQL talk to our DB?
- We write lines which our called **queries (hence the name structure query language)** and once we hit enter/ run the sql code it is executed and goes off and talks to our database for us

- **QUICK EXAMPLE**
```
// Find all users who are 18 or Older
SELECT * FROM USERS WHERE Age >= 18
```

### MySQL
- MySQL is a DBMS (Database Management System)
	- It's a relational database and uses SQL
		- When we are working with MySQL we are actually writing SQL
- There are other DBMS that use SQL (e.g. PostGreSQL)
	- There are slight difference in syntax

### SQL Standard
- There is a standard of how SQL should work (**SQL Standard**)
	- All of these DBMS are tasked with implementing this standard in their own Database (DB) and making it work
		- sometimes they may be little different 

### Interesting points

- What makes DBMS unique are the features they implement that each one offers not the language (syntactical differences)
	- How secure one DBMS compared to another?
	- How fast one DBMS compared to another?

