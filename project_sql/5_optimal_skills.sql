/*
Answer: What are the Most optimal skills to Learn?
-Identify skills in high demand associated with high average salaries for Data Analyst 
- Concenrates on remote positions with specified salaries
- Why? Targets skills that offer job security and financial benefits
*/

WITH skills_demand AS 
    (SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON 
        job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON 
        skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY 
        skills_dim.skill_id), 
average_salaries AS 
    (SELECT
    skills_job_dim.skill_id,
    ROUND(AVG(salary_year_avg),0) AS salary_avg
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON 
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON 
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills_job_dim.skill_id)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    salary_avg
FROM 
    skills_demand
INNER JOIN average_salaries ON 
    skills_demand.skill_id = average_salaries.skill_id
WHERE
    demand_count > 10
ORDER BY
    salary_avg DESC,
    demand_count DESc
LIMIT 25