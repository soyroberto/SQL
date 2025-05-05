Alright, let's delve into the concept of a **foreign key** drawing upon the provided sources and our conversation history about database concepts like data integrity and domains.

#week1 
#sql 
#latrobe 

In the context of Relational Database Management Systems (RDBMSs), a foreign key is a crucial mechanism for maintaining relationships and consistency between different tables (relations).
![[Pasted image 20250501165639.png]]
Here's a breakdown based on the sources:
![[Screenshot 2025-05-01 at 17.00.29.png]]

1. **Definition and Purpose:**
    
    - A **foreign key (FK)** is a set of attributes in one relation schema (the **referencing relation**, R1) that refers to or references another relation schema (the **referenced relation**, R2).
    - ==Its primary purpose is to **maintain referential integrity** between the two relations. This means that a tuple (row) in the referencing relation that refers to another relation _must_ refer to an **existing tuple** in the referenced relation.==
    - Referential integrity constraints typically arise from the relationships among the entities represented by the relation schemas.
    - In essence, foreign keys implement relationships by establishing **logical field references** among records in distinct files or relations.
2. **Properties and Rules:**
    
    - The attributes in the foreign key (FK) must have the **same domain(s)** as the primary key attributes (PK) of the referenced relation (R2).
    - A value of the foreign key (FK) in a tuple (t1) of the referencing relation (R1) must either:
        - Occur as a value of the primary key (PK) for _some_ tuple (t2) in the current state of the referenced relation (R2). In this case, t1[FK] = t2[PK], and we say t1 refers to t2.
        - Be **NULL**. This is often permissible, depending on the constraint definition, allowing for situations where a relationship might not exist (e.g., an employee not yet assigned to a department). However, if the referencing attribute is part of R1's _primary key_, it cannot be set to NULL due to the entity integrity constraint.
3. **Relationship to Entity-Relationship (ER) Modeling:**
    
    - While the ER model explicitly represents relationships between entity types, the relational model does not represent relationship types explicitly.
    - Instead, **relationships in the relational model are represented by having two attributes, ==one a primary key and the other a foreign key** (over the same domain) included in two relations. Two tuples are related when they have the same value for these matching attributes.==
    - The mapping algorithm from ER to relational schemas heavily relies on foreign keys:
        - **1:1 Relationship Types:** **Typically mapped by including the primary key of one relation as a foreign key in the other**. It's often better to place the foreign key in the relation corresponding to the entity type that has _total participation_ in the relationship. For example, the MANAGES relationship between EMPLOYEE and DEPARTMENT (where every department has a manager) is mapped by including the primary key of EMPLOYEE (Ssn) as a foreign key (Mgr_ssn) in the DEPARTMENT relation. Including the foreign key in both relations is possible but creates redundancy. A separate "relationship relation" is a third option but less common for 1:1 unless few instances exist.
        - **1:N Relationship Types:** Typically mapped by including the primary key of the "1-side" relation as a foreign key in the "N-side" relation. For example, the WORKS_FOR relationship (one department to many employees) is mapped by including the primary key of DEPARTMENT (Dnumber) as a foreign key (Dno) in the EMPLOYEE relation. Each employee is related to at most one department in this 1:N scenario. A separate relationship relation is an alternative but generally less preferred unless participation is sparse.
        - **M:N Relationship Types:** Cannot be represented by a single foreign key in one of the participating relations. They require a **separate relationship relation** (or cross-reference relation). This new relation includes the primary keys of _both_ participating relations as foreign keys, and their combination usually forms the primary key of the relationship relation. For example, the WORKS_ON relationship (many employees work on many projects) is mapped to a separate WORKS_ON relation containing Essn (foreign key to EMPLOYEE) and Pno (foreign key to PROJECT); the primary key is {Essn, Pno}.
        - **N-ary Relationship Types (n > 2):** Also mapped using the relationship relation option, including foreign keys to all participating entity relations. The primary key is usually the combination of all foreign keys, though cardinality constraints can influence this.
        - **Weak Entity Types:** The identifying relationship is mapped by including the primary key(s) of the owner entity type(s) as foreign key(s) in the relation corresponding to the weak entity type. The primary key of the weak entity relation is the combination of these foreign keys and the weak entity's partial key (if any).
4. **Specification in SQL:**
    
    - Foreign keys are specified using the **`FOREIGN KEY` clause** in SQL `CREATE TABLE` statements.
    - You specify the attribute(s) in the current table that form the foreign key and use `REFERENCES` to name the referenced table and its primary key attributes.
    - SQL allows foreign keys to refer to their own relation, such as the `Super_ssn` attribute in the EMPLOYEE table referencing `Ssn` in the same table to represent the supervisor relationship.
    - SQL also provides options for dealing with violations of referential integrity constraints during update operations (Insert, Delete, Update). These are specified with `ON DELETE` and `ON UPDATE` clauses:
        - **RESTRICT:** The default action. The operation causing the violation is rejected.
        - **SET NULL:** If a referenced tuple is deleted or its primary key updated, the foreign key value(s) in the referencing tuples are set to NULL. This is only possible if the foreign key attribute is not part of the primary key of the referencing table.
        - **CASCADE:** If a referenced tuple is deleted, the referencing tuples are also deleted (`ON DELETE CASCADE`). If the referenced primary key is updated, the foreign key value(s) in the referencing tuples are automatically updated to match the new primary key value (`ON UPDATE CASCADE`). CASCADE is suitable for relations corresponding to weak entity types, multivalued attributes, or relationship relations.
5. **Relationship to Inclusion Dependencies:**
    
    - Inclusion dependencies were defined to formalize interrelational constraints that functional or multivalued dependencies cannot capture, such as the foreign key constraint.
    - Foreign key constraints are a specific type of inclusion dependency. For example, `EMPLOYEE.Dno < DEPARTMENT.Dnumber` is an inclusion dependency representing that every value in the Dno column of the EMPLOYEE table must also exist in the Dnumber column of the DEPARTMENT table (or be NULL if allowed).

In summary, foreign keys are essential relational model constructs used to define and enforce relationships and referential integrity between tables, mirroring the relationships identified during conceptual design stages like the ER model. They are explicitly defined in SQL using the `FOREIGN KEY` clause and involve specifying the attributes that link to a primary key in another table, along with rules for handling potential integrity violations during data manipulation.