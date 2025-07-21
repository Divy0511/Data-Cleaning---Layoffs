# Data-Cleaning-Layoffs
A SQL-based project for cleaning, standardizing, and analyzing global tech layoff data to uncover key trends and insights.

## 📊 Layoffs Data Cleaning & Exploratory SQL Analysis

This project involves end-to-end **data cleaning**, **standardization**, and **exploratory data analysis (EDA)** on a real-world tech layoffs dataset using **pure SQL**. The goal is to prepare the dataset for insights by removing inconsistencies and then analyze patterns such as total layoffs by company, industry, country, and over time.

### 🛠️ Features

* ✅ Removed **duplicate records** using `ROW_NUMBER()` and partitioning logic.
* 🧹 Standardized text fields (like `company`, `industry`, `country`) to ensure uniformity.
* 📆 Converted and reformatted inconsistent date entries to proper SQL `DATE` type.
* 🚫 Cleaned **null, blank, and empty** values with appropriate imputation or deletion.
* 🧾 Performed **descriptive analysis**:

  * Top companies by total layoffs.
  * Yearly and monthly layoff trends.
  * Industry-wise and country-wise layoff distribution.
  * Rolling totals for layoffs over time.
  * Top 5 companies with the most layoffs per year.

### 📁 Files Included

* `REMOVING DUPLICATES.sql`: Deduplicates the raw dataset and creates a staging table.
* `STANDERDIZATION.sql`: Cleans and standardizes company names, industries, and countries.
* `updating null and removing extra column.sql`: Fills missing `industry` values using company name matches and drops unnecessary columns.
* `eda of layofss.sql`: Performs exploratory SQL queries to derive meaningful insights from the cleaned dataset.

### 📌 Tools Used

* MySQL (or any SQL engine supporting window functions and CTEs)

