/*
 * Analysisng the Wolrd Bank's Interntional data on debt owed by developing countries
 */

-- Seeing the data in with a limit of 10

SELECT *
FROM international_debt
LIMIT 10;

-- Finding the distinct number of countries in the data

SELECT COUNT(DISTINCT country_name) AS total_distinct_countries
FROM international_debt;

-- Finding out the distinct debt indicators

SELECT DISTINCT indicator_code AS  distinct_debt_indicators
FROM international_debt
ORDER BY indicator_code;

-- Finding the total amount of debt owed by the countries

SELECT ROUND(SUM(debt)/1000000, 2) AS total_debt
FROM  international_debt;

--Finding the country with the highest debt

SELECT country_name, SUM(debt) as total_debt 
FROM international_debt
GROUP BY country_name 
ORDER BY total_debt DESC 
LIMIT 1

-- Average amount of debt across indicators

SELECT indicator_code AS  debt_indicator, indicator_name,
AVG(debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name 
LIMIT 10;

-- Highest amount  of principal repayments

SELECT country_name, indicator_name 
FROM international_debt
WHERE debt = 
(SELECT MAX(debt) 
FROM international_debt 
WHERE indicator_code='DT.AMT.DLXF.CD')

-- The most common debt indicator

SELECT 
    indicator_code,
    COUNT(indicator_code) AS indicator_count
FROM international_debt
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC
LIMIT 20;

-- Top 10 institutes with the highest debt

SELECT country_name, indicator_code,
MAX(debt) AS maximum_debt
FROM international_debt
GROUP BY country_name, indicator_code 
ORDER BY maximum_debt DESC 
LIMIT 10


