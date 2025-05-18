**A Functional Dependency (FD) is a relationship between attributes in a database table, where one attribute uniquely determines another. For example, if StudentID → StudentName, it means that knowing the StudentID lets you find exactly one StudentName. FDs help in organizing and normalising data by identifying how attributes depend on each other**
--------------



      Given a form, how to normalise this form?

1. Unnormalised Form (UNF):

Write down all the attributes in the given form, including any repeating groups.

2. First Normal Form (1NF):  

 Identify the primary key.

Remove repeating groups and ensure that each attribute contains only atomic values.

3. Second Normal Form (2NF):

Remove partial dependencies. Ensure that all non-key attributes are fully functionally dependent on the entire primary key.  

4. Third Normal Form (3NF):

Remove transitive dependencies that non-key columns should not depend on other non-key columns.

After this stage all the non-key columns should depend only on the primary key.

Mostly going up to 3NF for fully normalisation.
------------------


By the end of this week, you should be able to:

**Topic 1: Normalisation**

- analyse different **functional dependencies (FDs)** that can exist among the attributes of a table
- given a user view, normalise the view and come up with a set of relational tables in the **third normal form (NF)**

**Topic 2: Data manipulation using relational algebra**

- use different relational algebraic operators
- create relational algebraic expressions for fetching specific data from relational database tables
- deduce the output of a relational algebraic expression, given a set of relational database tables.
- 
### **Normalization in Relational Databases**  
**Normalization** is the process of organizing data in a database to:  
1. **Minimize redundancy** (avoid duplicate data).  
2. **Prevent anomalies** (update/delete/insert errors).  
3. **Ensure data integrity** through logical table structures.  

It involves decomposing tables into smaller, related tables based on **normal forms (NFs)**.  

---

### **Key Normal Forms (NFs)**  
| Normal Form | Rule                                                                   | Example Violation                                                                                  | Fix                                             |
| ----------- | ---------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| **1NF**     | All attributes must be atomic (no repeating groups).                   | A `Students` table with a comma-separated `Courses` column.                                        | Split into `Students` and `Enrollments` tables. |
| **2NF**     | No partial dependency on a composite primary key.                      | `OrderDetails` with `(OrderID, ProductID)` as PK, but `ProductName` depends only on `ProductID`.   | Move `ProductName` to a `Products` table.       |
| **3NF**     | No transitive dependencies (non-key attributes depend only on the PK). | `Employees` table where `DepartmentName` depends on `DepartmentID` (not directly on `EmployeeID`). | Move `DepartmentName` to a `Departments` table. |
| **BCNF**    | Every determinant must be a candidate key.                             | A `Course` table where `Professor` → `Department` (assuming professors teach only one department). | Split into `Professors` and `Courses` tables.   |

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
![[Screenshot 2025-05-17 at 14.09.51.png]]
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

--------
Okay, let's look at how the sources, particularly Chapter 5, explain the interpretation of relations as facts.
#relations
#guide

Drawing on Chapter 5 and other relevant sections that discuss the meaning of relations, here are the principles established about how relations can be interpreted as facts:

1. **The Relational Model Represents Databases as Collections of Relations:** The relational model represents the database as a collection of relations. Informally, each relation resembles a table of values.
2. **Tuples (Rows) Represent Facts:** In the informal view of a relation as a table, each row in the table represents a collection of related data values. This row represents a **fact** that typically corresponds to a real-world entity or relationship. The table name and column names are used to help interpret the meaning of the values in each row.
3. **Relation Schema as a Declaration/Assertion:** The relation schema (the table name and attribute names) can be interpreted as a **declaration or a type of assertion**. It asserts, in general, that entities or relationships of a certain type exist and possess specific attributes. For example, the schema of the STUDENT relation asserts that a student entity has properties like Name, Ssn, Birth_date, etc..
4. **Tuples as Instances of the Assertion (Facts):** Each tuple (row) in the relation state (the current data in the table) **==can then be interpreted as a fact or a particular instance of the assertion made by the schema==**. For instance, a specific tuple in the STUDENT relation asserts the fact that there is a particular student entity with specific values for Name, Ssn, and other attributes.
5. **Representing Facts about Entities and Relationships:** The relational model represents facts about both **entities and relationships uniformly as relations**. While the Entity-Relationship (ER) model explicitly distinguishes between entity types and relationship types, the relational model converts both into relations [36, see also Chapter 9 mappings]. This means a tuple might represent a fact about an entity (like a specific EMPLOYEE) or a fact about a relationship (like an employee working for a department, potentially represented by a foreign key in the EMPLOYEE relation referring to the DEPARTMENT relation, or through a separate relationship relation). Sometimes this uniform representation can compromise understandability.
6. **Alternative Interpretation as a Predicate:** Another interpretation views the relation schema as a **predicate**. In this view, the values in each tuple are interpreted as values that satisfy this predicate. For example, the predicate STUDENT(Name, Ssn, ...) is true for the tuples in the STUDENT relation state. This interpretation is useful in logical programming and relates to the _closed world assumption_, which states that the only true facts are those present in the current state of the relation(s).
7. **Semantics Provide Meaning to Facts:** The "semantics" of a relation refers to the meaning derived from the interpretation of attribute values in a tuple. Clear semantics ensure that the real-world meaning of the data and the facts they represent are easily understood. Designing relations based on a careful conceptual model (like ER/EER) and following systematic mapping procedures helps ensure the relational schema has clear semantics and thus a clear meaning as a set of facts.

In essence, Chapter 5 establishes that at its core, the relational model's structure (relations/tables, attributes/columns, and tuples/rows) serves to represent real-world **facts** about entities and their relationships, enabling both declarative (assertion) and logical (predicate) interpretations of the data.