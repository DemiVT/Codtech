-- Create Tables

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(15)
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    course_code VARCHAR(20) UNIQUE,
    credits INT
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert Sample Data

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) 
VALUES 
    ('John', 'Doe', '2002-05-15', 'john.doe@example.com', '555-1234'),
    ('Jane', 'Smith', '2003-08-22', 'jane.smith@example.com', '555-5678');

INSERT INTO Courses (course_name, course_code, credits)
VALUES 
    ('Introduction to Programming', 'CS101', 3),
    ('Database Systems', 'CS102', 4),
    ('Data Structures', 'CS103', 3);

INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade)
VALUES 
    (1, 1, '2024-08-20', 'A'),
    (2, 2, '2024-08-21', 'B');

-- Basic SQL Commands

-- Retrieve all students
SELECT * FROM Students;

-- Insert a new student
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('Alice', 'Johnson', '2004-03-17', 'alice.johnson@example.com', '555-7890');

-- Update student email
UPDATE Students
SET email = 'new.email@example.com'
WHERE student_id = 1;

-- Delete a student
DELETE FROM Students
WHERE email = 'jane.smith@example.com';

-- Retrieve all courses
SELECT * FROM Courses;

-- Add a new course
INSERT INTO Courses (course_name, course_code, credits)
VALUES ('Computer Networks', 'CS104', 3);

-- Update course credits
UPDATE Courses
SET credits = 4
WHERE course_code = 'CS101';

-- Delete a course
DELETE FROM Courses
WHERE course_code = 'CS102';

-- Retrieve all enrollments
SELECT * FROM Enrollments;

-- Enroll a student in a course
INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade)
VALUES (2, 3, '2024-09-01', 'A');

-- Update student grade
UPDATE Enrollments
SET grade = 'A+'
WHERE enrollment_id = 1;

-- Delete an enrollment
DELETE FROM Enrollments
WHERE enrollment_id = 2;

-- Join Students, Courses, and Enrollments to retrieve detailed records
SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;
