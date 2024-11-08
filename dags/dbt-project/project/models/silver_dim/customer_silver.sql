{{
    config(
        materialized='view'
    )
}}


WITH CUSTOMER AS (
    SELECT * FROM {{ref("customer")}}
)

SELECT 
CUSTOMER_ID,
COMPANY_NAME,
CONTACT_NAME,
CONTACT_TITLE,
CITY,
COALESCE(REGION,'Not entered') AS REGION,
COUNTRY 
FROM CUSTOMER