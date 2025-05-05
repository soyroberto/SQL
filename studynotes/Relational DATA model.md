Based on the sources and our conversation about data models, the **Relational Data Model** is a fundamental concept in database management.

Here's what the sources say about the Relational Data Model:

- It is classified as a **representational (or implementation) data model**, providing concepts easily understood by end users while still being implementable on a computer system. These models often represent data using record structures.
- It represents the database as a **collection of relations**. Informally, each relation resembles a **table of values** or a flat file of records.
- The model has its theoretical basis in **set theory and first-order predicate logic**.
- ==In formal relational model terminology:==
    - ==A row in the table is called a **tuple**.==
    - ==A column header is called an **attribute**.==
    - ==The table is called a **relation**.==
    - The data type for values in a column is represented by a **domain** of possible values.
- A **relation schema** R(A1, A2, ... , An) defines the structure of a relation, consisting of the relation name R and a list of attributes.
- A **relation state** r(R) (or relation) is a set of n-tuples that conforms to the relation schema. It's a subset of the Cartesian product of the domains that define the schema.
- Tuples in a relation are typically not ordered in the formal model. However, SQL tables, based on the practical relational model, do not consider rows ordered, though attributes are ordered as specified in `CREATE TABLE`.
- Duplicate tuples are generally not allowed in a formal relation, as a relation is defined as a set of tuples. SQL, however, allows duplicate tuples in tables and query results.
- A relational database schema is a set of relation schemas and a set of integrity constraints. A database state is a set of relation states that satisfy these constraints.
- Important **integrity constraints** include domain constraints, key constraints (superkey, candidate key, primary key), NOT NULL constraints, entity integrity, and referential integrity. The primary key is one of the candidate keys designated to uniquely identify tuples. Referential integrity constraints are typically implemented using foreign keys.
- Relationships between tuples in different relations are primarily represented by having two attributes, one a **primary key** in one relation and the other a **foreign key** in the related relation. Tuples are related if they have the same values for these attributes.
- The relational model includes operations for manipulating the database, categorised as retrievals and updates.
    - ==**The basic set of retrieval operations for the formal model is the relational algebra.** These operations (like SELECT, PROJECT, JOIN, UNION, INTERSECTION, SET DIFFERENCE, CARTESIAN PRODUCT) produce new relations from existing ones.==
    - ==**Another formal language is the relational calculus, a higher-level declarative language where you specify _what_ to retrieve, not _how_. There are two variations: tuple relational calculus and domain relational calculus.**==
    - The standard query language, **SQL**, is primarily based on concepts from tuple relational calculus but also incorporates operations from relational algebra.
    - Update operations include Insert, Delete, and Update, which must result in a valid database state that satisfies constraints.
- The relational model was originally proposed to **separate the physical storage of data from its conceptual representation**, providing better data abstraction and program-data independence compared to earlier systems.
- It was first introduced by Ted Codd in 1970. Commercial implementations became widely available in the early 1980s.
- It is the **main data model used in many current commercial DBMSs**, often referred to as SQL systems.
- Designing a relational database schema often involves mapping from conceptual models like the ==Entity-Relationship (ER) or Enhanced Entity-Relationship (EER) models==. Normalization theory, using concepts like functional dependencies, is used to evaluate and improve the design of relational schemas.

In essence, the relational model is a robust, mathematically-founded approach to representing data in tables (relations) and manipulating it using powerful formal languages, underpinning most modern commercial database systems..

#week1 