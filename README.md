# Data-Cleaning-Project-Sql

* Project Overview
This project focuses on data cleaning using SQL. Real-world data is often messy, inconsistent, or incomplete — which makes data cleaning one of the most essential steps in any data analytics or data science workflow.

In this project, I used SQL queries to clean a raw dataset by identifying and fixing common data quality issues such as:

Duplicates

Null or missing values

Inconsistent formatting

Outliers

Irrelevant data

The goal was to transform the raw data into a clean, analysis-ready dataset using only SQL operations.

📁 Dataset Description
The dataset used in this project comes from :

[Kaggle]  

[Data - Layoffs]  

You can find the original dataset in the /data folder .

🛠️ Tools & Technologies
 MySQL Workbench

🧽 Key Data Cleaning Steps
Here are the main steps I performed using SQL:

Removed Duplicate Records

Used ROW_NUMBER() or DISTINCT to find and delete exact or near-duplicate rows.

Handled Null or Missing Values

Used IS NULL, COALESCE(), and default replacement strategies.

Standardized Text Formats

Cleaned inconsistencies in casing, extra spaces, and typos using LOWER(), TRIM(), REPLACE(), etc.

Corrected Data Types

Converted columns to proper types using CAST() or CONVERT() for accuracy.

Filtered Outliers

Identified outliers using MIN(), MAX(), or conditional logic (WHERE clause).

Removed Irrelevant Columns or Rows

Dropped unnecessary fields and filtered out data not relevant to analysis.

📊 Before vs After Cleaning
Step	Before	After
Null Values	123 nulls in email column	0 nulls after replacement
Duplicates	50 duplicate entries	All removed
Date Format	Mixed date formats	Unified YYYY-MM-DD format
Text Standard	"NY", "ny", "New York" mixed	Standardized to "New York"

📂 Folder Structure
bash
Copy
Edit
📁 Data-Cleaning-Project-SQL
│
├── 📁 data/               # Raw and cleaned datasets
│   └── raw_data.csv
│   └── cleaned_data.csv
│
├── 📁 sql_scripts/        # SQL queries used
│   └── cleaning_queries.sql
│
├── README.md             # Project overview and documentation
✅ How to Run
Clone this repository:
 

* Outcome
By the end of this project:

The dataset is clean and consistent

It's ready for further data analysis, visualization, or machine learning

All cleaning operations were done efficiently using SQL

📌 Learnings
Writing optimized SQL queries for cleaning tasks

Real-world challenges of dealing with messy datasets

Understanding SQL functions like TRIM(), REPLACE(), CASE, ISNULL(), ROW_NUMBER(), etc.

📬 Contact
If you have any questions or suggestions, feel free to reach out:

Name: [Ariz Iqbal ]
LinkedIn: [Ariz Iqbal ]
GitHub: [[(https://github.com/Aiiqbal1881)]
