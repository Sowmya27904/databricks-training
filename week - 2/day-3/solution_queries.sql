-- Week 2 - Day 3: Advanced Joins & Set Operations Solutions

-- Question 1
SELECT e.emp_name AS employee, m.emp_name AS manager 
FROM employees e 
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- Question 2
SELECT e.emp_name, d.dept_name 
FROM employees e 
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- Question 3
SELECT e.emp_name AS employee, m.emp_name AS manager 
FROM employees e 
INNER JOIN employees m ON e.manager_id = m.emp_id;

-- Question 4
SELECT d.dept_name, COALESCE(SUM(e.salary), 0) AS total_salary_paid 
FROM departments d 
LEFT JOIN employees e ON d.dept_id = e.dept_id 
GROUP BY d.dept_name;

-- Question 5
SELECT emp_name 
FROM employees 
WHERE dept_id IS NULL;

-- Question 6
SELECT e.emp_name, p.project_name 
FROM employees e 
LEFT JOIN projects p ON e.emp_id = p.emp_id;

-- Question 7
SELECT e.emp_name, p.project_name 
FROM employees e 
INNER JOIN projects p ON e.emp_id = p.emp_id;

-- Question 8
SELECT e.emp_name, p.project_name 
FROM employees e 
RIGHT JOIN projects p ON e.emp_id = p.emp_id;

-- Question 9
SELECT emp_name, salary 
FROM employees;

-- Question 10
SELECT e.emp_name, d.dept_name 
FROM employees e 
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- Question 11
SELECT d.dept_name, e.emp_name 
FROM departments d 
LEFT JOIN employees e ON d.dept_id = e.dept_id;

-- Question 12
SELECT e.emp_name, c.phone, c.email 
FROM employees e 
LEFT JOIN employee_contacts c ON e.emp_id = c.emp_id;

-- Question 13
SELECT e.emp_name, d.dept_name 
FROM employees e 
LEFT JOIN departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name 
FROM employees e 
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- Question 14
SELECT e.emp_name, p.project_name 
FROM employees e 
LEFT JOIN projects p ON e.emp_id = p.emp_id 
WHERE p.project_id IS NULL;

-- Question 15
SELECT e.emp_name, p.project_name 
FROM employees e 
LEFT JOIN projects p ON e.emp_id = p.emp_id;

-- Question 16
SELECT p.project_name, e.emp_name 
FROM projects p 
LEFT JOIN employees e ON p.emp_id = e.emp_id;

-- Question 17
SELECT e.emp_name AS employee, m.emp_name AS manager, p.project_name 
FROM employees e 
INNER JOIN employees m ON e.manager_id = m.emp_id 
INNER JOIN projects p ON e.emp_id = p.emp_id;

-- Question 18
SELECT e.emp_name, d.dept_name 
FROM employees e 
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- Question 19
SELECT e2.emp_name 
FROM employees e1 
INNER JOIN employees e2 ON e1.dept_id = e2.dept_id 
WHERE e1.emp_name = 'Vijay' AND e2.emp_name <> 'Vijay';

-- Question 20
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count 
FROM departments d 
LEFT JOIN employees e ON d.dept_id = e.dept_id 
GROUP BY d.dept_name;

-- Question 21
SELECT e.emp_name, p.project_name 
FROM employees e 
INNER JOIN projects p ON e.emp_id = p.emp_id 
WHERE e.dept_id IS NULL;

-- Question 22
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees 
FROM departments d 
LEFT JOIN employees e ON d.dept_id = e.dept_id 
GROUP BY d.dept_name;

-- Question 23
SELECT e.emp_name AS employee, m.emp_name AS manager 
FROM employees e 
INNER JOIN employees m ON e.manager_id = m.emp_id 
WHERE m.manager_id IS NOT NULL;

-- Question 24
SELECT e.emp_name AS employee, COALESCE(m.emp_name, 'CEO') AS manager 
FROM employees e 
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- Question 25
SELECT d.dept_name, COALESCE(AVG(e.salary), 0) AS average_salary 
FROM departments d 
LEFT JOIN employees e ON d.dept_id = e.dept_id 
GROUP BY d.dept_name;

-- Question 26
SELECT e.emp_name, d.dept_name, p.project_name 
FROM employees e 
LEFT JOIN departments d ON e.dept_id = d.dept_id 
LEFT JOIN projects p ON e.emp_id = p.emp_id;

-- Question 27
SELECT emp_name 
FROM employees 
WHERE salary IS NULL;

-- Question 28
SELECT e.emp_name, p.project_name 
FROM employees e 
LEFT JOIN projects p ON e.emp_id = p.emp_id
UNION
SELECT e.emp_name, p.project_name 
FROM employees e 
RIGHT JOIN projects p ON e.emp_id = p.emp_id;

-- Question 29
SELECT e.emp_name, d.dept_name, p.project_name, c.email 
FROM employees e 
LEFT JOIN departments d ON e.dept_id = d.dept_id 
LEFT JOIN projects p ON e.emp_id = p.emp_id 
LEFT JOIN employee_contacts c ON e.emp_id = c.emp_id;

-- Question 30
SELECT e.emp_name, d.dept_name 
FROM employees e 
LEFT JOIN departments d ON e.dept_id = d.dept_id;
