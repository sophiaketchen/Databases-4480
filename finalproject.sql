DROP TABLE StudentAssignments CASCADE CONSTRAINTS;
DROP TABLE Assignment CASCADE CONSTRAINTS;
DROP TABLE Enrollment CASCADE CONSTRAINTS;
DROP TABLE GradePercent CASCADE CONSTRAINTS;
DROP TABLE Courses CASCADE CONSTRAINTS;
DROP TABLE GradeScale CASCADE CONSTRAINTS;
DROP TABLE Student CASCADE CONSTRAINTS;
DROP TABLE Teacher CASCADE CONSTRAINTS;

create table Student (
StudentID VARCHAR2(4) Primary Key Not NULL,
Name VARCHAR2(50) Not NULL
);

create table Teacher (
TeacherID VARCHAR2(4) Primary Key Not NULL,
Name VARCHAR2(50) Not NULL
);

create table Courses (
CourseID VARCHAR2(6) Primary Key Not NULL,
Department VARCHAR2(20) Not NULL,
CourseNumber VARCHAR2(10) NOT NULL, 
Name VARCHAR2(50) Not NULL, 
Semester VARCHAR2(20) Not NULL, 
CourseYear VARCHAR2(4) NOT NULL,
TeacherID VARCHAR2(4) Not NULL, 
Foreign Key (TeacherID) references Teacher(TeacherID)
);

create table GradePercent (
CategoryID VARCHAR2(6) Primary Key Not NULL,
CourseID VARCHAR2(6) Not NULL, 
CategoryName VARCHAR2(20) Not NULL,
Percentage DECIMAL(5,2) Not NULL,
Foreign Key (CourseID) references Courses(CourseID),
Unique (CategoryName, CourseID)
);

create table GradeScale (
ScaleID VARCHAR2(6) Primary Key Not NULL,
TeacherID VARCHAR2(4) Not NULL, 
LetterGrade VARCHAR2(2) Not NULL,
Foreign Key (TeacherID) references Teacher(TeacherID),
MinPercent DECIMAL(5,2) Not NULL, 
MaxPercent DECIMAL(5,2) Not NULL
);

create table Enrollment (
EnrollmentID VARCHAR2(6) Primary Key Not NULL,
StudentID VARCHAR2(4) Not NULL,
CourseID VARCHAR2(6) Not NULL, 
Foreign Key (StudentID) references Student(StudentID),
Foreign Key (CourseID) references Courses(CourseID),
Unique (StudentID, CourseID)
);

create table Assignment (
AssignmentID VARCHAR2(6) Primary Key Not NULL,
AssignmentName VARCHAR2(50) Not NULL,
PointsPossible DECIMAL(5,2) Not NULL,
CourseID VARCHAR2(6) Not NULL, 
CategoryID VARCHAR2(6) Not NULL,
Foreign Key (CourseID) references Courses(CourseID),
Foreign Key (CategoryID) references GradePercent(CategoryID)
);

create table StudentAssignments (
AssignmentID VARCHAR2(6) Not NULL,
StudentID VARCHAR2(4) Not NULL,
PointsEarned DECIMAL(6,2) Not NULL,
Foreign Key (StudentID) references Student(StudentID), 
Foreign Key (AssignmentID) references Assignment(AssignmentID),
Primary Key (StudentID, AssignmentID)
);

INSERT INTO Teacher VALUES ('T001', 'Professor Safko');
INSERT INTO Teacher VALUES ('T002', 'Professor Joyce');
 
INSERT INTO Student VALUES ('S001', 'Patrick McCormack');
INSERT INTO Student VALUES ('S002', 'Sophia Ketchen');
INSERT INTO Student VALUES ('S003', 'John Miller');
INSERT INTO Student VALUES ('S004', 'Emma Davis');
INSERT INTO Student VALUES ('S005', 'Michael Brown');
 
INSERT INTO Courses VALUES ('C001', 'CSC', '4480', 'Database Systems', 'Spring', '2026', 'T001');
INSERT INTO Courses VALUES ('C002', 'CSC', '2405', 'Computer Systems', 'Spring', '2026', 'T001');
INSERT INTO Courses VALUES ('C003', 'MAT', '2400', 'Linear Algebra', 'Spring', '2026', 'T002');
 
INSERT INTO GradePercent VALUES ('G001', 'C001', 'Participation', 10.00);
INSERT INTO GradePercent VALUES ('G002', 'C001', 'Homework', 20.00);
INSERT INTO GradePercent VALUES ('G003', 'C001', 'Tests', 50.00);
INSERT INTO GradePercent VALUES ('G004', 'C001', 'Project', 20.00);
 
INSERT INTO GradePercent VALUES ('G005', 'C002', 'Participation', 10.00);
INSERT INTO GradePercent VALUES ('G006', 'C002', 'Homework', 30.00);
INSERT INTO GradePercent VALUES ('G007', 'C002', 'Tests', 40.00);
INSERT INTO GradePercent VALUES ('G008', 'C002', 'Project', 20.00);
 
INSERT INTO GradePercent VALUES ('G009', 'C003', 'Participation', 10.00);
INSERT INTO GradePercent VALUES ('G010', 'C003', 'Homework', 25.00);
INSERT INTO GradePercent VALUES ('G011', 'C003', 'Tests', 45.00);
INSERT INTO GradePercent VALUES ('G012', 'C003', 'Project', 20.00);
 
INSERT INTO GradeScale VALUES ('SC001', 'T001', 'A',  93.00, 100.00);
INSERT INTO GradeScale VALUES ('SC002', 'T001', 'A-', 90.00, 92.99);
INSERT INTO GradeScale VALUES ('SC003', 'T001', 'B+', 87.00, 89.99);
INSERT INTO GradeScale VALUES ('SC004', 'T001', 'B',  83.00, 86.99);
INSERT INTO GradeScale VALUES ('SC005', 'T001', 'C',  70.00, 79.99);
 
INSERT INTO GradeScale VALUES ('SC006', 'T002', 'A',  93.00, 100.00);
INSERT INTO GradeScale VALUES ('SC007', 'T002', 'A-', 90.00, 92.99);
INSERT INTO GradeScale VALUES ('SC008', 'T002', 'B+', 87.00, 89.99);
INSERT INTO GradeScale VALUES ('SC009', 'T002', 'B',  83.00, 86.99);
INSERT INTO GradeScale VALUES ('SC010', 'T002', 'C',  70.00, 79.99);
 
INSERT INTO Enrollment VALUES ('E001', 'S001', 'C001');
INSERT INTO Enrollment VALUES ('E002', 'S002', 'C001');
INSERT INTO Enrollment VALUES ('E003', 'S003', 'C001');
INSERT INTO Enrollment VALUES ('E004', 'S004', 'C002');
INSERT INTO Enrollment VALUES ('E005', 'S005', 'C003');
 
INSERT INTO Assignment VALUES ('A001', 'Participation Grade', 100.00, 'C001', 'G001');
INSERT INTO Assignment VALUES ('A002', 'Homework 1',          100.00, 'C001', 'G002');
INSERT INTO Assignment VALUES ('A003', 'Test 1',              100.00, 'C001', 'G003');
INSERT INTO Assignment VALUES ('A004', 'Final Project',       100.00, 'C001', 'G004');
 
INSERT INTO Assignment VALUES ('A005', 'Participation Grade', 100.00, 'C002', 'G005');
INSERT INTO Assignment VALUES ('A006', 'Homework 1',          100.00, 'C002', 'G006');
INSERT INTO Assignment VALUES ('A007', 'Test 1',              100.00, 'C002', 'G007');
INSERT INTO Assignment VALUES ('A008', 'Final Project',       100.00, 'C002', 'G008');
 
INSERT INTO Assignment VALUES ('A009', 'Participation Grade', 100.00, 'C003', 'G009');
INSERT INTO Assignment VALUES ('A010', 'Homework 1',          100.00, 'C003', 'G010');
INSERT INTO Assignment VALUES ('A011', 'Test 1',              100.00, 'C003', 'G011');
INSERT INTO Assignment VALUES ('A012', 'Final Project',       100.00, 'C003', 'G012');
 
INSERT INTO StudentAssignments VALUES ('A001', 'S001', 100.00);
INSERT INTO StudentAssignments VALUES ('A002', 'S001', 92.00);
INSERT INTO StudentAssignments VALUES ('A003', 'S001', 90.00);
INSERT INTO StudentAssignments VALUES ('A004', 'S001', 95.00);
 
INSERT INTO StudentAssignments VALUES ('A001', 'S002', 95.00);
INSERT INTO StudentAssignments VALUES ('A002', 'S002', 88.00);
INSERT INTO StudentAssignments VALUES ('A003', 'S002', 86.00);
INSERT INTO StudentAssignments VALUES ('A004', 'S002', 91.00);
 
INSERT INTO StudentAssignments VALUES ('A001', 'S003', 90.00);
INSERT INTO StudentAssignments VALUES ('A002', 'S003', 82.00);
INSERT INTO StudentAssignments VALUES ('A003', 'S003', 80.00);
INSERT INTO StudentAssignments VALUES ('A004', 'S003', 85.00);
 
INSERT INTO StudentAssignments VALUES ('A005', 'S004', 95.00);
INSERT INTO StudentAssignments VALUES ('A006', 'S004', 87.00);
INSERT INTO StudentAssignments VALUES ('A007', 'S004', 84.00);
INSERT INTO StudentAssignments VALUES ('A008', 'S004', 90.00);
 
INSERT INTO StudentAssignments VALUES ('A009', 'S005', 100.00);
INSERT INTO StudentAssignments VALUES ('A010', 'S005', 94.00);
INSERT INTO StudentAssignments VALUES ('A011', 'S005', 89.00);
INSERT INTO StudentAssignments VALUES ('A012', 'S005', 93.00);
 
SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Courses;
SELECT * FROM GradePercent;
SELECT * FROM Assignment;
SELECT * FROM StudentAssignments;
 
SELECT * FROM Student
WHERE Name = 'Patrick McCormack';
 
UPDATE StudentAssignments
SET PointsEarned = 96.00
WHERE StudentID    = 'S001'
AND   AssignmentID = 'A004';
 
SELECT * FROM StudentAssignments
WHERE StudentID    = 'S001'
AND   AssignmentID = 'A004';
 
SELECT 
    S.StudentID,
    S.Name,
    C.Name AS CourseName,
    SUM((SA.PointsEarned / A.PointsPossible) * GP.Percentage) AS FinalGrade
FROM Student S, Enrollment E, Courses C,
     StudentAssignments SA, Assignment A, GradePercent GP
WHERE S.StudentID     = E.StudentID
AND   E.CourseID      = C.CourseID
AND   S.StudentID     = SA.StudentID
AND   SA.AssignmentID = A.AssignmentID
AND   A.CategoryID    = GP.CategoryID
AND   A.CourseID      = C.CourseID
GROUP BY S.StudentID, S.Name, C.Name
ORDER BY FinalGrade DESC;
