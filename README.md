## **Superstore Sales, Product and Customer Analysis Dashboard**

**Project Overview**

This Superstore project analyses the retail sales data using PowerBI to generate insights about the company's Sales, Product and Customer performance across various states and regions.

This Dashboard uses various measures such as DAX calculations and interactive visualization to transform raw data so to generate meaningful business insights. 

**DASHBOARD PREVIEW**
<img width="1920" height="1080" alt="overview" src="https://github.com/user-attachments/assets/f427a771-4501-4ab5-afb4-cf5d74445a7a" />
**Tools Used**
- Microsoft PowerBI
- DAX Calculation
- Data Visualization
- Data Modeling
- Power Query

## **DATASET**

Dataset - Sample Superstore Dataset

https://github.com/Joshi1104/Superstore-powerbi-dashboard/blob/main/superstore_cleaned_data.csv

The dataset contains retail transactions across columns including:
- Orders
- Customers
- Product
- Sales
- Quantity
- Discount
- Profit
- Region
- States

## **Dashboard Pages**

**1. Executive Overview**

**Purpose:**
Provides the summary of overall business performace.

**Includes**

- Total Sales
- Total Profit
- Total Orders
- Profit Margin
- Quantity Sold

<img width="1920" height="1080" alt="overview" src="https://github.com/user-attachments/assets/f427a771-4501-4ab5-afb4-cf5d74445a7a" />

**2. Time Analysis**

**Purpose:**
Analyses Sales and Profit based on Yearly, Quarterly and Monthly trends.

**Includes**

- Prior year Sales Analysis
- YOY Growth % based on Sales
- Year and Month wise Sales and Profit
- Quarterly Perfomance
<img width="1920" height="1080" alt="Time Analysis" src="https://github.com/user-attachments/assets/371a6d1a-db7e-484d-8381-d0162388e6e9" />

**3. Product Analysis**

**Purpose:**
Identify Best and Worst performing products based on sales and Profit generation.

**Includes**
 - Category-wise Sales and Profit
 - Most Profitable Sub-Category
 - Products with Maximum revenue generation
 - Total contribution of Top Products in Profit Generation
 - Most Profitable and Revenue Generation Products across several Regions
<img width="1920" height="1080" alt="Product Analysis" src="https://github.com/user-attachments/assets/fc27af46-a4bf-4218-b1b4-4c1cddb4a3af" />

**4. Customer & Geographic Analysis**

**Purpose:**
Understand the Customer relationship with products and Identify High-value customers.

**Includes**
- Customer Distribution by Segments
- Top Profit generating Customers
- Most valueable customters according to Total sales, Number of orders and Profit Generation
- State wise Sales and Profitability
<img width="1920" height="1080" alt="Customer  Analysis" src="https://github.com/user-attachments/assets/727f2cac-56b2-40b9-aac9-07c3e90b7c83" />


## **Data Modelling and Calculations**

Some of the DAX measures that I have Created:

**1. Total Orders**

Total Orders = DISTINCTCOUNT(sales_overall_table[order_id]) 

**2. Profit Margin**

Profit Margin = SUM(sales_overall_table[profit])/SUM(sales_overall_table[sales])

**3. Quantity Sold**

Quantity Sold = SUM(sales_overall_table[quantity])

**4. Sales Last Year**

Sales last year = CALCULATE([sales], SAMEPERIODLASTYEAR(date_table[Date] ))

**5. YOY Growth %**

YOY Growth % = DIVIDE([sales] - [Sales last year], [Sales last year], BLANK())


## **Key Insights**

- Technology Segment has the highest contribution to Sales and Profit
- 2 of the Top 5 revenue generation products drive losses but overall the top revenue generation products have good profit margins.
- Furniture segment's almost all of the losses were accounted for the losses incurred on sales of Tables which is the heaviest loss making sub-category.
- Technology Segment has the least ordered items which means that per item profit generation and revenue is very good as compared to Office supplies which has the highest recorded ordered items considering that both segments have around same profit margins.
- Surprisingly the top customers by revenue tend to be the one generating most profit which means that they might be purchasing from Technology and Office supplies Segment. The segment distribution among top customers can be cleared more by aggregating the total quantities they have ordered, where less quantity and more profit means that they are somewhat more into technology segment.
- East and West Region seem to be having more customers as they consistently generate more revenue and profit.

## **Skills Demonstrated**

- Data Cleaning
- Data Modeling
- Data Interpretation
- DAX Calculations
- Interactive Design
- Business Analysis
- Data Storytelling
