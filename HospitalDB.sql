-- RESET ENVIRONMENT (Task 8: Table Removal)
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Doctors;
GO

-- RE-CREATE TABLES
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Gender VARCHAR(10)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Specialty VARCHAR(50)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
GO

-- TASK 2: DATA INSERTION (Hospital)
INSERT INTO Patients (PatientID, Name, Age, Gender) VALUES 
(1, 'Said Al-Saadi', 45, 'Male'),
(2, 'Zakia Al-Harthy', 30, 'Female'),
(3, 'Fahad Al-Balushi', 12, 'Male'),
(4, 'Maryam Al-Kindi', 65, 'Female'),
(5, 'Adnan Al-Farsi', 28, 'Male'), 
(6, 'Asma Al-Qasmi', 34, 'Female');

INSERT INTO Doctors (DoctorID, Name, Specialty) VALUES 
(10, 'Dr. Nasser', 'Cardiology'),
(11, 'Dr. Hanan', 'Pediatrics'),
(12, 'Dr. Sami', 'Dermatology'),
(13, 'Dr. Noor', 'General Medicine');

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, Date) VALUES 
(1001, 1, 10, '2026-06-01'),
(1002, 1, 12, '2026-06-05'), 
(1003, 2, 13, '2026-06-02'),
(1004, 3, 11, '2026-06-03'),
(1005, 4, 10, '2026-06-04'),
(1006, 5, 12, '2026-06-06'),
(1007, 6, 13, '2026-06-07'),
(1008, 2, 11, '2026-06-08');

GO

-- TASK 4: DATA UPDATE 
UPDATE Patients SET Age = 46 WHERE PatientID = 1;
UPDATE Doctors SET Specialty = 'General Surgery' WHERE DoctorID = 13;
UPDATE Appointments SET Date = '2026-06-15' WHERE AppointmentID = 1001;
UPDATE Patients SET Name = 'Asma Al-Qasmiya' WHERE PatientID = 6; -- Spelling correction
UPDATE Appointments SET DoctorID = 13 WHERE AppointmentID = 1006; -- Reassign
GO

-- TASK 6: DATA DELETION 
DELETE FROM Appointments WHERE PatientID = 5;
DELETE FROM Patients WHERE PatientID = 5;

-- Remove doctor
DELETE FROM Appointments WHERE DoctorID = 12;
DELETE FROM Doctors WHERE DoctorID = 12;

DELETE FROM Appointments WHERE AppointmentID = 1004; -- Canceled
DELETE FROM Appointments WHERE DoctorID = 10; -- Clear all Cardio appts
GO

SELECT P.Name, A.Date, D.Name AS Doctor
FROM Patients P
JOIN Appointments A ON P.PatientID = A.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID
WHERE P.PatientID = 1;

-- TEST --Task4
-- Dr. Noor (13) should now be 'General Surgery'
SELECT Name, Specialty FROM Doctors WHERE DoctorID = 13;

-- TEST 6: for  (Task 6)
-- This should return 0 results because Patient 5 and Doctor 12 were deleted
SELECT COUNT(*) AS Deleted_Records_Found 
FROM Patients WHERE PatientID = 5
UNION ALL
SELECT COUNT(*) FROM Doctors WHERE DoctorID = 12;
GO

-- TASK 8: TABLE REMOVAL 
-- Drop Appointments first (Dependency)
DROP TABLE IF EXISTS Appointments;
-- Final cleanup of module
DROP TABLE IF EXISTS Patients;

GO