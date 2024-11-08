select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      with relation_columns as (

        
        select
            cast('EMPLOYEE_ID' as TEXT) as relation_column,
            cast('NUMBER' as TEXT) as relation_column_type
        union all
        
        select
            cast('LAST_NAME' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('FIRST_NAME' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('TITLE' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('TITLE_OF_COURTESY' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('COUNTRY' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('DBT_SCD_ID' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('DBT_UPDATED_AT' as TEXT) as relation_column,
            cast('TIMESTAMP_NTZ' as TEXT) as relation_column_type
        union all
        
        select
            cast('DBT_VALID_FROM' as TEXT) as relation_column,
            cast('TIMESTAMP_NTZ' as TEXT) as relation_column_type
        union all
        
        select
            cast('DBT_VALID_TO' as TEXT) as relation_column,
            cast('TIMESTAMP_NTZ' as TEXT) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'EMPLOYEE_ID'
            and
            relation_column_type not in ('NUMBER')

    )
    select *
    from test_data
      
    ) dbt_internal_test