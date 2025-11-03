# 🚗 Insurance Claim Analysis

Comprehensive insurance claims analysis using SQL and Power BI to uncover policy trends, identify high-risk segments, and support data-driven decision-making.

---

## Table of Contents

## 📘 Table of Contents

1. [Project Overview](#-project-overview)
2. [Business Problem Statement](#-business-problem-statement)
3. [Tools & Technologies](#-tools--technologies)
4. [Dataset Overview](#-dataset-overview)
5. [Data Cleaning Process](#-data-cleaning-process)
6. [Exploratory Data Analysis (EDA)](#-exploratory-data-analysis-eda)
    - [Total Policies and Claim Overview](#total-policies-and-claim-overview)
    - [Top 10 Car Makes by Claim Amount](#top-10-car-makes-by-claim-amount)
    - [Average Claim Amount by Car Make](#average-claim-amount-by-car-make)
    - [Top 10 Policyholders by Claim Value](#top-10-policyholders-by-claim-value)
    - [Claims Distribution by State](#claims-distribution-by-state)
    - [Claim Trends Over Time](#claim-trends-over-time)
    - [Claim Type and Status Overview](#claim-type-and-status-overview)
7. [KPIs & Definitions](#-kpis--definitions)
8. [Key Insights](#-key-insights)
9. [Recommendations](#-recommendations)
10. [Power BI Dashboard Preview](#-power-bi-dashboard-preview)
11. [Conclusion](#-conclusion)
12. [Project Links](#-project-links)


---

## 📊 Project Overview

**Objective:** This project focuses on analyzing **Insurance Policy and Claims Data** to uncover patterns in customer claims, policy distribution, and claim amounts across different car makes and states.  

As a **Data Analyst**, the goal was to:
- Clean, aggregate, and analyze insurance claim data using **SQL**  
- Identify trends in total policies and claim amounts by car type and region
- Which segments (age, car use, education, coverage zone) drive the most claims and costs?   
- Visualize insights using **Power BI** for better business decision-making  

* The project demonstrates the use of SQL for data extraction and transformation, followed by Power BI for visualization and storytelling to support the company’s strategic goals.
---

## 💼 Business Problem Statement

The Insurance company is facing rising claim costs and inconsistent policy performance across various customer segments, car types, and coverage zones.  
Management suspects that **certain groups of customers, regions, or vehicle categories are contributing disproportionately to high claim payouts**, but lacks the analytical visibility to confirm or quantify this trend.

They’ve asked the **Data Analytics Team** to investigate the following key areas:

1. **High-Risk Segments Identification**  
   - Which customer groups (e.g., by age group, education level, or car use) have the highest **average claim amount per policy**?  
   - Are there particular combinations, such as *Age Group + Coverage Zone*, that indicate higher risk?

2. **Claim Frequency Analysis**  
   - What is the distribution of claims across customers — how many have made **no claims**, **1–2 claims**, or **3+ claims**?  
   - Can we categorize policyholders by their claim frequency to target risk management strategies?

3. **Data Quality & Operational Efficiency**  
   - Are there missing or inconsistent records (e.g., missing gender, education, or coverage type)?  
   - How reliable is the claims data for decision-making?

---

## 🧰 Tools & Technologies

- **SQL (Structured Query Language)** – Used for querying, cleaning, and aggregating policy and claims data. SQL enabled the extraction of KPIs such as total policies, total claim amounts, and average claims by customer or vehicle type.  

- **Power BI** – Used for interactive data visualization, dashboard design, and storytelling. Power BI allowed stakeholders to explore claim distributions, identify high-risk customer groups, and monitor trends dynamically.  

- **Excel** – Assisted with initial data inspection, verification of outputs, and cross-checking query results before importing into Power BI.

---

## 🗂 Dataset Overview

**Source:** Insurance Policy and Claims Dataset  
**Rows:** 10,000+ policy records  
**Columns:** 12+ fields capturing policyholder details, claim history, and vehicle information.  

The dataset was designed to analyze **insurance claim behavior**, **policy distribution**, and **claim frequency patterns** across different customer demographics and vehicle types. It provides a comprehensive view of how customer characteristics (e.g., age, gender, vehicle make) relate to claim outcomes and total claim amounts.

**Key Columns:**

| Column | Description |
|--------|--------------|
| policy_id | Unique identifier for each insurance policy |
| customer_id | Unique identifier for each policyholder |
| birthdate | Customer's date of birth, used for age group segmentation |
| gender | Gender of the policyholder |
| car_make | Vehicle manufacturer associated with the policy |
| car_model | Specific car model |
| claim_amount | Monetary value of claim(s) filed |
| claim_freq | Number of claims made per policy |

The dataset serves as the foundation for identifying risk patterns, understanding claim trends, and supporting strategic decision-making in policy management and pricing.

---

## 🔍 Exploratory Data Analysis (EDA)

The **Exploratory Data Analysis (EDA)** for this project was carried out using **SQL**, focusing on identifying key patterns in insurance policies, claims behavior, and customer demographics. The queries provided insights into claim frequency, policyholder profiles, and overall performance across various factors such as car use, education, and coverage zone.

All insights were later visualized in **Power BI** for interactive reporting and dashboard storytelling.


1. **Total Policies**
```sql
SELECT COUNT(id) AS Total_Policies
FROM insurance_policies;
```
<img width="212" height="62" alt="Total_Policies" src="https://github.com/user-attachments/assets/7377e93f-5351-478c-9708-83eaabd6f778" />

2. **Total Claim Amount**
  ```sql
    SELECT CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount
    FROM insurance_policies;
  ```
  <img width="232" height="73" alt="Total_claim_amount" src="https://github.com/user-attachments/assets/9f35ca05-e9d0-4bce-81d0-2776d608ba00" />

3. **Average Claim Frequency per Policy**
    ```sql
    SELECT CAST(AVG(claim_freq * 1.0) AS DECIMAL(10,4)) AS Avg_Claim_Frequency
    FROM insurance_policies;

    ```
     <img width="223" height="58" alt="Avg_claim_frequency" src="https://github.com/user-attachments/assets/d8f5f143-a81a-4c63-b315-a4fabc1751b8" />

6. **Average Claim Amount**
    
  
8. **Gender-wise**
9. **Policies & Claims by Car Use**
10. **Total Claim Amount**
11. **Total Claim Amount**
12. **Total Claim Amount**
13. **Total Claim Amount**
---

## 📊 KPIs & Definitions

The following **Key Performance Indicators (KPIs)** were calculated directly from SQL and visualized in Power BI.  
They serve as the foundation for evaluating policy performance, claim trends, and overall business health.

| **KPI** | **SQL Formula / Logic** | **Description** | **Business Purpose** |
|----------|-------------------------|------------------|-----------------------|
| **Total Policies** | `COUNT(id)` | Total number of insurance policies in the database | Measures overall portfolio size and customer base |
| **Total Claim Amount** | `SUM(claim_amount)` | Sum of all claim payouts across policies | Tracks total financial exposure and claim obligations |
| **Average Claim Amount** | `AVG(claim_amount)` | Mean claim value per customer | Evaluates average payout behavior and helps adjust premium pricing |
| **Average Claim Frequency per Policy** | `AVG(claim_freq)` | Average number of claims filed per policy | Indicates customer claim behavior and helps assess risk levels |
| **Gender-wise Total Policies** | `GROUP BY gender` | Count of policies grouped by gender | Helps understand demographic patterns and policyholder diversity |
| **Car Use Distribution** | `GROUP BY car_use` | Policies and claims segmented by car use (Private vs Commercial) | Identifies which usage type drives higher claim exposure |
| **Claims by Car Make** | `GROUP BY car_make` | Total claim amount and policy count per vehicle brand | Detects high-risk or high-value car brands |
| **Coverage Zone Performance** | `GROUP BY coverage_zone` | Total policies, total claims, and average claim ratio by zone | Reveals location-based risk and guides pricing adjustments |
| **Age Group Analysis** | Age calculated using `DATEDIFF(YEAR, Birthdate, GETDATE())` | Groups customers into age bands and summarizes claims | Highlights age-based risk and claim behavior |
| **Education & Marital Status Impact** | `GROUP BY education, marital_status` | Cross-tab of policies and claims by education level and marital status | Evaluates socio-demographic influence on insurance performance |
| **Claim Frequency Bucket** | Case logic on `claim_freq` (e.g. 0, 1–2, 3+) | Categorizes customers based on how often they file claims | Helps identify high-risk and loyal customer segments |
| **Kids Driving Impact** | `CASE WHEN kids_driving = 1 THEN 'Kids Driving'` | Measures claims and policies where kids are allowed to drive | Assesses family-related risk exposure |
| **Claim Ratio (Avg Claim per Policy)** | `SUM(claim_amount) / COUNT(*)` | Total claim amount divided by number of policies | Measures efficiency and risk cost per customer |

---

Each KPI was represented visually in **Power BI** through:
- **Cards** (for totals and averages)
- **Bar & Column Charts** (for distribution comparisons)
- **Pie/Donut Charts** (for demographic splits)
- **Tables** (for multi-variable breakdowns)

Together, these KPIs provide management with a clear understanding of:
- **Who the customers are**
- **How claims are distributed**
- **Which factors drive financial exposure**
- **Where opportunities exist to optimize premiums or reduce risk**






