with relation_columns as (

        
        select
            cast('CUSTOMER_ID' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('COMPANY_NAME' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('CONTACT_NAME' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('CONTACT_TITLE' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('CITY' as TEXT) as relation_column,
            cast('VARCHAR' as TEXT) as relation_column_type
        union all
        
        select
            cast('REGION' as TEXT) as relation_column,
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
            relation_column = 'CUSTOMER_ID'
            and
            relation_column_type not in ('VARCHAR')

    )
    select *
    from test_data