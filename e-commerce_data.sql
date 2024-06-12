CREATE DATABASE E_sale;

USE E_sale;


select * from cust_details;


-- Renaming the columns names
ALTER TABLE cust_details   
RENAME COLUMN `Customer ID` TO cust_id;


ALTER TABLE cust_details   
RENAME COLUMN `Item Purchased` TO Item,
RENAME COLUMN `Purchase Amount (USD)` TO Amount_USD,  
RENAME COLUMN `Review Rating` TO Rating,
RENAME COLUMN `Subscription Status` TO Subscription,
RENAME COLUMN `Shipping Type` TO Shipping_Type,
RENAME COLUMN `Discount Applied` TO Discount,
RENAME COLUMN `Promo Code Used` TO Promo_code,
RENAME COLUMN `Previous Purchases` TO Previous_Purchases,
RENAME COLUMN `Payment Method` TO Payment_mode,
RENAME COLUMN `Frequency of Purchases` TO Frequency;

-- Age	Gender	Item Purchased	Category	Purchase Amount (USD)	Location	Size Color	Season	Review Rating	Subscription Status		Discount Applied	
-- Promo Code Used	Previous Purchases	Payment Method	Frequency of Purchases


-- unique values 
select count(cust_id) from cust_details;


-- genden wise customer distribution
select gender,count(gender) as `gender count` from cust_details 
group by gender;


-- different number of items 
select item,count(item) as `no of items` from cust_details
group by item
order by `no of items` desc limit 10;


-- total amount
select sum(Amount_USD) from cust_details;


-- category wise amount
select category, count(category)as `no. of category`,sum(amount_usd) as `total amount` from cust_details
group by category
order by `no. of category` desc; 


-- size wise total amount by gender
select gender,size, sum(amount_usd) as `total amount` from cust_details
group by size,gender
order by `total amount` desc;


-- Location wise customer
select location,sum(amount_usd) as customers 
from cust_details
group by location
order by customers desc limit 5;

-- customer distribution by age group
select count(cust_id) as customer ,
case 
when age <=18 or age<20 then "18-20" 
when age <=20 or age<30 then "20-30" 
when age <=30 or age<40 then "30-40" 
when age <=40 or age<50 then "40-50" 
when age <=50 or age<60 then "50-60"
else "60+"
end as `age group`
from cust_details
group by `age group`
order by `age group`;



select size, count(size) as count, sum(amount_usd) as customer from cust_details where gender="Male" and size="M" ; 

select size, count(size) as count, sum(amount_usd) as customer from cust_details where gender="Female" and size="M" ; 



select count(cust_id) from cust_details 
where discount="YES" and gender="male";


select count(distinct(shipping_type)) from cust_details;

select shipping_type,count(cust_id) as count from cust_details group by shipping_type
order by count desc;


-- total amount by gender for different age group
select 
case 
when age <=18 or age<20 then "18-20" 
when age <=20 or age<30 then "20-30" 
when age <=30 or age<40 then "30-40" 
when age <=40 or age<50 then "40-50" 
when age <=50 or age<60 then "50-60"
else "60+"
end as `age group`, gender,sum(amount_usd) as `total amount` 
from cust_details
group by `age group`,gender
order by `age group`;
 

-- total amount by season for differnt location
select  location,season, sum(amount_usd) as `total amount` from cust_details
group by season,location
order by `total amount` desc limit 10;


-- season wise customers
select distinct(season),count(cust_id) as customers, gender from cust_details 
group by season,gender
order by customers desc;







































