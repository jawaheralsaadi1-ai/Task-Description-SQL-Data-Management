
USE CompanyDB;

-- Remove a temporary or backup table
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Departments;

GO
--  Setup Tables 

    CREATE TABLE Departments (
    Dnum INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL UNIQUE,
    Hire_Date DATE,
    Manager_SSN INT );

CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    FNAME VARCHAR(25) NOT NULL,
    LNAME VARCHAR(25) NOT NULL,
    GENDER VARCHAR(10),
    BD DATE,
    DNUM INT,
    Salary DECIMAL(10, 2),
    Superid INT);

    CREATE TABLE Location (
    Dnum INT NOT NULL,
    Location VARCHAR(100),
    PRIMARY KEY (Dnum, Location) );

    CREATE TABLE Projects (
    Pnum INT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    City VARCHAR(100),
    Location VARCHAR(100),
    Dnum INT NOT NULL);

 --Task 1: Data Insertion 
INSERT INTO Departments (Dnum, Dname, Hire_Date, Manager_SSN) VALUES 
(1, 'IT', '2020-01-15', 101),
(2, 'HR', '2019-05-10', 104),
(3, 'Financial', '2018-03-20', 106),
(4, 'Marketing', '2021-02-01', 108),
(5, 'Logistics', '2017-11-12', 109);


INSERT INTO Employee ( SSN, FNAME,  LNAME, GENDER, BD, DNUM, Salary, Superid ) VALUES 
(101, 'Ahmed', 'Al-Farsi', 'Male', '1985-04-12', 1, 2500.00, NULL),
(102, 'Sarah', 'Al-Hamdi', 'Female', '1992-08-25', 1, 1800.00, 101),
(103, 'Jasim', 'Al-sody', 'Male', '1990-12-01', 1, 1750.00, 101),
(104, 'Noura', 'Al-Said', 'Female', '1988-01-30', 2, 2200.00, NULL),
(105, 'Emman', 'Al-Nabai', 'Female', '1995-06-15', 2, 1400.00, 104),
(106, 'Khalid', 'Al-Hassani', 'Male', '1982-11-20', 3, 2300.00, NULL),
(107, 'Hamed', 'Al-Hamadani', 'Male', '1989-03-05', 3, 1600.00, 106),
(108, 'Muna', 'Al-Balushi', 'Female', '1993-07-10', 4, 2100.00, NULL),
(109, 'Rashid', 'Al-Kamali', 'Male', '1980-09-18', 5, 1950.00, NULL),
(110, 'Fatma', 'Al-Saadi', 'Female', '1994-02-22', 5, 1300.00, 109);

INSERT INTO Projects (Pnum, Pname, City, Location, Dnum) VALUES 
(501, 'Duqm Refinery', 'Duqm', 'Al Wusta', 1), 
(502, 'Al Mouj Muscat', 'Muscat', 'Al Mouj', 2),
(503, 'Salalah City', 'Salalah', 'Dhofar', 3),
(504, 'Nizwa Center', 'Nizwa', 'Ad Dakhiliyah', 4),
(505, 'Sohar Industrial Port', 'Sohar', 'Al Batinah', 5);

INSERT INTO Location (Dnum, Location) VALUES 
(1, 'Muscat '),
(2, 'Sohar '),
(3, 'Muscat '),
(4, 'Nizwa '),
(5, 'Salalah');

--Task 3 Data Update
UPDATE Employee SET Salary = Salary * 1.10 WHERE DNUM = 1;--Increase salary by 10%
UPDATE Departments SET Dname = 'Finance & Accounting' WHERE Dnum = 3; --Change department name
UPDATE Employee SET Salary = 1800.00 WHERE SSN = 101;-- Correct a wrong salary
UPDATE Projects SET Pname = 'Duqm Strategic Refinery' WHERE Pnum = 501;--Update project name
UPDATE Employee SET DNUM = 2 WHERE SSN = 102;--Assign employee to different dept

-- Task 5 Data Deletion
-- Delete an employee by EmployeeID (SSN)
DELETE FROM Employee 
WHERE SSN = 103;
-- Remove employees from a specific department
DELETE FROM Employee 
WHERE DNUM = 4;
-- Delete a project that is no longer active
DELETE FROM Projects 
WHERE Pnum = 505;
-- Delete employees with a salary below a specific value
DELETE FROM Employee 
WHERE Salary < 1400.00;

--  Remove a department (Safe Deletion)
DELETE FROM Employee WHERE DNUM = 5; -- Step A: Clear employees in that dept
DELETE FROM Departments WHERE Dnum = 5; -- Step B: Delete the department
 
-- TEST 1: Check Record Counts (Verification of Deletions)
SELECT 'Employee Count' as Test, COUNT(*) as Result FROM Employee
UNION ALL
SELECT 'Department Count', COUNT(*) FROM Departments;

-- TEST 2: Verify specific updates
SELECT FNAME, Salary FROM Employee WHERE SSN = 101; -- Should be 1800.00
SELECT Dname FROM Departments WHERE Dnum = 3;       -- Should be Finance & Accounting

-- TEST 3: Integrity Check (Ensure no employees are in Dnum 4 or 5)
SELECT COUNT(*) AS Orphan_Check FROM Employee WHERE DNUM IN (4, 5); -- Should be 0
GO


--Task 7 - Table Removal 
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Departments;
