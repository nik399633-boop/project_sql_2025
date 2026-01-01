/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analyst
*/

SELECT
    skills,
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
    skills
ORDER BY
    salary_avg DESC
LIMIT 25

/*
Here are the top 25 highly paid skills for a remote data analyst position:
1) What actually drives higher salaries
The top positions are dominated by Big Data and distributed systems: PySpark, Databricks, Airflow, Kubernetes. 
This shows the market values analysts who can handle scale and production environments, not just dashboards.

2) Analyst ≠ “SQL only”
The list includes many engineering and MLOps skills: GitLab, Jenkins, Linux, GCP. Higher pay goes to hybrid roles — analyst + engineer.

3) The foundation is still mandatory
Pandas, NumPy, Jupyter, PostgreSQL are not the highest-paid individually, but without them there is no entry into top-tier roles. 
These are baseline skills, not differentiators.

4) Less obvious senior-level signals
ElasticSearch, Scala, Go, MicroStrategy are niche skills that significantly increase value due to low supply and high demand.

Bottom line:
A highly paid remote Data Analyst is an analyst who thinks like an engineer and works with data at scale.



[
  {
    "skills": "pyspark",
    "salary_avg": "208172"
  },
  {
    "skills": "bitbucket",
    "salary_avg": "189155"
  },
  {
    "skills": "couchbase",
    "salary_avg": "160515"
  },
  {
    "skills": "watson",
    "salary_avg": "160515"
  },
  {
    "skills": "datarobot",
    "salary_avg": "155486"
  },
  {
    "skills": "gitlab",
    "salary_avg": "154500"
  },
  {
    "skills": "swift",
    "salary_avg": "153750"
  },
  {
    "skills": "jupyter",
    "salary_avg": "152777"
  },
  {
    "skills": "pandas",
    "salary_avg": "151821"
  },
  {
    "skills": "elasticsearch",
    "salary_avg": "145000"
  },
  {
    "skills": "golang",
    "salary_avg": "145000"
  },
  {
    "skills": "numpy",
    "salary_avg": "143513"
  },
  {
    "skills": "databricks",
    "salary_avg": "141907"
  },
  {
    "skills": "linux",
    "salary_avg": "136508"
  },
  {
    "skills": "kubernetes",
    "salary_avg": "132500"
  },
  {
    "skills": "atlassian",
    "salary_avg": "131162"
  },
  {
    "skills": "twilio",
    "salary_avg": "127000"
  },
  {
    "skills": "airflow",
    "salary_avg": "126103"
  },
  {
    "skills": "scikit-learn",
    "salary_avg": "125781"
  },
  {
    "skills": "jenkins",
    "salary_avg": "125436"
  },
  {
    "skills": "notion",
    "salary_avg": "125000"
  },
  {
    "skills": "scala",
    "salary_avg": "124903"
  },
  {
    "skills": "postgresql",
    "salary_avg": "123879"
  },
  {
    "skills": "gcp",
    "salary_avg": "122500"
  },
  {
    "skills": "microstrategy",
    "salary_avg": "121619"
  }
]
*/