select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    with a as (
        
    select
        
        employee_id as col_1,
        
        count(*) as expression
    from
        data.dev.dim_employee
    where
        employee_id is not null
    
    
    group by
        1
        
    

    ),
    b as (
        
    select
        
        employee_id as col_1,
        
        count(*) * 1 as expression
    from
        data.DEV.employee_silver
    where
        employee_id is not null
    
    
    group by
        1
        
    

    ),
    final as (

        select
            coalesce(a.col_1, b.col_1) as col_1,
            
            a.expression,
            b.expression as compare_expression,
            abs(coalesce(a.expression, 0) - coalesce(b.expression, 0)) as expression_difference,
            abs(coalesce(a.expression, 0) - coalesce(b.expression, 0))/
                nullif(a.expression * 1.0, 0) as expression_difference_percent
        from
        
            a
            full outer join
            b on
            a.col_1 = b.col_1 
            
    )
    -- DEBUG:
    -- select * from final
    select
        *
    from final
    where
        
        expression_difference > 0.0
        

      
    ) dbt_internal_test