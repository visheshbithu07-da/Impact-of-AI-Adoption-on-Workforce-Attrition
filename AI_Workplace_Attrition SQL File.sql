select * from my_db.workforce limit 10;

-- data exploration --

-- number of rows
select count(*) as total_rows
from my_db.workforce;

-- check Nulls
SELECT
  COUNTIF(job_role IS NULL) AS null_job,
  COUNTIF(years_experience IS NULL) AS null_YoE,
  COUNTIF(education_level IS NULL) AS null_education,
  COUNTIF(country IS NULL) AS null_country,
  COUNTIF(industry IS NULL) AS null_industry,
  COUNTIF(company_size IS NULL) AS null_company_size,
  COUNTIF(remote_work_type IS NULL) AS null_remote_work,
  COUNTIF(team_size IS NULL) AS null_team_size,
  COUNTIF(salary_usd_k IS NULL) AS null_salary,
  COUNTIF(primary_ai_tool IS NULL) AS null_ai_tool,
  COUNTIF(ai_tools_used_per_day IS NULL) AS null_ai_tool_per_day,
  COUNTIF(hours_with_ai_assistance_daily IS NULL) AS null_ai_assistance,
  COUNTIF(ai_replaces_my_tasks_pct IS NULL) AS null_ai_replaces,
  COUNTIF(ai_adoption_stage IS NULL) AS null_ai_adoption,
  COUNTIF(weekly_ai_upskilling_hrs IS NULL) AS null_weekly_ai,
  COUNTIF(productivity_score IS NULL) AS null_productivity,
  COUNTIF(burnout_score IS NULL) AS null_burnout,
  COUNTIF(job_satisfaction_1_5 IS NULL) AS null_job_satisfaction,
  COUNTIF(fear_of_ai_replacement IS NULL) AS null_fear,
  COUNTIF(attrition_risk IS NULL) AS null_attrition
FROM my_db.workforce;


-- Calculate the following KPIs:
-- Average burnout score
-- % of employees with high attrition risk
--Average daily hours working with AI
--Average productivity score
-- Average % of tasks replaced by AI

select
  round(avg(burnout_score),1) as avg_burnout_score,
  round(countif(attrition_risk = 'High') * 100.0 / count(*), 1) as pct_high_attrition_risk,
  round(avg(hours_with_ai_assistance_daily),1) as avg_daily_ai_hours,
  round(avg(productivity_score),1) as avg_productivity_score,
  round(avg(ai_replaces_my_tasks_pct),1) as tasks_replaced
from my_db.workforce;


--1. Which roles are most impacted by AI in terms of task replacement?
--task replacement % by role

select job_role, round(avg(ai_replaces_my_tasks_pct),1) as task_replacement_percent
from my_db.workforce
group by job_role
order by  task_replacement_percent desc;



--2. How does attrition risk vary across different stages of AI adoption in organizations?
--Attrition Risk By AI Adoption Stage

select ai_adoption_stage, attrition_risk,
count(*) as emp_count,
round(count(*) * 100.0/ sum(count(*)) over(partition by ai_adoption_stage),2) as percent
from my_db.workforce
group by ai_adoption_stage, attrition_risk
order by ai_adoption_stage, attrition_risk;



--3. How widespread is the fear of job displacement due to AI among employees?
--Fear of AI replacement
select fear_of_ai_replacement, round(count(*) * 100.0/ sum(count(*)) over (), 2) as percent
from my_db.workforce
group by fear_of_ai_replacement;



--4. Which industries have the most burnt-out and dissatisfied employees at high risk of leaving due to AI?
--High Attrition Risk Cohort

select industry, round(avg(years_experience),2) as avg_YoE,
round(avg(burnout_score),2) as avg_burnout,
round(avg(job_satisfaction_1_5),2) as avg_job_satisfaction
from my_db.workforce
where fear_of_ai_replacement = 'High' and attrition_risk = 'High'
group by industry
order by avg_YoE desc;


