Superclasses can represent different entity types, and therefore they may not have many common attributes even though they represent a particular meaning.

- A category (UNION type) called OWNER is created to represent a subset of the union of the three superclasses COMPANY, BANK and PERSON.
![[Pasted image 20250512180345.png]]
- A category (UNION type) called OWNER is created to represent a subset of the union of the three superclasses COMPANY, BANK and PERSON.
- A category member must exist in at least one of its superclasses.
- **We put a ‘U’ inside the circle that connects the subclass (OWNER) with multiple superclasses (PERSON, BANK, COMPANY) to represent the UNION relationship (unlike ‘o’ or ‘d’ for a specialisation).**
- Also note, as far as the subset notation (i.e. ‘U’) is concerned, the open side of the ‘U’ still points towards the superclass. In this case, we have three superclasses.





![[Pasted image 20250512182315.png]]


**IS-A question and answers for the overlapping specialisation**

As you can see from Table 2.4, the IS-A question returns ‘Yes’ for all the scenarios, and hence, the union is a valid parent–child relationship for the problem.

