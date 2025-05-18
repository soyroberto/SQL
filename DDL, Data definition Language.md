# Database development process
![[Pasted image 20250506162602.png]]


# Data Definition Language (DDL) Explained

Data Definition Language (DDL) is a subset of SQL (Structured Query Language) that deals with the structure and organization of database objects. Unlike DML (Data Manipulation Language) which works with data itself, DDL focuses on defining and modifying the database schema.

## Core DDL Commands

### 1. CREATE
Defines new database objects:
```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    HireDate DATE
);

CREATE INDEX idx_name ON Employees(Name);
```

### 2. ALTER
Modifies existing database objects:
```sql
ALTER TABLE Employees ADD Department VARCHAR(50);
ALTER TABLE Employees ALTER COLUMN Name VARCHAR(150);
```

### 3. DROP
Removes database objects:
```sql
DROP TABLE TemporaryData;
DROP INDEX idx_name ON Employees;
```

### 4. TRUNCATE
Removes all records from a table (while keeping the structure):
```sql
TRUNCATE TABLE LogEntries;
```

### 5. RENAME
Changes names of database objects (implementation varies by DBMS):
```sql
-- SQL Server/Azure SQL
EXEC sp_rename 'OldTableName', 'NewTableName';
-- MySQL
RENAME TABLE OldTableName TO NewTableName;
```

## Key Characteristics of DDL

1. **Schema Modification**: Affects the database structure rather than data content
2. **Auto-Commit**: Most DDL statements automatically commit transactions
3. **Privilege Requirements**: Typically requires higher-level permissions than DML
4. **Minimal Logging**: Unlike DML operations, DDL often has minimal transaction logging

## Common DDL Operations

| Object Type       | CREATE               | ALTER                | DROP                 |
|-------------------|----------------------|----------------------|----------------------|
| Tables           | `CREATE TABLE`       | `ALTER TABLE`        | `DROP TABLE`         |
| Indexes          | `CREATE INDEX`       | `ALTER INDEX`        | `DROP INDEX`         |
| Views            | `CREATE VIEW`        | `ALTER VIEW`         | `DROP VIEW`          |
| Stored Procedures| `CREATE PROCEDURE`   | `ALTER PROCEDURE`    | `DROP PROCEDURE`     |
| Functions        | `CREATE FUNCTION`    | `ALTER FUNCTION`     | `DROP FUNCTION`      |

## DDL in Different Database Systems

While the core concepts remain the same, syntax varies:
- **SQL Server**: Includes schema binding options
- **Oracle**: Has additional storage parameters
- **MySQL**: Supports engine-specific options (InnoDB, MyISAM)
- **PostgreSQL**: Includes tablespace definitions

## Importance of DDL

1. **Database Design**: Establishes the foundation for data storage
2. **Data Integrity**: Enforces rules through constraints (PK, FK, CHECK)
3. **Performance**: Proper indexing and partitioning improves query speed
4. **Security**: Controls access through schema permissions

Would you like me to elaborate on any specific DDL operation or provide examples for a particular database system?