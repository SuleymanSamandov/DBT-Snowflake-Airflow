WITH CTRG AS(
    SELECT * 
    FROM {{source("data","categories")}}
)

SELECT * FROM CTRG