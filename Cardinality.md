### Cardinality example

Let’s talk more about the cardinality values and their meaning using the following example (Figure 2.13).

**Figure 2.13**  
_Cardinality Values_
![[Pasted image 20250507120135.png]]
![At the centre is ‘teaches’ in a diamond shape. It is connected to the left text box labelled ‘LECTURER’ and right text box. See image transcript for further details.]()
This example illustrates a binary relationship between Lecturer and Subject. The relationship is ‘teach’, and can be interpreted in both directions. (**Note:** In an ER, the direction of interpretation does not matter much, so we would not worry about it.) So, the relationship is, ‘A Lecturer teaches subjects’, or ‘A subject is taught by a Lecturer’.

Let’s focus on the cardinality values now.

**The meaning of basic cardinality values (1 on Lecturer side and N on Subject side):**

- The relationship is a 1-to-N relationship.
- One Lecturer can teach many subjects.
- A subject is taught by one Lecturer.

**The meaning of min–max cardinality values ((0, N) on Lecturer side and (1, 1) on Subject side)**

- The pair of values on the lecturer side (0 and N) is the number of subjects.
- The pair of values on the subject side (1 and 1) is the number of lecturers.
- One Lecturer teaches a minimum of 0 subjects and a maximum of many subjects.
- One subject is taught by a minimum of one lecturer and a maximum of one lecturer.

Participation
![[Pasted image 20250507120333.png]]
# Attributes of a relationship

![[Pasted image 20250507121215.png]]