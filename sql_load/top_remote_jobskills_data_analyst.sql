WITH REMOTE_JOBS AS ( SELECT
    job_id
FROM
    job_postings_fact
WHERE job_work_from_home= True and job_title_short = 'Data Analyst'),
top_skills_for_remote_jobs as (
SELECT COUNT(skills_job_dim.job_id) as skills_Demand, skill_id FROM SKILLS_JOB_DIM
JOIN REMOTE_JOBS ON REMOTE_JOBS.JOB_ID = SKILLS_JOB_DIM.JOB_ID
GROUP BY skill_id
order by skills_Demand DESC
limit 5) 
SELECT skills_dim.skill_id, skills_dim.skills as name, top_skills_for_remote_jobs.skills_Demand
from skills_dim
join top_skills_for_remote_jobs ON
skills_dim.skill_id = top_skills_for_remote_jobs.skill_id