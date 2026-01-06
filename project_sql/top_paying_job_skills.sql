with
    top_paying_jobs as (
        SELECT
            job_id,
            NAME AS COMPANY_NAME,
            salary_year_avg,
            salary_rate
        from
            job_postings_Fact
            INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
        WHERE
            job_work_from_home = TRUE
            AND job_title_short = 'Data Analyst'
            AND salary_year_avg IS NOT NULL
        ORDER BY
            salary_year_avg DESC
        limit
            10
    )
SELECT
    top_paying_jobs.job_id,
    company_name,
    salary_year_avg,
    salary_rate,
    skills_dim.skill_id,
    skills_dim.skills
from
    top_paying_jobs
    INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id