# Company project MySQL

This repository contains a MySQL database schema and sample data for managing company information, locations, departments, projects and employees. The script includes table creation, constraints, triggers, sample data insertion, view creation and user privilege granting and revoking.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)

## Features

- Comprehensive database schema for company-related data.
- Includes tables for `Companies`, `Locations`, `Departments`, `Projects` and `Employees`.
- Implements logging triggers for data manipulation statements.
- Demonstrates view creation and user privilege management.
- Sample data for testing and demonstration purposes.
- Demonstrates the use of Stored Procedures and Functions

## Installation

1.  Ensure you have MySQL installed and running.
2.  Clone this repository to your local machine:

    ```bash
    git clone https://github.com/panoschron97/Company_Project_MySQL.git
    cd Company_Project_MySQL
    ```

3.  Connect to your MySQL server as an administrator.

## Usage

1.  Execute the SQL script to create the database, tables and populate them with data:

    ```bash
    mysql -u your_mysql_username -p < Company_Project_MySQL.sql
    ```
   Or login to MySQL and use the source command

    ```sql
    mysql -u your_mysql_username -p
    source /path/to/Company_Project_MySQL.sql
    ```

2.  Verify the table creation and data insertion by querying the tables.
    
    ```sql
    USE Company_Project_MySQL;
    SELECT * FROM Companies;
    SELECT * FROM Locations;
    SELECT * FROM Departments;
    SELECT * FROM Projects;
    SELECT * FROM Employees;
    ```

## Dependencies

-   MySQL
