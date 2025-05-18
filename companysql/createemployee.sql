USE [dbsrvauesqlp];
GO

CREATE TABLE EMPLOYEE (
    Ssn CHAR(9) PRIMARY KEY,  -- Using SSN as primary key
    Name VARCHAR(100) NOT NULL,
    Sex CHAR(2) NOT NULL CHECK (Sex IN ('M', 'F', 'M', 'F', 'NB')),  -- 1-2 characters for gender
    Address VARCHAR(200),
    Salary DECIMAL(10,2) CHECK (Salary > 0),  -- Positive salary
    Birth_date DATE NOT NULL CHECK (Birth_date <= GETDATE()),  -- Cannot be future date
    Department VARCHAR(50) NOT NULL,
    SupervisorSsn CHAR(9),  -- Self-referencing relationship
    
    -- Foreign key to same table for supervisor
    CONSTRAINT FK_Employee_Supervisor FOREIGN KEY (SupervisorSsn) 
        REFERENCES EMPLOYEE(Ssn),
    
    -- Additional constraints
    CONSTRAINT CHK_Sex_Length CHECK (LEN(Sex) BETWEEN 1 AND 2),  -- 1 or 2 characters
    CONSTRAINT CHK_Adult CHECK (DATEDIFF(YEAR, Birth_date, GETDATE()) >= 16)  -- Minimum age 16
);