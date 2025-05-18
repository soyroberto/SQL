-- Create schema (works in Azure SQL Database)
CREATE SCHEMA Sales;
GO

-- Create Customers table
CREATE TABLE Sales.Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,  -- Using NVARCHAR for Unicode support
    Email NVARCHAR(100) UNIQUE
);
GO

-- Create Orders table with proper Azure SQL syntax
CREATE TABLE Sales.Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,  -- Explicit NOT NULL for foreign key
    OrderDate DATE DEFAULT CONVERT(DATE, GETDATE()),  -- Explicit date conversion
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) 
        REFERENCES Sales.Customers(CustomerID)
);
GO