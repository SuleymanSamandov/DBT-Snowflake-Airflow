

with all_values as (

    select
        title_of_courtesy as value_field

    from data.dev.dim_employee
    
    where title_of_courtesy is not null
    

),
set_values as (

    select
        cast('Dr.' as TEXT) as value_field
    union all
    select
        cast('Ms.' as TEXT) as value_field
    union all
    select
        cast('Mrs.' as TEXT) as value_field
    union all
    select
        cast('Mr.' as TEXT) as value_field
    
    
),
validation_errors as (
    -- values from the model that are not in the set
    select
        v.value_field
    from
        all_values v
        left join
        set_values s on v.value_field = s.value_field
    where
        s.value_field is null

)

select *
from validation_errors

