WITH PRDCT AS(
    SELECT * 
    FROM {{source("data","products")}}
)

SELECT * FROM PRDCT