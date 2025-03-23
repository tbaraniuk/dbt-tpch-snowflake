{% macro days_since(date_col) %}
    datediff(day, {{ date_col }}, current_date)
{% endmacro %}