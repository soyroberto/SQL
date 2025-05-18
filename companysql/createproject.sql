USE [dbsrvauesqlp];
GO

CREATE TABLE PROJECT (
    Name VARCHAR(100) NOT NULL,
    Number SMALLINT NOT NULL,   
    Location VARCHAR(MAX) NOT NULL,
    Controlling_department VARCHAR(100) NOT NULL,   
    CONSTRAINT PK_PROJECT PRIMARY KEY (Name, Number),
    CONSTRAINT UQ_PROJECT_Name UNIQUE (Name),      -- Name as separate key attribute
    CONSTRAINT UQ_PROJECT_Number UNIQUE (Number),  -- Number as separate key attribute
    CONSTRAINT CHK_Location_Format CHECK (
        LEN(Location) > 0 AND 
        Location NOT LIKE '%,,%' AND  -- No empty elements
        Location NOT LIKE ',%' AND    -- Doesn't start with comma
        Location NOT LIKE '%,'        -- Doesn't end with comma
    )
);