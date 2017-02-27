--Create a new table
CREATE TABLE Person (
   ID int NOT NULL IDENTITY,
   Name nvarchar(max),
   Salary decimal(18, 2) NOT NULL,
   Age int NOT NULL,
   CONSTRAINT PK_dbo.Person PRIMARY KEY (ID)
)

--Add a primary key to an existing table
ALTER TABLE Tacos
ADD PRIMARY KEY (ID)

--Add a column to a table
ALTER TABLE Person
ADD BirthDate DATETIME NOT NULL

--Change column properties
ALTER TABLE Person
ALTER COLUMN NAME nvarchar(max) NOT NULL

--Remove a column from a table
ALTER TABLE Person
DROP COLUMN Age

--Rename a column
--Qualify the first parameter with the table name, not the second
EXEC sp_rename 'Person.Salary', 'Wage', 'COLUMN'; 

--Rename a table
EXEC sp_rename 'Persons', 'Person';

--Allow insert statements to specify IDs
SET IDENTITY_INSERT Table1 ON;

--Insert rows from one table into another
INSERT INTO Table1
SELECT name, GETDATE(), '123 Street Ave.', status FROM Table2;

--Insert rows from one table into another *with IDENTITY_INSERT*
INSERT INTO Table1 (id, name, createdtimestamp, updatedtimestamp)
SELECT id, name, createdtimestamp, updatedtimestamp FROM Table2;

--Run a query on all tables in the database
sp_MSforeachtable 'alter table ? check constraint all'

--Check if table exists SQL 2000
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Employees')
BEGIN
    --DO THINGS
END

--Check if column exists SQL 2000
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Employees' AND COLUMN_NAME = 'JobName')
BEGIN
    --DO THINGS
END