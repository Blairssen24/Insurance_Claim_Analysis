# 🚗 Insurance Claim Analysis

Comprehensive insurance claims analysis using SQL and Power BI to uncover policy trends, identify high-risk segments, and support data-driven decision-making.

---

## Table of Contents

## 📘 Table of Contents

1. [Project Overview](#-project-overview)  
2. [Business Problem Statement](#-business-problem-statement)  
3. [Tools & Technologies](#-tools--technologies)  
4. [Dataset Overview](#-dataset-overview)  
5. [Data Cleaning & Preparation](#-data-cleaning--preparation)  
6. [Exploratory Data Analysis (EDA)](#-exploratory-data-analysis-eda)  
   - [Total Policies](#total-policies)  
   - [Total Claim Amount](#total-claim-amount)  
   - [Average Claim Frequency per Policy](#average-claim-frequency-per-policy)  
   - [Average Claim Amount](#average-claim-amount)  
   - [Gender-wise Total Policies](#gender-wise-total-policies)  
   - [Policies & Claims by Car Use](#policies--claims-by-car-use)  
   - [Policies & Claims by Car Make](#policies--claims-by-car-make)  
   - [Coverage Zone Performance](#coverage-zone-performance)  
   - [Kids Driving Impact](#kids-driving-impact)  
   - [Policies & Claims by Education](#policies--claims-by-education)  
   - [Education + Marital Status Analysis](#education--marital-status-analysis)  
   - [Age Group Analysis](#age-group-analysis)  
7. [Key Insights](#-key-insights)  
8. [Recommendations](#-recommendations)  
9. [Power BI Dashboard Preview](#-power-bi-dashboard-preview)  
10. [Conclusion](#-conclusion)  
11. [Project Links](#-project-links)

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

4. **Average Claim Amount**
     ```sql
   SELECT CAST(AVG(claim_amount) AS DECIMAL(18,2)) AS Avg_Claim_Amount
    FROM insurance_policies
    WHERE claim_amount > 0;

    ```
   <img width="210" height="60" alt="Avg_claim_amount" src="https://github.com/user-attachments/assets/193bcd25-d4c5-4bf3-9011-8f414cd8f269" />

5. **Gender-wise**
    ```sql
      SELECT gender, COUNT(id) AS Total_Policies
    FROM insurance_policies
    GROUP BY gender;
    
    ```
    <img width="211" height="82" alt="gender_wise" src="https://github.com/user-attachments/assets/8c15e984-2e56-49db-97a8-eb54d83330a1" />
    <img width="86" height="147" alt="male" src="https://github.com/user-attachments/assets/d9b8b12d-a6eb-4510-ba20-8a413613744c" />
    <img width="87" height="146" alt="female" src="https://github.com/user-attachments/assets/b62ef016-3a73-4cc5-a86b-1a6c0a4e3739" />

    
6. **Policies & Claims by Car Use**
      ```sql
   SELECT 
    car_use,  
    COUNT(id) AS Total_Policies,
    CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount,
    CAST(COUNT(id) * 100.0 / SUM(COUNT(id)) OVER() AS DECIMAL(5,2)) AS Policy_Percentage,
    CAST(SUM(claim_amount) * 100.0 / SUM(SUM(claim_amount)) OVER() AS DECIMAL(5,2)) AS Claim_Percentage
    FROM insurance_policies
    GROUP BY car_use
    ORDER BY Total_Policies DESC;
       
    ```
    <img width="628" height="112" alt="car_use_%" src="https://github.com/user-attachments/assets/971671f9-ed39-4641-b3b4-a2838952d5e0" />
    <img width="996" height="642" alt="claim_by_car_use" src="https://github.com/user-attachments/assets/60104518-cee3-4291-b3d3-d0e344c7582d" />

      
7. **Policies & Claims by Car Make**
      ```sql
     SELECT car_make,
       COUNT(*) AS Total_Policies,
       SUM(claim_amount) AS Total_Claim_Amount
    FROM insurance_policies
    GROUP BY car_make
    ORDER BY total_claim_amount DESC;

    ```
    <img width="362" height="217" alt="claim_by_car_make" src="https://github.com/user-attachments/assets/77e40c09-b21f-44f3-b747-dd7d4a0c6e27" />
    
8. **Coverage Zone Performance**
      ```sql
     SELECT coverage_zone,
       COUNT(*) AS Total_Policies,
       CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount
    FROM insurance_policies
    GROUP BY coverage_zone
    ORDER BY total_claim_amount DESC;
      
    ```
      <img width="397" height="162" alt="coverage_zone" src="https://github.com/user-attachments/assets/7493e974-0c87-4de1-80cf-4fee7253e9ce" />
    <img width="1481" height="760" alt="claim_by_coverage_zone" src="https://github.com/user-attachments/assets/e26d43e0-c093-499a-a1c9-72f304533c96" />

9. **Kids Driving Impact**
      ```sql
      SELECT
    CASE WHEN kids_driving = 1 THEN 'Kids Driving' ELSE 'No Kids Driving' END AS kids_driving_bucket,
    COUNT(*) AS Total_Policies,
    CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount
    FROM insurance_policies
    GROUP BY CASE WHEN kids_driving = 1 THEN 'Kids Driving' ELSE 'No Kids Driving' END;
    
    ```
   
    <img width="1647" height="697" alt="claim_by_kids_driving" src="https://github.com/user-attachments/assets/2cebd096-1ed2-4a3f-8c99-d09c01fdff6e" />

10. **Policies & Claims by Education**
      ```sql
    SELECT education,
       COUNT(*) AS Total_Policies,
       CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount
    FROM insurance_policies
    GROUP BY education
    ORDER BY total_policies DESC;
    
    ```
    <img width="386" height="122" alt="education" src="https://github.com/user-attachments/assets/c9490af8-d226-45f2-995c-3292531d6237" />
    <img width="1091" height="707" alt="Policies_by_education" src="https://github.com/user-attachments/assets/3dce3301-b467-4bc0-bfa1-4fd534512ad1" />
    
11  **Education + Marital Status Analysis**

      ```sql
    SELECT 
    education,
    marital_status,
    COUNT(*) AS Total_Policies,
    CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount,
    CAST(AVG(CAST(claim_freq AS FLOAT)) AS DECIMAL(10,2)) AS Avg_Claims_Per_Policy
    FROM insurance_policies
    GROUP BY education, marital_status
    ORDER BY education, marital_status;
 
    ```
<img width="662" height="306" alt="claim_by_education_maritalstatus" src="https://github.com/user-attachments/assets/1d0f48e5-a9f1-4699-b4ad-4296cfc04495" />

12  **Age Group Analysis**

      ```sql
      SELECT 
        CASE 
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 15 AND 25 THEN '15-25'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 26 AND 35 THEN '26-35'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 46 AND 55 THEN '46-55'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 56 AND 65 THEN '56-65'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 66 AND 75 THEN '66-75'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) > 75 THEN '76+'
            ELSE 'Unknown'
        END AS Age_Group,
        COUNT(*) AS Total_Policies,
        CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount,
        CAST(AVG(CAST(claim_freq AS FLOAT)) AS DECIMAL(10,2)) AS Avg_Claims_Per_Policy
    FROM insurance_policies
    GROUP BY 
        CASE 
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 15 AND 25 THEN '15-25'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 26 AND 35 THEN '26-35'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 46 AND 55 THEN '46-55'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 56 AND 65 THEN '56-65'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 66 AND 75 THEN '66-75'
            WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) > 75 THEN '76+'
            ELSE 'Unknown'
        END
    ORDER BY Age_Group;
    
    ```
<img width="536" height="181" alt="Age_group" src="https://github.com/user-attachments/assets/c43a0b33-1e3f-4589-b6d6-36f73139dacf" />
<img width="1607" height="707" alt="claim_by_age_group" src="https://github.com/user-attachments/assets/1fd186bb-e891-4bd1-ae12-1859937f36c4" />

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

Together, these KPIs provide management with a clear understanding of:
- **Who the customers are**
- **How claims are distributed**
- **Which factors drive financial exposure**
- **Where opportunities exist to optimize premiums or reduce risk**

---

## 📊 Key Insights

* Claim Behavior: Private-use vehicles recorded the highest claim frequencies and claim amounts, indicating higher usage and potential risk exposure.

* Car Make Patterns: Certain car brands dominate both the number of policies and total claim values, suggesting a link between vehicle type and claim likelihood.

* Demographics: Policyholders aged 26–45 form the largest insured group and contribute to the majority of claims — this represents the most active driver segment.

* Coverage Zone: The Urban coverage zones have the highest claim amounts, while rural areas show fewer but higher-value claims on average.

* Education & Marital Status: Individuals with higher education tend to file fewer claims, while married individuals appear to have slightly lower claim frequencies.

* Claim Frequency: Policies with 1–2 claims dominate overall, while a smaller number of customers file 3+ claims, driving up average claim values.

---

## 💡 Recommendations

- Risk-Based Premiums: Adjust pricing models based on vehicle usage type, age group, and claim frequency, ensuring fairness and profitability.

- Customer Profiling: Target high-claim customer groups with preventive driving education programs and reward systems for claim-free years.

- Fraud Monitoring: Implement data-driven fraud detection by tracking repeated claim submissions or unusually high claim amounts.

- Geographic Focus: Optimize marketing and risk control strategies in urban areas, where claim rates are concentrated.

- Data Integration: Combine SQL insights with Power BI dashboards to enable real-time monitoring and strategic reporting for management decisions.

## 📈 Power BI Dashboard Preview

<img width="1292" height="748" alt="Final_dashboard" src="https://github.com/user-attachments/assets/358fe17f-d152-413d-bf13-016231421be9" />

---

## Conclusion

1. The Insurance Claim Analysis provided a comprehensive breakdown of policyholder behavior, claim frequency, and demographic impact.
Using SQL for data analysis and Power BI for visualization, the project delivers insights that help insurers:

2. Reduce risk exposure

3. Improve claim handling strategies

4. Optimize policy offerings through data-backed decision making

## Project Links

Interact with the dasboard 


