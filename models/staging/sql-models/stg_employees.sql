{{ config(materialized = 'table', schema = env_var('DBT_SOURCESCHEMA_SOURCESCHEMA', 'STAGING')) }}

select * from 
{{ source('qwt_src', 'employee') }}