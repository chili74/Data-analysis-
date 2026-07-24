# ROBUST CYCLING - SQL data analysis project

A full SQL Server project exploratory data analysis, advanced analysis and reporing.

## Overview 
This project explores, cleans and analysis the data of a cycling store named Robust Cycling  demonstrating a practical, structured approach to Exploratory and Advanced Data Analysis using SQL Server and SSMS. Its goal is to turn raw relational data into business-ready insights by answering core analytical questions with SQL queries.

## Objectives
-Inspect database structure and metadata.
-Identify categorical dimensions and numerical measures.
-Determine dataset time coverage.
-Calculate core business metrics and KPIs.
-Reveal trends, patterns, and outliers.
-Rank entities by business performance.
-Provide a foundation for dashboards and advanced analysis.

## Technologies

-SQL Server, SQL
-SQL Server Management Studio (SSMS)

Project Structure
SQL/

-Database Exploration.sql
-Dimension Exploration.sql
-Date Exploration.sql
-Measures Exploration.sql
-Magnitude Analysis.sql
-Ranking Analysis.sql
-README.md

Analysis Framework (6 Steps)

1.Database Exploration
Goal: Map tables, columns, and data types.
Key SQL: INFORMATION_SCHEMA.TABLES, INFORMATION_SCHEMA.COLUMNS
Value: Locate correct sources for reporting and reduce errors.

2.Dimension Exploration
Goal: Explore categorical data (dimensions).
Key SQL: DISTINCT, ORDER BY
Examples: Country, Product Category, Customer Segment
Value: Identify reporting categories and business scope.

3.Date Exploration
Goal: Establish dataset time span.
Key SQL: MIN(), MAX(), DATEDIFF()
Value: Ensure correct trend analysis, seasonality, and forecasting.

4.Measures Exploration
Goal: Summarize numerical business metrics.
Key SQL: SUM(), AVG(), COUNT(), COUNT(DISTINCT)
Typical metrics: Total Sales, Avg. Sales, Order Count, Customer Count
Value: Provide executive-level KPIs.

5.Magnitude Analysis
Goal: Compare performance across dimensions.
Key SQL: GROUP BY, SUM(), COUNT(), ORDER BY
Examples: Revenue by Country, Orders by Department
Value: Spot top segments and underperformers for resource allocation.

6.Ranking Analysis
Goal: Identify top and bottom performers.
Key SQL: TOP, ORDER BY, ROW_NUMBER(), RANK(), DENSE_RANK()
Examples: Top products, top customers, least-revenue products
Value: Prioritize investments and improvement efforts.


Key Business Insights

-Understand database structure and available reporting dimensions.
-Measure overall business health with KPIs.
-Determine historical coverage for trend analysis.
-Compare performance across products, regions, and customers.
-Identify top and underperforming entities to guide strategy.
-Build a reliable base for dashboards and predictive work.
