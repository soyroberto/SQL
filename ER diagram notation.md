
![ER diagram symbols](https://cdn.nulab.com/learn-wp/app/uploads/2018/05/14210150/ER-Symbols-1.png "ER diagram symbols chart")



Based on the sources and our conversation, here are the very indispensable fundamentals of the ER diagrammatic notation, as presented in Chapter 3:

The Entity-Relationship (ER) model is a popular high-level conceptual data model used for the **conceptual design** phase of database applications. ER diagrams are the **diagrammatic notation** associated with the ER model, used to display an ER schema visually. While many alternative notations exist, the one detailed in the sources is presented as being close to the original proposed notation.

Here are the fundamental elements and their representation:

- **Entity Types:** Represented by **rectangular boxes**. The entity type name is placed inside the box. An entity type describes the structure for a set of similar entities. Examples include EMPLOYEE, DEPARTMENT, and PROJECT.
- **Relationship Types:** Represented by **diamond-shaped boxes**. Relationship types are attached to the participating entity types by straight lines. A relationship type defines a set of associations among entities from different entity types. Examples include WORKS_FOR, MANAGES, and CONTROLS.
- **Attribute Types:** Represented as **ovals**. Each attribute oval is attached by a straight line to its entity type (or sometimes a relationship type, though less common in the basic model). Attributes are properties that describe an entity.

Specific notations for different types of attributes:

- **Composite Attributes:** Attached to their component attributes by straight lines. This indicates an attribute made up of sub-attributes. For example, the Name attribute of EMPLOYEE might be composite.
- **Multivalued Attributes:** Displayed in **double ovals**. These are attributes for which an entity can have multiple values, like the Locations attribute of DEPARTMENT.
- **Derived Attributes:** Shown in **dotted ovals**. These are attributes whose values can be calculated from other data, such as the Number_of_employees attribute of DEPARTMENT.
- **Key Attributes:** The names of key attributes are **underlined** inside the oval. Key attributes uniquely identify each entity within an entity set. If a composite attribute is a key, the composite name is underlined. If multiple attributes are underlined separately on the same entity type, each is a key on its own.

Notation for Weak Entity Types and their relationships:

- **Weak Entity Types:** Represented by **double rectangles**. These are entity types that do not have a key attribute of their own.
- **Identifying Relationship Types:** The relationship linking a weak entity type to its owner (the entity type it depends on for identification) is shown in **double diamonds**.
- **Partial Key:** The attribute(s) that uniquely identify weak entities _relative_ to their owner entity form a partial key. The partial key attribute is underlined with a dashed or dotted line.

Notation for Structural Constraints on Relationship Types:

- **Cardinality Ratios:** For binary relationships, these specify the number of relationship instances an entity can participate in (e.g., 1:1, 1:N, M:N). These are shown using numbers (1, N, M) near the participating entity types in the diagram.
- **Participation Constraints (Existence Dependency):** Specifies whether an entity's existence depends on its participation in a relationship (total or partial). **Total (mandatory) participation** is shown by a **double line** connecting the entity type to the relationship. **Partial (optional) participation** is shown by a **single line**.
- **Alternative (Min, Max) Notation:** An alternative method uses a pair of integers (min, max) associated with each entity type's participation. `min = 0` implies partial participation, and `min > 0` implies total participation.

Naming Conventions and Design Issues:

- Names should convey meaning.
- Use singular names for entity types.
- A suggested convention uses uppercase for entity and relationship type names, initial capitalisation for attribute names, and lowercase for role names.
- Nouns in requirements often become entity types, and verbs become relationship types.

These symbols, lines, and text conventions form the foundation of ER diagrams used to represent the conceptual structure of a database application. The focus is on representing the schema, which changes rarely, rather than the potentially frequently changing instances (entity sets and relationship sets).