{% test not_accepted_values(model, column_name, values) %}
SELECT *
FROM {{ model }}
WHERE {{ column_name }} IN (
    {% for value in values %}
    '{{ value }}'{% if not loop.last %}, {% endif %}
    {% endfor %}
)
{% endtest %}
