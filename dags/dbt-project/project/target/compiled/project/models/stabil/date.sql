

WITH RECURSIVE date_range AS (
    SELECT DATE('1996-01-01') AS date
    UNION ALL
    SELECT date + INTERVAL '1 day'
    FROM date_range
    WHERE date < DATE('2030-12-31')
)

SELECT
    date,
    YEAR(date) AS year,
    MONTH(date) AS month,
    DAY(date) AS day,
    WEEK(date) AS week,
    QUARTER(date) AS quarter,
    DAYNAME(date) AS day_name
FROM date_range