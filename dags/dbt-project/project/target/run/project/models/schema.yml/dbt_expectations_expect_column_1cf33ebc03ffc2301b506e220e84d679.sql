select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      with relation_columns as (

        
        select
            cast('PRODUCT_ID' as TEXT) as relation_column,
            cast('NUMBER' as TEXT) as relation_column_type
        union all
        
        select
            cast('PRODUCT_NAME' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('QUANTITY_PER_UNIT' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('UNIT_PRICE' as TEXT) as relation_column,
            cast('FLOAT' as TEXT) as relation_column_type
        union all
        
        select
            cast('UNITS_IN_STOCK' as TEXT) as relation_column,
            cast('NUMBER' as TEXT) as relation_column_type
        union all
        
        select
            cast('UNITS_ON_ORDER' as TEXT) as relation_column,
            cast('NUMBER' as TEXT) as relation_column_type
        union all
        
        select
            cast('REORDER_LEVEL' as TEXT) as relation_column,
            cast('NUMBER' as TEXT) as relation_column_type
        union all
        
        select
            cast('DISCONTINUED' as TEXT) as relation_column,
            cast('NUMBER' as TEXT) as relation_column_type
        union all
        
        select
            cast('CATEGORY_CATEGORY_ID' as TEXT) as relation_column,
            cast('NUMBER' as TEXT) as relation_column_type
        union all
        
        select
            cast('CATEGORY_NAME' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('CATEGORY_DESCRIPTION' as TEXT) as relation_column,
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
            relation_column = 'CATEGORY_DESCRIPTION'
            and
            relation_column_type not in ('VARCHAR')

    )
    select *
    from test_data
      
    ) dbt_internal_test