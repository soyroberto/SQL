USE [dbsrvauesqlp];
GO

CREATE TABLE DEPENDENT (
    EmployeeSsn CHAR(9) NOT NULL,  -- References EMPLOYEE table
    Dependent_name VARCHAR(100) NOT NULL,
    Sex CHAR(2) NOT NULL CHECK (Sex IN ('M', 'F', 'NB')),  -- 1-2 character codes
    Birth_date DATE NOT NULL CHECK (Birth_date <= GETDATE()),  -- No future dates
    Relationship VARCHAR(50) NOT NULL CHECK (
        Relationship IN ('Spouse', 'Child', 'Parent', 'Domestic Partner', 'Other')
    ),
    
    -- Composite primary key
    CONSTRAINT PK_DEPENDENT PRIMARY KEY (EmployeeSsn, Dependent_name),
    
    -- Foreign key to EMPLOYEE
    CONSTRAINT FK_DEPENDENT_EMPLOYEE FOREIGN KEY (EmployeeSsn) 
        REFERENCES EMPLOYEE(Ssn) ON DELETE CASCADE
);