


WITH  __dbt__cte__employees as (
WITH CSTMR AS(
    SELECT * 
    FROM data.raw.employees
)

SELECT * FROM CSTMR
), EMPLOYEES AS (
    SELECT * FROM __dbt__cte__employees
)

SELECT 
EMPLOYEE_ID,
LAST_NAME,
FIRST_NAME,
TITLE,
TITLE_OF_COURTESY,
COUNTRY
FROM EMPLOYEES