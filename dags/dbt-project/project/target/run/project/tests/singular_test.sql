select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      SELECT * FROM DATA.DEV.FACT F
LEFT JOIN DATA.DEV.DIM_PRODUCT P ON F.PRODUCT_SID=P.DBT_SCD_ID
WHERE F.ORDER_DATE > F.SHIPPED_DATE
      
    ) dbt_internal_test