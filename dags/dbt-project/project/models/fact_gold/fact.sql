{{
    config(
        materialized='incremental',
        on_schema_change='ignore', 
        unique_key='TransactionId'
    )
}}

WITH FCT_GOLD AS (
    SELECT
        P.DBT_SCD_ID AS PRODUCT_SID,
        E.DBT_SCD_ID AS EMPLOYEE_SID,
        C.DBT_SCD_ID AS CUSTOMER_SID,
        FS.ORDER_DATE,
        FS.REQUIRED_DATE,
        FS.SHIPPED_DATE,
        FS.UNIT_PRICE,
        FS.QUANTITY,
        FS.DISCOUNT
    FROM 
        {{ref('fact_silver')}}  FS
    LEFT JOIN 
        {{ref('dim_product')}}  P ON P.PRODUCT_ID = FS.PRODUCT_ID
    LEFT JOIN 
        {{ref('dim_employee')}} E ON E.EMPLOYEE_ID = FS.EMPLOYEE_ID
    LEFT JOIN 
        {{ref('dim_customer')}} C ON C.CUSTOMER_ID = FS.CUSTOMER_ID
)

SELECT {{dbt_utils.generate_surrogate_key(['PRODUCT_SID', 'EMPLOYEE_SID', 'CUSTOMER_SID', 'ORDER_DATE', 'REQUIRED_DATE', 'SHIPPED_DATE'])}} AS TransactionId,
* 
FROM FCT_GOLD
{% if is_incremental() %}
    WHERE ORDER_DATE>=(SELECT MAX(ORDER_DATE) FROM {{this}})
{% endif %}