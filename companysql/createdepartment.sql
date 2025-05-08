USE [dbsrvauesqlp];
GO

-- Create DEPARTMENT table with comma-separated locations
CREATE TABLE DEPARTMENT (
    Name VARCHAR(100) NOT NULL,
    Number VARCHAR(20) NOT NULL,
    Manager VARCHAR(100) NOT NULL,
    Manager_start_date DATE NOT NULL,
    Locations VARCHAR(MAX) NOT NULL, -- Stores multiple locations separated by commas
    CONSTRAINT PK_DEPARTMENT PRIMARY KEY (Name, Number),
    CONSTRAINT UQ_DEPARTMENT_Name UNIQUE (Name),
    CONSTRAINT UQ_DEPARTMENT_Number UNIQUE (Number),
    CONSTRAINT CHK_Manager_start_date CHECK (Manager_start_date <= CAST(GETDATE() AS DATE)),
    CONSTRAINT CHK_Locations_Format CHECK (
        -- Ensures locations isn't empty and follows basic format
        LEN(Locations) > 0 AND 
        Locations NOT LIKE '%,,%' AND -- No empty elements
        Locations NOT LIKE ',%' AND   -- Doesn't start with comma
        Locations NOT LIKE '%,'       -- Doesn't end with comma
    )
);