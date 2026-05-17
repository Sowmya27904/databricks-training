-- Week 2 - Day 6: String Functions in MySQL Solutions

-- Question 1: Length of Name
SELECT full_name, LENGTH(full_name) AS name_length 
FROM employees;

-- Question 2: Convert Case
SELECT UPPER(department) AS dept_upper, LOWER(city) AS city_lower 
FROM employees;

-- Question 3: Clean Whitespaces
SELECT TRIM(full_name) AS cleaned_name 
FROM employees;

-- Question 4: Combine Column Values (CONCAT)
SELECT CONCAT(TRIM(full_name), ' [', department, ']') AS emp_details 
FROM employees;

-- Question 5: Combine with Separator (CONCAT_WS)
SELECT CONCAT_WS(' -- ', emp_id, TRIM(full_name), TRIM(city)) AS unified_details 
FROM employees;

-- Question 6: Extract Email Prefix (SUBSTRING)
SELECT email, SUBSTRING(email, 1, 5) AS email_prefix 
FROM employees;

-- Question 7: Left and Right Extract
SELECT LEFT(TRIM(full_name), 4) AS name_prefix, RIGHT(TRIM(city), 3) AS city_suffix 
FROM employees;

-- Question 8: Locate Character (INSTR)
SELECT email, INSTR(email, '@') AS at_symbol_position 
FROM employees;

-- Question 9: Locate Dot (LOCATE)
SELECT email, LOCATE('.', email) AS dot_position 
FROM employees;

-- Question 10: Replace Substrings
SELECT department, REPLACE(department, 'Data', 'Big Data') AS modified_department 
FROM employees;

-- Question 11: Reverse Characters
SELECT full_name, REVERSE(TRIM(full_name)) AS reversed_name 
FROM employees;

-- Question 12: Left Padding (LPAD)
SELECT emp_id, LPAD(emp_id, 5, '0') AS padded_emp_id 
FROM employees;

-- Question 13: Remove Internal Spaces
SELECT city, REPLACE(city, ' ', '') AS cleaned_city 
FROM employees;

-- Question 14: Handle Null Remarks (IFNULL)
SELECT full_name, IFNULL(remarks, 'No remarks') AS verified_remarks 
FROM employees;

-- Question 15: Handle Null Remarks (COALESCE)
SELECT full_name, COALESCE(NULLIF(TRIM(remarks), ''), 'N/A') AS verified_remarks 
FROM employees;

-- Question 16: Find in Comma-Separated List (FIND_IN_SET)
SELECT FIND_IN_SET('Analytics', 'Data Science,Analytics,Data Engineering,DevOps') AS match_position;
