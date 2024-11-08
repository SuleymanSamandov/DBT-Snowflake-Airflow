select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
SELECT *
FROM data.dev.dim_product
WHERE category_description IN (
    
    'A'
    
)

      
    ) dbt_internal_test