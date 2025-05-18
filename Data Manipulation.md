#week1 
Based on the sources and our conversation, **data manipulation** is one of the primary functions provided by a database management system (DBMS). It involves accessing and interacting with the data stored within a database.

Essentially, manipulating a database covers the actions users take to work with the data after the database structure has been defined and built.

The sources identify the main types of actions involved in data manipulation:

- **Querying (Retrieval)**: This means retrieving specific data from the database. Examples include retrieving a student's transcript, listing students who took a specific course section, or listing prerequisites for a course.
- **Updating**: This refers to modifying the data in the database to reflect changes in the real world. Updates can be further broken down into:
    - **Insertion**: Adding new data or records (tuples) to the database. An example is creating a new section for a course.
    - **Deletion**: Removing existing data or records (tuples) from the database.
    - **Modification**: Changing the values of existing data records (tuples). An example is changing a student's class to sophomore or entering a grade for a student.

The DBMS provides a set of operations or a language known as the **Data Manipulation Language (DML)** for performing these tasks. This language is used for specifying database retrievals and updates. High-level DMLs, like SQL, can specify and retrieve many records in a single statement, often called set-at-a-time or set-oriented **DMLs, and are considered declarative as they specify _what_ data to retrieve rather than _how_.** These commands can be used interactively or embedded within general-purpose programming languages. SQL is a comprehensive language that includes constructs for data manipulation, among other features.

Update operations, specifically Insert, Delete, and Update, must ensure that the resulting database state remains valid and satisfies the integrity constraints defined on the schema. Transactions, which are logical units of database processing, also encompass these database access operations.