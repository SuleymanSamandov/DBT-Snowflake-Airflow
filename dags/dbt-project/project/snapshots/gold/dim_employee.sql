{% snapshot dim_employee %}

{{
    config(
        target_schema="dev",
        strategy="check",
        check_cols=['TITLE','TITLE_OF_COURTESY','COUNTRY'],
        unique_key='employee_id',
        invalidate_hard_deletes=True

    )
}}


SELECT * 
FROM
{{ref("employee_silver")}} 



{% endsnapshot %}