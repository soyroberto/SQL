### **Normalization in Relational Databases**  
**Normalization** is the process of organizing data in a database to:  
1. **Minimize redundancy** (avoid duplicate data).  
2. **Prevent anomalies** (update/delete/insert errors).  
3. **Ensure data integrity** through logical table structures.  

It involves decomposing tables into smaller, related tables based on **normal forms (NFs)**.  

---

### **Key Normal Forms (NFs)**  
| Normal Form  | Rule | Example Violation | Fix |
|-------------|------|------------------|-----|
| **1NF**     | All attributes must be atomic (no repeating groups). | A `Students` table with a comma-separated `Courses` column. | Split into `Students` and `Enrollments` tables. |
| **2NF**     | No partial dependency on a composite primary key. | `OrderDetails` with `(OrderID, ProductID)` as PK, but `ProductName` depends only on `ProductID`. | Move `ProductName` to a `Products` table. |
| **3NF**     | No transitive dependencies (non-key attributes depend only on the PK). | `Employees` table where `DepartmentName` depends on `DepartmentID` (not directly on `EmployeeID`). | Move `DepartmentName` to a `Departments` table. |
| **BCNF**    | Every determinant must be a candidate key. | A `Course` table where `Professor` → `Department` (assuming professors teach only one department). | Split into `Professors` and `Courses` tables. |

---

### **Example: Normalization in Action**  
#### **Unnormalized Table (Problems)**  
| `StudentID` | `Name` | `Courses` (comma-separated) | `Department` | `DepartmentHead` |  
|------------|--------|----------------------------|--------------|------------------|  
| 101        | Alice  | Math, Physics              | Science      | Dr. Smith        |  
| 102        | Bob    | Math, Chemistry            | Science      | Dr. Smith        |  

**Issues**:  
- Redundancy (`DepartmentHead` repeats).  
- Update anomaly: Changing "Dr. Smith" requires multiple updates.  
- Insert anomaly: Cannot add a department without a student.  

#### **Normalized Tables (Solution)**  
1. **Students**  
   | `StudentID` | `Name` | `DepartmentID` |  
   |------------|--------|----------------|  
   | 101        | Alice  | 1              |  
   | 102        | Bob    | 1              |  

2. **Departments**  
   | `DepartmentID` | `DepartmentName` | `DepartmentHead` |  
   |----------------|------------------|------------------|  
   | 1              | Science          | Dr. Smith        |  

3. **Courses**  
   | `CourseID` | `CourseName` |  
   |------------|--------------|  
   | 1          | Math         |  
   | 2          | Physics      |  

4. **Enrollments** (Junction table for M:N relationship)  
   | `StudentID` | `CourseID` |  
   |------------|------------|  
   | 101        | 1          |  
   | 101        | 2          |  

---

### **Benefits of Normalization**  
- **Reduced Storage**: Eliminates duplicate data.  
- **Consistency**: Single source of truth (e.g., `DepartmentHead` updates once).  
- **Flexibility**: Easier to modify schema without breaking queries.  

---

### **When to Denormalize?**  
For **performance** in read-heavy systems (e.g., data warehouses), controlled redundancy is sometimes reintroduced.  

**Example**: Adding `TotalOrders` to a `Customers` table to avoid frequent `COUNT()` joins.  

---

### **Key Takeaway**  
Normalization structures data logically to prevent anomalies, but balance it with real-world performance needs.  

Need help normalizing your specific database? Share your schema! 🛠️


**Copilot:**
15.05.2025 16:56
https://copilot.microsoft.com/shares/kdXMdmigBqE9GTQVEpx5w

Database normalization is the process of organizing a relational database to reduce redundancy and improve data integrity. It follows a series of normal forms (NF), each applying specific rules to enhance efficiency. Here’s a detailed breakdown with diagrams for each normalization level:

### **1st Normal Form (1NF) - Ensuring Atomicity**
**Rule:** Eliminate repeating groups and ensure each column contains atomic values.

| StudentID | Name       | Subjects          |
|-----------|-----------|-------------------|
| 101       | Alice      | Math, Science     |
| 102       | Bob        | Science, History  |

**Issue:** The "Subjects" column contains multiple values, violating atomicity.
**Solution (1NF):** Separate subjects into a new table.

| StudentID | Name  |
|-----------|------|
| 101       | Alice |
| 102       | Bob   |

| StudentID | Subject  |
|-----------|---------|
| 101       | Math    |
| 101       | Science |
| 102       | Science |
| 102       | History |

---

### **2nd Normal Form (2NF) - Removing Partial Dependencies**
**Rule:** Ensure that all non-key attributes are fully functionally dependent on the primary key.

Consider a table where a non-key attribute depends only on part of the composite primary key:

| OrderID | ProductID | ProductName | CustomerID | CustomerName |
|---------|----------|-------------|------------|--------------|
| 201     | P001     | Laptop      | C101       | Alice        |
| 202     | P002     | Mouse       | C102       | Bob          |

**Issue:** "ProductName" depends only on "ProductID," not the full primary key.

**Solution (2NF):** Separate into two tables.

| ProductID | ProductName |
|-----------|-------------|
| P001      | Laptop      |
| P002      | Mouse       |

| OrderID | ProductID | CustomerID |
|---------|----------|------------|
| 201     | P001     | C101       |
| 202     | P002     | C102       |

| CustomerID | CustomerName |
|------------|--------------|
| C101       | Alice        |
| C102       | Bob          |

---

### **3rd Normal Form (3NF) - Removing Transitive Dependencies**
**Rule:** Ensure that non-key attributes depend only on the primary key, eliminating transitive dependencies.

| EmployeeID | EmployeeName | DepartmentID | DepartmentName |
|------------|--------------|--------------|---------------|
| E001       | Alice        | D01          | HR            |
| E002       | Bob          | D02          | IT            |

**Issue:** "DepartmentName" depends on "DepartmentID," which is not the primary key.

**Solution (3NF):** Separate department details.

| EmployeeID | EmployeeName | DepartmentID |
|------------|--------------|--------------|
| E001       | Alice        | D01          |
| E002       | Bob          | D02          |

| DepartmentID | DepartmentName |
|-------------|----------------|
| D01         | HR             |
| D02         | IT             |

---

### **Boyce-Codd Normal Form (BCNF) - Handling Anomalies Beyond 3NF**
**Rule:** Every determinant must be a candidate key.

| StudentID | Course | Instructor |
|-----------|--------|------------|
| 101       | Math   | Prof. A    |
| 102       | Science | Prof. B   |
| 101       | Science | Prof. A   |

**Issue:** An instructor can teach multiple courses, creating dependency issues.

**Solution (BCNF):** Break dependency.

| StudentID | Course  |
|-----------|--------|
| 101       | Math   |
| 101       | Science |
| 102       | Science |

| Course  | Instructor |
|---------|------------|
| Math    | Prof. A    |
| Science | Prof. B   |

---

**Atomicity**

### **Atomic Value in Databases**  
An **atomic value** (or *scalar value*) is the smallest, indivisible unit of data in a relational database. It adheres to these principles:  

#### **1. Definition**  
- **Indivisible**: Cannot be logically broken down further without losing meaning.  
- **Single Value**: Stores exactly one piece of data per field (no lists, sets, or composite structures).  

#### **2. Examples**  
| Atomic (Valid)          | Non-Atomic (Invalid)        |  
|-------------------------|----------------------------|  
| `"John"` (first name)   | `"John, Doe"` (combined first/last name) |  
| `25` (age)              | `"25, 30"` (multiple ages in one field) |  
| `"2023-10-15"` (date)   | `"Oct 15-20, 2023"` (date range) |  

#### **3. Why Atomicity Matters**  
- **Normalization (1NF)**: Requires atomic values to eliminate repeating groups.  
- **Query Efficiency**: Enables precise filtering (e.g., `WHERE age = 25`).  
- **Data Integrity**: Prevents ambiguous interpretations (e.g., splitting `"John, Doe"` risks errors).  

#### **4. Common Violations (Non-Atomic Data)**  
- **Comma-separated lists**:  
  ```sql
  -- Bad: Stores multiple phone numbers in one field
  CREATE TABLE Contacts (
      ContactID INT,
      PhoneNumbers VARCHAR(200)  -- e.g., "555-1234, 555-5678"
  );
  ```
- **JSON/XML blobs**: While useful for semi-structured data, they violate atomicity if used to bypass normalization.  

#### **5. How to Fix Non-Atomic Data**  
- **Split into separate columns**:  
  ```sql
  -- Good: Atomic values
  CREATE TABLE Contacts (
      ContactID INT,
      Phone1 VARCHAR(15),
      Phone2 VARCHAR(15)
  );
  ```
- **Use related tables**:  
  ```sql
  -- Better: Normalized design
  CREATE TABLE Contacts (
      ContactID INT PRIMARY KEY
  );
  CREATE TABLE Phones (
      PhoneID INT,
      ContactID INT,
      Number VARCHAR(15),
      FOREIGN KEY (ContactID) REFERENCES Contacts(ContactID)
  );
  ```

#### **6. Exceptions**  
- **Arrays/JSON in modern databases**: PostgreSQL, MongoDB, etc., allow non-atomic values for flexibility, but these still violate relational principles.  

#### **Key Takeaway**  
Atomic values ensure clean, efficient, and unambiguous data storage—a cornerstone of relational database design.  

Need help fixing a specific non-atomic field? Share your table structure! 🛠️


==**Functional Dependency**==

The most straightforward kind of dependency is called  functional dependency (FD). FD is expressed using a left-hand side, a right-hand side and an arrow.

For example, there might be a table called ‘Lecturer’ in a university database with primary key LecturerID. In this case, we can write an FD as:

**LecturerID – > LecturerName**

It means the following:

- For each LecturerID, there is at most one LecturerName, or
- LecturerName is determined by LecturerID, or
- LecturerName is uniquely determined by LecturerID, or
- LecturerName depends on LecturerID and so on.

So, the basic idea of an FD is given the expression

**LHS – > RHS,**

if LHS (left-hand side) determines the value of RHS (right-hand side), the expression is a valid FD.

Both LHS and RHS are made up of attribute(s) in an FD.

Back to our university database example,

**LecturerID – > LecturerName**

is a valid FD, since LecturerID determines the value of LecturerName.