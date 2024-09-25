{% macro get_order_linenos() -%}

{% set lineno__query %}
select distinct
Lineno
from {{ ref('stg_orderdetails') }}
order by 1
{% endset %}

{% set results = run_query(lineno__query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}

{% macro get_min_orderdate() %}

{% set orderdate_query %}

select to_date(min(orderdate))
from {{ ref('stg_orders') }}

{% endset %}

{% set results = run_query(orderdate_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}


{% endmacro %}

{% macro get_max_orderdate() %}

{% set orderdate_query %}

select to_date(max(orderdate))
from {{ ref('stg_orders') }}

{% endset %}

{% set results = run_query(orderdate_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}


{% endmacro %}