# RETAIL PHARMACY DATA ANALYSIS

PROJECT OVERVIEW : EXECUTIVE SUMMARY

Introduction
This project focuses on analyzing a pharmacy’s sales, inventory, and operational data using SQL for data extraction and Power BI for visualizations. The goal is to identify key metrics such as sales performance, profit trends, and inventory levels, enabling data-driven decision-making.
________________________________________
Tools Used
•	MySQL: Data extraction and querying.
•	Power BI: Visualization of insights and performance tracking.
________________________________________
Outcome
The dashboard delivers actionable insights on sales performance, inventory status, and staff contributions, helping to optimize operations and improve overall profitability.
________________________________________
Key Insights

1. Sales Performance
•	Total Sales: The total sales over the reporting period amounted to 2.71M, indicating healthy revenue generation.
•	Total Orders: A total of 200 orders were processed, with an average customer spending of 13.67K.
•	Top-Selling Drugs: The leading drugs by revenue include:
o	Clopidogrel: 0.20M
o	Hydrochlorothiazide: 0.19M
o	Ibuprofen: 0.17M
o	Aspirin: 0.15M
•	Monthly Sales Trend: Revenue peaked in May (0.27M) and showed steady performance across most months.



2.PROFIT ANALYSIS
•	Monthly Profit: Profit peaked at 1.25M in May 2024, with fluctuations throughout the year. A notable dip of -0.19M occurred in November 2023, highlighting potential issues such as increased costs or returns.
•	Average Yearly Revenue: Revenue has outperformed expectations, exceeding the 9.74K goal by 263.18%.


3. INVENTORY ANALYSIS
•	Days Until Expiry: Several critical drugs, such as Albuterol and Lisinopril, are nearing their expiry (9 and 11 days, respectively). Monitoring and strategic sales are necessary to avoid losses.
•	Top Suppliers by Quantity: Key suppliers include Waters and Sons (3.3K units supplied) and Smith, Powell and Johnson (2.8K units).
•	Stock Depletion: On average, drugs take 948 days to deplete, which could suggest overstocking or low turnover rates for certain drugs.
•	Total Stock Remaining: The pharmacy has a stock level of 497K, suggesting a healthy inventory for upcoming months.

4.CUSTOMER AND STAFF ANALYSIS
•	Customer Distribution: The gender distribution of customers is almost even, with 50.6% female and 49.4% male.
•	Staff Performance: The highest selling staff members by revenue are:
o	Dominique Thompson: £316.03K
o	Sierra Campbell: £304.89K
o	Jamie Sullivan: £285.44K
•	Sales by Drug Type and Staff: Staff sales primarily consist of Ointments, Suspensions, Syrups, and Tablets, with most staff handling an even mix of drug types.
________________________________________
Challenges
•	Connecting Power BI to MySQL Server: One significant challenge encountered was the difficulty in directly connecting Power BI to the MySQL server. This was mitigated by exporting data from MySQL to CSV format and then importing it into Power BI for visualization.
________________________________________
Suggestions for Additional Queries and Insights
To enhance the depth of the analysis, additional queries could be integrated:
1.	Sales Conversion Rate: Calculate how many customers complete a purchase versus how many visit the store or website.
2.	Promotional Effectiveness: Track how discounts and promotions influence sales over time.
3.	Supplier Performance: Analyze supplier reliability based on delivery times and stock depletion rates.
4.	Seasonal Trends: Analyze if certain drugs are sold more during specific seasons or months.
5.	Return Rates: Track the number of returned drugs to understand customer satisfaction and potential issues with certain products.
