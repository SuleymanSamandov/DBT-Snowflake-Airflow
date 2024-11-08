WITH CSTMR AS(
    SELECT * 
    FROM {{source("data","customers")}}
)

SELECT * FROM CSTMR