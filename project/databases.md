# Relational Databases

(short recap from 1st year)

## TOC

1. Relational Database Concepts
1. SQL basics
   - Creating a Database
   - Querying data
   - Updating data
   - Deleting data
   - SQL scripts
1. Assignment

## Relational Database Concepts

### Database

- Database is a collection of related data
- Long term storage: data is persisted and can be retrieved later
- Typically, a database contains also metadata
- Descriptions of data types, structures, and constraints of the actual data
- Compare to plain files
- **Database Management System** (DBMS) is collection of applications that can be used to create and maintain databases
  - MySQL, SQLite, Microsoft SQL Server, etc.
- Note: several applications or users can use the same database

### Database model

- A **Database model** defines
  - Structure of a database
  - How data is stored, organized, and manipulated
- Different database models
  - Relational model
  - Network model
  - Object model
  - Document model
- **Relational model** is the most widely used database model
  - Implemented by several DBMSes (e.g. MySQL, Postgre, Oracle, etc.) since 1970s
  - Relational databases are typically operated through **Structured Query Language (SQL)**

### Relational database model

- Data is stored in named tables
- A table is a collection of records (rows) that have similar properties (columns)
- Each table has a dedicated column (primary key, PK) that identifies its records unambiguously
- Each table may have a column (foreign key, FK) that is used to reference primary key in another table
- Note:
  - Columns have no specific order
  - Records have no specific order
- Designing a database comprises of defining and identifying tables, columns, and keys we need
- After a database has been designed and implemented, the actual data (records) may be inserted (or imported) into it
- An operational database may be queried for information (search and
combine information stored in records)

#### MediaItems table example data

| media_id (PK) | filename | filesize | title     | description | user_id (FK) | media_type | created_at           |
|----------|----------|----------|----------------|-------------|---------|------------|---------------------------|
| 9632     | ffd8.jpg | 887574   | Favorite drink |             | 305     | image/jpeg | 2023-10-16T19:00:09.000Z  |
| 9626     | dbbd.jpg | 60703    | Miika          | My Photo    | 305     | image/jpeg | 2023-10-13T12:14:26.000Z  |
| 9625     | 2f9b.jpg | 30635    | Aksux and Jane | friends     | 260     | image/jpeg | 2023-10-12T20:03:08.000Z  |

#### User table example data

| user_id (PK) | username  | password   | email        | user_level_id | created_at                |
|---------|-----------|------------|-------------------|---------------|---------------------------|
| 260     | VCHar     | secret123  | vchar@example.com | 1             | 2020-09-12T06:56:41.000Z  |
| 305     | Donatello | secret234  | dona@example.com  | 1             | 2021-12-11T06:00:41.000Z  |
| 3609    | Anon5468  | secret345  | x58df@example.com | 3             | 2023-04-02T05:56:41.000Z  |

**What is the relation between these two tables?**

### Primary key (PK)

- A column (or group of colums) that uniquely identifies records (rows) in the table
- Must be unique value, two records cannot have the same value for the primary key
- Each record must have a value for primary key
- Every table must have a primary key (defined by database designer)
- Sometimes it is difficult to identify proper, unique primary identifier among columns
  - in these cases, a surrogate key (e.g "id") may be added
  - surrogate key is typically a sequential number (e.g., an auto-incremented number in SQL databases) that is assigned to each record as it is created

### Foreign key (FK)

- Foreign key references primary key in another table
  - creates a relation between tables
  - Reference may be missing (NULL value)

```mermaid
erDiagram

Table Users {
  user_id INT PK
  username VARCHAR
  password VARCHAR
  email VARCHAR
  user_level_id INT FK
  created_at TIMESTAMP
}

Table MediaItems {
  media_id INT PK
  user_id INT FK
  filename VARCHAR
  filesize INT
  media_type VARCHAR
  title VARCHAR
  description VARCHAR
  created_at TIMESTAMP
}

Users ||--o{ MediaItems : owns

```

### Integrity constraints

- Integrity constraints are **rules that database records must satisfy**
  - Otherwise database might end up in inconsistent or unusable state
  - Constraints are (usually) enforced by DBMS at all times
- **Primary key constrain**: Primary key values must be unique
- **Referential Integrity Constraint**: Referenced primary key value must exist (enforcement varies between DBMSes)
- **Value constraint**: Each column has a data type defined; values must be within the range

### Database server and client

- **Database server** is a computer that runs database system
  - You need an account to use the system
- **Database client** is a program that connects to server and requests database services
  - Client may have just a command line or graphical user interface
  - In this course the client will be a back-end web application
- Typically client and server reside on different machines, but may also run in the same machine
  - E.g. the development environment setup on your laptop

### Terminology in Finnish

- Database: tietokanta
- Table: taulu
- Record: tietue
- Column (field): sarake (kenttä)
- Primary Key: perusavain/pääavain
- Foreign Key: viiteavain
- Integrity Constraint: eheysrajoite
- DBMS: tietokannanhallintajärjestelmä
- Key Constraint: avainrajoite
- Referential Integrity Constraint: viite-eheysrajoite
- Value Constraint: arvoaluerajoite

## Structured Query Language, SQL

- Standardized language for operating relational databases
  - Supported by many DBMSes – MariaDB, MySQL, SQLite, PostgreSQL, Oracle, etc.
  - Minor differences between implementations
- Operations for:
  - Database creation
  - Data insertion, deletion, and updates
  - Querying database
- Declarative query language: user describes what data he wants to find, and DBMS figures out a way to get it

### Creating a database

```sql
-- Remove existing database completely (needs a root access to DBMS)
DROP DATABASE IF EXISTS database_name;
-- Create a new database (needs a root access to DBMS)
CREATE DATABASE database_name;
-- Connect to the database
USE database_name;

-- Example

DROP DATABASE IF EXISTS mediashare;
CREATE DATABASE mediashare;
USE mediashare;
```

Notes:

- SQL statements end with semicolon and may be split into several lines
- SQL statements can be a written in a script (plain text) file and run from there
- SQL is not case sensitive, but it is a good practice to write SQL keywords in uppercase
- Use `show databases` command to show available databases
- `DROP DATABASE database_name;` deletes the database and all its tables and data completely (No comfirmation is asked!)

### Creating tables

```sql
CREATE TABLE table_name (
  column_name1 data_type [NOT NULL] [UNIQUE] [PRIMARY KEY],
  column_name2 data_type [NOT NULL] [UNIQUE],
  column_name3 data_type [NOT NULL] [UNIQUE],
  ...
  column_nameN data_type [NOT NULL] [UNIQUE],
  PRIMARY KEY (column_name1)
);
```

- `create table` statement creates a new database table (just the table structure, not any records)
- The statement defines:
  - Table name
  - Column names and data types
  - Primay key column(s)
  - Possibly foreign keys as well (enforcement of foreign key constraint depends on the database engine and settings)
  - Other constraints, e.g. NOT NULL if column value cannot be NULL, UNIQUE if column values must be unique, AUTO_INCREMENT if column value is automatically incremented when new record is inserted
- Tips:
  - `show tables` lists all existing tables
  - `describe table_name` describes details of given table
  - `drop table_name` deletes given table completely
  - `alter table` may be used to modify existing table
  - Creating tables is often a bit tedious, so it’s best to store the statements in a script file

Example:

```sql
CREATE TABLE Users (
  user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  user_level_id INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE MediaItems (
  media_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  filename VARCHAR(255) NOT NULL,
  filesize INT NOT NULL,
  media_type VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (media_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
```

- Column data types define what kind of data is stored in the column
- There are plenty of different data types, see e.g. <https://www.w3schools.com/sql/sql_datatypes.asp>
- The most data types are:
  - INT - Integer values
  - DOUBLE - Floating point numbers
  - VARCHAR - Strings
  - DATE - Dates
  - TIMESTAMP/DATETIME - Date and time
- Foreign key specifications are not mandatory, but necessary if one wants to enforce foreign key constraint (Referenced tables should be created first)

### Inserting data

```sql
INSERT INTO table_name (column1, column2, column3, ...)
  VALUES (value1, value2, value3, ...);

-- or

INSERT INTO table_name
  VALUES (value1, value2, value3, ...);
```

- `insert into` statement inserts records into existing table
  - First version specifies values to given columns, the latter version requires
values for all the columns
- You can list all existing records with `select * from table_name;`

Examples:

```sql
INSERT INTO Users VALUES (260, 'VCHar', 'secret123', 'vchar@example.com', 1, null);
INSERT INTO Users VALUES (305, 'Donatello', 'secret234', 'dona@example.com', 1, null);

-- Following will generate an error: FK constraint fails because user_id 1606 does not exist
INSERT INTO MediaItems (filename, filesize, title, description, user_id, media_type) 
  VALUES ('ffd8.jpg', 887574, 'Favorite drink', '', 1606, 'image/jpeg');

-- Inserting multiple records at once
INSERT INTO MediaItems (filename, filesize, title, description, user_id, media_type) 
  VALUES ('ffd8.jpg', 887574, 'Favorite drink', null, 305, 'image/jpeg'),
         ('dbbd.jpg', 60703, 'Miika', 'My Photo', 305, 'image/jpeg'),
         ('2f9b.jpg', 30635, 'Aksux and Jane', 'friends', 260, 'image/jpeg');

```

Note: referenced records (`user_id` in this case) in other tables must exist (foreign key constraint)
There are other ways and tools for mass importing data, e.g. from CSV files, other databases, etc.

### Querying data

- SQL queries retrieve meaningful data from a database
- SQL is a declarative language
  - Tell what kind of data you’re interested in
  - DBMS figures out a way to get the data for you

Select statement:

```sql
SELECT [ALL | DISTINCT] column1[,column2]
  FROM table1[,table2]
  [WHERE conditions]
  [GROUP BY column-list]
  [HAVING conditions]
  [ORDER BY column-list [ASC | DESC] ]
  [LIMIT number];
```

- `select` - selects desired column(s) `*` means every column
- `from` which table(s) the data is retrieved from
- `where` - Conditions that records must satisfy (optional)
- `group by` - Group records by given column(s) (optional)
- `having` - Conditions that groups must satisfy (optional)
- `order by` - Order records by given column(s) in ASCending or DESCending order (optional)
- `limit` - Limit the number of records (optional)

```sql
-- Select all columns from the MediaItems table:
SELECT * FROM MediaItems;

-- Select all media items for a specific user:
SELECT * FROM MediaItems WHERE user_id = 260;

-- Select usernames and emails from the Users table:
SELECT username, email FROM Users;

-- Select the top 5 largest media items
SELECT * FROM MediaItems ORDER BY filesize DESC LIMIT 2;
```

#### Operators and functions

- Arithmetic operators: + - * / %
- Equal to: `=` example: `firstname = 'Eric’`
- Not equal to: `<>` example: `firstname <> 'Mike’`
- Greater than: `>` example: `dateofbirth > '1993-01-31’`
- Less than: `<` example: `salary < 2000`
- Greater (Lesser) than or equal: `>=` (or `<=`) example: `salary >= 2000`
- Match a character pattern: `LIKE` example: `firstname LIKE 'Mi%'`
- Between an inclusive range: `BETWEEN` example: `salary BETWEEN 1000 AND 2000`
- Equal to one of multiple possible values: `IN` example: `deptcode IN (101, 103, 209)`
- Compare to null (missing data): `IS` or `IS NOT` example: `address IS NULL`
- Absolute value: `ABS(x)`
- Sign (-1, 0, -1): `SIGN(x)`
- Modulo: `MOD(x)`
- Raise x to power y: `POWER(x, y)`
- Square root: `SQRT(x)`
- Largest integer <= x: `FLOOR(x)`
- Smallest integer >= x: `CEIL(x)`
- Round to nearest integer: `ROUND(x)`
- Round x to d decimal places: `ROUND(x, d)`

Examples:

```sql
-- Find users with a username starting with 'D':
SELECT * FROM Users WHERE username LIKE 'D%';

-- Select users created after a certain date:
SELECT * FROM Users WHERE created_at > '2023-01-01';
```

#### Querying several tables

- Queries often need to collect data from two (or more) tables
- If one specifies two tables in `from`-clause, the result will include
every combination of records from both tables called "cartesian product". For example, if the tables have 1000 records both, the result will have 1000 x 1000 = 1M rows
- Typically, one needs to specify which records from both sides are to be combined (very often through foreign keys) by using `WHERE` condition or `JOIN` operation

Examples:

```sql
-- "cartesian product" of two tables:
SELECT * FROM Users, MediaItems;

-- Select all columns from both tables where user_id matches:
SELECT * FROM Users, MediaItems WHERE Users.user_id = MediaItems.user_id;

-- Select all media items along with the username of the owner using a (inner) join:
SELECT MediaItems.*, Users.username 
  FROM MediaItems 
  JOIN Users ON MediaItems.user_id = Users.user_id;

-- Select media items with the highest filesize for each user using a subquery:
SELECT * FROM MediaItems AS MI1
WHERE filesize = (
  SELECT MAX(filesize) FROM MediaItems AS MI2
  WHERE MI1.user_id = MI2.user_id
);

-- Select all media items and all users whether they have media items or not. 
SELECT 
  Users.user_id, 
  Users.username, 
  MediaItems.media_id, 
  MediaItems.title, 
  MediaItems.filename
FROM 
  Users
LEFT OUTER JOIN MediaItems 
  ON Users.user_id = MediaItems.user_id;
```

### Updating data

Database state is changed by following operations:

- Inserting records
- Updating records
- Deleting records

- Database content updates are very common
- Database structure (tables, keys, types, etc.) should change very seldom if at all (after the design time)
  - Changes in the structure would often break applications that use the database

#### Update statement

```sql
UPDATE table_name
  SET column1 = value1, column2 = value2, ...
  WHERE condition;
```

`UPDATE` changes column values for record(s)

- If `WHERE` is missing, all records in the table are changed, Be careful!
- It is possible to specify modified records in a subquery

Examples:

```sql
UPDATE Users SET user_level_id = 2 WHERE user_id = 260;

UPDATE MediaItems SET title = 'New title' WHERE media_id = 9632;
```

#### Delete statement

```sql
DELETE FROM table_name
  WHERE condition;
```

`DELETE` removes records from a database

- If WHERE is missing, all records are removed (table is emptied). Be careful, no questions asked!

Examples:

```sql
DELETE FROM MediaItems WHERE media_id = 9632;
```

### SQL scripts

- Separate text files that contain SQL statements
  - Can be executed as necessary on the sql command line: `source path-to-script.sql`
  - using the mysql command line tool: `mysql -u username -p database_name < path-to-script.sql`
  - or in a graphical DBMS tool (Many graphical DBMS tools (e.g. MySQL Workbench) actually generate SQL scripts for its operations)
- Recommended way for database creation and data import
- Databases and their contents can be easily exported and imported as SQL scripts
  - export using a command line tool: `mysqldump -u username -p database_name > path-to-script.sql`
  - Used for backups, copying and moving databases, etc.

---

## Group assignment (project team)

Think about your project requiremens. What kind of data is needed?

1. Design tables for the app (in addition to the ones we already have in examples)
1. Draw a diagram of the database structure (including relations between tables)
1. Define the data types for the columns
1. Define primary keys and foreign keys
1. Implement SQL statements for creating the tables
1. Insert multiple records of mock data into the tables
1. Think about use cases for the data from the application point of view and provide examples how to update, delete and query the data in a meaningful way
1. Create a script including all your SQL statements (create tables, insert data, queries, updates, etc.)

---

<!-- add mermaid support for gh pages -->
<script type="module">
    Array.from(document.getElementsByClassName("language-mermaid")).forEach(element => {
      element.classList.add("mermaid");
    });
    import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
    mermaid.initialize({ startOnLoad: true });
</script>
