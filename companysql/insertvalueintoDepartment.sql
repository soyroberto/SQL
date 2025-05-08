USE [dbsrvauesqlp];
GO

-- Insert departments with multiple locations
INSERT INTO DEPARTMENT (Name, Number, Manager, Manager_start_date, Locations)
VALUES 
    ('Research', 'D04', 'Matilda Bolt', '2020-01-15','Building A, Floor 3,Building C, Floor 1'),
      ('Administration', 'D05', 'Rufino López', '2024-01-15','Building C, Floor 4,Building A, Floor 2'); 