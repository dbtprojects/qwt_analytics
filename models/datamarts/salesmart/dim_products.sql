{{ config(materialized = 'view', schema = 'salesmart') }}

select 

p.productid,
p.productname,
c.categoryname,
p.quantityperunit,
p.unitprice,
p.unitcost,
p.unitsonorder,
p.unitsinstock,
p.productavailability,
s.contactname,
s.CompanyName,
s.City,
s.Country

from 

{{ref('trf_products')}} as p 

inner join {{ref('trf_suppliers')}} as s

on p.supplierid = s.supplierid

inner join {{ref('lkp_categories')}} as c

on p.categoryid = c.categoryid