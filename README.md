📊 Bank Marketing Campaign Performance Analysis

SQL Server | Power BI | Excel

🔍 Problem Statement

Banks run repeated marketing campaigns to promote term deposit subscriptions, but excessive outreach increases cost and customer fatigue without consistently improving conversions. This project identifies which customers are most likely to subscribe, which contact methods perform best, and when campaign efforts start showing diminishing returns, enabling more efficient, data-driven marketing decisions.

💼 Business Impact

Overall subscription rate: 47.38%

High-performing customer segments convert at 60–75%, significantly above average

Campaign effectiveness declines sharply after 3–4 contact attempts

Prioritizing high-converting segments and limiting excessive outreach can:

Reduce unnecessary marketing spend

Improve campaign ROI

Increase conversion efficiency by an estimated 15–20%

🧠 Approach & Methodology

Cleaned and validated the dataset using Excel

Loaded cleaned data into SQL Server for structured analysis

Calculated KPIs and segment-level metrics using:

Common Table Expressions (CTEs)

Aggregations and CASE logic

Window functions (RANK, AVG OVER)

Built an interactive Power BI dashboard to visualize performance, segmentation, and campaign trends

📈 Key Findings

Age segments: Customers under 30 and retired customers show the highest subscription rates

Balance impact: High balance customers convert significantly better than low or negative balance customers

Contact method: Cellular outreach outperforms telephone and unknown channels

Campaign frequency: Subscription rates drop after 3–4 campaign attempts, indicating diminishing returns

High-converting segments: Young customers with positive balances and student/management occupations exceed 60% conversion

🎯 Recommendations

Focus marketing efforts on:

High balance customers

Under-30 and retired segments

Prioritize cellular contact for outreach

Limit campaign attempts to 3–4 per customer

Reallocate marketing spend away from low-performing segments and excessive follow-ups

📊 Dashboard Overview

The Power BI dashboard provides:

KPI overview (total customers, subscribers, subscription rate)

Subscription performance by age group, occupation, balance group, and contact method

High-converting customer segments table

Campaign frequency vs subscription trend analysis

📸 Dashboard preview available in the screenshots folder.

🛠 Tools & Technologies

Excel – Data cleaning and validation

SQL Server – KPI calculation, segmentation, advanced SQL queries

Power BI – Interactive visualization and business storytelling

👤 Author

Akhilesh Pedduri
SQL • Power BI • Data Analytics
Toronto, Canada
