WITH top_paying_jobs AS (SELECT
	job_id,
	job_title,
	salary_year_avg
FROM
	job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
	job_title = 'Data Analyst'
	AND salary_year_avg IS NOT NULL
	AND job_location = 'Anywhere'
ORDER BY
	salary_year_avg DESC 
LIMIT 10
)

SELECT 
top_paying_jobs.job_id,
top_paying_jobs.job_title,
top_paying_jobs.salary_year_avg,
skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY top_paying_jobs.job_id, top_paying_jobs.job_title, top_paying_jobs.salary_year_avg, skills_dim.skills
ORDER BY top_paying_jobs.salary_year_avg DESC


-- Key Observations

-- Python + SQL combination is the golden standard - appears together in 6 positions. If you know both, you're competitive for these top-tier roles.
-- The $165K positions show interesting differences:

-- One focuses on cloud (Python, MySQL, AWS) - likely data engineering-heavy
-- The other is analytics-heavy (SQL, Python, R, SAS, MATLAB, Pandas, Tableau, Looker)


-- Polyglot advantage: The $145K positions require diverse skill sets (Golang, JavaScript, C++, Java) beyond typical analyst tools, suggesting these are more hybrid data engineer/analyst roles.
-- Excel still matters: Even at $135-140K salaries, Excel appears, showing it remains relevant for business stakeholder communication.
-- Modern stack vs traditional: There's a split between companies using modern tools (Pandas, Scikit-learn, Kubernetes) and those still using SAS/MATLAB, likely reflecting industry differences (finance/pharma vs tech).