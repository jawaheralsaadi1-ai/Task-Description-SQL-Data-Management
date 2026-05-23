# **SQL Data Management**



# **SQL INSERT , UPDATE, DELETE and DROP TABLE Practice Task**



# 

# **Project Overview:** Company Data Management System

# This project demonstrates how to build and manage a business database from scratch. It focuses on the Company Management System, which handles the relationships between employees, their departments, and the projects they work on.

# 

# The project covers the entire Database Lifecycle: Resetting the system, building tables, adding data, updating records, and safely deleting information.

# 

# &#x20;**Main Tables**

# \-Departments: The core organizational structure (IT, HR, Finance).

# \-Employee: Personnel data including salaries and supervisors.

# \-Projects: Specific tasks linked to different departments.

# \-Location: Regional tracking for different departments.

# 

# &#x20;**Errors I Faced \& Solutions**

# **Error 1:** The "Parent-Child" Conflict

# **Message:** Could not drop object because it is referenced by a FOREIGN KEY constraint.

# **The Problem**: I tried to delete a "Parent" (Department) while a "Child" (Employee) was still linked to it.

# **The Simple Solution:** Always delete the Child table first, then the Parent.

# \---------------------------------------------------------------------------------

# **Error 2:** The "Missing Column" Error

# **Message:** Invalid column name 'Salary'.

# **The Problem:** I tried to update a column before the table was fully created or because of a typo.

# **The Simple Solution:** I used the GO command to separate my code into steps. This ensures Step 1 (Create) is finished before Step 2 (Update) starts.

# \-------------------------------------------------------------------------------

# **Error 3:** The "Duplicate Table" Error

# **Message**: There is already an object named 'Departments'.

# **The Problem:** I tried to create a table that already existed.

# Th**e Simple Solution:** I added DROP TABLE IF EXISTS at the start of my code. This "cleans the slate" every time I run the script.

# 

# **Important Discoveries**

# **1. No "Boolean" in SQL Server**

# learned that SQL Server doesn't use True or False. Instead, it uses the BIT type:

# 

# **2. The "Orphan" Check**

# I learned how to check for "Ghost" or Orphan records. This happens when a child (Employee) is left without a home (Department). I wrote tests to make sure my Orphan\_Check always returns 0.

# 

# **What I Learned?**

# \-Safety First: How to delete data without breaking the database.

# \-Clean Code: Using IF EXISTS to prevent errors.

# \-Testing: Writing simple queries to double-check my work.

# \-Relationships: How to link different tables together using Primary and Foreign Keys.

# 

# By: Jawaher

# 

