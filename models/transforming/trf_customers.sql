{{config(materialized = 'table', schema='transforming') }}

with customerCTE as 
(
select 

customerid,
companyname,
contactname, 
city, 
country,
divisionid,
address,
fax,
phone,
postalcode,
IFF(state = '', 'NA', state) as statename


from {{ ref ('stg_customers') }}
)

select * from customerCTE
