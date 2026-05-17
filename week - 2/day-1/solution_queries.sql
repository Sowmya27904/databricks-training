-- Week 2 - Day 1: SQL Master Assignment Solutions

-- Case Study 1: Employee Compensation and Experience Classification
SELECT 
    CONCAT(UPPER(LEFT(emp_name, 1)), LOWER(SUBSTRING(emp_name, 2))) AS proper_name,
    (base_salary + IFNULL(bonus, 0)) AS total_income,
    ROUND(base_salary + IFNULL(bonus, 0), 0) AS rounded_income,
    YEAR(joining_date) AS joining_year,
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) > 7 THEN 'Senior'
        WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) BETWEEN 4 AND 7 THEN 'Mid'
        ELSE 'Junior'
    END AS experience_rank
FROM employee_payments;

-- Case Study 2: Order Delivery Delay Audit
SELECT 
    UPPER(customer_name) AS customer_name_upper,
    DATEDIFF(IFNULL(delivery_date, CURDATE()), order_date) AS delivery_days,
    TRUNCATE(order_amount, 1) AS truncated_amount,
    CASE 
        WHEN delivery_date IS NULL THEN 'Pending'
        WHEN DATEDIFF(delivery_date, order_date) = 0 THEN 'Same-day'
        WHEN DATEDIFF(delivery_date, order_date) > 3 THEN 'Delayed'
        ELSE 'On-time'
    END AS shipping_status
FROM orders_delivery;

-- Case Study 3: Customer Spending and Tier Categorization
SELECT 
    CONCAT(UPPER(LEFT(cust_name, 1)), LOWER(SUBSTRING(cust_name, 2))) AS proper_name,
    MONTHNAME(purchase_date) AS purchase_month,
    ROUND(ABS(purchase_amount), 0) AS rounded_absolute_amount,
    CASE 
        WHEN ABS(purchase_amount) > 15000 THEN 'High Spender'
        WHEN ABS(purchase_amount) BETWEEN 8000 AND 15000 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS customer_tier
FROM customer_spending;

-- Case Study 4: Subscription Validity and Renewal Risk
SELECT 
    REGEXP_SUBSTR(user_email, '@([a-zA-Z0-9.]+)', 1, 1, '', 1) AS email_domain,
    TIMESTAMPDIFF(MONTH, start_date, end_date) AS subscription_months,
    FORMAT(subscription_fee, 2) AS formatted_fee,
    DATEDIFF(end_date, CURDATE()) AS remaining_days,
    CASE 
        WHEN end_date < CURDATE() THEN 'Expired'
        WHEN DATEDIFF(end_date, CURDATE()) BETWEEN 0 AND 30 THEN 'Expiring Soon'
        ELSE 'Active'
    END AS subscription_status
FROM subscriptions;

-- Case Study 5: Loan EMI Risk Categorization
SELECT 
    ROUND(POWER((1 + interest_rate/100), 5), 4) AS five_year_compounding,
    TIMESTAMPDIFF(YEAR, loan_start, CURDATE()) AS loan_age_years,
    UPPER(customer_name) AS customer_name_upper,
    CASE 
        WHEN interest_rate > 9.0 THEN 'High Interest'
        WHEN interest_rate BETWEEN 8.0 AND 9.0 THEN 'Moderate Interest'
        ELSE 'Low Interest'
    END AS loan_risk_tier
FROM loan_details;

-- Case Study 6: Tax Shock and Revision Audit
SELECT 
    LOWER(emp_name) AS emp_name_lower,
    ROUND(salary * (1 - tax_percent/100), 0) AS net_salary,
    YEAR(last_revision) AS last_revision_year,
    TIMESTAMPDIFF(MONTH, last_revision, CURDATE()) AS months_since_revision,
    CASE 
        WHEN tax_percent > 20.0 AND TIMESTAMPDIFF(MONTH, last_revision, CURDATE()) > 24 THEN 'Flag Tax Shock'
        WHEN tax_percent BETWEEN 15.0 AND 20.0 THEN 'Flag Review Needed'
        ELSE 'Stable'
    END AS salary_audit_flag
FROM salary_audit;

-- Case Study 7: Bonus Abuse Detection
SELECT 
    CONCAT(UPPER(LEFT(emp_name, 1)), LOWER(SUBSTRING(emp_name, 2))) AS proper_name,
    ROUND((bonus / base_salary) * 100, 2) AS bonus_percentage,
    DAYNAME(bonus_date) AS credit_weekday,
    ABS(base_salary - bonus) AS absolute_diff,
    CASE 
        WHEN (bonus / base_salary) * 100 > 30.0 AND DAYOFWEEK(bonus_date) IN (1, 7) THEN 'Suspicious Transaction'
        WHEN (bonus / base_salary) * 100 <= 20.0 THEN 'Compliant Regular'
        ELSE 'Audit Needed'
    END AS transaction_safety_flag
FROM bonus_monitor;

-- Case Study 8: Experience Parity Validation
SELECT 
    UPPER(emp_name) AS emp_name_upper,
    TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS actual_experience_years,
    (declared_experience - TIMESTAMPDIFF(YEAR, joining_date, CURDATE())) AS experience_discrepancy,
    FLOOR(salary) AS floor_salary,
    CASE 
        WHEN declared_experience > TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) THEN 'Overstated Resume'
        WHEN declared_experience < TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) THEN 'Understated Resume'
        ELSE 'Fully Verified'
    END AS history_validation_status
FROM employee_experience;

-- Case Study 9: Odd-Even Salary Compliance
SELECT 
    LOWER(emp_name) AS emp_name_lower,
    DAY(payment_date) AS payment_day_of_month,
    ROUND(salary, 0) AS rounded_salary,
    MOD(ROUND(salary, 0), 2) AS salary_mod_2,
    CASE 
        WHEN (MOD(ROUND(salary, 0), 2) = 0 AND MOD(DAY(payment_date), 2) <> 0) 
             OR (MOD(ROUND(salary, 0), 2) <> 0 AND MOD(DAY(payment_date), 2) = 0) THEN 'Compliance Violation'
        ELSE 'Compliant Payroll'
    END AS compliance_flag
FROM payroll_control;

-- Case Study 10: Salary Increment Simulation
SELECT 
    TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) AS years_since_hike,
    CASE 
        WHEN rating = 5 THEN 15
        WHEN rating = 4 THEN 10
        WHEN rating = 3 THEN 5
        ELSE 0
    END AS increment_percentage,
    ROUND(current_salary * (1 + (CASE 
                                    WHEN rating = 5 THEN 15
                                    WHEN rating = 4 THEN 10
                                    WHEN rating = 3 THEN 5
                                    ELSE 0
                                 END) / 100.0), 0) AS simulated_salary,
    LOWER(emp_name) AS emp_name_lower,
    CASE 
        WHEN rating >= 4 THEN 'High Growth'
        WHEN rating = 3 THEN 'Medium Growth'
        ELSE 'Stagnant'
    END AS budget_growth_tier
FROM salary_revision;

-- Case Study 11: Weekend Credit Fraud Audit
SELECT 
    SUBSTRING(bank_code, 1, 4) AS bank_prefix,
    DAYNAME(credit_date) AS credit_day,
    ROUND(salary, 0) AS rounded_salary,
    MOD(ROUND(salary, 0), 5) AS salary_mod_5,
    CASE 
        WHEN DAYOFWEEK(credit_date) IN (1, 7) AND MOD(ROUND(salary, 0), 5) = 0 THEN 'Weekend Fraud Risk'
        WHEN SUBSTRING(bank_code, 1, 4) = 'HDFC' AND DAYOFWEEK(credit_date) = 7 THEN 'Bank Review Required'
        ELSE 'Secure Transaction'
    END AS security_flag
FROM salary_credit_audit;

-- Case Study 12: Salary Decimal Precision Loss Audit
SELECT 
    TRUNCATE(salary, 2) AS truncated_salary,
    ABS(ROUND(salary, 2) - TRUNCATE(salary, 2)) AS round_vs_truncate_diff,
    DAYNAME(record_date) AS record_day,
    LENGTH(emp_name) AS name_length,
    CASE 
        WHEN ABS(ROUND(salary, 2) - TRUNCATE(salary, 2)) > 0.005 THEN 'High Precision Leak'
        ELSE 'Safe Precision'
    END AS precision_audit_flag
FROM salary_precision;

-- Case Study 13: Employee Login Discipline and Performance
SELECT 
    CONCAT(UPPER(LEFT(emp_name, 1)), LOWER(SUBSTRING(emp_name, 2))) AS proper_name,
    CASE 
        WHEN DAYOFWEEK(login_time) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    ROUND(TIMESTAMPDIFF(MINUTE, login_time, logout_time) / 60.0, 2) AS hours_worked,
    CASE 
        WHEN DAYOFWEEK(login_time) IN (1, 7) THEN 'Weekend Support'
        WHEN TIMESTAMPDIFF(MINUTE, login_time, logout_time) / 60.0 >= 8.0 THEN 'Excellent Performer'
        WHEN TIMESTAMPDIFF(MINUTE, login_time, logout_time) / 60.0 < 6.0 THEN 'Underperformer'
        ELSE 'Standard Compliance'
    END AS login_discipline_status
FROM employee_login;

-- Case Study 14: Weekend Work Abuse Detection
SELECT 
    DAYNAME(work_date) AS credit_day,
    LOWER(emp_name) AS emp_name_lower,
    ROUND(TIMESTAMPDIFF(SECOND, login_time, logout_time) / 3600.0, 2) AS hours_worked_decimal,
    CEIL(TIMESTAMPDIFF(SECOND, login_time, logout_time) / 3600.0) AS ceiling_hours,
    CASE 
        WHEN DAYOFWEEK(work_date) IN (1, 7) AND (TIMESTAMPDIFF(SECOND, login_time, logout_time) / 3600.0) >= 8.0 THEN 'Weekend Overtime Approved'
        WHEN DAYOFWEEK(work_date) IN (1, 7) AND (TIMESTAMPDIFF(SECOND, login_time, logout_time) / 3600.0) < 4.0 THEN 'Unapproved Weekend Access'
        ELSE 'Regular Business Hours'
    END AS security_log_flag
FROM weekend_monitor;

-- Case Study 15: Absenteeism vs Performance Correlation
SELECT 
    CASE 
        WHEN work_date BETWEEN '2025-01-08' AND '2025-01-15' THEN 'Active Threshold'
        ELSE 'Stale Threshold'
    END AS threshold_status,
    CASE 
        WHEN DAYOFWEEK(work_date) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    FLOOR(TIMESTAMPDIFF(SECOND, login_time, logout_time) / 3600.0) AS floor_hours,
    CASE 
        WHEN work_date BETWEEN '2025-01-08' AND '2025-01-15' 
             AND DAYOFWEEK(work_date) NOT IN (1, 7) 
             AND (TIMESTAMPDIFF(SECOND, login_time, logout_time) / 3600.0) >= 8.0 THEN 'Consistent Performer'
        WHEN (TIMESTAMPDIFF(SECOND, login_time, logout_time) / 3600.0) < 6.0 THEN 'Irregular Attendance'
        ELSE 'Historical Record'
    END AS attendance_correlation_index
FROM performance_tracker;
