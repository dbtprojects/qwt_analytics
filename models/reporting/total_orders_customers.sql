{{ config(materialized = "view", schema = 'reporting') }}

with customers as 

(
select 

customerid,
companyname,
contactname

from 

{{ref('dim_customers')}}
),

 orders as 
(
    select 
    orderid,
    customerid,
    orderdate

    from 

    {{ ref ('fct_orders') }}


),

 customers_orders as

(
    select 
    
    customers.companyname as companyname,
    customers.contactname as contactname,
    min(orders.orderdate) as min_orderdate,
    max(orders.orderdate) as max_orderdate,
    count(orders.orderid) as total_orders

    from orders inner join customers on orders.customerid = customers.customerid

    group by  companyname, contactname

    order by total_orders desc

)

select * from 
customers_orders

