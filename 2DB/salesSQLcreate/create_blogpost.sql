CREATE TABLE BlogPost (
    PostID INT PRIMARY KEY,
    UserID INT NULL,  -- Allows orphaned posts (if business rules permit)
    FOREIGN KEY (UserID) REFERENCES users(Id)
);