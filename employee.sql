/*
   Query Name: Employee Education Distribution
   Description: This query returns the distribution of educational qualifications among employees.

   Context:
   - This query is intended for HR teams who want to understand the educational background of the workforce.
   - It can be used for workforce planning, training, and development programs.
*/

SELECT 
    education,                        -- The educational qualification of the employee
    COUNT(*) AS qualification_count    -- The count of employees with each qualification
FROM
    employee
GROUP BY education                    -- Grouping by educational qualification
ORDER BY qualification_count DESC;     -- Ordering by count of qualifications in descending order


/*
   Query Name: Experience and Payment Tier Correlation
   Description: This query investigates if there's a correlation between Payment Tier and Experience in Current Domain.

   Context:
   - This query can be used by HR and Finance teams to analyze compensation and experience levels.
   - It categorizes experience into 'Experienced', 'Slightly Experienced', and 'Less Experienced'.
*/

SELECT 
    -- Categorizing experience level into segments
    CASE
        WHEN experience_level >= 7 THEN 'Experienced'
        WHEN experience_level >= 2 THEN 'Slightly Experienced'
        ELSE 'Less Experienced'
    END AS experience_status,
    paymenttier,                       -- The payment tier of the employee
    COUNT(*) AS segment_count           -- The count of employees in each segment
FROM
    employee
GROUP BY experience_status, paymenttier -- Grouping by experience status and payment tier
ORDER BY experience_status, paymenttier; -- Ordering by experience status and payment tier


/*
   Query Name: Service Length and City
   Description: This query analyzes how the length of service (Joining Year) varies across different cities.

   Context:
   - This query can be useful for HR teams to understand employee retention and distribution across cities.
   - It assumes that 'joiningyear' cannot be null.
*/

SELECT 
    city,                               -- The city where the employee works
    joiningyear                         -- The year the employee joined the company
FROM
    employee
WHERE
    joiningyear IS NOT NULL              -- Filtering out null joining years
GROUP BY joiningyear, city               -- Grouping by joining year and city
ORDER BY city, joiningyear ASC;          -- Ordering by city and joining year in ascending order


/*
   Query Name: Benched Employees Demographics
   Description: This query finds the age and educational level of people who have ever been benched (taking leave) and their gender.

   Context:
   - This query can be useful for HR teams to understand demographics of employees who have taken leaves.
   - 'everbenched' column is assumed to be 'yes' for employees who have taken leave.
*/

SELECT 
    education,                         -- The educational level of the employee
    COUNT(gender) AS gender_count,      -- The count of employees for each gender
    age                                 -- The age of the employee
FROM
    employee
WHERE
    everbenched = 'yes'                 -- Filtering for employees who have ever been benched
GROUP BY education, age                 -- Grouping by education and age
ORDER BY age DESC;                      -- Ordering by age in descending order
