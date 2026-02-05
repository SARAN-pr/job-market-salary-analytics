-- 1. Average salary by experience level
SELECT experience_level, AVG(salary_in_usd) AS avg_salary
FROM jobs
GROUP BY experience_level
ORDER BY avg_salary DESC;

-- 2. Average salary by primary skill
SELECT s.skill_name, AVG(j.salary_in_usd) AS avg_salary
FROM jobs j
JOIN skills s ON j.skill_id = s.skill_id
GROUP BY s.skill_name
ORDER BY avg_salary DESC;

-- 3. Salary comparison: remote vs non-remote
SELECT remote_ratio, AVG(salary_in_usd) AS avg_salary
FROM jobs
GROUP BY remote_ratio
ORDER BY remote_ratio;

-- 4. Top paying company locations
SELECT c.company_location, AVG(j.salary_in_usd) AS avg_salary
FROM jobs j
JOIN companies c ON j.company_id = c.company_id
GROUP BY c.company_location
ORDER BY avg_salary DESC;

-- 5. Most common job titles
SELECT job_title, COUNT(*) AS job_count
FROM jobs
GROUP BY job_title
ORDER BY job_count DESC
LIMIT 10;
