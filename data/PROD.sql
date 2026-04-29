create database PROD;

USE PROD;

SELECT * FROM prod_env_inventory_dataset;

ALTER table prod_env_inventory_dataset
change column  Order_Date_DD_MM_YYYY order_date text,
change column `Product ID` Product_ID int;

UPDATE prod_env_inventory_dataset
SET Order_Date = STR_TO_DATE(Order_Date, '%d-%m-%y');


ALTER TABLE prod_env_inventory_dataset
MODIFY COLUMN Order_Date DATE;

select * from products_1;

alter table products_1
change column `Product ID` Product_ID int,
change column `Product Name` Product_Name text,
change column `Unit Price ($)` Unit_Price double;

SELECT distinct Order_Date_DD_MM_YYYY FROM prod_env_inventory_dataset
WHERE Order_Date_DD_MM_YYYY IS NULL OR Order_Date_DD_MM_YYYY = '';

SELECT distinct PRODUCT_ID FROM prod_env_inventory_dataset
ORDER BY PRODUCT_ID;
-- WHERE Order_Date_DD_MM_YYYY IS NULL OR Order_Date_DD_MM_YYYY = '';
SET SQL_SAFE_UPDATES = 0;
UPDATE prod_env_inventory_dataset
SET PRODUCT_ID= 7 WHERE PRODUCT_ID= 21;

UPDATE prod_env_inventory_dataset
SET PRODUCT_ID= 11 WHERE PRODUCT_ID= 22;

SELECT distinct AVAILABILITY FROM prod_env_inventory_dataset;
SELECT distinct DEMAND FROM prod_env_inventory_dataset
WHERE DEMAND IS NULL OR DEMAND = '';

SELECT a.Order_Date, a.Product_ID, a.Availability, a.Demand,
b.Product_Name, b.Unit_Price FROM prod_env_inventory_dataset AS a
LEFT JOIN products_1 AS b
ON a.product_id= b.product_id
;

create table new_table as SELECT a.Order_Date, a.Product_ID, a.Availability, a.Demand,
b.Product_Name, b.Unit_Price FROM prod_env_inventory_dataset AS a
LEFT JOIN products_1 AS b
ON a.product_id= b.product_id;

select * from new_table