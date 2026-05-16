# SQL Joins Assignment

## Overview
This assignment helped me learn different types of SQL joins and how to retrieve related data from multiple tables in a database.

## Topics Learned
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- Working with multiple tables
- Finding matched and unmatched records
- Using foreign keys and relationships

## Join Syntax

### INNER JOIN
Returns only matching records from both tables.

```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

1.LEFT JOIN

Returns all records from the left table and matching records from the right table.

SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

2. RIGHT JOIN

Returns all records from the right table and matching records from the left table.

SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

3.FULL OUTER JOIN

Returns all matching and unmatched records from both tables.

SELECT columns
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name;

   ##MySQL Alternative for FULL OUTER JOIN
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name
UNION
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;


4.CROSS JOIN

Returns all possible combinations of rows from both tables.

SELECT columns
FROM table1
CROSS JOIN table2;

--Files Included
1.students
Contains:
student_id
student_name
email

2.instructors
Contains:
instructor_id
instructor_name
department

3.courses
Contains:
course_id
course_name
instructor_id

4.enrollments
Contains:
enrollment_id
student_id
course_id
enrollment_date

## What I Practiced
1.Displaying students with enrolled courses
2.Finding students without enrollments
3.Finding courses without instructors
4.Identifying courses with no enrollments
5.Combining data from multiple tables
6.Understanding unmatched rows using joins

Tools Used
DB Fiddle - versions - SQL, MySQL, PostgreSQL

Learning Outcome

Through this assignment, I understood how SQL joins work and how tables are connected using primary keys and foreign keys.
