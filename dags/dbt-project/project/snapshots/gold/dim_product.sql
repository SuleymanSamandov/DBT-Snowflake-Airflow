{% snapshot dim_product %}

{{
    config(
        target_schema="dev",
        strategy="check",
        check_cols=['PRODUCT_NAME','CATEGORY_NAME','CATEGORY_DESCRIPTION'],
        unique_key='product_id',
        invalidate_hard_deletes=True

    )
}}


SELECT * 
FROM
{{ref("product_silver")}} 



{% endsnapshot %}