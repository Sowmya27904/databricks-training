-- Week 2 - Day 2: Date & Timestamp Manipulations Solutions

-- Question 1: Server Curtime Checks
SELECT CURDATE() AS current_date_val, 
       CURTIME() AS current_time_val, 
       NOW() AS current_timestamp_val;

-- Question 2: Date Slicing
SELECT order_id, order_date, 
       YEAR(order_date) AS order_year, 
       MONTH(order_date) AS order_month, 
       DAY(order_date) AS order_day 
FROM orders;

-- Question 3: Standard SQL Extractions
SELECT order_id, order_date, 
       EXTRACT(YEAR FROM order_date) AS extracted_year, 
       EXTRACT(MONTH FROM order_date) AS extracted_month, 
       EXTRACT(DAY FROM order_date) AS extracted_day 
FROM orders;

-- Question 4: Retrieve Names
SELECT order_id, order_date, 
       MONTHNAME(order_date) AS month_name_val, 
       DAYNAME(order_date) AS weekday_name_val 
FROM orders;

-- Question 5: Weekday Indices
SELECT order_id, order_date, 
       WEEKDAY(order_date) AS weekday_index_0_to_6, 
       DAYOFWEEK(order_date) AS dayofweek_index_1_to_7 
FROM orders;

-- Question 6: Identify Weekend Orders (Day Names)
SELECT * 
FROM orders 
WHERE DAYNAME(order_date) IN ('Saturday', 'Sunday');

-- Question 7: Identify Weekend Orders (Day Indices)
SELECT * 
FROM orders 
WHERE DAYOFWEEK(order_date) IN (1, 7);

-- Question 8: Retrieve Weekday Orders
SELECT * 
FROM orders 
WHERE DAYOFWEEK(order_date) BETWEEN 2 AND 6;

-- Question 9: Date Arithmetic (Add Days)
SELECT order_id, order_date, 
       DATE_ADD(order_date, INTERVAL 5 DAY) AS projected_delivery_date 
FROM orders;

-- Question 10: Date Arithmetic (Subtract Days)
SELECT order_id, order_date, 
       DATE_SUB(order_date, INTERVAL 3 DAY) AS three_days_prior 
FROM orders;

-- Question 11: Deliveries Duration
SELECT order_id, order_date, delivery_date, 
       DATEDIFF(delivery_date, order_date) AS delivery_days_taken 
FROM orders;

-- Question 12: Month End Calculations
SELECT order_id, order_date, 
       LAST_DAY(order_date) AS month_end_date 
FROM orders;

-- Question 13: Month Start Calculations
SELECT order_id, order_date, 
       DATE_SUB(order_date, INTERVAL (DAY(order_date) - 1) DAY) AS month_start_date 
FROM orders;

-- Question 14: Date Formatting
SELECT order_id, order_date, 
       DATE_FORMAT(order_date, '%d-%m-%Y') AS format_a_dd_mm_yyyy, 
       DATE_FORMAT(order_date, '%M %d, %Y') AS format_b_month_name_dd_yyyy 
FROM orders;

-- Question 15: Convert String to Date
SELECT STR_TO_DATE('15-01-2024', '%d-%m-%Y') AS converted_date_object;

-- Question 16: Financial Year Logic
SELECT order_id, order_date,
       CASE 
           WHEN MONTH(order_date) >= 4 THEN CONCAT(YEAR(order_date), '-', YEAR(order_date) + 1)
           ELSE CONCAT(YEAR(order_date) - 1, '-', YEAR(order_date))
       END AS financial_year 
FROM orders;
