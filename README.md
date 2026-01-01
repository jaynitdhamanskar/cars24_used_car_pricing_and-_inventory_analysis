# CARS24 Used Car Pricing & Inventory Analysis

## Overview

This project presents an **end-to-end data analytics workflow** focused on understanding **used-car pricing drivers, inventory composition, and regional variation** for a marketplace similar to **CARS24**. The goal is to translate raw listing data into **clear, actionable business insights** using Python, SQL, and Power BI.

The project is designed to be **recruiter-friendly** and demonstrates practical skills across data cleaning, analysis, visualization, and stakeholder communication.

---

## Dataset

* **Type:** Used car listings (listing-level data)
* **Records:** Individual vehicle listings
* **Key Columns:**

  * Resale Price
  * Distance Driven
  * Vehicle Age
  * Fuel Type
  * Vehicle Type
  * Ownership Count
  * Registration Code (converted to State-level geography)

Derived fields were created to support analysis, such as:

* Vehicle age buckets
* Price per kilometer (usage-normalized metric)
* State name from registration codes

---

## Tools & Technologies

* **Python** (Pandas, NumPy, Matplotlib): Data loading, cleaning, EDA
* **SQL (MySQL)**: Business-driven queries and aggregations
* **Power BI**: Interactive dashboard and data storytelling
* **DAX**: Dynamic KPIs and calculated measures
* **Gamma**: Presentation (PPT) creation

---

## Project Workflow / Steps

### 1. Data Loading & Cleaning (Python)

* Loaded raw dataset into Python
* Handled missing values and invalid records
* Corrected data types for numerical and categorical fields
* Removed infinite values generated during feature engineering
* Created new analytical features (age buckets, price per km)

---

### 2. Exploratory Data Analysis (EDA)

* Analyzed price distribution and skewness
* Studied depreciation patterns across vehicle age
* Examined relationship between distance driven and resale price
* Compared pricing across fuel type, ownership, and vehicle category

EDA helped validate assumptions and guide SQL analysis.

---

### 3. SQL Analysis (MySQL)

* Created database and tables
* Loaded cleaned data into MySQL
* Wrote SQL queries from **basic to advanced**, answering business questions such as:

  * What is the typical resale price?
  * How does price vary by age, fuel, and ownership?
  * Which segments are high-volume vs high-value?
  * How does resale pricing vary across states?

SQL ensured accurate aggregation and business logic validation.

---

### 4. Power BI Dashboard

A **single-page Power BI dashboard** was built for decision-makers.

**Dashboard elements include:**

* KPI cards (Total Listings, Average Price, Median Price)
* Bar/column charts for pricing drivers
* Scatter plot (Price vs Distance Driven)
* Donut chart for inventory composition
* Heatmap (matrix) for segment interaction analysis
* India shape map for state-level pricing

Interactive slicers allow filtering by fuel type, vehicle type, ownership, and state.

---

### 5. Reporting & Presentation

* Created a **stakeholder-focused analysis report** summarizing insights and recommendations
* Built a **presentation deck using Gamma**, translating analytical findings into a clear business narrative

---

## Key Results & Insights

* Vehicle age and distance driven are the strongest drivers of resale price decline.
* Single-owner vehicles command a consistent price premium, acting as a trust signal.
* Diesel vehicles and SUVs tend to retain higher value than other segments.
* Older vehicles contribute higher inventory volume but lower overall value.
* Regional (state-level) price variation highlights demand differences across markets.
* Median price is more reliable than average in segments with high outliers.

---

## How to Run the Project

1. **Python Analysis**

   * Open the Jupyter Notebook
   * Install required libraries (pandas, numpy, matplotlib)
   * Run cells sequentially for data cleaning and EDA

2. **SQL Analysis (MySQL)**

   * Create a MySQL database
   * Load the cleaned dataset into a table
   * Execute provided SQL queries to reproduce analysis

3. **Power BI Dashboard**

   * Open the `.pbix` file in Power BI Desktop
   * Refresh data connection (MySQL)
   * Explore dashboard using slicers

4. **Presentation**

   * Review the Gamma-generated PPT for a business-ready summary

---
