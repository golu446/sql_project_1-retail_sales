create table retail_sales1
(
transactions_id	int primary key,
sale_date date,
sale_time time,
customer_id	int ,
gender varchar(50),
age	 int,
category varchar(50),
quantiy float,
price_per_unit float,
cogs float,
total_sale float

);

select * from retail_sales1
limit 10



select count(*) from retail_sales1

-- check the null value
select * from retail_sales1
where
	transactions_id is null
	or 
	sale_date is null
	or
	sale_time is null
	or
	customer_id is null
	or
	gender is null
	or
	age is null
	or
	category is null
	or
	quantiy is null
	or
	price_per_unit is null
	or
	cogs is null
	or
	total_sale is null;



delete  from retail_sales1
where
	transactions_id is null
	or 
	sale_date is null
	or
	sale_time is null
	or
	customer_id is null
	or
	gender is null
	or
	age is null
	or
	category is null
	or
	quantiy is null
	or
	price_per_unit is null
	or
	cogs is null
	or
	total_sale is null;


-- Data exploration

-- How Many Sales we have

select count(*) from retail_sales1

-- How Many Customer we have

select count(customer_id) from retail_sales1

-- How Many unique Customer we have

select count(Distinct customer_id) from retail_sales1

-- How Many category we have

select count(Distinct category) from retail_sales1

-- How Many category name  we have

select Distinct category from retail_sales1

-- data analysis and bussiness problem and answer



--My Analysis & Findings

--Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
--Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
--Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
--Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
--Q.5 Write a SQL query to find all transactions where the total sale is greater than 1000.
--Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
--Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
--Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
--Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
--Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

--Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

select * from retail_sales1
where sale_date = '2022-11-05'

--Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

select 
	*
	from retail_sales1
where category = 'Clothing'
And 
to_char(sale_date ,'YYYY-MM')='2022-11'
And
quantiy >= 4

--Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category,
    SUM(total_sale) as net_order ,
	count(*) as total_order
FROM retail_sales1
GROUP BY category;

--Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.


SELECT 
   round(avg(age),2) as Average_age
FROM retail_sales1
where category = 'Beauty'


--Q.5 Write a SQL query to find all transactions where the total sale is greater than 1000.

select *from retail_sales1
where total_sale>=1000


--Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select
		category,
		gender,
		count(*) as total_trans
from retail_sales1
group by
	category,
	gender
order by 1

--Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select 
	extract (year from sale_date) as year,
    extract (month from sale_date) as month,
	
	avg(total_sale) as Average_Sales
from retail_sales1
group by 1,2
order by 1,3 desc


--Q.8 Write a SQL query to find the top 5 customers based on the highest total sales

SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales1
GROUP BY customer_id 
ORDER BY total_sales DESC
LIMIT 5;


--Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select
	category,
count(Distinct customer_id) As unique_customer 
from retail_sales1 
group by category;

--Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

select *, 
    case
		when extract(hour from sale_time)>12 then 'morning'
		when extract(hour from sale_time) between 12 and 14 then 'Afternoon'
		else 'evening'
end as shift
from retail_sales1














































