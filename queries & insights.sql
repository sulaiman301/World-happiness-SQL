USE world_happiness;

select * from countries;
select * from happiness_indicators;

-- SQL Queries for Insights
--  Assuming you have a table named happiness_indicators with the specified structure:



-- Insert sample data (replace with actual data)
INSERT INTO happiness_indicators (country, world_happiness, economy, family, freedom, health, corruption)
VALUES
    ('Country A', 7.5, 1.2, 1.5, 1.8, 1.3, 0.5),
    ('Country B', 6.8, 0.9, 1.3, 1.6, 1.2, 0.7),
    ('Country C', 5.9, 0.8, 1.1, 1.4, 1.0, 0.9),
    -- Add more rows as needed
    ('Country Z', 4.2, 0.6, 0.9, 1.1, 0.8, 1.2);

-- Execute queries for insights

-- 1. Calculate the average scores for each factor
SELECT
    AVG(economy) AS avg_economy,
    AVG(family) AS avg_family,
    AVG(freedom) AS avg_freedom,
    AVG(health) AS avg_health,
    AVG(corruption) AS avg_corruption
FROM happiness_indicators;

-- 2. Find the countries with the highest and lowest world happiness scores
SELECT
    name,
    (economy+family+freedom+health+corruption)/5 AS world_happiness
FROM happiness_indicators
JOIN countries ON countries.id = happiness_indicators.country_id
ORDER BY world_happiness DESC
LIMIT 1;   -- Highest

SELECT
    name,
    (economy+family+freedom+health+corruption)/5 AS world_happiness
FROM happiness_indicators
JOIN countries ON countries.id = happiness_indicators.country_id
ORDER BY world_happiness ASC
LIMIT 1;   -- Lowest

-- 3. Compare factors across countries using JOIN and GROUP BY
SELECT
    name,
    AVG(hi.economy) AS avg_economy,
    AVG(hi.family) AS avg_family,
    AVG(hi.freedom) AS avg_freedom,
    AVG(hi.health) AS avg_health,
    AVG(hi.corruption) AS avg_corruption
FROM happiness_indicators hi
JOIN countries ON countries.id= hi.country_id
GROUP BY hi.country_id;

-- 4. Use CASE to categorize countries based on happiness level
SELECT
    name,
   (economy+family+freedom+health+corruption)/5 AS world_happiness,
    CASE
        WHEN (economy+family+freedom+health+corruption)/5  >= 1 THEN 'Very Happy'
        WHEN (economy+family+freedom+health+corruption)/5  >= 0.5 THEN 'Happy'
        WHEN (economy+family+freedom+health+corruption)/5 >= 0.3 THEN 'Moderate'
	ELSE 'Unhappy'
    END AS happiness_category
FROM happiness_indicators
JOIN countries ON countries.id = happiness_indicators.country_id;

SELECT *
   FROM happiness_indicators hi
JOIN countries ON countries.id= hi.country_id;






