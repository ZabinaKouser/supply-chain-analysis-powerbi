create database test_env;

use test_env;

select * from products;

alter table products
change column `Product Name` product_name text,
change column `Unit Price ($)` unit_price double;

select * from test_environment_inventory_dataset;

alter table test_environment_inventory_dataset
change column `Product ID` product_id INT

select distinct product_ID from test_environment_inventory_dataset
order by product_id

alter table test_environment_inventory_dataset
change column `Order Date (DD/MM/YYYY)` order_date text

select distinct order_date from test_environment_inventory_dataset


select a.order_date, a.product_id, a.Availability, a.demand, b.product_name, b.unit_price
 from test_environment_inventory_dataset as a
left join products as b on a.product_id= b.product_id

create table New_Table as select a.order_date, a.product_id, a.Availability, a.demand, b.product_name, b.unit_price
 from test_environment_inventory_dataset as a
left join products as b on a.product_id= b.product_id

select * from new_table


UPDATE test_environment_inventory_dataset
SET Order_Date = STR_TO_DATE(Order_Date, '%d-%m-%Y');

ALTER TABLE test_environment_inventory_dataset
MODIFY COLUMN Order_Date DATE;

update new_table
SET Order_Date = STR_TO_DATE(Order_Date, '%d-%m-%Y');

ALTER TABLE new_table
MODIFY COLUMN Order_Date DATE;
