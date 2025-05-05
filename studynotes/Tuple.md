In a **relational database**, a **tuple** (pronounced "tuh-pul") is a fundamental concept that refers to a **single row of data** within a table. Here’s a detailed breakdown:

---

### **1. Definition of a Tuple**
- A **tuple** is a **row** in a table, representing a single, structured data entry.
- Each tuple contains related data items (attributes/columns) about a specific entity (e.g., a customer, product, or order).

---

### **2. Key Characteristics**
| Property          | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| **Uniqueness**    | Each tuple is unique within a table (enforced by a **primary key**).        |
| **Orderless**     | Tuples have no inherent order; they’re identified by content, not position. |
| **Atomic Values** | Each field (attribute) in a tuple holds a single, indivisible value.        |

---

### **3. Example: Tuples in a Table**
Consider a table named **`Employees`**:

| **EmployeeID** (PK) | **Name**   | **Department** | **Salary** |
|---------------------|------------|----------------|------------|
| 101                 | Alice      | Sales          | 75,000     |
| 102                 | Bob        | Engineering    | 90,000     |

- Each **row** is a tuple:
  - `(101, 'Alice', 'Sales', 75000)` → Tuple 1  
  - `(102, 'Bob', 'Engineering', 90000)` → Tuple 2  

---

### **4. Tuple vs. Other Terms**
| Term        | Meaning                                                                 |
|-------------|-------------------------------------------------------------------------|
| **Tuple**   | A single row/record in a table (formal relational algebra term).        |
| **Row**     | Common synonym for tuple (used in SQL).                                 |
| **Record**  | Equivalent to a tuple (used in file-based systems or NoSQL contexts).   |

---

### **5. Tuples in Relational Algebra**
In theoretical database models, operations like **SELECT** or **PROJECT** manipulate tuples:
- **Selection (σ):** Filters tuples (e.g., `σ(Salary > 80000)(Employees)` → Returns Bob’s tuple.
- **Projection (π):** Extracts specific columns (e.g., `π(Name, Department)(Employees)` → Strips out `Salary`.

---

### **6. Why Tuples Matter**
- **Data Integrity:** Each tuple must satisfy the table’s schema (e.g., no missing `EmployeeID`).
- **Querying:** SQL operations (`SELECT`, `JOIN`) combine/filter tuples.
- **Normalization:** Eliminates duplicate tuples to reduce redundancy.

---

### **7. Special Cases**
- **Duplicate Tuples:** By default, SQL tables allow duplicates unless constrained (e.g., `PRIMARY KEY` or `UNIQUE`).
- **NULLs in Tuples:** A tuple can have `NULL` values (unless restricted by `NOT NULL`).

---

### **Key Takeaway**
A **tuple** is the relational database term for a **row**—a structured set of attribute values representing one entity. It’s the building block of relational data manipulation, whether in theory (relational algebra) or practice (SQL).

Need an example of querying tuples with SQL? 🛠️