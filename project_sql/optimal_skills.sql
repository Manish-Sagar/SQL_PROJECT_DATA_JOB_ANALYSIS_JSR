-- jsr
-- optimal skills - most demanding and high paying
select
    round(avg(job_postings_fact.salary_year_avg), 0) as avg_salary,
    count(job_postings_fact.job_id) as demand,
    -- skills_dim.skill_id,
    skills_dim.skills
from
    job_postings_fact
    join skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
    join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where
    salary_year_avg is not NULL
    and job_title_short = 'Data Analyst'
    and job_work_from_home = TRUE
group by
    skills_dim.skills,
    skills_dim.skill_id
having
    count(job_postings_fact.job_id) > 10
order by
    avg_salary desc,
    demand desc
limit
    25