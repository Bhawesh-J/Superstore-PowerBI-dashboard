## **Superstore Sales, Product and Customer Analysis Dashboard**

**Project Overview**

This Superstore project analyses 9000 rows of retail sales data using PowerBI to generate insights about the company's Sales, Product and Customer performance across various states and regions.

This Dashboard uses various measures such as DAX calculations and interactive visualization to transform raw data so to generate meaningful business insights.

**DASHBOARD PREVIEW**
<img width="1604" height="896" alt="Overview" src="https://github.com/user-attachments/assets/f28eab70-64e2-4d94-ae6c-c03ce83c7d41" />

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

<img width="1604" height="896" alt="Overview" src="https://github.com/user-attachments/assets/5ca06ddf-94fa-4870-920f-8553520e9eae" />

**2. Time Analysis**

**Purpose:**
Analyses Sales and Profit based on Yearly, Quarterly and Monthly trends.

**Includes**

- Prior year Sales Analysis
- YOY Growth % based on Sales
- Year and Month wise Sales and Profit
- Quarterly Perfomance
<img width="1590" height="888" alt="Time Analysis" src="https://github.com/user-attachments/assets/ada6f17e-1acb-4cce-b5da-dea06eda23d9" />

**3. Product Analysis**

**Purpose:**
Identify Best and Worst performing products based on sales and Profit generation.

**Includes**
 - Category-wise Sales and Profit
 - Most Profitable Sub-Category
 - Products with Maximum revenue generation
 - Total contribution of Top Products in Profit Generation
 - Most Profitable and Revenue Generation Products across several Regions
<img width="1588" height="889" alt="Product Analysis" src="https://github.com/user-attachments/assets/8ce41d7b-0333-4df0-a49b-bd3f6945907d" />

**4. Customer & Geographic Analysis**

**Purpose:**
Understand the Customer relationship with products and Identify High-value customers.

**Includes**
- Customer Distribution by Segments
- Top Profit generating Customers
- Most valueable customters according to Total sales, Number of orders and Profit Generation
- State wise Sales and Profitability
<img width="1589" height="886" alt="Customer Analysis" src="https://github.com/user-attachments/assets/b9a16c76-b8a7-4390-8dfb-554fb5903119" />


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
- 2 of the Top 5 revenue generating products drive losses but overall the top revenue generating products have good profit margins.
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
