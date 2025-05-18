Database Systems Study Guide Quiz and Answers

Database Systems Study Guide

Quiz

1.

What is the primary purpose of the external or view level in the three-schema architecture?

2.

How is the internal schema typically specified in most modern relational Database Management Systems (DBMSs)?

3.

What is the fundamental idea behind the client/server architecture in a computing environment?

4.

Define a relationship instance within the context of relationship types and sets in a database model.

5.

Explain what a predicate-defined subclass is in a database system.

6.

In the relational model, what does "atomic" mean when describing values within a domain?

7.

What is the standard SQL notation used to refer to the value of an attribute A for a tuple t?

8.

Give an example of a numeric data type used for attribute declaration in SQL.

9.

What does a value of '00000' in the SQLSTATE communication variable indicate?

10.

What are observer functions for user-defined types (UDTs) used for in SQL?

Answer Key

1.

The external or view level describes the part of the database that a specific user group is interested in, effectively hiding the rest of the database from them.

2.

In most modern relational DBMSs, the internal schema is specified through a combination of functions, parameters, and specifications related to file storage.

3.

The fundamental idea is to define specialized servers with specific functionalities that can be accessed by multiple client machines, which provide user interfaces and local processing power.

4.

A relationship instance is a specific association among individual entities, where each entity is a member of a participating entity set for that relationship type.

5.

A predicate-defined subclass is a subclass of a class where membership is determined by whether an entity in the class satisfies a specific predicate (condition) on its attributes.

6.

In the relational model, "atomic" means that each value within a domain is indivisible and cannot be broken down into smaller components as far as the formal model is concerned.

7.

Both t[Ai] and t.Ai (and sometimes t[i]) are used to refer to the value vi in tuple t for attribute Ai.

8.

Examples of numeric data types in SQL include INTEGER (or INT), SMALLINT, FLOAT (or REAL), DOUBLE PRECISION, and DECIMAL (or DEC or NUMERIC).

9.

A value of '00000' in SQLSTATE indicates that there was no error or exception during the execution of an SQL statement.

10.

Observer functions are implicitly created for each attribute of a UDT and are used to read or retrieve the value of that specific attribute for an object of that type.

Essay Questions

1.

Compare and contrast the two-tier and three-tier client/server architectures in the context of Database Management Systems, highlighting their logical and physical implementations and their respective advantages or disadvantages.

2.

Explain the concepts of functional dependency, multivalued dependency, and join dependency, outlining how they differ and their significance in the process of database normalization to achieve higher normal forms.

3.

Describe the different types of single-level ordered indexes discussed in the source material (primary, clustering, and secondary indexes). Explain their characteristics, such as dense/nondense, block anchoring, and how they are used to access data records efficiently.

4.

Discuss the concept of query processing and optimization. Explain how relational algebra equivalencies and transformation rules are used by a query optimizer to select an efficient query plan for executing a query.

5.

Explain the concept of locking in concurrency control within a database system. Describe the difference between binary locks and shared/exclusive locks, including the operations associated with each type and how they help ensure data consistency and prevent conflicting operations.

Glossary of Key Terms

•

External or View Level: Describes the portion of the database visible to a specific user group, hiding the rest.

•

Conceptual Level: Represents the overall logical structure of the database, independent of physical storage details.

•

Internal Level: Describes the physical storage structure of the database.

•

DDL (Data Definition Language): Used to specify the conceptual schema in DBMSs where conceptual and internal levels are clearly separated.

•

SDL (Storage Definition Language): Used to specify the internal schema in systems with clear separation of conceptual and internal levels.

•

VDL (View Definition Language): Used to specify user views and their mappings to the conceptual schema (often implemented using DDL or SQL).

•

Client/Server Architecture: A computing model where specialized servers provide resources and services to multiple client machines.

•

Relationship Type: Defines a set of associations among entities from different entity types.

•

Relationship Set: The collection of relationship instances for a given relationship type.

•

Relationship Instance: A specific association among individual entities participating in a relationship type.

•

Predicate-defined Subclass: A subclass whose members are determined by satisfying a predicate on the attributes of the superclass.

•

User-defined Subclass: A subclass whose membership is not determined by a predicate but by explicit assignment by the user.

•

Domain: A set of atomic values that can be assigned to an attribute.

•

Atomic Value: An indivisible value within a domain.

•

Relation (or Relation State): A set of tuples in a relational database, corresponding to a relation schema.

•

Tuple: An ordered list of values representing a record in a relation.

•

Relational Intension: The schema of a relation, defining its name and attributes.

•

Relational Extension: A specific state or set of tuples in a relation at a given time.

•

SQLSTATE: A communication variable in SQL used to indicate errors or exceptions, with '00000' signifying no error.

•

SQLCODE: An older communication variable for error handling, whose codes are often vendor-specific.

•

CREATE DOMAIN: An SQL statement used to define a named domain with specific constraints.

•

CHECK Clause: Used in SQL to specify a condition that must be true for data values in a column or domain.

•

Functional Dependency (FD): A constraint where the values of a set of attributes X uniquely determine the values of a set of attributes Y (denoted X → Y).

•

Left-hand Side (of an FD): The set of attributes X in a functional dependency X → Y.

•

Right-hand Side (of an FD): The set of attributes Y in a functional dependency X → Y.

•

Closure of X (X+): The set of all attributes functionally determined by a set of attributes X based on a given set of functional dependencies.

•

Multivalued Dependency (MVD): A constraint where the values of a set of attributes X determine a set of values for a set of attributes Y, independent of other attributes (denoted X →→ Y).

•

Trivial MVD: An MVD X →→ Y where Y is a subset of X or X ∪ Y covers all attributes in the relation schema.

•

Nontrivial MVD: An MVD that is not trivial.

•

Join Dependency (JD): A constraint specifying that every legal state of a relation should have a nonadditive join decomposition into a set of relation schemas.

•

Trivial JD: A JD where one of the relation schemas in the decomposition is equal to the original relation schema.

•

Fifth Normal Form (5NF or Project-Join Normal Form): A normal form based on join dependencies.

•

Armstrong’s Inference Rules: A set of sound and complete rules for inferring functional dependencies.

•

Inclusion Dependency: A constraint between two relations where a set of attributes in one relation must appear as a subset of the values of a set of attributes in another relation.

•

IDIRs (Inclusion Dependency Inference Rules): Rules for inferring inclusion dependencies.

•

Buffer: A reserved area in main storage that holds disk blocks for data transfer.

•

Cluster (or File Segment or Extent): Several contiguous disk blocks transferred as a unit.

•

Blocking Factor (bfr): The number of records that can fit into one disk block.

•

Contiguous Allocation: File blocks are allocated to consecutive disk blocks.

•

Linked Allocation: Each file block contains a pointer to the next file block.

•

Indexed Allocation: Index blocks contain pointers to the actual file blocks.

•

Binary Search (on a Disk File): An algorithm to efficiently find a record in a file ordered by a key field.

•

Primary Index: An ordered file with entries for each block in the data file, using the ordering key field.

•

Clustering Index: An ordered file with entries for each distinct value of a non-key ordering field.

•

Secondary Index: An index specified on any non-ordering field of a file.

•

Dense Index: An index with an entry for every record in the data file.

•

Nondense (Sparse) Index: An index with fewer entries than records (e.g., one entry per block or per distinct value).

•

Multilevel Index: An index structure with multiple levels of index blocks, reducing the number of block accesses needed for searching.

•

Index Fan-out (fo): The number of entries that can fit into one index block.

•

B-tree: A balanced tree data structure used for dynamic multilevel indexing.

•

B+-tree: A variation of the B-tree commonly used in databases, where all data pointers are in the leaf nodes.

•

Bitmap Index: An index structure that uses bitmaps to represent the occurrences of values or value ranges in a column.

•

ISAM (Indexed Sequential Access Method): An older file organization method that combines sequential and indexed access.

•

VSAM (Virtual Storage Access Method): An IBM access method similar to B+-trees.

•

Indexing Hints: Suggestions provided in queries to guide the query optimizer in using indexes.

•

Sort-Merge Join: A join algorithm that sorts both relations on the join attributes and then merges the sorted relations.

•

Nested-Loop Join: A join algorithm where one relation is iterated over, and for each tuple, the other relation is scanned for matches.

•

Relational Algebra Equivalencies: Rules that allow relational algebra expressions to be transformed into equivalent expressions.

•

Query Optimizer: A component of the DBMS that chooses the most efficient execution plan for a query.

•

Materialized View: A view whose result is pre-computed and stored, allowing for faster retrieval.

•

Incremental Update (of Views): Updating a materialized view by only applying changes based on modifications to the base relations, rather than recomputing the entire view.

•

Aggregate Functions (in Views): Functions like COUNT and SUM applied to groups of tuples in a view.

•

Transaction: A logical unit of database processing that includes one or more database access operations.

•

Binary Lock: A lock with two states: locked or unlocked, allowing only one transaction access to an item at a time.

•

Shared/Exclusive (Read/Write) Locks: A lock type allowing multiple transactions to read an item concurrently (shared) but only one transaction to write an item (exclusive).

•

Multiversion 2PL (Two-Phase Locking): A concurrency control protocol that uses multiple versions of data items to allow concurrent read and write operations.

•

Data Item Granularity: The size of the data items being locked or accessed (e.g., record, block, file).

•

Fine Granularity: Refers to small data item sizes.

•

Coarse Granularity: Refers to large data item sizes.

•

Multiple Granularity Level Locking: A locking protocol that supports locking at different levels of the data item hierarchy (e.g., database, file, page, record).

•

Intention-Shared (IS) Lock: Indicates that shared locks will be requested on descendant nodes.

•

Intention-Exclusive (IX) Lock: Indicates that exclusive locks will be requested on descendant nodes.

•

Horizontal Fragmentation (Sharding): Partitioning a relation into subsets of tuples based on a condition.

•

Federated Database System (FDBS): A system where independent and autonomous centralized DBMSs are integrated to some extent, often with a global schema.

•

Multidatabase System: A system with full local autonomy that constructs a global schema interactively as needed.

•

Active Database System: A database system that automatically reacts to certain events or conditions by executing pre-defined rules (triggers).

•

Trigger: A rule in an active database system that specifies an action to be executed automatically when a specific event occurs or a condition is met.

•

CREATE TRIGGER: An SQL statement used to define a trigger.

•

Triggering Event: The event that causes a trigger to be considered for execution (e.g., INSERT, DELETE, UPDATE).

•

Trigger Action: The set of operations executed when a trigger is fired.

•

Rule Sets: Groups of triggers that can be activated, deactivated, or dropped together.