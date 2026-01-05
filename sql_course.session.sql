-- WITH RJOBS AS (SELECT JOb_POSTINGS_FACT.job_id, SKILLS_JOB_DIM.skill_id, JOB_POSTINGS_FACT.job_title_short
-- FROM skills_job_dim
-- JOIN job_postings_fact ON
-- JOB_POSTINGS_FACT.job_id = SKILLS_JOB_DIM.job_id 
-- AND job_work_from_home = TRUE)


-- SELECT * FROM RJOBS
-- GROUP bY skill_id
-- LIMIT 5

-- WITH RSKILLS AS (SELECT RJOBS.job_title_short, SKILLS_DIM.skills 
-- FROM RJOBS
-- JOIN skills_dim ON SKILLS_DIM.skill_id = RJOBS.skill_id)




-- -- JSR

-- wITH RJOBS AS  (SELECT JOB_POSTINGS_FACT.job_id, SKILLS_JOB_DIM.SKILL_ID, job_postings_fact.job_title_short 
-- FROM job_postings_fact
-- JOIN skills_job_dim ON SKILLS_JOB_DIM.job_id = JOB_POSTINGS_FACT.job_id
-- AND JOB_POSTINGS_FACT.job_work_from_home = TRUE )

-- SELECT SKILLS_DIM.skills, COUNT(*)
-- FROM RJOBS 
-- JOIN skills_dim ON SKILLS_DIM.skill_id = RJOBS.SKILL_ID AND RJOBS.job_title_short = 'Data Analyst'
-- GROUP BY SKILLS_DIM.SKILLS
-- ORDER BY COUNT(RJOBS.JOB_ID) DESC
-- LIMIT 5


-- new code


with remote_jobs as (select job_postings_Fact.job_id, skills_job_dim.skill_id
FROM job_postings_fact
Inner join skills_job_dim
on skills_job_dim.job_id = job_postings_fact.job_id and job_work_from_home = True and job_title_short = 'Data Analyst')

select skills_dim.skills, count(remote_jobs.job_id)
from remote_jobs
join skills_dim
on skills_dim.skill_id = remote_jobs.skill_id
group by skills_dim.skills
order by count(remote_jobs.job_id) DESC
limit 5
