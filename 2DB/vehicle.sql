CREATE TABLE VEHICLE (
    VIN INT PRIMARY KEY,
    Type VARCHAR(10) NOT NULL CHECK (Type IN ('Car', 'Truck')), -- Enforces disjointness
    NumDoors INT NULL,        -- Car-specific
    CargoCapacity INT NULL,   -- Truck-specific
    CHECK (
        (Type = 'Car' AND NumDoors IS NOT NULL AND CargoCapacity IS NULL) OR
        (Type = 'Truck' AND CargoCapacity IS NOT NULL AND NumDoors IS NULL)
    )
);