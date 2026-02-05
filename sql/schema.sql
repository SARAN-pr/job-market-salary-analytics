CREATE DATABASE IF NOT EXISTS job_market_db;
USE job_market_db;

CREATE TABLE IF NOT EXISTS companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_location VARCHAR(10),
    company_size VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(50) UNIQUE
);

CREATE TABLE IF NOT EXISTS jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(100),
    experience_level VARCHAR(5),
    employment_type VARCHAR(10),
    work_year INT,
    salary_in_usd INT,
    remote_ratio INT,
    company_id INT,
    skill_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);
