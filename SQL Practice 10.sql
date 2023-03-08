create database pivote;
use pivote;

create table order_table1 (
orderid int ,
employeeid int ,
vendorid int );

insert into order_table1 values (1, 258, 1580),
(2, 254, 1496),
(3, 257, 1494),
(4, 261, 1650),
(5, 251, 1654),
(6, 253, 1664);


select * from order_table1 ;

# The basic idea behind a pivot table is to take the data in a table and rotate it so that the rows become columns, and the columns become rows.
# Pivot tables are especially useful when working with large datasets where it may be difficult to spot patterns or trends just by looking at the raw data.

# Applications of Pivot Table -----
# Analyzing sales data by product, region, and time period.
# Summarizing customer data by demographics and purchase history.
# Aggregating financial data by account type, department, and time period.
# Analyzing website traffic data by page, visitor, and time period.
# Summarizing employee data by department, job title, and performance metrics.

select orderid,
if(employeeid = 254,1,NULL) as "254" ,
if(employeeid = 257,1,NULL) as emp257 ,
if(employeeid = 261,1,NULL) as emp261 ,
if(employeeid = 251,1,NULL) as emp251 ,
if(employeeid = 253,1,NULL) as emp253 
from 
order_table1;