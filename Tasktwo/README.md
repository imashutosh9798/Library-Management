# Task 2: Data Insertion and Handling Nulls (MySQL)

## 📌 Objective
This task is aimed at practicing inserting, updating, and deleting data in a MySQL database, along with handling `NULL` values.

## 🛠 Tools Used
- **MySQL Workbench**
- **GitHub** (for submission)

## 📂 Deliverables
- `Task2_Data_Insertion_Handling_Nulls.sql` file with:
  - `CREATE TABLE` statements
  - `INSERT` statements (full, partial, with NULLs, default values)
  - `UPDATE` statements (single & multiple rows)
  - `DELETE` statements (with conditions)
  - NULL handling using `IS NULL` and `IFNULL`
  - Example of `ON DELETE CASCADE`
  - `INSERT INTO ... SELECT` example

## 📜 SQL Script Details

### 1. Create Database and Table
- Database: `MobileStore`
- Table: `Products`  
  Columns:
  - `ProductID` (Primary Key)
  - `ProductName` (NOT NULL)
  - `Brand`
  - `Price` (Default `0.00`)
  - `Stock` (Default `0`)
  - `ReleaseDate`
  - `WarrantyMonths`

### 2. Operations Performed
1. **INSERT**: Adding records (full & partial inserts, with NULLs, defaults, using `SELECT`)
2. **UPDATE**: Updating specific rows & multiple rows
3. **DELETE**: Removing rows using conditions
4. **NULL Handling**: Using `IS NULL` and replacing NULLs with default values using `IFNULL`
5. **ON DELETE CASCADE**: Demonstrated with an `Orders` table linked to `Products`

### 3. Example Queries
- **Insert with NULL values:**
```sql
INSERT INTO Products (ProductName, Brand, Price, Stock, ReleaseDate, WarrantyMonths)
VALUES ('iPhone 14', 'Apple', NULL, 30, '2023-09-20', NULL);
