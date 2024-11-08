{{
    config(
        materialized='view'
    )
}}


WITH EMPLOYEES AS (
    SELECT * FROM {{ref("employees")}}
)

SELECT 
EMPLOYEE_ID,
LAST_NAME,
FIRST_NAME,
TITLE,
TITLE_OF_COURTESY,
COUNTRY
FROM EMPLOYEES