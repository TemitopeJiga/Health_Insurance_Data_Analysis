This repository is an analysis of public health insurance data. The purpose is to identify trends and valuable insights to help the company make data-driven decisions, especially with pricing
### Table of Contents
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Data Cleaning/Preparation](#data-cleaningpreparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results/Findings](#resultsfindings)
- [Recommendations](#recommendations)
- [Limitations](#limitations)
- [References](#references)

### Project Overview
This project aims to analyze health insurance data using SQL to uncover insights and patterns. The analysis includes various tasks such as data cleaning, exploratory data analysis, and specific queries to answer business questions related to health insurance claims.

### Data Sources
The dataset used in this project is sourced from Kaggle. It includes information on health insurance claims, policyholders, and other relevant data. 

Data - [Download here](https://www.kaggle.com/datasets/arunjangir245/healthcare-insurance-expenses?resource=download)

### Tools
Excel

MySQL

### Data Cleaning/Preparation
The data cleaning process involved the following steps:

1. Handling missing values.
2. Removing duplicates.
3. Loading the dataset into the SQL database.

## Exploratory Data Analysis
Exploratory Data Analysis (EDA) was conducted to understand the dataset better and to identify any initial patterns or anomalies. This involved:

- Descriptive statistics
- Identifying correlations

## Data Analysis
Specific SQL queries were designed to answer key questions, such as:

- Total number of claims by insurance type
- Average claim amount by age group
- Distribution of claims over time

```sql
SELECT 
    ROUND(AVG(age), 0) AS avg_age, MIN(age) AS min_age, MAX(age) AS max_age,
    ROUND(AVG(bmi), 2) AS avg_bmi, MIN(bmi) AS min_bmi, MAX(bmi) AS max_bmi,
    ROUND(AVG(charges), 2) AS avg_charges, MIN(charges) AS min_charges, MAX(charges) AS max_charges
FROM insurance_data;
```
Explainer: This summary statistics is aimed at finding out the numeric values that defines the data set. The result reveals the relevant averages of the data set as evidenced by the syntax as well as the table headers. It is worth noting that the decimal places of the average bmi and charges are pegged at 2

```sql
SELECT sex, COUNT(*) AS count
FROM insurance_data
GROUP BY sex;
```
Explainer: This query presents the gender distribution in the data set

```sql
SELECT smoker, COUNT(*) AS count FROM insurance_data GROUP BY smoker;
```
Explainer: This query result shows the smoker status distribution from the data set with the priority grouping set for the smoker header

```sql
SELECT region, COUNT(*) AS count FROM insurance_data GROUP BY region;
```
Explainer: This code returns the count of insured persons by region

```sql
SELECT sex, COUNT(*) AS count, ROUND (SUM(charges),2) AS charges
FROM insurance_data
GROUP BY sex;
```
Explainer: This query results shows the total number of males and females and their associated charges in the data set. The decimal places is placed at 2

```sql
SELECT
    CASE 
        WHEN age BETWEEN 18 AND 29 THEN '18-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age >= 60 THEN '60+'
    END AS age_range,
    ROUND(AVG(bmi), 2) AS avg_bmi,
    ROUND(AVG(charges), 2) AS avg_charges
FROM 
    insurance_data
GROUP BY 
    age_range
ORDER BY 
    age_range DESC;
```
Explainer: This aggregation query summarizes the average bmis and average charges of the specified age group within the data set

### Results/Findings
The key findings from the analysis include:

- Patterns in claim amounts by age group.
- Differences in the number of claims by insurance type.
- Temporal trends in claims data.

### Recommendations
Based on the analysis, the following recommendations are made:

- Focus on high-claim age groups for targeted interventions.
- Optimize claim processes for the most common insurance types.
- Monitor seasonal trends to predict claim surges.

### Limitations
The limitations of this analysis include:

- Potential biases in the dataset.
- Limited scope to only the provided dataset.
- Assumptions made during data cleaning and analysis.

### References
Kaggle Health Insurance Dataset: [Link to Kaggle Dataset](https://www.kaggle.com/datasets/arunjangir245/healthcare-insurance-expenses?resource=download)

😄
