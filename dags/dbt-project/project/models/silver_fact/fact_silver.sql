{{
    config(
        materialized='view'
    )
}}

WITH FCT_STAG AS(
SELECT 
    P.PRODUCT_ID,
    P.SUPPLIER_ID,
    O.ORDER_ID,
    O.CUSTOMER_ID,
    O.EMPLOYEE_ID,
    O.ORDER_DATE,
    O.REQUIRED_DATE,
    O.SHIPPED_DATE,
    OD.UNIT_PRICE,
    OD.QUANTITY,
    OD.DISCOUNT
FROM {{source("data","orders")}} O
LEFT JOIN {{source("data","order_details")}} OD ON O.ORDER_ID=OD.ORDER_ID
LEFT JOIN {{source("data","products")}} P ON P.PRODUCT_ID=OD.PRODUCT_ID
)

SELECT * FROM FCT_STAG