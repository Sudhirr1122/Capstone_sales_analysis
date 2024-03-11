## Capstone Store Data Analysis

### Objective:
The objective of this project is to analyze the Capstone store data to derive insights and make data-driven decisions for business improvement. The analysis covers various metrics such as revenue, order value, product categories, delivery time, and customer behavior.

### Queries Overview:
#### User Order Buckets:
Categorizes users based on their order history.

| Order Category | Total |
| -------------- | ----- |
| 1_to_5_orders | 9247 |
| 6_to_10_orders | 241 |
| >=10_orders | 12 |

#### Month-over-Month Metrics Comparison:
Compares various metrics such as total revenue, average order value, number of orders, etc., month-over-month.

| Metric | Month |
| ------ | ----- |
| Total Sales | 654465, 561396, 645157, 597322, 611579, 581715 |
| Average Order Value | 641, 646.03, 628.2, 622.86, 649.92, 622.82 |
| Total Orders | 1021, 869, 1027, 959, 941, 934 |

#### Product Category Analysis:
Identifies the count of each product in different categories per month.

| Month | Product ID | Count of Product |
| ----- | ---------- | ---------------- |
| 1 | 159 | 3 |
| 1 | 646 | 3 |
| 1 | 3088 | 3 |
| ... | ... | ... |

#### Order Rating Analysis:
Shows the distribution of orders by their rating.

| Order Rating | Total Orders |
| ------------ | ------------ |
| 1 | 1855 |
| 2 | 1884 |
| 3 | 1920 |
| ... | ... |

#### Product Contribution Analysis:
Identifies products contributing to 80% of order contribution and their attributes.

#### Cohort Retention Analysis:
Calculates month-over-month retention for specific cohorts based on their first order month.

#### Return Rate by Product Category:
Determines the return rate for each product category.

| Product Category | Return Rate (%) |
| ---------------- | --------------- |
| Electronics | 6.82 |
| Sports | 6.39 |
| Books | 6.5 |
| Clothing | 6.99 |
| Home Goods | 6.55 |

#### Delivery Time Comparison:
Compares average delivery time for orders placed on weekdays versus weekends.

| Delivery Time | Average Delivery Time (hours) |
| ------------- | ---------------------------- |
| Weekend | 13.01 |
| Weekday | 12.97 |

#### Supplier Contribution Analysis:
Calculates the percentage contribution of each supplier to the total quantity of products sold in different categories.

| Supplier ID | Product ID | Percentage |
| ----------- | ---------- | ---------- |
| 795 | Home Goods | 0.44 |
| ... | ... | ... |

#### Running Total of Delivered Orders:
Tracks the running total of orders delivered over time.

| Delivery Date | Running Total of Delivered Orders |
| ------------- | -------------------------------- |
| 2022-01-02 | 2 |
| 2022-01-03 | 6 |
| ... | ... |

#### Gender-based Analysis:
Evaluates distribution of orders delivered based on gender and day-over-day trend of Gross Merchandise Value (GMV).

| Gender | Total Sales |
| ------ | ----------- |
| Female | 3295787 |
| Male | 2766058 |

### Key Insights:

1. **User Engagement and Loyalty:**
   - The categorization of users based on their order history reveals that the majority (9247) have placed 1 to 5 orders, indicating a large base of regular customers.
   - A smaller proportion (241) have placed 6 to 10 orders, suggesting a loyal customer segment that contributes consistently to sales.
   - Only a handful (12) have placed more than 10 orders, indicating a niche group of highly engaged and loyal customers. Targeting strategies towards retaining and nurturing this segment could yield high returns.

2. **Trend Analysis and Seasonal Variations:**
   - Month-over-month comparison of metrics like total sales, average order value, and total orders indicates fluctuating patterns over time.
   - For example, while total sales peak in January and March, they dip slightly in February and May, showcasing seasonal variations or specific promotional activities during certain months.
   - Understanding these trends can help in planning marketing campaigns, inventory management, and resource allocation more effectively.

3. **Product Contribution and Category Performance:**
   - Analyzing the contribution of products to order value can help in focusing on high-value items and optimizing product offerings.
   - Categories like Clothing, Electronics, and Sports contribute significantly to overall sales, indicating areas of strength that can be further leveraged for growth.
   - Conversely, categories with lower contributions may require attention to improve performance or adjust strategies.

4. **Customer Retention and Return Rates:**
   - Cohort retention analysis provides insights into customer retention patterns over time, highlighting the effectiveness of customer acquisition and retention efforts.
   - Return rate analysis by product category indicates the level of satisfaction with different product types.
   - Higher return rates in certain categories may suggest issues with product quality, sizing, or customer expectations, requiring corrective actions to maintain customer satisfaction levels.

5. **Order Fulfillment and Delivery Performance:**
   - Analysis of repeated canceled orders identifies potential issues in order fulfillment or customer experience that need to be addressed.
   - Delivery time comparison between orders placed on weekends and weekdays can highlight any discrepancies in delivery speed or efficiency based on order timing.
   - Improving order fulfillment processes and optimizing delivery routes can lead to enhanced customer satisfaction and loyalty.

6. **Supplier Contribution and Relationship Management:**
   - Supplier contribution analysis allows for the identification of percentage contribution of each supplier to the total quantity of products sold in different categories.
   - Building strong relationships with these suppliers and negotiating favorable terms can ensure consistent product availability and quality.

7. **Gender-based Purchasing Behavior:**
   - Gender-based analysis reveals differences in purchasing behavior between male and female customers.
   - Understanding these differences can help tailor marketing strategies, product offerings, and customer experiences to better meet the needs and preferences of each gender group.

### Conclusion:
The analysis of Capstone store data provides valuable insights into various aspects of business operations, customer behavior, and product performance. These insights can be leveraged to optimize processes, improve customer satisfaction, and drive business growth. Continuous monitoring and analysis of key metrics are essential for informed decision-making and business success.

Feedback on the analysis and findings is welcome for further refinement and improvement. Thank you!

