-- Week 2 - Day 5: Regex Foundations & Advanced Pattern Matching Solutions

-- Question 1: Start Digits Extraction
SELECT mixed_value, 
       REGEXP_SUBSTR(mixed_value, '^[0-9]+') AS start_digits 
FROM regex_practice;

-- Question 2: End Digits Extraction
SELECT mixed_value, 
       REGEXP_SUBSTR(mixed_value, '[0-9]+$') AS end_digits 
FROM regex_practice;

-- Question 3: Extract First Single Character
SELECT mixed_value, 
       REGEXP_SUBSTR(mixed_value, '^.') AS first_char 
FROM regex_practice;

-- Question 4: Extract Last Single Character
SELECT mixed_value, 
       REGEXP_SUBSTR(mixed_value, '.$') AS last_char 
FROM regex_practice;

-- Question 5: Extract Two Digits Anywhere
SELECT mixed_value, 
       REGEXP_SUBSTR(mixed_value, '[0-9]{2}') AS two_digits 
FROM regex_practice;

-- Question 6: Extract Single Digit Anywhere
SELECT mixed_value, 
       REGEXP_SUBSTR(mixed_value, '[0-9]') AS single_digit 
FROM regex_practice;

-- Question 7: Country Code from Phone
SELECT phone, 
       REGEXP_SUBSTR(phone, '[0-9]+') AS country_code 
FROM regex_practice;

-- Question 8: Digits in Middle of Text
SELECT mixed_value, 
       REGEXP_SUBSTR(mixed_value, '[a-zA-Z]([0-9]+)[a-zA-Z]', 1, 1, '', 1) AS middle_digits 
FROM regex_practice;

-- Question 9: Username from Email
SELECT email, 
       REGEXP_SUBSTR(email, '^[^@]+') AS username 
FROM regex_practice;

-- Question 10: Domain Section from Email
SELECT email, 
       REPLACE(REGEXP_SUBSTR(email, '@[a-zA-Z0-9.-]+'), '@', '') AS domain_with_extension 
FROM regex_practice;

-- Question 11: Domain Name only
SELECT email, 
       REGEXP_SUBSTR(email, '@([a-zA-Z0-9]+)\\.', 1, 1, '', 1) AS domain_name 
FROM regex_practice;

-- Question 12: Extension Suffix from Email
SELECT email, 
       REGEXP_SUBSTR(email, '[^.]+$') AS extension_suffix 
FROM regex_practice;

-- Question 13: Extract Continuous Alphabet Sequence
SELECT mixed_value, 
       REGEXP_SUBSTR(mixed_value, '[a-zA-Z]+') AS continuous_alphabets 
FROM regex_practice;

-- Question 14: Extract Continuous Digit Sequence
SELECT mixed_value, 
       REGEXP_SUBSTR(mixed_value, '[0-9]+') AS continuous_digits 
FROM regex_practice;

-- Question 15: First Three of Header
SELECT full_text, 
       REGEXP_SUBSTR(full_text, '^.{3}') AS first_three 
FROM regex_practice;

-- Question 16: Last Two of Header
SELECT full_text, 
       REGEXP_SUBSTR(full_text, '.{2}$') AS last_two 
FROM regex_practice;

-- Question 17: Extract Embedded Employee Number
SELECT full_text, 
       REGEXP_SUBSTR(full_text, '[0-9]+') AS employee_number 
FROM regex_practice;

-- Question 18: Country Suffix
SELECT full_text, 
       REGEXP_SUBSTR(full_text, '[^_]+$') AS country_suffix 
FROM regex_practice;

-- Question 19: Alphabetic Text Between Underscores
SELECT full_text, 
       REGEXP_SUBSTR(full_text, '_([a-zA-Z]+)_', 1, 1, '', 1) AS middle_text 
FROM regex_practice;

-- Question 20: Country Code after Plus
SELECT phone, 
       REGEXP_SUBSTR(phone, '\\\\+([0-9]+)', 1, 1, '', 1) AS country_code_after_plus 
FROM regex_practice;
