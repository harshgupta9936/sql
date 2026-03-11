/*
QUESTION: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average sąlaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
offering strategic insights for career development in data analysis
*/

WITH skills_in_demand AS
(
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY    
        skills_dim.skill_id
), avg_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim. skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY
        skills_job_dim.skill_id
)

SELECT 
    skills_in_demand.skill_id,
    skills_in_demand.skills,
    demand_count,
    avg_salary
FROM skills_in_demand
INNER JOIN avg_salary ON skills_in_demand.skill_id = avg_salary.skill_id 
WHERE
    demand_count>10
-- ORDER BY
--     demand_count DESC,
--     avg_salary DESC
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25

/*
INSIGHTS: 

Here are **brief insights from the dataset of high-demand, high-paying Data Analyst skills**:

1. **Python and Tableau dominate demand**, with **236 and 230 job postings**, making them the most sought-after analyst skills.
2. **R (148 postings)** is also highly demanded, showing strong use in statistical and analytical roles.
3. **SQL-related tools remain essential**, with **SQL Server (35)** and database systems like **Oracle (37)** appearing frequently.
4. **Cloud platforms are highly valued**, especially **Snowflake (37), Azure (34), AWS (32), and BigQuery (13)**.
5. These cloud technologies indicate the shift toward **modern cloud-based data warehouses**.
6. **Business Intelligence tools** such as **Tableau, Looker, and Qlik** appear regularly, emphasizing the importance of **data visualization skills**.
7. **Looker (49 postings)** shows strong demand among BI tools for analytics dashboards.
8. **Big data technologies** like **Hadoop and Spark** suggest companies handle **large-scale data processing**.
9. Programming languages such as **Java, C++, Go, and JavaScript** appear, indicating analysts sometimes work with **engineering teams**.
10. Tools like **Jira and Confluence** highlight collaboration within **Agile development environments**.
11. **SAS appears twice in the dataset**, indicating a duplicate skill entry.
12. Most average salaries range between **$97k and $115k**, showing a relatively consistent salary band for these skills.
13. **Go has the highest average salary ($115k)** but relatively low demand, suggesting it is a **specialized skill**.
14. High demand skills like **Python, Tableau, and R** offer slightly lower salaries because **many companies require them**.
15. Overall, the trend shows that **modern data analysts need a mix of programming, cloud platforms, and BI tools** to maximize both demand and salary.
*/

/*
JSON:

[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]

*/