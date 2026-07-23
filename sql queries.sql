-- ========================================================================================
-- Question 1: What is the Total revenue generated.
-- ========================================================================================

SELECT 
    SUM(sales) AS total_revenue
FROM
    customer_data;

-- ========================================================================================
-- Question 2:Total Profit.
-- ========================================================================================

SELECT 
    SUM(profit) AS total_profit
FROM
    customer_data;

-- ========================================================================================
-- Question 3:	Total orders.
-- ========================================================================================

SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM
    customer_data;

-- ========================================================================================
-- Question 4: Average Order Value.
-- ========================================================================================

SELECT 
    ROUND(SUM(sales)/COUNT(DISTINCT order_id) ,2) AS avg_sales_per_order
FROM
    customer_data;

-- ========================================================================================
-- Question 5: Monthly sales trend.
-- ========================================================================================

SELECT 
    ROUND(SUM(sales)/COUNT(DISTINCT EXTRACT(MONTH FROM order_date)) ,2) AS avg_sales_per_month
FROM
    customer_data;

-- ========================================================================================
-- Question 6: Top 10 product by sales.
-- ========================================================================================
  
SELECT
    product_name, SUM(sales) as total_sale
FROM
    customer_data
GROUP BY product_name
ORDER BY total_sale DESC 
LIMIT 10;

-- ========================================================================================
-- Question 7:	Top 10 product by profit.
-- ========================================================================================

SELECT
    product_name, SUM(profit) as max_profit_items
FROM
    customer_data
GROUP BY product_name
ORDER BY max_profit_items DESC 
LIMIT 10; 

-- ========================================================================================
-- Question 8:	Worst performing products.
-- ========================================================================================

SELECT
    product_name, SUM(profit) as min_profit_items
FROM
    customer_data
GROUP BY product_name
ORDER BY min_profit_items ASC
LIMIT 10;

-- ========================================================================================
-- Question 9: What is the Category wise sales.
-- ========================================================================================

SELECT
    category, SUM(sales) as total_category_sales
FROM
    customer_data
GROUP BY category
ORDER BY total_category_sales DESC
LIMIT 10;

-- ========================================================================================
-- Question 10:	Sub-category profitability.
-- ========================================================================================

SELECT
    sub_category, SUM(profit) as sub_category_profit
FROM
    customer_data
GROUP BY sub_category
ORDER BY sub_category_profit DESC;

-- ========================================================================================
-- Question 11: Top customer by revenue.
-- ========================================================================================

SELECT
    customer_name, customer_id, SUM(sales) as customer_revenue_generation
FROM
    customer_data
GROUP BY customer_name, customer_id
ORDER BY customer_revenue_generation DESC
LIMIT 10;

-- ========================================================================================
-- Question 12: Sales by customer segment.
-- ========================================================================================

SELECT 
    segment, SUM(sales) as segment_revenue_generation
FROM
    customer_data
GROUP BY segment
ORDER BY segment_revenue_generation DESC
LIMIT 10;

-- ========================================================================================
-- Question 13: Number of customers per region.
-- ========================================================================================

SELECT
    region, COUNT(DISTINCT (customer_name)) as customers_per_region
FROM
    customer_data
GROUP BY region
ORDER BY customers_per_region DESC;

-- ========================================================================================
-- Question 14:	What is the Yearly growth.
-- ========================================================================================

SELECT
    year, total_revenue, (LAG(total_revenue) OVER(ORDER BY year)) as previous_base,
    total_revenue - (LAG(total_revenue) OVER(ORDER BY year)) as difference_from_previous_year
FROM
    (SELECT
    EXTRACT(YEAR FROM order_date) as year, SUM(sales) as total_revenue
FROM
    customer_data GROUP BY year) as year_row;

-- ========================================================================================
-- Question 15:	Monthly profit trend.
-- ========================================================================================

SELECT 
    months, total_profit, (LAG(total_profit) OVER(ORDER BY months)) as previous_base,
    total_profit - (LAG(total_profit) OVER(ORDER BY months)) as difference_from_previous_month
FROM
    (SELECT
    EXTRACT(MONTH FROM order_date) as months, SUM(profit) as total_profit
FROM
    customer_data GROUP BY months) as month_row;

-- ========================================================================================
-- Question 16:	Shipping time analysis
-- ========================================================================================

SELECT 
    ship_mode,region, category, sub_category, ROUND(AVG(datediff(ship_date , order_date)), 0) AS time_taken_in_days
FROM
    customer_data
GROUP BY ship_mode, region, category, sub_category
ORDER BY time_taken_in_days, region, category;

-- ========================================================================================
-- Question 17:	Ranking customer by spending.
-- ========================================================================================

SELECT
    customer_name, SUM(sales) AS avg_spending
FROM
    customer_data
GROUP BY customer_name 
ORDER BY avg_spending DESC;

-- ========================================================================================
-- Question 18:	Running total sales.
-- ========================================================================================

SELECT 
    months,
    monthly_sales,
    SUM(monthly_sales) OVER (ORDER BY months) AS running_total
FROM 
    (SELECT 
        EXTRACT(MONTH FROM order_date) AS months,
        SUM(sales) AS monthly_sales
    FROM customer_data
    GROUP BY EXTRACT(MONTH FROM order_date)
) AS monthly_data;

-- ========================================================================================
-- Question 19:	Month over month growth
-- ========================================================================================

WITH monthly_sales AS (
    SELECT
        EXTRACT(MONTH FROM order_date) AS months,
        SUM(sales) AS monthly_sales,
        SUM(profit) AS monthly_profit
    FROM customer_data
    GROUP BY EXTRACT(MONTH FROM order_date)
),

metrics_with_prev AS (
    SELECT
        months,
        monthly_sales,
        monthly_profit,
        LAG(monthly_sales) OVER (ORDER BY months) AS prev_sale,
        LAG(monthly_profit) OVER (ORDER BY months) as prev_profit
    FROM monthly_sales
)

SELECT
    months,
    monthly_sales,
    ROUND(
        ((monthly_sales - prev_sale) * 100.0 / prev_sale), 2)
        AS percentage_change_in_sales,
    monthly_profit,
    ROUND(
		    ((monthly_profit - prev_profit) *100.0/ prev_profit), 2) 
        AS percentage_change_in_profit
FROM metrics_with_prev;

-- ========================================================================================
-- Question 20: Top 3 products per Category.
-- ========================================================================================

SELECT
    category, product_name, total_sale, sales_rank, total_profit, profit_rank 
FROM
    (SELECT category, product_name,
		  SUM(sales) AS total_sale,
		  SUM(profit) AS total_profit,
          DENSE_RANK()
			      OVER(PARTITION BY category ORDER BY SUM(sales) DESC) AS sales_rank,
		      DENSE_RANK()
			      OVER(PARTITION BY category ORDER BY SUM(profit) DESC) AS profit_rank 
FROM customer_data GROUP BY category, product_name) as p WHERE sales_rank <=3;

-- ========================================================================================
-- Question 21:	Category wise Percentage Contribution to total sales.
-- ========================================================================================

SELECT 
    category,
    ctgr_sale,
    ROUND(ctgr_sale * 100.0 / SUM(ctgr_sale) OVER(), 2) AS percentage_contribution
FROM
    (SELECT 
        category, SUM(sales) AS ctgr_sale
    FROM
        customer_data
    GROUP BY category) AS tables ORDER BY percentage_contribution DESC; 

-- ========================================================================================
-- Question 22:	Region wise Percentage contribution to total sales.
-- ========================================================================================

SELECT 
    region,
    region_sale,
    ROUND(region_sale * 100.0 / SUM(region_sale) OVER(), 2) AS percentage_contribution
FROM
    (SELECT 
        region, SUM(sales) AS region_sale
    FROM
        customer_data
    GROUP BY region) AS tables ORDER BY percentage_contribution DESC;

-- ========================================================================================
-- Question 23:	Sub-category wise Percentage contribution to total sales.
-- ========================================================================================

SELECT 
    sub_category,
    sub_category_wise_sale,
    ROUND(sub_category_wise_sale * 100.0 / SUM(sub_category_wise_sale) OVER(), 2) AS percentage_contribution
FROM
    (SELECT 
        sub_category, SUM(sales) AS sub_category_wise_sale
    FROM
        customer_data
    GROUP BY sub_category) AS tables ORDER BY percentage_contribution DESC LIMIT 10;
