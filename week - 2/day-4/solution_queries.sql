-- Week 2 - Day 4: Numeric & Null Handling Solutions

-- NULL HANDLING EXERCISES (TABLES A, B, C) --

-- Question 1
SELECT * 
FROM Employees 
WHERE salary IS NULL;

-- Question 2
SELECT * 
FROM Orders 
WHERE discount IS NOT NULL;

-- Question 3
SELECT * 
FROM Products 
WHERE category IS NULL;

-- Question 4
SELECT name, 
       IFNULL(salary, 0) AS cleaned_salary, 
       IFNULL(bonus, 1000) AS cleaned_bonus 
FROM Employees;

-- Question 5
SELECT order_id, customer_name, 
       COALESCE(amount, 500) AS adjusted_amount 
FROM Orders;

-- Question 6
SELECT name, 
       (IFNULL(salary, 0) + IFNULL(bonus, 0)) AS total_earnings 
FROM Employees;

-- Question 7
SELECT name, 
       COALESCE(salary, bonus, 0) AS earnings_fallback 
FROM Employees;

-- Question 8
SELECT product_name, 
       COALESCE(price, 1000) AS pricing 
FROM Products;

-- Question 9
SELECT name, 
       NULLIF(salary, 0) AS nullable_salary 
FROM Employees;

-- Question 10
SELECT order_id, amount, discount, 
       amount / NULLIF(discount, 0) AS amount_to_discount_ratio 
FROM Orders;

-- Question 11
SELECT order_id, customer_name, 
       NULLIF(coupon_code, 'DISC10') AS adjusted_coupon_code 
FROM Orders;


-- NUMERIC MANIPULATION EXERCISES (TABLE D) --

-- Question 12
SELECT emp_name, base_salary, 
       ROUND(base_salary, 0) AS rounded_integer, 
       ROUND(base_salary, 2) AS rounded_decimals 
FROM employee_salary;

-- Question 13
SELECT emp_name, base_salary, 
       CEIL(base_salary) AS ceiling_salary 
FROM employee_salary;

-- Question 14
SELECT emp_name, base_salary, 
       FLOOR(base_salary) AS floor_salary 
FROM employee_salary;

-- Question 15
SELECT emp_name, base_salary, 
       TRUNCATE(base_salary, 1) AS truncated_salary 
FROM employee_salary;

-- Question 16
SELECT emp_name, experience_years, 
       MOD(experience_years, 2) AS is_odd 
FROM employee_salary;

-- Question 17
SELECT emp_name, base_salary, experience_years, 
       ROUND(base_salary * POWER(1.05, experience_years), 2) AS projected_salary 
FROM employee_salary;

-- Question 18
SELECT emp_name, 
       FORMAT(base_salary, 2) AS formatted_salary 
FROM employee_salary;

-- Question 19
SELECT emp_name, base_salary, bonus, 
       GREATEST(base_salary, IFNULL(bonus, 0)) AS highest_payment 
FROM employee_salary;

-- Question 20
SELECT emp_name, base_salary, bonus, 
       LEAST(base_salary, IFNULL(bonus, 0)) AS lowest_payment 
FROM employee_salary;
