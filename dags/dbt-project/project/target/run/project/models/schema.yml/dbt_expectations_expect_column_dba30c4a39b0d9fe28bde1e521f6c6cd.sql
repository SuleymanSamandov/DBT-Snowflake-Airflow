select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





    with grouped_expression as (
    select
        
        
    
  shipped_date >= order_date as expression


    from data.DEV.fact
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors





      
    ) dbt_internal_test