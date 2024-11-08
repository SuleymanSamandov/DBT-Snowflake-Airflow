

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
        data.DEV.fact_silver  FS
    LEFT JOIN 
        data.dev.dim_product  P ON P.PRODUCT_ID = FS.PRODUCT_ID
    LEFT JOIN 
        data.dev.dim_employee E ON E.EMPLOYEE_ID = FS.EMPLOYEE_ID
    LEFT JOIN 
        data.dev.dim_customer C ON C.CUSTOMER_ID = FS.CUSTOMER_ID
)

SELECT md5(cast(coalesce(cast(PRODUCT_SID as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(EMPLOYEE_SID as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(CUSTOMER_SID as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(ORDER_DATE as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(REQUIRED_DATE as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(SHIPPED_DATE as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS TransactionId,
* 
FROM FCT_GOLD

    WHERE ORDER_DATE>=(SELECT MAX(ORDER_DATE) FROM data.DEV.fact)
