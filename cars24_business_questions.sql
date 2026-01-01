SELECT * FROM cars24;

SELECT DISTINCT state_name FROM cars24;

-- Creating table for state code

ALTER TABLE cars24
ADD COLUMN state_code VARCHAR(2);


-- Populating state code using location column

UPDATE cars24
SET state_code = LEFT(location, 2)
WHERE location IS NOT NULL;

-- Creating state_name column

ALTER TABLE cars24
ADD COLUMN state_name VARCHAR(50);

-- Populating state_name

UPDATE cars24
SET state_name =
    CASE LEFT(location, 2)
        WHEN 'MH' THEN 'Maharashtra'
        WHEN 'DL' THEN 'Delhi'
        WHEN 'KA' THEN 'Karnataka'
        WHEN 'TN' THEN 'Tamil Nadu'
        WHEN 'GJ' THEN 'Gujarat'
        WHEN 'RJ' THEN 'Rajasthan'
        WHEN 'UP' THEN 'Uttar Pradesh'
        WHEN 'MP' THEN 'Madhya Pradesh'
        WHEN 'HR' THEN 'Haryana'
        WHEN 'PB' THEN 'Punjab'
        WHEN 'WB' THEN 'West Bengal'
        WHEN 'AP' THEN 'Andhra Pradesh'
        WHEN 'TS' THEN 'Telangana'
        WHEN 'KL' THEN 'Kerala'
        WHEN 'OD' THEN 'Odisha'
        WHEN 'BR' THEN 'Bihar'
        WHEN 'CH' THEN 'Chandigarh'
        ELSE 'Other / Unknown'
    END;



-- Q1. What is the overall size of the used-car inventory and the typical resale price?

SELECT 
    COUNT(*) AS total_listings,
    ROUND(AVG(price)) AS avg_price
FROM cars24;

-- Q2. How are used-car prices distributed across the platform?

SELECT
    CASE
        WHEN price < 300000 THEN 'Below 3L'
        WHEN price < 600000 THEN '3L–6L'
        WHEN price < 1000000 THEN '6L–10L'
        ELSE 'Above 10L'
    END AS price_band,
    COUNT(*) AS listings
FROM cars24
GROUP BY price_band
ORDER BY listings DESC;

-- Q3. Which fuel types dominate inventory, and how do prices vary?

SELECT
    fuel,
    COUNT(*) AS listings,
    ROUND(AVG(price)) AS avg_price
FROM cars24
GROUP BY fuel
ORDER BY listings DESC;

-- Q4. How does vehicle age influence resale price?

SELECT
    age_bucket,
    COUNT(*) AS listings,
    ROUND(AVG(price)) AS avg_price
FROM cars24
GROUP BY age_bucket
ORDER BY avg_price DESC;

-- Q5. How does distance driven affect resale pricing?

SELECT 
	CASE
		WHEN distance <= 30000 THEN 'Low Usage'
        WHEN distance <= 70000 THEN 'Medium Usage'
        WHEN distance <= 120000 THEN 'High Usage'
        ELSE 'Very High Usage'
	END AS usage_bracket, 
    COUNT(*) AS total_listing, ROUND(AVG(Price)) AS avg_price
FROM cars24
GROUP BY usage_bracket
ORDER BY avg_price DESC;

-- Q6. How does ownership history affect resale value?

SELECT
    owner,
    COUNT(*) AS listings,
    ROUND(AVG(price)) AS avg_price
FROM cars24
GROUP BY owner
ORDER BY avg_price DESC;

SELECT * FROM cars24 WHERE owner = '4';

-- Q7. Which vehicle types command higher prices by fuel type?

SELECT
    type,
    fuel,
    COUNT(*) AS listings,
    ROUND(AVG(price)) AS avg_price
FROM cars24
GROUP BY type, fuel
ORDER BY avg_price DESC;

-- Q8. Which brands combine high listing volume with strong resale prices?

SELECT
    SUBSTRING_INDEX(`Car Name`, ' ', 1) AS brand,
    COUNT(*) AS listings,
    ROUND(AVG(price)) AS avg_price
FROM cars24
GROUP BY brand
HAVING COUNT(*) > 100
ORDER BY avg_price DESC;


-- Q9. How does resale pricing vary across major cities?

SELECT
    location,
    COUNT(*) AS listings,
    ROUND(AVG(price)) AS avg_price
FROM cars24
WHERE location <> 'Unknown'
GROUP BY location
HAVING COUNT(*) > 50
ORDER BY avg_price DESC;


-- Q10. Which segments combine high resale value with strong demand?

SELECT
    type,
    fuel,
    COUNT(*) AS listings,
    ROUND(AVG(price)) AS avg_price
FROM cars24
GROUP BY type, fuel
HAVING COUNT(*) > 100
ORDER BY avg_price DESC;