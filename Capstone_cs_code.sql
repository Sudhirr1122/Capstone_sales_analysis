1.Write an SQL query to find the count of users in each order bucket based on their order history. The order buckets are categorized as 'No_orders' for customers with no delivered orders, '1_to_5_orders' for those with 1 to 5 delivered orders, '6_to_10_orders' for 6 to 10 delivered orders, and '>=10_orders' for customers with more than 10 delivered orders. The result should display the order bucket and the corresponding count of users.

with my_cte as (
select User_id,count()over(partition by User_id) as count_of_total_order
from Capstone_database
)
select
case 
    when count_of_total_order >= 1 and count_of_total_order <= 5 then '1_to_5_orders'
    when count_of_total_order >= 6 and count_of_total_order <= 10 then '6_to_10_orders'
    when count_of_total_order >= 10 then '>=10_orders'
    else null
    end as order_category,
    count(*) as total
    from my_cte
    group by order_category;

Fetch the below metrics for month on month comparison of

	1. Total Revenue
	select extract ( Month from Order_date) AS "Month", sum(Quantity*Sale_price) as total_sales
	from Capstone_database
	where Order_status = 'Delivered'
	group by 1;


	2. Average Order Value
	select extract ( Month from Order_date) AS "Month", Round(avg (Quantity*Sale_price),2) as avg_order_value
	from Capstone_database
	where Order_status = 'Delivered'
	group by 1;

	3. Number of Orders
	select extract ( Month from Order_date) AS "Month", Count(order_id) total_orders
	from Capstone_database
	where Order_status = 'Delivered'
	group by 1;


	4. Average Order Processing Time
	select extract ( Month from Order_date) AS "Month", 
	round (avg(Delivery_date - Order_date),2) avg_processing_time_indays
	from Capstone_database
	where Order_status =! 'Delivered'
	group by 1;

	5. Top 10 highest selling products

	with my_cte AS
	(
	select extract(month from Order_date )as 'Month',Product_id, count(Product_id)count_of_product,
	row_number() over(partition by extract(month from Order_date) order by count(Product_id) desc) as 'rank'
	from Capstone_Database
	group by 1,2
	)
	SELECT MONTH,Product_id,count_of_product
	FROM    my_cte
	WHERE   rank <= 10
	order by 1;

	6. Bucket DIstribution of different ratings and count of orders in it’

	select Order_rating,count(User_id) total
	from Capstone_database
	group by 1;

	7. Sales by Product Category
	select Product_category ,Sum (Quantity*Sale_price) total
	from Capstone_database
	group by 1;



	8. Sales and Orders by Gender
	select Gender ,Sum (Quantity*Sale_price) total_sales
	from Capstone_database
	group by 1;

3.For the products contributing to 80% Order contribution overall, get the product_id, Category, Portfolio, total_orders for each product and offer_name used the most with them.

with my_cte as (
select product_id,COUNT(ORDER_ID) TOTAL_ORDER,(COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM Capstone_Database)) AS percentage_contribution
from Capstone_Database
group by 1
)
SELECT m.product_id,c.Product_category, c.Product_portfolio,c.Offer_name,COUNT(ORDER_ID) TOTAL_ORDER
from my_cte as m
join Capstone_Database as c 
on m.product_id=c.product_id
group by 1,2,3,4
HAVING SUM(m.percentage_contribution) <= 80;

4. Calculate the month-over-month retention for a specific cohort based on the month of their first order. The retention should be measured for each subsequent month. The cohort should be defined by the month of the first order, and the result should display the percentage of customers retained for each month. For example, People who ordered for the first time in Jan, what percentage of users ordered in Feb, Mar, Apr and so on. Then same for people who first ordered in Feb, how many of them ordered again in Mar, Apr, May and so on till June.

WITH my_cte AS (
    SELECT 
        User_id,
        MIN(EXTRACT(month FROM Order_timestamp)) AS month_of_1st_purchase
    FROM 
        Capstone_Database
    GROUP BY 
        User_id
),
my_cte_1 AS (
    SELECT 
        c.User_id,
        EXTRACT(month FROM c.Order_timestamp) AS month,
        month_of_1st_purchase,
        CASE 
            WHEN month_of_1st_purchase = 1 THEN 'J'
            WHEN month_of_1st_purchase = 2 THEN 'F'
            WHEN month_of_1st_purchase = 3 THEN 'M'
            WHEN month_of_1st_purchase = 4 THEN 'A'
            WHEN month_of_1st_purchase = 5 THEN 'M'
            WHEN month_of_1st_purchase = 6 THEN 'Ju'
            ELSE 'Other' 
        END AS Retention
    FROM 
        Capstone_Database AS c
    INNER JOIN 
        my_cte AS m ON c.User_id = m.User_id
),
my_cte_2 AS
(
SELECT 
    month,
    Retention,
    COUNT(*) OVER (PARTITION BY month, Retention) AS Retention_count
FROM 
    my_cte_1
)
select month, COUNT(*) OVER (PARTITION BY month, Retention)*100.0/(select count(Retention) from my_cte_2) as Retention_percentage
from my_cte_2
GROUP by 1,Retention


5.Calculate the return rate for each product category. The return rate is defined as the percentage of orders that have been returned out of the total delivered orders for each product category.

select Product_category, round ((COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM Capstone_Database group by Product_category)),2) AS return_percentage
from Capstone_Database
where Order_status= 'Return to Origin'
group by 1

6.Write a query to fetch only those customers who placed an order but cancelled the same orders more than once.

select User_id,Order_id,count(Order_id)
from Capstone_Database
where Order_status='cancelled'
group by 1,2;

7.Write a query to find what is the Average delivery time for orders placed on weekdays versus weekends

with my_cte as (
select extract (dow from Order_date) as day_of_order, round (avg(Delivery_date - Order_date),2) as avg_delievry_time
from Capstone_Database
where Order_status='Delivered'
group by 1
)
select
    AVG((select avg_delievry_time
            FROM my_cte WHERE day_of_order IN (0,6))) AS ORDERED_ON_WEEKEND,
            AVG((select avg_delievry_time
            FROM my_cte WHERE day_of_order NOT IN (0,6))) AS ORDERED_ON_WEEKDAY;

8.Write a query to Determine the percentage contribution of each supplier to the total quantity of products sold in different product categories.

select Supplier_id,Product_category, round ((COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM Capstone_Database group by Product_category)),2) AS total_percentage
from Capstone_Database
group by 1,2
order by 3 desc;

9.Write a query to Calculate the running total of orders delivered over time to identify trends in the order delivery volume.

WITH my_cte AS (
    SELECT 
        Delivery_date,
        CASE 
            WHEN Order_status = 'Delivered' THEN 1
            ELSE 0
        END AS Delivered_order_count
    FROM 
        Capstone_Database
)

SELECT 
    Delivery_date,
    SUM(Delivered_order_count) OVER (ORDER BY Delivery_date) AS running_total_delivered_order
FROM 
    my_cte
ORDER BY 
    Delivery_date;


10.
A. Evaluate the distribution of orders delivered based on gender to understand any gender-related trends.

WITH MY_CTE AS (            
select Gender,COUNT(Order_id) AS TOTAL_DELIVERD_ORDER
from Capstone_Database
where Order_status='Delivered'
group by 1
),
MY_CTE_1 AS (
    select Gender,COUNT(Order_id) AS TOTAL_ORDER
    FROM Capstone_Database
    GROUP BY 1
    )
    select m1.Gender,Round((TOTAL_DELIVERD_ORDER*100.0/TOTAL_ORDER),2) as Successful_delivery_percentage
    from MY_CTE as m1
    join MY_CTE_1 as m2
    on m1.Gender=m2.Gender


 B.Day over Day trend of GMV
with my_cte as(
    select extract (doy from Order_date) as day_of_order, 
        Sum(Quantity*Sale_price) as GMV
    from Capstone_Database 
    group by 1
),
 my_cte_2 as (
    select 
        day_of_order,
        GMV,
        lag(Gmv,1,0) over() as lag
    from my_cte )
    
select 
    day_of_order,
    GMV,
    lag,
    Round(((GMV-lag)*100.0/lag),2)AS day_over_day_percentage_change
from my_cte_2





