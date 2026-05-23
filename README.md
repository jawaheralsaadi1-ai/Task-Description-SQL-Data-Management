# **SQL Data Management Project**



**Project Overview**

This project demonstrates the full Data Lifecycle within a relational database environment.

It covers two main systems:



1.Company Management: Handling employees, departments, and projects.

2.Hospital Management: Managing patients, doctors, and appointments.



The focus is on the Database Lifecycle: Resetting the system, building tables, adding data, updating records, and safely deleting information.



&#x20;**Main Tables**

Patient \& Doctor: Core hospital records.

Employee \& Department: Core company structure.

Appointment: The link between patients and doctors.

Projects: Work managed by departments.



**Key Operations Covered**

&#x20;**Stage 1: Data Insertion (Tasks 1 \& 2)**

&#x20;Stage 2: Data Updates (Tasks 3 \& 4)

&#x20;Stage 3: Data Deletion (Tasks 5 \& 6)

&#x20;Stage 4: Table Removal (Tasks 7 \& 8)





&#x20;**Errors I Faced \& Solutions**

Error 1: The "Parent-Child" Conflict

Message: Could not drop object because it is referenced by a FOREIGN KEY constraint.

The Problem: I tried to delete a "Parent" (Department) while a "Child" (Employee) was still linked to it.

The Simple Solution: Always delete the Child table first, then the Parent.

\------------------------------------------------------------------------------

Error 2: The "Missing Column" Error

Message: Invalid column name 'Salary'.

The Problem: I tried to update a column before the table was fully created or because of a typo.

The Simple Solution: I used the GO command to separate my code into steps. This ensures Step 1 (Create) is finished before Step 2 (Update) starts.

\---------------------------------------------------------------------------------

Error 3: The "Duplicate Table" Error

Message: There is already an object named 'Departments'.

The Problem: I tried to create a table that already existed.

The Simple Solution: I added DROP TABLE IF EXISTS at the start of my code. This "cleans the slate" every time I run the script.

\---------------------------------------------------------------------------------------

**Important Lessons** 

\-The Hierarchy Rule: Always handle "Child" tables (those with Foreign Keys) before "Parent" tables when deleting or dropping.

\-No "Unfiltered" Updates: Never run an UPDATE or DELETE without a WHERE clause to avoid wiping the entire database.

\-The "Orphan" Check: I learned how to check for "Ghost" or Orphan records. I wrote tests to make sure my Orphan Check always returns 0.





&#x20;**What I Learned??**

Safety First: How to delete data without breaking the database.

Clean Code: Using IF EXISTS to prevent errors.

Testing: Writing simple queries to double-check my work.

Relationships: How to link different tables together using Keys.



By: Jawaher



