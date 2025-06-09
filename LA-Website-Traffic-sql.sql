-- Cleaning and Formatting

CREATE TABLE `la_website`(
`date` DATE,
device_category VARCHAR(50),
browser VARCHAR(50),
num_of_vistors INT,
num_of_sessions INT,
bouce_rate DECIMAL(5,2)
);

LOAD DATA LOCAL INFILE "C:/data/lacity.org-website-traffic.csv"
INTO TABLE la_website_traffic.la_website
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Creating a staging table to prevent unrevertable edits
CREATE TABLE la_website_staging AS
SELECT * FROM la_website;

SELECT * FROM
la_website_staging;

-- Checking all types of browsers used to access website
SELECT DISTINCT(browser)
FROM la_website_staging;

-- Changing (not set) to NULL for more consistency
UPDATE la_website_staging
SET browser = NULL
WHERE browser = '(not set)';

-- Mozilla had duplicate columns with different characters
UPDATE la_website_staging
SET browser = 'Mozilla'
WHERE browser LIKE '%Mozilla%';

-- Checking for invalid devices
SELECT DISTINCT(device_category)
FROM la_website_staging;

-- Changing column names that we're mispelled
ALTER TABLE la_website_staging
RENAME COLUMN num_of_vistors TO num_of_visitors;

ALTER TABLE la_website_staging
RENAME COLUMN bouce_rate TO bounce_rate;

-- Checking for any outliers in the data
SELECT MIN(`date`),
	   MAX(`date`),
       MIN(num_of_visitors),
	   MAX(num_of_visitors),
       MIN(num_of_sessions),
	   MAX(num_of_sessions),
       MIN(bounce_rate),
	   MAX(bounce_rate)
FROM la_website_staging;





-- Exploratory 
SELECT *
FROM la_website_staging;

-- Total amount of sessions
SELECT ROUND(SUM(num_of_sessions) / 1000000,0)
FROM la_website_staging;

-- Total amount of sessions for each month of the year
SELECT DATE_FORMAT(`date`, '%M %Y') AS month_year, (SUM(num_of_sessions) AS total_sessions_per_month
FROM la_website_staging
GROUP BY month_year;	

-- Total unique visitor amount
SELECT ROUND(SUM(num_of_sessions - (num_of_sessions - num_of_visitors)) / 1000000, 0) as total_unique_visitors
FROM la_website_staging;

-- Unique visitors for each month of the year
SELECT DATE_FORMAT(`date`, '%M %Y') AS month_year, SUM(num_of_sessions - (num_of_sessions - num_of_visitors)) as total_unique_visitors
FROM la_website_staging
GROUP BY month_year;

-- Average bounce rate
SELECT ROUND(AVG(bounce_rate),0)
FROM la_website_staging;

-- Average bounce rate for each month of the year
SELECT DATE_FORMAT(`date`, '%M %Y') AS month_year, ROUND(AVG(bounce_rate),0)
FROM la_website_staging
GROUP BY month_year;

-- Counting the amount of times each browser was used
SELECT browser, SUM(num_of_sessions) AS sessions_count
FROM la_website_staging
GROUP BY browser
ORDER BY sessions_count DESC;

-- Finding the total sessions, total amount of unique users, and AVG bouce rate of each browser (/1K)
SELECT browser, 
	   ROUND(SUM(num_of_sessions) / 1000000,2) AS total_sessions, 
       ROUND(SUM(num_of_sessions - (num_of_sessions - num_of_visitors)) / 1000000,2) AS unique_visitors, 
       ROUND(AVG(bounce_rate),0) as avg_bounce_rate
FROM la_website_staging
GROUP BY browser;

-- Percentage of total sessions, average amount of sessions, and average bounce rate for each device type
WITH device_table AS 
(SELECT device_category AS device, 
	   COUNT(device_category) AS device_count, 
       ROUND(AVG(num_of_sessions),0) AS avg_count_of_sessions, 
       ROUND(AVG(bounce_rate),0) AS avg_bounce_rate
FROM la_website_staging
GROUP BY device_category)
SELECT device, 
	   ROUND((device_count / (SELECT COUNT(*) FROM la_website_staging	)) * 100,0), 
       avg_count_of_sessions, 
       avg_bounce_rate
FROM device_table;

-- Average number of sessions and bounce rate for each device based on the day of the week
SELECT DAYNAME(`date`) as day_of_week, 
	   device_category, 
       ROUND(AVG(num_of_sessions),0) AS avg_sessions,
       ROUND(AVG(bounce_rate),0) AS avg_bounce_rate
FROM la_website_staging
GROUP BY day_of_week, device_category;
