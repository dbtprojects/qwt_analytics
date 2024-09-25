{{ config(materialized = 'table', schema = 'staging') }}

select 
orderid,
lineno,
shipperid,
customerid,
productid,
employeeid,
split_part(shipmentdate,' ',1)::date as shipmentdate,
status 
from
{{source('qwt_src', 'shipments')}}
