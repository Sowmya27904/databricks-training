--1. Display all students and the courses they are enrolled in. Include students who are not enrolled in any course.
SELECT
    s.student_id,
    s.student_name,
    c.course_name
FROM students s
LEFT JOIN enrollments e
    ON s.student_id = e.student_id
LEFT JOIN courses c
    ON e.course_id = c.course_id;
--output:
+------------+---------------+---------------------+
| student_id | student_name  | course_name         |
+------------+---------------+---------------------+
|          1 | Alice Johnson | SQL Basics          |
|          1 | Alice Johnson | Python Fundamentals |
|          2 | Bob Smith     | SQL Basics          |
|          3 | Charlie Brown | Cloud Computing     |
|          4 | Diana Prince  | Cyber Security      |
|          5 | Ethan Hunt    | NULL                |
|          6 | Fiona Green   | NULL                |
+------------+---------------+---------------------+

--2. Find all courses that currently have no students enrolled.
SELECT
    c.course_id,
    c.course_name
FROM courses c
LEFT JOIN enrollments e
    ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

--output:
+-----------+------------------+
| course_id | course_name      |
+-----------+------------------+
|       103 | Data Analytics   |
|       105 | Machine Learning |
+-----------+------------------+

--3. Display all instructors and the courses they teach, including instructors who are not assigned to any course.
SELECT
    i.instructor_id,
    i.instructor_name,
    c.course_name
FROM instructors i
LEFT JOIN courses c
    ON i.instructor_id = c.instructor_id;
--OUTPUT:
+---------------+-----------------+---------------------+
| instructor_id | instructor_name | course_name         |
+---------------+-----------------+---------------------+
|             1 | Sarah Connor    | SQL Basics          |
|             2 | Michael Scott   | Python Fundamentals |
|             3 | Tony Stark      | Cloud Computing     |
|             4 | Bruce Wayne     | Cyber Security      |
+---------------+-----------------+---------------------+

--4. Find all courses that do not have an instructor assigned.
SELECT
    course_id,
    course_name
FROM courses
WHERE instructor_id IS NULL;
--OUTPUT:
+-----------+------------------+
| course_id | course_name      |
+-----------+------------------+
|       103 | Data Analytics   |
|       105 | Machine Learning |
+-----------+------------------+
  
--5. Display all students and enrollment information using a RIGHT JOIN.
SELECT
    s.student_id,
    s.student_name,
    e.course_id,
    e.enrollment_date
FROM students s
RIGHT JOIN enrollments e
    ON s.student_id = e.student_id;
--OUTPUT:
+------------+---------------+-----------+-----------------+
| student_id | student_name  | course_id | enrollment_date |
+------------+---------------+-----------+-----------------+
|          1 | Alice Johnson |       101 | 2024-01-10      |
|          1 | Alice Johnson |       102 | 2024-01-12      |
|          2 | Bob Smith     |       101 | 2024-01-15      |
|          3 | Charlie Brown |       104 | 2024-01-20      |
|          4 | Diana Prince  |       106 | 2024-01-25      |
+------------+---------------+-----------+-----------------+

  
--6. Find students who are not enrolled in any course.
SELECT
    s.student_id,
    s.student_name
FROM students s
LEFT JOIN enrollments e
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
--OUTPUT:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
|          5 | Ethan Hunt   |
|          6 | Fiona Green  |
+------------+--------------+

  
--7. Use a FULL OUTER JOIN to display all students and enrollments, including unmatched rows from both tables.
SELECT
    s.student_id,
    s.student_name,
    e.course_id,
    e.enrollment_date
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
UNION
SELECT
    s.student_id,
    s.student_name,
    e.course_id,
    e.enrollment_date
FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id;

--  OUTPUT:
+------------+---------------+-----------+-----------------+
| student_id | student_name  | course_id | enrollment_date |
+------------+---------------+-----------+-----------------+
|          1 | Alice Johnson |       101 | 2024-01-10      |
|          1 | Alice Johnson |       102 | 2024-01-12      |
|          2 | Bob Smith     |       101 | 2024-01-15      |
|          3 | Charlie Brown |       104 | 2024-01-20      |
|          4 | Diana Prince  |       106 | 2024-01-25      |
|          5 | Ethan Hunt    |      NULL | NULL            |
|          6 | Fiona Green   |      NULL | NULL            |
+------------+---------------+-----------+-----------------+

  
--8. Find all courses that have never appeared in the enrollments table.
SELECT
    c.course_id,
    c.course_name
FROM courses c
LEFT JOIN enrollments e
    ON c.course_id = e.course_id
WHERE e.course_id IS NULL;
--OUTPUT:
+-----------+------------------+
| course_id | course_name      |
+-----------+------------------+
|       103 | Data Analytics   |
|       105 | Machine Learning |
+-----------+------------------+

  
--9.Display all instructors and courses using a FULL OUTER JOIN and identify unmatched rows.
SELECT
    i.instructor_id,
    i.instructor_name,
    c.course_id,
    c.course_name
FROM instructors i
LEFT JOIN courses c
ON i.instructor_id = c.instructor_id
WHERE c.instructor_id IS NULL
UNION
SELECT
    i.instructor_id,
    i.instructor_name,
    c.course_id,
    c.course_name
FROM instructors i
RIGHT JOIN courses c
ON i.instructor_id = c.instructor_id
WHERE i.instructor_id IS NULL;
--OUTPUT:
+---------------+-----------------+-----------+------------------+
| instructor_id | instructor_name | course_id | course_name      |
+---------------+-----------------+-----------+------------------+
|          NULL | NULL            |       103 | Data Analytics   |
|          NULL | NULL            |       105 | Machine Learning |
+---------------+-----------------+-----------+------------------+

  
--10.Create a report showing: student name, course name, and instructor name. Include rows even if course or
instructor information is missing.
  SELECT
    s.student_name,
    c.course_name,
    i.instructor_name
FROM students s
LEFT JOIN enrollments e
    ON s.student_id = e.student_id
LEFT JOIN courses c
    ON e.course_id = c.course_id
LEFT JOIN instructors i
    ON c.instructor_id = i.instructor_id;

--OUTPUT:
+---------------+---------------------+-----------------+
| student_name  | course_name         | instructor_name |
+---------------+---------------------+-----------------+
| Alice Johnson | SQL Basics          | Sarah Connor    |
| Alice Johnson | Python Fundamentals | Michael Scott   |
| Bob Smith     | SQL Basics          | Sarah Connor    |
| Charlie Brown | Cloud Computing     | Tony Stark      |
| Diana Prince  | Cyber Security      | Bruce Wayne     |
| Ethan Hunt    | NULL                | NULL            |
| Fiona Green   | NULL                | NULL            |
+---------------+---------------------+-----------------+
