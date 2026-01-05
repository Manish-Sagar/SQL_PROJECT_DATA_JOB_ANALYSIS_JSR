SELECT 
    COUNT(job_id),
    EXTRACT(MONTH FROM JOB_POSTED_DATE) AS month
FROM   
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY month
-- LIMIT 5;

