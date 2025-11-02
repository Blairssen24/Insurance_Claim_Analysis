create table InsuranceClaimsDB;

USE InsuranceClaimsDB;

select * from insurance_policies;

 -- Check for missing IDs or duplicates
SELECT id, COUNT(*) AS cnt FROM insurance_policies GROUP BY id HAVING COUNT(*) > 1;

-- Check for negative claim amounts
SELECT COUNT(*) AS negative_claims FROM insurance_policies WHERE claim_amount < 0;

-- NULLs in key columns
SELECT
    SUM(CASE WHEN birthdate IS NULL THEN 1 ELSE 0 END) AS missing_birthdate,
    SUM(CASE WHEN car_year IS NULL THEN 1 ELSE 0 END) AS missing_car_year,
    SUM(CASE WHEN claim_amount IS NULL THEN 1 ELSE 0 END) AS missing_claim_amount
FROM insurance_policies;

--                          KPI's
-- Total Policy
SELECT COUNT(id) AS Total_Policies
FROM insurance_policies;

-- Total Claim Amount
SELECT CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount
FROM insurance_policies;

-- Average Claim Frequency per Policy
SELECT CAST(AVG(Claim_Freq * 1.0) AS DECIMAL(10,4)) AS Avg_Claim_Frequency
FROM insurance_policies;

-- Average Claim Amount(average claim value of all policies that actually filed claims, rounded to 2 decimal places)
SELECT CAST(AVG(claim_amount) AS DECIMAL(18,2)) AS Avg_Claim_Amount
FROM insurance_policies
WHERE claim_amount > 0;

-- Gender-wise Total Policies
SELECT gender, COUNT(id) AS TotalPolicies
FROM insurance_policies
GROUP BY gender;

--                      INSIGHTS / OVERVIEW QUERIES(INSURANCE CLAIM REPORT)

-- Policies and Claims grouped by Car Use and % of total

SELECT 
    Car_Use,  
    COUNT(id) AS TotalPolicies,
    CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount,
    CAST(COUNT(id) * 100.0 / SUM(COUNT(id)) OVER() AS DECIMAL(5,2)) AS Policy_Percentage,
    CAST(SUM(claim_amount) * 100.0 / SUM(SUM(claim_amount)) OVER() AS DECIMAL(5,2)) AS Claim_Percentage
FROM insurance_policies
GROUP BY Car_Use
ORDER BY TotalPolicies DESC;

-- Policies and Claims grouped by Car Make
SELECT car_make,
       COUNT(*) AS total_policies,
       SUM(claim_amount) AS total_claim_amount
FROM insurance_policies
GROUP BY car_make
ORDER BY total_claim_amount DESC;

-- By Coverage Zone
SELECT coverage_zone,
       COUNT(*) AS total_policies,
       CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS total_claim_amount
FROM insurance_policies
GROUP BY coverage_zone
ORDER BY total_claim_amount DESC;

-- Age Group Analysis (Policies + Claims)
--DATEDIFF(YEAR, Birthdate, GETDATE()) AS Age

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

-- CROSS TABS
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
    coverage_zone,
    COUNT(*) AS total_policies,
    ROUND(SUM(claim_amount), 2) AS total_claim_amount
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
    END,
    coverage_zone
ORDER BY Age_Group, total_claim_amount DESC;


-- By Car Year (“Group all insurance records by the year of the car. For each car year, count how many policies exist, and sum up the total claim amounts.”)
SELECT car_year,
       COUNT(*) AS total_policies,
       CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount
FROM insurance_policies
GROUP BY car_year
ORDER BY car_year;

-- By Kids Driving
SELECT
    CASE WHEN kids_driving = 1 THEN 'Kids Driving' ELSE 'No Kids Driving' END AS kids_driving_bucket,
    COUNT(*) AS total_policies,
    CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount
FROM insurance_policies
GROUP BY CASE WHEN kids_driving = 1 THEN 'Kids Driving' ELSE 'No Kids Driving' END;

-- By Education
SELECT education,
       COUNT(*) AS total_policies,
      CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS Total_Claim_Amount
FROM insurance_policies
GROUP BY education
ORDER BY total_policies DESC;

-- Policies and Claims by Education + Marital Status
SELECT 
    education,
    marital_status,
    COUNT(*) AS total_policies,
    CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS total_claim_amount,
    CAST(AVG(CAST(claim_freq AS FLOAT)) AS DECIMAL(10,2)) AS avg_claims_per_policy
FROM insurance_policies
GROUP BY education, marital_status
ORDER BY education, marital_status;

-- Claim Freq Bucket
SELECT CASE 
           WHEN claim_freq = 0 THEN 'No Claims'
           WHEN claim_freq BETWEEN 1 AND 2 THEN '1-2 Claims'
           ELSE '3+ Claims'
       END AS claim_bucket,
       COUNT(*) AS total_policies,
        CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS total_claim_amount
FROM insurance_policies
GROUP BY CASE 
             WHEN claim_freq = 0 THEN 'No Claims'
             WHEN claim_freq BETWEEN 1 AND 2 THEN '1-2 Claims'
             ELSE '3+ Claims'
         END
ORDER BY total_policies DESC;

-- CROSS TABS
SELECT gender,
       car_use,
       COUNT(*) AS total_policies,
        CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS total_claim_amount
FROM insurance_policies
GROUP BY gender, car_use
ORDER BY gender, total_claim_amount DESC;

--                          FINAL INSIGHTS
-- Claim Ratio = Total Claim Amount / Total Policies
SELECT 
    coverage_zone,
    COUNT(*) AS total_policies,
    CAST(SUM(claim_amount) AS DECIMAL(18,2)) AS total_claim_amount,
    CAST(SUM(claim_amount) * 1.0 / COUNT(*) AS DECIMAL(18,2)) AS avg_claim_per_policy
FROM insurance_policies
GROUP BY coverage_zone
ORDER BY avg_claim_per_policy DESC;







