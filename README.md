# **TPCH Data Pipeline with dbt, Snowflake, and Apache Airflow**

## **📌 Project Overview**

This project implements a **data pipeline using dbt (Data Build Tool) with Snowflake and Apache Airflow** to process and analyze the TPCH sample dataset. The pipeline transforms raw TPCH data into structured analytical models to solve business problems like profitability analysis, cost optimization, and sales trends.

### **✨ Key Features**

- **Automated Data Transformation**: Using dbt models for data cleaning and aggregation.
- **Snowflake Integration**: Efficient storage and query execution on TPCH data.
- **Apache Airflow Orchestration**: Task scheduling and execution monitoring.
- **Business Insights**: Profitability analysis, cost trends, and sales performance.

--

## **📊 Business Problems Solved**

### **1️⃣ Profitability & Cost Analysis**

- **Objective**: Analyze revenue, cost, and profitability at the product and order level.
- **Tables Created**:
  - `fact_profitability.sql`: Stores order-level revenue, cost, and profit margins.
  - `dim_product_profitability.sql`: Aggregates profitability by product and month.

### **2️⃣ Customer retention**

- **Objective**: Track customer retention.
- **Tables Created**:
  - `dim_customers.sql`: Retention info about customers.
