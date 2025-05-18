## What is an ER diagram?

An entity-relationship diagram (ER diagram), also called an entity-relationship model, is aptly named because it shows the relationships between entities within an ER model. ER diagrams are most commonly used to organize data within databases or information systems. Their purpose is to visually represent the structure and logic of databases, making it easier to understand and manage complex data relationships.

### ER diagram symbols

A conceptual ER diagram uses six standard symbols.

1. **Entities** are objects or concepts that represent important data. Also known as strong entities or parent entities, these entities will often have weak entities that depend on them.
2. **Attributes** are characteristics of an entity (i.e., many-to-many or one-to-one). The primary key is crucial in establishing unique identification and relational schema.
3. **Relationships** are associations between entities.
4. ==**Weak entities depend on another entity.**==
5. **Multivalued attributes** are attributes that can have more than one value.
6. **Weak relationships** are the connections between a weak entity and its parent.

![ER diagram symbols](https://cdn.nulab.com/learn-wp/app/uploads/2018/05/14210150/ER-Symbols-1.png "ER diagram symbols chart")

Right then, let's dive into what those single and double lines mean in an Entity-Relationship (ER) diagram between entity types and relationship types, based on the sources you've provided.

The lines connecting entity types (rectangles) to relationship types (diamonds) specify the **participation constraints** of the entity type in that particular relationship type. These constraints dictate the _minimum_ number of relationship instances that an entity from that type must participate in.

There are two main types of participation constraints represented by these lines: 06.05.2025 17:17


![[Screenshot 2025-05-06 at 16.51.50.png]]

#latrobe #er #notebooklm 
1. **Single Line:** A **single line** connecting an entity type to a relationship type indicates **partial participation**. This means that an entity from this entity type _may_ participate in the relationship, but it is not required to. In terms of the alternative (min, max) notation for structural constraints, a single line implies a minimum participation of zero (`min = 0`). The example diagrams, such as Figure 3.2, show single lines representing partial participation. For instance, in the COMPANY database diagram (Figure 3.2), the EMPLOYEE entity type has a single line connecting to the MANAGES relationship type, indicating that an employee _may or may not_ manage a department.
    
2. **Double Line:** A **double line** connecting an entity type to a relationship type indicates **total participation**. Total participation is also referred to as existence dependency. This means that every entity from this entity type **must** participate in at least one instance of the relationship. Using the (min, max) notation, a double line indicates a minimum participation greater than zero (`min > 0`), typically meaning a minimum of one instance (`min = 1`). Figure 3.2 uses double lines to show total participation. For example, the EMPLOYEE entity type has a double line connecting to the WORKS_FOR relationship type, signifying that every employee _must_ work for a department. Similarly, the PROJECT entity type has total participation in the CONTROLS relationship type, meaning every project must be controlled by a department.
    

In the specific case of **weak entity types**, the double line plays a crucial role. While the weak entity type itself is denoted by a double rectangle and its identifying relationship by a double diamond, the double line connecting the weak entity (double rectangle) to its identifying relationship (double diamond) specifically illustrates the **total participation** of the weak entity in that relationship. This signifies that a weak entity's existence depends on its connection to its owner entity via this relationship. Figure 3.2 demonstrates this with the DEPENDENT entity type (double rectangle) and the DEPENDENTS_OF relationship type (double diamond), where the double line between them shows the total participation of DEPENDENT.

So, in essence, the single or double line indicates whether an entity's participation in a relationship is optional (partial, single line) or mandatory (total, double line). This is distinct from **the cardinality ratio (1:1, 1:N, M:N), which specifies the _maximum_ number of relationship instances an entity can participate in, shown by numbers (1, M, N) near the entity type in the diagram.**