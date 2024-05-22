# Retail Data Analysis (with ETL)

Data Extraction, Transformation, Load and Analysis with Kaggle API, Python and MySQL

## Overview

This project demonstrates a full data pipeline process, starting from data extraction using the Kaggle API, followed by data transformation (ETL) using Jupyter Notebook with Python, and finally loading the transformed data into a MySQL database for analysis.

## Table of Contents

- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Data Extraction](#data-extraction)
- [ETL Process](#etl-process)
- [Loading Data into MySQL](#loading-data-into-mysql)
- [Data Analysis](#data-analysis)

## Introduction

The objective of this project is to provide a comprehensive example of a data pipeline. The project involves:

1. Extracting data from Kaggle using the Kaggle API.
2. Performing data cleaning, transformation, and loading tasks using Python in a Jupyter Notebook.
3. Storing the transformed data into a MySQL database.
4. Conducting data analysis using SQL queries.

## Project Structure

```
├── data/
│   └── orders.csv( raw data )
├── notebooks/
│   └── ETL_Retail_Analysis.ipynb
├── sql_scripts/
│   ├── schema.sql
│   └── analysis.sql
└── README.md
```
- **notebooks/**: Jupyter Notebook for ETL tasks.
- **sql_scripts/**: sql schema file and SQL scripts for data analysis.
- **README.md**: Project documentation.

## Usage

### Data Extraction

1. Set up your Kaggle API credentials:
   - Follow instructions on [Kaggle API documentation](https://github.com/Kaggle/kaggle-api#api-credentials) to get your API key.
   - Place the `kaggle.json` file in the `~/.kaggle/` directory.

### ETL Process

Open the Jupyter Notebook and run the ETL process:
```bash
jupyter notebook notebooks/ETL_Retail_Analysis.ipynb
```

### Loading Data into MySQL

Run the script to load data into MySQL:
```bash
username = 'username'
password = 'password'
host = 'hostname'
database = 'database_name'

# Create the connection string
connection_string = f'mysql+mysqlconnector://{username}:{password}@{host}/{database}'
# Create an engine
engine = create_engine(connection_string)
# Export the DataFrame to MySQL
df.to_sql(name='retail_orders', con=engine, if_exists='append', index=False)
```
### Database Schema Design

Execute SQL queries in the `sql_scripts/schema.sql` file to create the schema so as to load the transformed data (required for consistent data-types in SQL).

### Data Analysis

Execute SQL queries in the `sql_scripts/analysis.sql` file to perform data analysis.
