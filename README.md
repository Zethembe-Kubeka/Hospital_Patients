# 🏥 Hospital Patient Data Analysis

## 📊 Project Overview

This project analyses hospital patient data to uncover insights that can support better decision-making across hospital operations, finance, patient care, and resource management.

As a Healthcare Data Analyst, the goal was to transform raw and inconsistent patient data into a clean, reliable dataset that could be used to answer meaningful business and stakeholder questions.

The analysis focuses on key areas such as:

* 👥 Patient demographics
* 🏥 Hospital wards and patient demand
* 🩺 Diagnoses and healthcare trends
* 💰 Treatment costs
* 📅 Patient length of stay
* 📈 Patient outcomes
* 💳 Payment methods
* 🧹 Healthcare data quality

The project demonstrates an end-to-end data analytics workflow, from understanding and cleaning raw data to generating insights and recommendations that stakeholders can use to improve hospital performance.

---

# 🎯 Business Problem

Hospitals generate large volumes of patient data, but raw data alone does not provide meaningful insights for decision-making.

The key business problem addressed in this project is:

> **How can hospital patient data be used to improve operational efficiency, understand treatment costs, optimise resource allocation, and support better patient outcomes?**

The hospital needs to understand:

* Which wards experience the highest patient demand?
* Which diagnoses are associated with the highest treatment costs?
* How long are patients staying in the hospital?
* What are the most common patient outcomes?
* Are hospital resources being used efficiently?
* What data quality issues could affect decision-making?

By answering these questions, stakeholders can make more informed decisions regarding hospital operations, financial planning, and healthcare service delivery.

---

# 🔍 Stakeholder Questions

The analysis was designed to support different stakeholders across the hospital.

## 👔 CEO & Executive Management

* What is the overall performance of the hospital?
* What are the major drivers of treatment costs?
* Which areas require additional management attention?
* Where can operational efficiency be improved?

## 💰 Finance Department

* What is the total treatment cost?
* Which wards and diagnoses are the most expensive?
* What is the average treatment cost per patient?
* Which areas may require cost optimisation?

## 🏥 Operations Management

* Which wards have the highest patient volumes?
* Which wards may be experiencing operational pressure?
* What is the average patient length of stay?
* Where are potential bottlenecks affecting patient flow?

## 🩺 Clinical Leadership

* What are the most common patient outcomes?
* Which diagnoses may require further investigation?
* Are certain patient groups experiencing longer hospital stays?

## 👥 Human Resources

* How is patient workload distributed across doctors and wards?
* Which hospital areas may require additional staffing?

## 💻 IT & Data Governance

* Are there inconsistencies in the hospital data?
* How many missing values exist?
* What data-quality improvements should be implemented?

---

# 🧹 Data Cleaning Process

The raw dataset contained several data-quality challenges that needed to be addressed before analysis.

The cleaning process included:

### 1. Data Exploration

* Reviewed dataset structure
* Inspected column names
* Checked data types
* Identified missing values
* Investigated duplicate records

### 2. Data Standardisation

* Standardised gender values
* Cleaned province names
* Standardised ward names
* Standardised payment methods
* Standardised patient outcomes
* Removed unnecessary spaces and inconsistent capitalisation

### 3. Date Cleaning

* Converted admission and discharge dates into a consistent format
* Checked for invalid dates
* Identified records where discharge dates occurred before admission dates

### 4. Data Validation

* Checked patient age values
* Validated treatment costs
* Investigated missing and inconsistent records
* Removed exact duplicate records where necessary

### 5. Feature Engineering

Created additional fields to support deeper analysis:

* **Length of Stay**
* **Age Group**

---

# 🛠️ Tools Used

| Tool               | Purpose                                     |
| ------------------ | ------------------------------------------- |
| 🟧 Databricks      | Data processing and analysis                |
| 🧑‍💻 SQL          | Data cleaning, transformation, and querying  |
| 📊 Microsoft Excel | Pivot tables and exploratory analysis       |
| 📈 Excel Charts    | Data visualisation                          |
| 🎨 Canva           | Project presentation and visual design      |
| 🧠 Miro            | Business understanding and project planning |
| 🐙 GitHub          | Project documentation and version control   |

---

# 📊 Key Performance Indicators

The analysis focuses on several important healthcare KPIs:

* 👥 Total Patients
* 💰 Total Treatment Cost
* 💵 Average Treatment Cost
* 🛏️ Average Length of Stay
* 🏥 Patient Volume by Ward
* 🩺 Most Common Diagnoses
* 📈 Patient Outcomes
* 💳 Payment Method Distribution

These KPIs provide a high-level view of hospital performance and support evidence-based decision-making.

---

# 📈 Key Analysis Areas

## 💰 Financial Analysis

This analysis investigates:

* Total treatment costs
* Average treatment cost per patient
* Treatment costs by ward
* Treatment costs by diagnosis
* Costs by payment method

---

## 🏥 Operational Analysis

This analysis investigates:

* Patient volume by ward
* Average patient length of stay
* High-demand hospital areas
* Patient flow

---

## 👥 Patient Demographics

This analysis investigates:

* Patient age groups
* Gender distribution
* Patient distribution by province

---

## 🩺 Patient Outcome Analysis

The project analyses outcomes such as:

* Discharged
* Transferred
* Admitted
* Deceased

---

# 💡 Business Insights & Recommendations

Based on the analysis, the hospital should focus on the following areas:

## 1️⃣ Improve Data Quality

Inconsistent data can negatively affect reporting and decision-making.

### Recommendation:

Implement:

* Standardised data-entry fields
* Dropdown lists for categorical data
* Required fields for important patient information
* Standard date formats
* Regular data-quality audits
* A central data dictionary

---

## 2️⃣ Monitor High-Cost Areas

Wards and diagnoses with high treatment costs should be monitored closely.

### Recommendation:

Hospital management should regularly track:

* Total treatment cost
* Average treatment cost
* Patient volume
* Length of stay

This can help identify opportunities for cost optimisation while maintaining quality patient care.

---

## 3️⃣ Optimise Patient Flow

Long hospital stays can increase costs and place pressure on hospital resources.

### Recommendation:

Investigate:

* Wards with longer average patient stays
* Diagnoses associated with prolonged hospitalisation
* Potential discharge delays
* Possible operational bottlenecks

---

## 4️⃣ Improve Resource Allocation

Patient demand varies across hospital wards and services.

### Recommendation:

Use patient volume and workload data to support decisions around:

* Staffing
* Bed allocation
* Equipment
* Budget allocation

---

## 5️⃣ Investigate Patient Outcomes

Patient outcomes should be continuously monitored to identify potential areas for improvement.

### Recommendation:

Further investigate patterns by:

* Diagnosis
* Ward
* Patient age group
* Length of stay

---

# 🚀 Skills Demonstrated

This project demonstrates practical skills in:

* SQL
* Databricks
* Data Cleaning
* Data Transformation
* Data Quality Assessment
* Exploratory Data Analysis
* Healthcare Analytics
* Pivot Tables
* Data Visualisation
* Business Analysis
* KPI Development
* Stakeholder Communication
* Business Recommendations

---

# 📌 Conclusion

This project demonstrates how a Healthcare Data Analyst can transform raw patient information into meaningful insights that support better business and operational decisions.

The analysis highlights the importance of combining:

> **Data Quality + Healthcare Knowledge + Business Understanding + Data Analytics**

By using data to understand patient demand, treatment costs, hospital operations, and patient outcomes, healthcare organisations can improve decision-making, optimise resources, and identify opportunities to enhance service delivery.

---
