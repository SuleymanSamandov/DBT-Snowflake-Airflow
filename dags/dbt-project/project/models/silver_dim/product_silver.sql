{{
    config(
        materialized='view'
    )
}}

WITH prdct_cat AS (
    SELECT 
        p.*,
        c.CATEGORY_NAME,
        c.DESCRIPTION
    FROM 
        {{ ref("products") }} p
    LEFT JOIN 
        {{ ref("categories") }} c
    ON 
        p.CATEGORY_ID = c.CATEGORY_ID
)

SELECT 
        product_id,
        product_name,
        quantity_per_unit,
        unit_price AS unit_price,
        units_in_stock AS units_in_stock,
        units_on_order AS units_on_order,
        reorder_level AS reorder_level,
        discontinued AS discontinued,
        category_id AS category_category_id,
        category_name,
        description AS category_description
FROM prdct_cat