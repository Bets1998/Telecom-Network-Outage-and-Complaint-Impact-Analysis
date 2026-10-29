USE telecom_analysis;

# 1. Preview the data
SELECT * FROM telecom_kpi LIMIT 10;

# 2. Overall network summary
SELECT COUNT(*) AS total_records,
       SUM(data_down_time_min) AS total_downtime_minutes,
       SUM(customer_complaints) AS total_complaints,
       ROUND(AVG(availability_percent), 2) AS average_availability
       FROM telecom_kpi;

# 3. Region-wise outage and complaint impact
SELECT region,
       SUM(data_down_time_min) AS total_downtime_minutes,
       SUM(customer_complaints) AS total_complaints,
       ROUND(AVG(availability_percent), 2) AS average_availability,
       SUM(call_drops) AS total_call_drops
FROM telecom_kpi
GROUP BY region
ORDER BY total_complaints DESC;

# 4. Technology-wise impact
SELECT technology,
       SUM(data_down_time_min) AS total_downtime_minutes,
       SUM(customer_complaints) AS total_complaints,
       ROUND(AVG(availability_percent), 2) AS average_availability
FROM telecom_kpi
GROUP BY technology
ORDER BY total_complaints DESC;

# 5. Sites with the most downtime
SELECT site_id,
	   region,
       SUM(data_down_time_min) AS total_downtime_minutes
FROM telecom_kpi
GROUP BY site_id, region
ORDER BY total_downtime_minutes DESC
LIMIT 10;

# 6. Sites with the most complaints
SELECT site_id, region,
       SUM(customer_complaints) AS total_complaints
FROM telecom_kpi
GROUP BY site_id, region
ORDER BY total_complaints DESC
LIMIT 10;

# 7. Compare complaints across outage-duration bands
SELECT CASE 
WHEN data_down_time_min <= 30 THEN 'Low (0-30 min)'
WHEN data_down_time_min <= 60 THEN 'Medium (31-60 min)'
ELSE 'High (61+ min)'
END AS outage_band,
	   COUNT(*) AS record_count,
	   ROUND(AVG(customer_complaints), 2) AS average_complaints,
	   ROUND(AVG(availability_percent), 2) AS average_availability
FROM telecom_kpi
GROUP BY outage_band
ORDER BY average_complaints DESC;

# 8. High-downtime records with high complaint volume
SELECT record_date, region, site_id,
       technology, data_down_time_min, customer_complaints
FROM telecom_kpi
WHERE data_down_time_min > 60 AND customer_complaints >= 15
ORDER BY customer_complaints DESC, data_down_time_min DESC;

# 9. Monthly downtime and complaint trend
SELECT `year_month`, SUM(data_down_time_min) AS total_downtime_minutes,
        SUM(customer_complaints) AS total_complaints,
        ROUND(AVG(availability_percent), 2) AS average_availability
FROM telecom_kpi
GROUP BY `year_month`
ORDER BY `year_month`;

# 10. Complaint level by availability band
SELECT CASE
WHEN availability_percent < 95 THEN 'Below 95%'
WHEN availability_percent < 98 THEN '95% to 97.99%'
ELSE '98% and above'
END AS availability_band, COUNT(*) AS record_count,
       SUM(customer_complaints) AS total_complaints,
       ROUND(AVG(customer_complaints), 2) AS average_complaints
FROM telecom_kpi
GROUP BY availability_band
ORDER BY average_complaints DESC;

# 11. Call drops and complaints by region
SELECT region,
       SUM(call_drops) AS total_call_drops,
       SUM(customer_complaints) AS total_complaints
FROM telecom_kpi
GROUP BY region
ORDER BY total_call_drops DESC;

# 12. Lowest-availability records for investigation
SELECT record_date, region, site_id, technology, availability_percent,
       data_down_time_min, customer_complaints
FROM telecom_kpi
ORDER BY availability_percent ASC
LIMIT 10;
