# Library Management System ( - SQL)

## 📌 Project Overview
This project implements a **Library Management System** using **Oracle SQL**. It includes database schema creation, sample data insertion, and essential queries for managing books, members, and transactions.

## 📂 Files Included
- **`library_management.sql`** – Contains the SQL script to create tables, insert data, and perform queries.

## 🏗️ Features
- **Book Management** – Stores book details like title, author, genre, and availability.
- **Member Management** – Stores member information including name, email, and contact details.
- **Transaction Management** – Handles book issuance and returns with due dates and statuses.
- **SQL Queries** – Fetch available books, issued books, and update return statuses.

## 🛠️ Setup Instructions
1. Install Oracle Database and SQL Developer.
2. Open SQL Developer and connect to your database.
3. Run the `library_management.sql` script to create tables and insert data.
4. Execute sample queries to test functionality.

## 📜 Sample Queries
- Retrieve all books:
  ```sql
  SELECT * FROM Books;
  ```
- Check books issued to a member:
  ```sql
  SELECT B.Title, T.IssueDate, T.DueDate FROM Transactions T
  JOIN Books B ON T.BookID = B.BookID
  WHERE T.MemberID = 1 AND T.Status = 'Issued';
  ```

## 🚀 Contributing
Feel free to fork this repository and enhance it by adding features like stored procedures, triggers, or an interactive frontend.

## 📧 Contact
For queries, reach out via GitHub Issues or email.

---
Enjoy coding! 🚀

