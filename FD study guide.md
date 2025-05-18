
# highlight with bullets the ultimate fundamentals for Normalisation and Functional Dependency (FD) with 3 or 4 examples make it like a study guide outlining the specific in each sample, this will be used a booklet and notebook as an exam guide

Righto, here's a study guide outline covering the fundamentals of Normalisation and Functional Dependencies (FDs) based on the sources, designed to be a handy booklet for exam prep.

---

### **Study Guide: Normalisation & Functional Dependencies**

This guide outlines key principles from the sources regarding Functional Dependencies (FDs) and Normalisation, focusing on their purpose and application in relational database design.

#### **1. The Fundamentals: Why Normalise?**

- **Relational Model Basics:** The relational model represents a database as a collection of **relations**, which informally resemble tables. Each tuple (row) in a relation state represents a **fact** about an entity or relationship [Chapter 5 principle, 37].
- **Goal of Good Relational Design:** The goal is to design relation schemas that have **clear semantics** (meaning) and to **minimise redundancy** and avoid **insertion, deletion, and update anomalies**.
- **Anomalies:** These are problems that can occur when updating a poorly designed relation:
    - **Insertion anomalies:** Difficulty inserting new facts if some data is missing (e.g., cannot add a new department until an employee is assigned to it if department info is stored only with employees).
    - **Deletion anomalies:** Losing unintended facts when deleting a tuple (e.g., deleting the last employee in a department also deletes the department's information).
    - **Update anomalies:** Needing to update the same fact in multiple tuples, leading to inconsistencies if not all copies are updated (e.g., updating a department manager's details in multiple employee records).
- **Normalisation Process:** Normalisation is a **top-down design technique** (or can be used to evaluate existing designs) that takes a relation schema through a **series of tests** (normal forms) to identify and remove redundancy and anomalies by **decomposing** problematic relations into smaller ones.

#### **2. Functional Dependencies (FDs): The Core Tool**

- **Definition:** A **Functional Dependency** (FD) is a **constraint** between two sets of attributes in a relation schema. It states that the values of one set of attributes (the **left-hand side** or LHS) **uniquely determine** the values of another set of attributes (the **right-hand side** or RHS). Notation: **X → Y**, where X and Y are sets of attributes.
- **Property of the Schema:** An FD is a property of the **relation schema**, defined by someone who understands the meaning (semantics) of the data, not something that can be automatically inferred from a specific set of data in a table at one moment. A single counterexample in a relation state is sufficient to **disprove** an FD.
- **Closure of FDs (F+):** From a given set of FDs (F), we can **infer** additional FDs. The **closure F+** is the set of all FDs that can be inferred from F. Armstrong's axioms are a set of inference rules for FDs.
- **Minimal Cover:** For a set of FDs E, a **minimal cover** F is an equivalent set of FDs that is minimal, meaning it has no redundant attributes on the LHS of any FD and no redundant FDs. Every dependency in E can be inferred from F, and F has no redundancies.
- **Keys and Superkeys:**
    - A **superkey** of a relation R is a set of attributes SK such that no two tuples in any valid relation state of R have the same value for SK [Chapter 5 definition]. This is equivalent to saying that **SK functionally determines all attributes** in R (SK → R) [derived from 42, 115].
    - A **candidate key** is a **minimal superkey**; it's a superkey from which no attribute can be removed while still remaining a superkey [Chapter 5 definition, 23].
    - The **primary key** is one of the candidate keys chosen to uniquely identify tuples. It's usually underlined in the relation schema notation.
    - The **closure of a key** is the entire relation.

#### **3. Normal Forms: Steps to a Better Design**

Normal forms (NF) are tests based on FDs (and other dependencies) used to evaluate and improve relation schemas.

- **First Normal Form (1NF):** A relation is in 1NF if the domain of each attribute contains only **atomic (indivisible)** values, and the value of each attribute in a tuple is a single value from that domain. This means no multivalued attributes or nested relations.
- **Second Normal Form (2NF):** Based on **full functional dependency**. A non-key attribute A is **fully functionally dependent** on a key X if A is functionally dependent on X (X → A), but not on any **proper subset** of X.
    - **Test (considering only primary key):** For relations where the primary key has multiple attributes, **no nonkey attribute should be functionally dependent on only a part of the primary key** (i.e., no partial dependencies on the primary key).
    - **General Test (considering all candidate keys):** A relation schema R is in 2NF if for every non-prime attribute A (an attribute not part of any candidate key), A is fully functionally dependent on _every_ candidate key of R [derived from 60, 61, 84]. Partial dependencies on any candidate key are disallowed.
    - **Remedy:** Decompose the relation. Create new relations where the partial dependency exists, placing the partial key with its dependent attributes.
- **Third Normal Form (3NF):** Based on **transitive dependency**. A functional dependency X → Y in a relation R is **transitive** if there exists a set of attributes Z that is neither a candidate key nor a subset of any key, and both X → Z and Z → Y hold.
    - **Test (considering only primary key):** No nonkey attribute should be transitively dependent on the primary key [derived from 57, 61, 84].
    - **General Test (considering all candidate keys):** A relation schema R is in 3NF if, whenever a non-trivial FD X → A holds in R, either (a) X is a superkey of R, OR (b) A is a prime attribute (part of some candidate key) [derived from 59, 60, 65, 66, 83]. This general definition implicitly covers 2NF.
    - **Remedy:** Decompose the relation. Create a new relation for the transitive dependency, placing the intermediate attribute(s) (Z) with the dependent attribute(s) (Y) [derived from 57, 61].
- **Boyce-Codd Normal Form (BCNF):** A **stricter** form of 3NF.
    - **Test:** A relation schema R is in BCNF if, whenever a **nontrivial** functional dependency X → A holds in R, **X is a superkey of R**. The key difference from 3NF is that BCNF **disallows** the clause (b) from the general 3NF definition; the RHS (A) being a prime attribute does not make an FD valid in BCNF if the LHS (X) is not a superkey.
    - **Remedy:** Decompose the relation. If X → A violates BCNF (X is not a superkey, A is not in X), decompose R into R1 = (X ∪ A) and R2 = (R − A) [71, derived from 69].
- **Higher Normal Forms:**
    - **Fourth Normal Form (4NF):** Based on **Multivalued Dependencies (MVDs)**. An MVD X →→ Y means that for a given value of X, the values of Y are independent of the values of other attributes in the relation. These often arise from forcing multivalued attributes into 1NF relations improperly.
        - **Test:** A relation R is in 4NF if, for every nontrivial MVD X →→ Y in R+, X is a superkey of R.
        - **Remedy:** Decompose the relation.
    - **Fifth Normal Form (5NF) / Project-Join Normal Form (PJNF):** Based on **Join Dependencies (JDs)**. A JD specifies that a relation can be decomposed into several relations such that joining them back reproduces the original relation without spurious tuples.
        - **Test:** A relation R is in 5NF if, for every nontrivial JD (R1, R2, ..., Rn) in R+, every Ri is a superkey of R.
    - **Domain-Key Normal Form (DKNF):** The theoretical "ultimate" normal form. A relation is in DKNF if all constraints can be enforced simply by enforcing **domain constraints** and **key constraints**. Rarely used in practice as it's hard to test directly.
- **Practical Use:** While higher normal forms exist, practical database design typically aims for **BCNF or at most 4NF**. Constraints for 5NF are rare and difficult to detect.
- **Properties of Decomposition:** When decomposing relations during normalisation, two properties are important:
    - **Lossless Join (Nonadditive Join) Property:** Guarantees that joining the decomposed relations back together produces the _exact_ original relation state, without generating **spurious tuples**. This property **must be achieved at any cost**.
    - **Dependency Preservation Property:** Ensures that each functional dependency in the original relation (or its closure) is **represented in at least one** of the decomposed relations. This is desirable but sometimes sacrificed (e.g., achieving BCNF may lose dependency preservation).

#### **4. Examples**

Let's illustrate with examples from the sources, outlining the specific dependencies and normalisation steps.

**Example 1: Transitive Dependency & 3NF (from COMPANY Database)**

- **Relation Schema:** `EMP_DEPT` (Ssn, Ename, Bdate, Address, Dnumber, Dname, Dmgr_ssn) [Figure 14.3(a) via 37, 57]
- **Attributes:**
    - `Ssn`: Employee Social Security Number (Primary Key)
    - `Ename`: Employee Name
    - `Bdate`: Birth Date
    - `Address`: Employee Address
    - `Dnumber`: Department Number (Foreign Key)
    - `Dname`: Department Name
    - `Dmgr_ssn`: Department Manager's Ssn
- **Functional Dependencies (FDs) Relevant Here:**
    - `Ssn → {Ename, Bdate, Address, Dnumber}`: An employee's Ssn determines their name, birth date, address, and the department they work for [derived from 37, 100]. This is a full dependency on the primary key.
    - `Dnumber → {Dname, Dmgr_ssn}`: A department number determines the department's name and the manager's Ssn.
- **Analysis:**
    - **1NF:** Assuming no multivalued attributes or nested structures, this relation is in 1NF [derived from 61].
    - **2NF:** `Ssn` is a single-attribute primary key. There are no partial dependencies on the primary key [derived from 55, 61]. Thus, the relation is in 2NF.
    - **3NF:** Consider the FD `Ssn → Dmgr_ssn`. This dependency holds because `Ssn` determines `Dnumber`, and `Dnumber` determines `Dmgr_ssn` (`Ssn → Dnumber` and `Dnumber → Dmgr_ssn`). The attribute set `Dnumber` is **neither a candidate key nor a subset of any key** (in this specific `EMP_DEPT` relation schema, `Ssn` is the key). Therefore, `Ssn → Dmgr_ssn` is a **transitive dependency** through `Dnumber`. This violates the 3NF condition (specifically, the nonkey attribute `Dmgr_ssn` is transitively dependent on the primary key `Ssn` via `Dnumber`).
- **Remedy (Normalisation to 3NF):** Decompose `EMP_DEPT` to remove the transitive dependency [derived from 61].
    - Create one relation for the employee data and the intermediate key (`Ssn` and `Dnumber`, plus other employee attributes dependent on `Ssn`): `ED1` (Ssn, Ename, Bdate, Address, Dnumber) [Figure 14.11(b) via 56, 57]. Here, `Ssn` is the primary key, and `Dnumber` is a foreign key referencing the department relation.
    - Create another relation for the attributes involved in the transitive dependency (the intermediate key `Dnumber` and what it determines): `ED2` (Dnumber, Dname, Dmgr_ssn) [Figure 14.11(b) via 56, 57]. Here, `Dnumber` is the primary key.
- **Result:** Both `ED1` and `ED2` are in 3NF, as the problematic transitive dependency has been removed by splitting the relation [Figure 14.11(b) via 56, 57].

**Example 2: Partial Dependency & 2NF, Transitive Dependency & 3NF, and BCNF (from LOTS Database)**

- **Relation Schema:** `LOTS` (Property_id#, County_name, Lot#, Area, Price, Tax_rate) [Figure 14.12(a)]
- **Attributes:**
    - `Property_id#`: Unique identifier for the property (Primary Key).
    - `County_name`: County where the lot is located.
    - `Lot#`: Lot number within the county.
    - `Area`: Area of the lot.
    - `Price`: Price of the lot.
    - `Tax_rate`: Tax rate for the county.
- **Candidate Keys:** {Property_id#} and {County_name, Lot#}. We choose {Property_id#} as the primary key.
- **Functional Dependencies (FDs):**
    - `FD1: Property_id# → {County_name, Lot#, Area, Price, Tax_rate}`: The property ID determines all other attributes (it's a superkey, and a candidate key).
    - `FD2: {County_name, Lot#} → {Area, Price, Tax_rate, Property_id#}`: The combination of county and lot number uniquely identifies the property and its details (this is the other candidate key, so it's also a superkey).
    - `FD3: County_name → Tax_rate`: The tax rate is fixed for a given county.
    - `FD4: Area → Price`: The price is determined by the area (assume this is for tax purposes).
- **Analysis:**
    - **1NF:** Assuming atomic values, the relation is in 1NF [derived from 61].
    - **2NF:** The primary key is `Property_id#`, which is a single attribute. So, there are no partial dependencies on the primary key [derived from 55, 61]. However, using the general definition of 2NF (considering all candidate keys), `Tax_rate` is partially dependent on the candidate key `{County_name, Lot#}` via `FD3: County_name → Tax_rate` because `County_name` is a proper subset of `{County_name, Lot#}`. This violates 2NF according to the general definition.
- **Remedy (Normalisation to 2NF):** Decompose based on the partial dependency `County_name → Tax_rate`.
    - Create `LOTS1` (Property_id#, County_name, Lot#, Area, Price) [Figure 14.12(b)]. Keep attributes fully dependent on the primary key `{Property_id#}`. Include `County_name`, `Lot#`, `Area`, and `Price`. `FD4 (Area → Price)` and FDs derived from keys (FD1 excluding Tax_rate, FD2 excluding Tax_rate) apply here.
    - Create `LOTS2` (County_name, Tax_rate) [Figure 14.12(b)]. Include the LHS of the partial dependency (`County_name`) as the key and the RHS (`Tax_rate`). `FD3 (County_name → Tax_rate)` applies here.
- **Result:** `LOTS1` and `LOTS2` are in 2NF.
- **Analysis (Continued on LOTS1):** Now consider `LOTS1`. The key is `Property_id#`. We have the dependency `FD4: Area → Price`. `Area` is not a key or part of the key of `LOTS1`. `Price` is dependent on `Area`. Is this a transitive dependency? `Property_id#` determines `Area` (from FD1), and `Area` determines `Price`. So, `Property_id# → Price` transitively through `Area`. This violates 3NF (using either definition, as `Area` is a non-key attribute) [derived from 57, 61].
- **Remedy (Normalisation of LOTS1 to 3NF):** Decompose `LOTS1` to remove the transitive dependency `Area → Price` [Figure 14.12(c)].
    - Create `LOTS1A` (Property_id#, County_name, Lot#, Area) [Figure 14.12(c)]. Keep attributes not involved in this specific transitive dependency _as the non-key attribute_ (Price) [derived from 61]. Keep the primary key and the intermediate attribute (`Area`).
    - Create `LOTS1B` (Area, Price) [Figure 14.12(c)]. Include the intermediate attribute (`Area`) as the key and the dependent attribute (`Price`). `FD4 (Area → Price)` applies here.
- **Result:** Relations `{LOTS1A, LOTS1B, LOTS2}` form a 3NF design [Figure 14.12(d) via 62]. All three relations are in 3NF.
- **Analysis (BCNF):** Now let's check for BCNF. Recall the general 3NF test: X → A implies (X is superkey) OR (A is prime). BCNF requires X → A implies (X is superkey).
    - In `LOTS1A` (Property_id#, County_name, Lot#, Area), Candidate Keys: {Property_id#}, {County_name, Lot#} [derived from FD1, FD2 on original LOTS]. Consider adding a new FD: `Area → County_name` (if, for example, certain area sizes only exist in certain counties). Let's assume this FD holds.
    - With `Area → County_name` in `LOTS1A`, the LHS `Area` is **not a superkey** of `LOTS1A`. The RHS `County_name` _is_ a prime attribute (part of the candidate key `{County_name, Lot#}`).
    - According to the general 3NF definition, `Area → County_name` is OK because `County_name` is prime (clause b). So, `LOTS1A` with `Area → County_name` is in 3NF.
    - According to the BCNF definition, `Area → County_name` is **not OK** because the LHS `Area` is not a superkey. This violates BCNF.
- **Remedy (Normalisation of LOTS1A to BCNF):** Decompose `LOTS1A` based on the BCNF violation `Area → County_name`.
    - Create `LOTS1AX` (Area, County_name) [Figure 14.13(a)]. Key is `Area`. `Area → County_name` applies here.
    - Create `LOTS1AY` (Property_id#, Area, Lot#) [Figure 14.13(a) with correction based on decomposition rule]. Keep the original key `Property_id#` and the attributes from the original relation that were not the RHS of the violating FD (`Lot#`) plus the LHS (`Area`).
- **Result:** `{LOTS1AX, LOTS1AY, LOTS1B, LOTS2}` forms a BCNF design. This decomposition based on `Area → County_name` loses the dependency `FD2: {County_name, Lot#} → Property_id#` because County_name and Lot# are separated. This illustrates that achieving BCNF may sacrifice dependency preservation.

**Example 3: Multivalued Dependency & 4NF**

- **Relation Schema:** `EMP` (Ename, Pname, Dname) [Figure 14.15(a), 73] (Note: This relation is an all-key relation).
- **Attributes:**
    - `Ename`: Employee Name
    - `Pname`: Project Name the employee works on
    - `Dname`: Dependent Name of the employee
- **Functional Dependencies (FDs):** Since all attributes form the key, there are no _nontrivial_ functional dependencies (X → Y where Y is not a subset of X) where X is a proper subset of {Ename, Pname, Dname}. The key is {Ename, Pname, Dname}. Thus, this relation is in BCNF as every nontrivial FD must have the entire set as the LHS (which is a superkey).
- **Problem:** The problem here is redundancy caused by **multivalued dependencies**. An employee works on several projects, and has several dependents, and these two sets of values are independent of each other. To represent this, every combination of an employee's project and dependent must be listed for that employee. This leads to repeating project names for each dependent and dependent names for each project for a given employee.
- **Multivalued Dependencies (MVDs):**
    - `Ename →→ Pname`: For a given employee (Ename), the set of projects they work on (Pname values) is independent of other attributes (like Dname) [derived from 73, 74].
    - `Ename →→ Dname`: For a given employee (Ename), the set of dependents they have (Dname values) is independent of other attributes (like Pname) [derived from 73, 74].
- **Analysis (4NF):**
    - **BCNF:** As noted, the relation is in BCNF because there are no problematic FDs.
    - **4NF:** A relation is in 4NF if for every _nontrivial_ MVD X →→ Y, X is a superkey. In `EMP`, we have the nontrivial MVDs `Ename →→ Pname` and `Ename →→ Dname`. The LHS `Ename` is **not a superkey** for the `EMP` relation (which requires {Ename, Pname, Dname} as the key). This violates the 4NF condition.
- **Remedy (Normalisation to 4NF):** Decompose `EMP` to remove the nontrivial MVDs.
    - Create `EMP_PROJECTS` (Ename, Pname) [Figure 14.15(b), 77]. Key is {Ename, Pname}. The MVD `Ename →→ Pname` becomes trivial here as Pname is part of the key.
    - Create `EMP_DEPENDENTS` (Ename, Dname) [Figure 14.15(b), 77]. Key is {Ename, Dname}. The MVD `Ename →→ Dname` becomes trivial here as Dname is part of the key.
- **Result:** Both `EMP_PROJECTS` and `EMP_DEPENDENTS` are in 4NF. Redundancy is significantly reduced, and update anomalies related to the independent multivalued attributes are avoided.

---

This outline covers the fundamental concepts of FDs, the purpose of normalisation, the main normal forms up to 4NF, and uses concrete examples to show how dependencies lead to normal form violations and subsequent decomposition. Remember, understanding the definitions of dependencies (partial, transitive, multivalued) and how they relate to the normal form tests is key to designing good relational schemas!