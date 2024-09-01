

## Overview

This repository contains SQL scripts for two basic database management projects: a Library Management System and a Student Database Management System. These projects are designed to help you understand and practice SQL commands, database design, and basic data manipulation techniques.

## Contents

- **`library_management_system.sql`**: SQL script for the Library Management System.
- **`student_database_management.sql`**: SQL script for the Student Database Management System.

## Project Descriptions

### 1. **Library Management System**
The Library Management System allows you to manage a library's book inventory, member records, and book borrowing/return transactions. The project includes SQL commands to:

- Create tables for books, members, and transactions.
- Insert, update, delete, and retrieve data related to books, members, and transactions.
- Manage book availability and track borrow/return activities.

#### **Tables:**
- **`Books`**: Stores information about each book in the library.
- **`Members`**: Stores member details.
- **`Transactions`**: Records borrowing and returning transactions.

#### **Features:**
- Insert, update, and delete book and member records.
- Track book borrow and return transactions.
- Retrieve detailed information on library inventory and member activities.

### 2. **Student Database Management System**
The Student Database Management System helps you manage student records, including their personal details, courses, and grades. This project involves SQL commands to:

- Create tables for students, courses, and enrollments.
- Insert, update, delete, and retrieve data related to students, courses, and enrollments.
- Implement SQL joins to combine data from multiple tables for detailed records.

#### **Tables:**
- **`Students`**: Stores student details.
- **`Courses`**: Stores course information.
- **`Enrollments`**: Tracks which students are enrolled in which courses and their grades.

#### **Features:**
- Insert, update, and delete student and course records.
- Manage course enrollments and update grades.
- Retrieve comprehensive student records using SQL joins.

## How to Use

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/library-and-student-management-system.git
   cd library-and-student-management-system
   ```

2. **Set Up the Database**:
   - Use a MySQL client (like MySQL Workbench) to execute the SQL scripts provided in this repository.
   - Create a new database in your SQL environment.
   - Run the `library_management_system.sql` and `student_database_management.sql` scripts to set up the tables and insert sample data.

3. **Explore the Queries**:
   - Modify and run the SQL queries provided in the scripts to interact with the database.
   - Experiment with inserting, updating, deleting, and retrieving data to understand how each query works.

## Requirements

- **MySQL**: Version 5.7 or higher.
- **SQL Client**: MySQL Workbench, phpMyAdmin, or any other SQL client of your choice.


