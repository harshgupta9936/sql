/*
QUESTION: What are the top skills based on salary?
Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim. skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
-- AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25



/*
1. The dataset shows the **top 25 highest-paying skills for Data Analysts** based on average salary.
2. **SVN** appears as a major outlier with an extremely high average salary of **$400,000**.
3. Many high-paying skills belong to the **machine learning ecosystem**.
4. Tools like **TensorFlow, PyTorch, Keras, MXNet, and Hugging Face** indicate demand for AI-related analytics roles.
5. This suggests that analysts with **machine learning knowledge earn higher salaries**.
6. **DataRobot** also shows that **automated machine learning platforms** are valuable in high-paying roles.
7. Several **data engineering tools** appear in the list.
8. Technologies such as **Kafka, Airflow, Cassandra, and Couchbase** indicate demand for large-scale data processing skills.
9. **Cloud and DevOps tools** like **Terraform, VMware, Ansible, and Puppet** also appear frequently.
10. This shows that companies value analysts who understand **data infrastructure and deployment environments**.
11. Programming languages like **Golang, Scala, and Perl** are associated with higher salaries.
12. Collaboration and development tools such as **GitLab, Bitbucket, and Atlassian** also appear among top skills.
13. These tools indicate analysts often work closely with **engineering and product teams**.
14. Overall, the highest-paying roles combine **analytics, engineering, and AI skills**.
15. The trend shows that modern data analysts are evolving into **hybrid roles involving machine learning and data engineering**.
*/



/*

JSON DATA

[
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_salary": "115480"
  }
]
*/