# Crime Data Cleaning Project

## Project Overview

This project demonstrates how I used SQL Server to clean, standardize, and validate a messy crime dataset.

The raw dataset contained inconsistent category names, misspellings, invalid numeric values, inconsistent capitalization, blank values, and mixed formatting.

## Tools Used

* SQL Server
* SQL Server Management Studio
* SQL

## Data Quality Issues

The dataset contained several problems:

* Inconsistent crime-type labels
* Misspelled district names
* Mixed gender formats
* Invalid age values
* Inconsistent severity levels
* Inconsistent case-status values
* Invalid or inconsistent phone-number formats
* Text-based null values
* Inconsistent capitalization
* Invalid numeric values

## Cleaning Process

I used SQL to:

* Standardize crime types
* Standardize district names
* Standardize suspect and victim gender values
* Convert invalid ages to null
* Standardize names and categorical fields
* Clean phone-number formatting
* Validate latitude and longitude values
* Standardize severity, case status, and resolution
* Convert numeric fields with `TRY_CAST`
* Create a permanent cleaned table using `SELECT INTO`

## SQL Techniques Used

* `CASE`
* `TRIM`
* `UPPER`
* `LOWER`
* `LEFT`
* `SUBSTRING`
* `TRY_CAST`
* `TRY_CONVERT`
* `NULLIF`
* `GROUP BY`
* `HAVING`
* `SELECT INTO`

## Validation

After creating the cleaned table, I validated:

* Raw and cleaned row counts
* Duplicate incident IDs
* Standardized category values
* Age ranges
* Arrest-count ranges
* Null values
* District and crime-type consistency

## Outcome

The raw dataset was transformed into a permanent analysis-ready table called `crime_clean`.

The cleaned table contains standardized categories, validated numeric fields, and consistent formatting that can now be used for analysis or dashboard development.
