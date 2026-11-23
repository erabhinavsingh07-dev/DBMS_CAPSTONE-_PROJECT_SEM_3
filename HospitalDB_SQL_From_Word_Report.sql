-- SQL statements copied from the SQL code sections in the Word report.
-- Hospital Management System | HospitalDB
-- Run only if you need to recreate the database and its data.

-- SQL block 1
CREATE DATABASE HospitalDB;

-- SQL block 2
USE HospitalDB;

-- SQL block 3
SHOW TABLES;

-- SQL block 4
CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- SQL block 5
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15),
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES Department(department_id)
);

-- SQL block 6
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(15),
    address VARCHAR(200),
    blood_group VARCHAR(5)
);

-- SQL block 7
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_datetime DATETIME,
    status VARCHAR(30),

    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id),

    FOREIGN KEY (doctor_id)
    REFERENCES Doctor(doctor_id)
);

-- SQL block 8
CREATE TABLE Bed (
    bed_id INT PRIMARY KEY AUTO_INCREMENT,
    department_id INT NOT NULL,
    bed_number VARCHAR(20) NOT NULL,
    availability VARCHAR(20),

    FOREIGN KEY (department_id)
    REFERENCES Department(department_id)
);

-- SQL block 9
CREATE TABLE Admission (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    bed_id INT NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE,

    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id),

    FOREIGN KEY (bed_id)
    REFERENCES Bed(bed_id)
);

-- SQL block 10
CREATE TABLE Medical_History (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    diagnosis VARCHAR(200),
    history_date DATE,

    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id)
);

-- SQL block 11
CREATE TABLE Treatment (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    treatment_details VARCHAR(500),

    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id),

    FOREIGN KEY (doctor_id)
    REFERENCES Doctor(doctor_id)
);

-- SQL block 12
CREATE TABLE Surgery (
    surgery_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    department_id INT NOT NULL,
    surgery_date DATE,

    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id),

    FOREIGN KEY (doctor_id)
    REFERENCES Doctor(doctor_id),

    FOREIGN KEY (department_id)
    REFERENCES Department(department_id)
);

-- SQL block 13
SHOW TABLES;

-- SQL block 14
DESC Admission;

-- SQL block 15
DESC Bed;

-- SQL block 16
DESC Medical_History;

-- SQL block 17
DESC Treatment;

-- SQL block 18
DESC Surgery;

-- SQL block 19
INSERT INTO Department
(department_name, location)
VALUES
('Cardiology', 'First Floor'),
('Neurology', 'Second Floor'),
('Orthopedics', 'Third Floor'),
('General Medicine', 'Ground Floor'),
('ENT', 'Fourth Floor');

-- SQL block 20
INSERT INTO Doctor
(doctor_name, specialization, phone, department_id)
VALUES
('Dr. Rahul', 'Heart Specialist', '9876543210', 1),
('Dr. Amit', 'Neurologist', '9876543211', 2),
('Dr. Neha', 'Orthopedic', '9876543212', 3),
('Dr. Priya', 'General Physician', '9876543213', 4),
('Dr. Karan', 'ENT Specialist', '9876543214', 5);

-- SQL block 21
INSERT INTO Patients
(patient_name, gender, date_of_birth, phone, address, blood_group)
VALUES
('Riya Sharma', 'Female', '2002-05-12', '9876543215', 'Delhi', 'B+'),
('Aman Kumar', 'Male', '2000-08-20', '9876543216', 'Palwal', 'O+'),
('Priya Singh', 'Female', '1998-03-15', '9876543217', 'Gurgaon', 'A+'),
('Rahul Verma', 'Male', '1995-11-25', '9876543218', 'Faridabad', 'AB+'),
('Sneha Gupta', 'Female', '2001-07-10', '9876543219', 'Delhi', 'O-');

-- SQL block 22
INSERT INTO Bed
(department_id, bed_number, availability)
VALUES
(1, 'C101','Occupied'),
(1, 'C102', 'Occupied'),
(2, 'N101', 'Available'),
(3, 'O101', 'Occupied'),
(4, 'G101', 'Available');

-- SQL block 23
INSERT INTO Appointment
(patient_id, doctor_id, appointment_datetime, status)
VALUES
(1, 1, '2026-11-08 10:00:00', 'Scheduled'),
(2, 2, '2026-11-08 11:00:00', 'Completed'),
(3, 3, '2026-11-09 12:00:00', 'Scheduled'),
(4, 4, '2026-11-09 13:00:00', 'Completed'),
(5, 5, '2026-11-10 14:00:00', 'Scheduled');

-- SQL block 24
INSERT INTO Admission
(patient_id, bed_id, admission_date, discharge_date)
VALUES
(1, 2, '2026-11-01', NULL),
(2, 4, '2026-11-02', '2026-11-05'),
(3, 1, '2026-11-03', NULL),
(4, 5, '2026-11-04', '2026-11-06');

-- SQL block 25
INSERT INTO Medical_History
(patient_id, diagnosis, history_date)
VALUES
(1, 'Heart Disease', '2026-11-01'),
(2, 'Migraine', '2026-11-02'),
(3, 'Bone Fracture', '2026-11-03'),
(4, 'Fever', '2026-11-04'),
(5, 'Ear Infection', '2026-11-05');

-- SQL block 26
INSERT INTO Treatment
(patient_id, doctor_id, treatment_details)
VALUES
(1, 1, 'Cardiac Monitoring'),
(2, 2, 'Migraine Medication'),
(3, 3, 'Fracture Treatment'),
(4, 4, 'Fever Medication'),
(5, 5, 'Ear Infection Treatment');

-- SQL block 27
INSERT INTO Surgery
(patient_id, doctor_id, department_id, surgery_date)
VALUES
(1, 1, 1, '2026-11-12'),
(2, 2, 2, '2026-11-13'),
(3, 3, 3, '2026-11-14');

-- SQL block 28
SELECT * FROM Department;

-- SQL block 29
SELECT * FROM Doctor;

-- SQL block 30
SELECT * FROM Patients;

-- SQL block 31
SELECT * FROM Bed;

-- SQL block 32
SELECT * FROM Appointment;

-- SQL block 33
SELECT * FROM Admission;

-- SQL block 34
SELECT * FROM Medical_History;

-- SQL block 35
SELECT * FROM Treatment;

-- SQL block 36
SELECT * FROM Surgery;

-- SQL block 37
SELECT COUNT(*) AS Total_Departments FROM Department;

-- SQL block 38
SELECT COUNT(*) AS Total_Doctors FROM Doctor;

-- SQL block 39
SELECT COUNT(*) AS Total_Patients FROM Patients;

-- SQL block 40
SELECT COUNT(*) AS Total_Beds FROM Bed;

-- SQL block 41
SELECT COUNT(*) AS Total_Appointments FROM Appointment;

-- SQL block 42
SELECT COUNT(*) AS Total_Admissions FROM Admission;

-- SQL block 43
SELECT COUNT(*) AS Total_History FROM Medical_History;

-- SQL block 44
SELECT COUNT(*) AS Total_Treatments FROM Treatment;

-- SQL block 45
SELECT COUNT(*) AS Total_Surgeries FROM Surgery;

-- SQL block 46
SELECT * FROM Patients
WHERE gender = 'Female';

-- SQL block 47
SELECT
    Doctor.doctor_name,
    Doctor.specialization,
    Department.department_name
FROM Doctor
INNER JOIN Department
ON Doctor.department_id = Department.department_id;

-- SQL block 48
SELECT
    Patients.patient_name,
    Doctor.doctor_name,
    Appointment.appointment_datetime,
    Appointment.status
FROM Appointment
INNER JOIN Patients
ON Appointment.patient_id = Patients.patient_id
INNER JOIN Doctor
ON Appointment.doctor_id = Doctor.doctor_id;

-- SQL block 49
SELECT COUNT(*) AS Total_Patients
FROM Patients;

-- SQL block 50
SELECT
    Department.department_name,
    COUNT(Doctor.doctor_id) AS Total_Doctors
FROM Department
LEFT JOIN Doctor
ON Department.department_id = Doctor.department_id
GROUP BY Department.department_name;

-- SQL block 51
SELECT
    Patients.patient_name,
    Admission.admission_date,
    Bed.bed_number
FROM Admission
INNER JOIN Patients
ON Admission.patient_id = Patients.patient_id
INNER JOIN Bed
ON Admission.bed_id = Bed.bed_id
WHERE Admission.discharge_date IS NULL;

-- SQL block 52
SELECT
    Patients.patient_name,
    Medical_History.diagnosis,
    Medical_History.history_date
FROM Patients
INNER JOIN Medical_History
ON Patients.patient_id = Medical_History.patient_id;

-- SQL block 53
SELECT
    status,
    COUNT(*) AS Total
FROM Appointment
GROUP BY status;

-- SQL block 54
SELECT
    Doctor.doctor_name,
    COUNT(Appointment.appointment_id) AS Total_Appointments
FROM Doctor
LEFT JOIN Appointment
ON Doctor.doctor_id = Appointment.doctor_id
GROUP BY Doctor.doctor_id, Doctor.doctor_name
HAVING COUNT(Appointment.appointment_id) > 0;

-- SQL block 55
SELECT *
FROM Patients
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 25;

-- SQL block 56
SELECT *
FROM Doctor
WHERE doctor_id IN (
    SELECT doctor_id
    FROM Appointment
);

-- SQL block 57
SELECT *
FROM Patients
WHERE patient_id IN (
    SELECT patient_id
    FROM Appointment
);

-- SQL block 58
SELECT
    d.doctor_name,
    COUNT(a.appointment_id) AS Total_Appointments
FROM Doctor d
LEFT JOIN Appointment a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name
HAVING COUNT(a.appointment_id) > (
    SELECT AVG(appointment_count)
    FROM (
        SELECT COUNT(appointment_id) AS appointment_count
        FROM Appointment
        GROUP BY doctor_id
    ) AS Doctor_Counts
);

-- SQL block 59
SELECT *
FROM Patients
WHERE patient_id NOT IN (
    SELECT patient_id
    FROM Admission
);

-- SQL block 60
SELECT
    p.patient_name,
    a.admission_date,
    b.bed_number
FROM Patients p
JOIN Admission a
ON p.patient_id = a.patient_id
JOIN Bed b
ON a.bed_id = b.bed_id
WHERE a.discharge_date IS NULL;

-- SQL block 61
SELECT
    d.department_name,
    b.bed_number,
    b.availability
FROM Bed b
JOIN Department d
ON b.department_id = d.department_id
WHERE b.availability = 'Available';

-- SQL block 62
SELECT
    p.patient_name,
    d.doctor_name,
    s.surgery_date
FROM Surgery s
JOIN Patients p
ON s.patient_id = p.patient_id
JOIN Doctor d
ON s.doctor_id = d.doctor_id
ORDER BY s.surgery_date;

-- SQL block 63
SELECT
    d.department_name,
    COUNT(a.admission_id) AS Total_Admissions
FROM Department d
JOIN Bed b
ON d.department_id = b.department_id
JOIN Admission a
ON b.bed_id = a.bed_id
GROUP BY d.department_id, d.department_name;

-- SQL block 64
CREATE INDEX idx_admission_patient_date
ON Admission(patient_id, admission_date);

-- SQL block 65
CREATE INDEX idx_appointment_doctor_date
ON Appointment(doctor_id, appointment_datetime);

-- SQL block 66
SHOW INDEX FROM Admission;

-- SQL block 67
SHOW INDEX FROM Appointment;

-- SQL block 68
EXPLAIN
SELECT *
FROM Appointment
WHERE doctor_id = 1;

-- SQL block 69
CREATE OR REPLACE VIEW Current_Patients AS
SELECT
    p.patient_id,
    p.patient_name,
    a.admission_date,
    b.bed_number
FROM Patients p
JOIN Admission a
ON p.patient_id = a.patient_id
JOIN Bed b
ON a.bed_id = b.bed_id
WHERE a.discharge_date IS NULL;

-- SQL block 70
SELECT * FROM Current_Patients;

-- SQL block 71
CREATE OR REPLACE VIEW Front_Desk_View AS
SELECT
    p.patient_id,
    p.patient_name,
    p.phone,
    a.appointment_datetime,
    a.status
FROM Patients p
JOIN Appointment a
ON p.patient_id = a.patient_id;

-- SQL block 72
SELECT * FROM Front_Desk_View;

-- SQL block 73
SELECT
    d.doctor_name,
    COUNT(a.appointment_id) AS Total_Appointments,
    DENSE_RANK() OVER (
        ORDER BY COUNT(a.appointment_id) DESC
    ) AS Doctor_Rank
FROM Doctor d
LEFT JOIN Appointment a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name;

-- SQL block 74
SELECT
    doctor_id,
    COUNT(*) AS Total_Appointments,
    AVG(COUNT(*)) OVER () AS Average_Appointments
FROM Appointment
GROUP BY doctor_id;

-- SQL block 75
SELECT
    patient_id,
    appointment_datetime,
    LAG(appointment_datetime) OVER (
        PARTITION BY patient_id
        ORDER BY appointment_datetime
    ) AS Previous_Appointment
FROM Appointment;

-- SQL block 76
SELECT
    patient_id,
    appointment_datetime,
    LEAD(appointment_datetime) OVER (
        PARTITION BY patient_id
        ORDER BY appointment_datetime
    ) AS Next_Appointment
FROM Appointment;
