# Telecom Network Outage and Complaint Impact Analysis

## About Project
When networks go down, customers often complain — but is the relationship always that simple?  
This project uses a telecom KPI dataset to explore **whether downtime, availability, and call drops are linked to higher complaint volumes.**  

It’s a beginner‑friendly SQL analysis that compares regions, technologies, sites, months, and outage bands to uncover patterns.

## Goals
- Measure total downtime, complaints, and average availability.
- Compare outage and complaint impact across regions and technologies.
- Identify sites with the most downtime and complaints.
- Test whether longer outages lead to more complaints.
- Track monthly changes in downtime and complaint counts.

## Tools used
- **SQL (MySQL)**: basic queries with `SELECT`, `WHERE`, `GROUP BY`, `CASE`, etc.
- **Dataset**: educational telecom KPI dataset from [MReza07/Telecom-KPI-Analysis-PowerBI](https://github.com/MReza07/Telecom-KPI-Analysis-PowerBI).
- **Files included**:  
  - `data/telecom_kpi.csv` > cleaned dataset  
  - `Telecom Outage Complaint Impact.sql` > analysis queries  
  - `region_summary.csv` > quick result check  
  - `README.md` > documentation  

## Key findings
- Dataset: **600 site‑day records**, 37,399 downtime minutes, and 6,757 complaints.  
- Average network availability: **95.67%**.  
- **Sylhet** recorded the most complaints (1,748) and downtime (8,584 minutes).  
- **4G** had the most complaints (2,461), while **3G** had the most downtime (13,211 minutes).  
- Longer downtime did **not** automatically mean more complaints — high‑downtime records averaged fewer complaints than medium‑downtime ones.  

This shows why it’s important to let the data speak, even when results don’t match expectations.

## How to run
1. Open MySQL Workbench.  
2. Run the table setup script.  
3. Import `telecom_kpi.csv` into the database.  
4. Confirm 600 rows were loaded.  
5. Run the queries in `Telecom Outage Complaint Impact.sql` one by one.  

## Portfolio skills demonstrated
- Creating and loading SQL tables.  
- Summarizing operational KPIs.  
- Comparing regions, technologies, and sites.  
- Categorizing records with `CASE`.  
- Interpreting complaint impact without overstating causation.  

## Limitations
- Dataset is educational, not audited operator data.  
- Complaint topics and resolution times are not included.  
- Analysis shows associations, not proof of causation.  
