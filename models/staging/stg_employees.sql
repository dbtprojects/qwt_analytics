{{ config(materialized = 'table', sql_header = "alter session set timezone = 'Asia/Kolkata';") }}

select * from 
{{ source('qwt_src', 'employee') }}