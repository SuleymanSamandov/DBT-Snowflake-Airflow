{% snapshot dim_customer %}

{{
    config(
        target_schema="dev",
        strategy="check",
        check_cols=['COMPANY_NAME','CONTACT_NAME','CONTACT_TITLE','CITY','REGION','COUNTRY'],
        unique_key='customer_id',
        invalidate_hard_deletes=True

    )
}}


SELECT * 
FROM
{{ref("customer_silver")}} 



{% endsnapshot %}