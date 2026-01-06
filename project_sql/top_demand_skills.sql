select
    skills_job_dim.skill_id,
    skills_dim.skills,
    count(*) as no_of_jobs
from
    job_postings_fact
    inner join skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
    inner JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where
    job_title_short = 'Data Analyst'
group by
    skills_job_dim.skill_id,
    skills_dim.skills
order by
    no_of_jobs desc