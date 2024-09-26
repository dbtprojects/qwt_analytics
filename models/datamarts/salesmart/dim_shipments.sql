{{ config(materialized = 'view', schema = 'salesmart') }}

select 

snap.shipperid, 

ship.companyname ,

snap.shipmentdate,

snap.status,

snap.dbt_valid_from,

snap.dbt_valid_to

from 

{{ref('shipments_snapshot')}} as snap 

inner join {{ref('shippers')}} as ship

on snap.shipperid = ship.shipperid