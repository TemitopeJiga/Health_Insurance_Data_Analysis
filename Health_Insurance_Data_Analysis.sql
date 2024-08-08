SELECT * FROM insurance_data;
SELECT 
    ROUND(AVG(age), 0) AS avg_age, MIN(age) AS min_age, MAX(age) AS max_age,
    ROUND(AVG(bmi), 2) AS avg_bmi, MIN(bmi) AS min_bmi, MAX(bmi) AS max_bmi,
    ROUND(AVG(charges), 2) AS avg_charges, MIN(charges) AS min_charges, MAX(charges) AS max_charges
FROM insurance_data;

SELECT sex, COUNT(*) AS count
FROM insurance_data
GROUP BY sex;

SELECT smoker, COUNT(*) AS count
FROM insurance_data
GROUP BY smoker;

SELECT region, COUNT(*) AS count
FROM insurance_data
GROUP BY region;

SELECT region, ROUND(AVG(charges), 2) AS avg_charges
FROM insurance_data
GROUP BY region;

SELECT 
    sex,
    COUNT(*) AS count,
    SUM(charges) AS total_charges,
    AVG(charges) AS average_charges,
    MIN(charges) AS min_charges,
    MAX(charges) AS max_charges
FROM 
    insurance_data
GROUP BY 
    sex;

SELECT sex, COUNT(*) AS count, ROUND (SUM(charges),2) AS charges
FROM insurance_data
GROUP BY sex;

SELECT smoker, COUNT(*) AS count, ROUND (SUM(charges),2) AS charges
FROM insurance_data
GROUP BY smoker;

SELECT region, ROUND(SUM(charges),2) AS charges, 
MAX(charges) AS max_charges, 
MIN(charges) AS min_charges 
FROM insurance_data
GROUP BY region
ORDER BY 
charges DESC;

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