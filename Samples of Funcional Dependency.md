what's a 
Functional dependencies?
# Functional Dependencies in Database Design

Functional dependencies are fundamental concepts in database normalization that describe relationships between attributes in a relational database.

## Definition

A **functional dependency** (FD) is a constraint between two sets of attributes in a relation. It's denoted as X → Y, where:

- X is the **determinant set** (left side)
- Y is the **dependent set** (right side)

This means that the attributes in X functionally determine the attributes in Y. For any two tuples (rows) in the relation, if their X values are equal, then their Y values must also be equal.

## Key Properties

1. ==**Uniqueness**: For each unique value of X, there is exactly one value of Y==
2. ==**Not reversible**: X → Y doesn't imply Y → X==
3. ==**Transitive**: If X → Y and Y → Z, then X → Z==

## Examples

### Example 1: Simple FD

Consider a Student table:
```
Student(ID, Name, DateOfBirth)
```

Here:
- `ID → Name` (Student ID determines their name)
- `ID → DateOfBirth` (Student ID determines their birth date)

This means no two students can have the same ID but different names or birth dates.

### Example 2: Composite Determinant

In an OrderItems table:
```
OrderItems(OrderID, ProductID, Quantity, Price)
```

Here:
- `(OrderID, ProductID) → Quantity` (The combination of order and product determines quantity)
- `ProductID → Price` (Product determines its price)

### Example 3: Transitive Dependency

In an Employee table:
```
Employee(EmpID, Name, DeptID, DeptName, DeptLocation)
```

Here we have multiple FDs:
1. `EmpID → Name, DeptID`
2. `DeptID → DeptName, DeptLocation`
3. `EmpID → DeptName, DeptLocation` (transitive through DeptID)

## Types of Functional Dependencies

1. **Trivial FD**: When Y is a subset of X
   - Example: (A,B) → A

2. **Non-trivial FD**: When Y is not a subset of X
   - Example: EmployeeID → EmployeeName

3. **Fully functional dependency**: When Y depends on the entire X (no partial dependency)
   - Example: (OrderID, ProductID) → Quantity (if neither OrderID nor ProductID alone determines quantity)

4. **Partial dependency**: When Y depends on a proper subset of X
   - Example: (OrderID, ProductID) → OrderDate (if OrderDate depends only on OrderID)

## Why Functional Dependencies Matter

1. **Database normalization**: FDs help identify normalization opportunities (1NF, 2NF, 3NF, etc.)
2. **Key identification**: Help determine candidate keys and primary keys
3. **Data integrity**: Help enforce business rules at the database level
4. **Query optimization**: Help the DBMS optimize query execution plans

## How to Identify Functional Dependencies

1. **From business rules**:
   - A student can have only one birth date
   - An order has only one customer
   - A product has one current price

2. **From sample data**:
   ```
   EmployeeID  Name    Dept
   101         John    Sales
   102         Mary    HR
   101         John    Sales
   ```
   Here we can observe that EmployeeID → Name, Dept

3. **From database constraints**:
   - Primary keys functionally determine all other attributes
   - Unique constraints create functional dependencies

## Functional Dependency vs. Entity Relationships

While related, they're different concepts:
- **Functional dependency**: Within a single relation (table)
- **Entity relationship**: Between different relations (tables)

## Armstrong's Axioms

These inference rules help derive all possible FDs from a given set:

1. **Reflexivity**: If Y ⊆ X, then X → Y
2. **Augmentation**: If X → Y, then XZ → YZ
3. **Transitivity**: If X → Y and Y → Z, then X → Z

Understanding functional dependencies is crucial for proper database design and normalization, helping eliminate redundancy and maintain data integrity.