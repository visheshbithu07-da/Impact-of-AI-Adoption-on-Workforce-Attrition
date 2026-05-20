# 🤖 Impact of AI on Workforce Attrition

> Analyzing how AI adoption intensity, tool dependency, and organizational AI maturity influence employee burnout, job security, satisfaction, and attrition risk across 1,500 employees (2026).

---

## 📌 Table of Contents

- [Business Problem](#-business-problem)
- [Objectives](#-objectives)
- [Tech Stack](#️-tech-stack)
- [Dataset Overview](#-dataset-overview)
- [Project Architecture](#-project-architecture)
- [SQL Analysis](#-sql-analysis)
- [Key Findings & Dashboard Insights](#-key-findings--dashboard-insights)
- [GenAI Insights Layer](#-genai-insights-layer)
- [How to Run](#-how-to-run)
- [Folder Structure](#-folder-structure)

---



## 🎯 Objectives

Evaluate the **hidden costs of AI adoption** by examining how AI usage intensity, tool dependency, and organizational AI maturity influence:

| Dimension | Key Question |
|---|---|
| 🔥 Employee Burnout | Does heavier AI usage correlate with higher burnout? |
| 🔒 Perceived Job Security | Which roles and industries fear AI replacement most? |
| 😔 Job Satisfaction | How does AI adoption stage affect satisfaction scores? |
| 📉 Attrition Risk | Where are the highest-risk cohorts concentrated? |

---

## 🛠️ Tech Stack

| Layer | Tool |
|---|---|
| **Data Warehouse** | Google BigQuery (SQL) |
| **Cloud Platform** | Google Cloud Platform (GCP) |
| **Visualization** | Power BI |
| **Analysis & Orchestration** | Python — Google Colab |
| **Generative AI** | Vertex AI — Gemini 2.5 Pro |
| **App Deployment** | Streamlit + ngrok (tunneling) |

---

## 📊 Dataset Overview

**File:** `ai_workforce_attrition.csv`
**Rows:** 1,500 employees | **Columns:** 21 features

| Column | Description |
|---|---|
| `employee_id` | Unique employee identifier |
| `job_role` | Role (12 roles: Data Analyst, ML Engineer, DevOps, etc.) |
| `years_experience` | Total years of professional experience |
| `education_level` | Highest education attained |
| `country` | Country of employment (India, USA, UK, Germany, etc.) |
| `industry` | Sector (Fintech, SaaS, Healthtech, Media, etc.) |
| `company_size` | Startup / Small / Mid / Large / Enterprise |
| `remote_work_type` | Fully Remote / Hybrid / On-site |
| `team_size` | Number of people in employee's team |
| `salary_usd_k` | Annual salary in USD (thousands) |
| `primary_ai_tool` | Main AI tool used (ChatGPT, Copilot, Claude, Gemini, etc.) |
| `ai_tools_used_per_day` | Number of distinct AI tools used daily |
| `hours_with_ai_assistance_daily` | Daily hours working alongside AI |
| `ai_replaces_my_tasks_pct` | % of the employee's tasks now handled by AI |
| `ai_adoption_stage` | Org-level AI maturity: Experimenting → Integrating → Optimizing → AI-First |
| `weekly_ai_upskilling_hrs` | Hours per week spent learning AI skills |
| `productivity_score` | Self-reported productivity (0–100) |
| `burnout_score` | Burnout level (0–100, higher = more burned out) |
| `job_satisfaction_1_5` | Job satisfaction on a 1–5 scale |
| `fear_of_ai_replacement` | Perceived job displacement risk: Low / Medium / High |
| `attrition_risk` | Likelihood of leaving: Low / Medium / High |

---

## 🏗️ Project Architecture

```
CSV Data (BigQuery)
        │
        ▼
  SQL Queries (BigQuery)
  ├── KPI Aggregations
  ├── Task Replacement by Role
  ├── Attrition Risk by AI Adoption Stage
  ├── Fear of AI Replacement Distribution
  └── High Attrition Risk Cohort by Industry
        │
        ▼
  Power BI Dashboard
  (Visual layer — exported as PDF)
        │
        ▼
  Python (Google Colab)
  ├── BigQuery Client (data pull)
  ├── DataFrame context building
  └── Vertex AI — Gemini 2.5 Pro
      (GenAI Insights via prompt engineering)
        │
        ▼
  Streamlit App (served via ngrok)
  ├── Embeds Power BI Dashboard (PDF iframe)
  └── Q&A Interface → GenAI Responses
```

---

## 📈 Key Findings & Dashboard Insights

### 🔢 Headline KPIs

| KPI | Value |
|---|---|
| Average Burnout Score | **50.06 / 100** |
| Average Productivity Score | **57.54 / 100** |
| Avg Daily AI Usage | **4.23 hours** |
| High Attrition Risk | **5.67%** of workforce |
| Tasks Replaced by AI | **41.25%** on average |

---

### 1️⃣ Task Replacement % by Role

Backend Engineers and Software Engineers face the highest proportion of AI-replaced tasks (~43%), while AI Ethics Officers and DevOps Engineers see slightly lower displacement (~42%). The narrow spread (42–44%) suggests **AI task replacement is pervasive across all technical roles**, not concentrated in any single function.

| Role | Task Replacement % |
|---|---|
| Backend Engineer | 43.53% |
| Software Engineer | 43.39% |
| Data Analyst | 42.58% |
| Cloud Architect | 42.58% |
| Data Scientist | 42.55% |
| DevOps Engineer | 42.03% |
| AI Ethics Officer | 42.02% |

---

### 2️⃣ Attrition Risk by AI Adoption Stage

The **Experimenting** stage carries the highest high-risk attrition at **51.40%** — pointing to peak uncertainty and anxiety before AI workflows are stabilized. As organizations mature toward Integrating and Optimizing, high-risk attrition decreases, suggesting that **structured AI integration reduces retention pressure**.

| Adoption Stage | High Risk % | Low Risk % | Medium Risk % |
|---|---|---|---|
| Experimenting | 51.40% | 43.02% | — |
| AI-First | 48.00% | 45.60% | — |
| Integrating | 47.15% | 47.76% | — |
| Optimizing | 47.00% | 47.00% | — |

---

### 3️⃣ Fear of AI Replacement

Nearly **65% of employees** report medium-to-high fear of AI displacement, with only 34.87% reporting low concern. This is a significant organizational risk indicator.

| Fear Level | % of Workforce |
|---|---|
| Medium | 41.27% |
| Low | 34.87% |
| High | 23.87% |

---

### 4️⃣ High Attrition Risk Cohort — By Industry

Among employees who both **fear AI replacement (High)** and **carry high attrition risk**, Consulting leads in average experience (14.4 years), meaning organizations stand to lose their most senior talent. Automotive employees show the lowest job satisfaction (2.47/5) and highest burnout (65), making it the most acutely stressed industry.

| Industry | Avg YoE | Avg Burnout | Job Satisfaction (1–5) |
|---|---|---|---|
| Consulting | 14.40 | 63.00 | 2.72 |
| Fintech | 12.40 | 56.00 | 2.88 |
| Media | 12.22 | 60.00 | 2.88 |
| E-commerce | 9.85 | 60.46 | 2.65 |
| Automotive | 9.14 | 65.00 | 2.47 |
| SaaS | 9.00 | 62.67 | 2.65 |
| **Total** | **9.71** | **59.97** | **2.72** |

---

## 🧠 GenAI Insights Layer

A **Streamlit application** wraps the dashboard and data context with a **Vertex AI (Gemini 2.5 Pro)** powered Q&A layer, allowing stakeholders to ask natural language questions about the workforce data.

### How it works

1. SQL queries pull five data contexts from BigQuery at startup (KPIs, high attrition cohort, adoption-risk breakdown, task replacement, fear distribution).
2. Each context is serialized to a string and injected into a structured prompt template.
3. The Gemini model returns 3–4 sentence analyst-style responses with business impact framing and actionable recommendations.
4. The Streamlit UI embeds the Power BI dashboard PDF alongside the Q&A input box.
5. ngrok exposes the local Streamlit server for live sharing during presentations.

### Sample prompt architecture
```
You are a senior data analyst.
Dataset Context: 1500 employees (2026) — AI adoption vs burnout, productivity, attrition.

Key KPIs: {kpi_context}
Industry Attrition Insights: {high_attrition_context}
Attrition Risk vs AI Adoption: {attrition_by_adoption_context}
Task Replacement by Role: {task_replacement_context}
Fear of AI Replacement: {fear_of_ai_context}

User Question: {user_question}

Instructions: Answer in 3–4 sentences. Explain business impact.
Provide actionable recommendations. Use only provided data.
```

---

## 📁 Folder Structure

```
ai-workforce-attrition/
│
├── data/
│   └── ai_workforce_attrition.csv       # Raw dataset (1,500 employees, 21 columns)
│
├── sql/
│   └── analysis_queries.sql             # All BigQuery SQL queries
│
├── dashboard/
│   └── AI_Workplace_Attrition.pdf       # Exported Power BI dashboard
│
├── app.py                               # Streamlit app with GenAI Q&A layer
├── requirements.txt                     # Python dependencies
└── README.md                            # This file
```

---

## 💡 Key Recommendations

Based on the analysis, organizations should prioritize:

**1. Slow down AI rollout in the Experimenting stage** — attrition risk peaks here (51.4%). Pair AI introduction with structured change management and psychological safety programs.

**2. Address Consulting and Automotive urgently** — senior talent (14+ YoE) in Consulting and burned-out employees in Automotive represent the highest combined flight risk. Targeted retention programs are needed.

**3. Tackle the fear gap** — 65% of employees report medium-to-high fear of AI displacement. Transparency campaigns, role evolution roadmaps, and upskilling investment can reduce this significantly.

**4. Monitor task replacement thresholds** — with 41.25% of tasks already replaced across all roles, organizations should establish guardrails to ensure AI augments rather than eliminates meaningful work.

---

*Dataset: 1,500 employees | Year: 2026 | Tools: BigQuery · Power BI · Python · Vertex AI · Streamlit*
