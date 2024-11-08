WITH CSTMR AS(
    SELECT * 
    FROM {{source("data","employees")}}
)

SELECT * FROM CSTMR