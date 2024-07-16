CREATE TABLE Class(
    classID   INT AUTO_INCREMENT PRIMARY KEY,
    className VARCHAR(60) NOT NULL,
    startDate DATE        NOT NULL,
    status    BIT
);
CREATE TABLE Student(
    studentId   INT AUTO_INCREMENT PRIMARY KEY,
    studentName VARCHAR(255) NOT NULL,
    address     VARCHAR(255),
    phone       VARCHAR(255),
    status      BIT,
    classId     INT,
    FOREIGN KEY (classId) REFERENCES Class(classID)
);
CREATE TABLE Subject(
    subId   INT AUTO_INCREMENT PRIMARY KEY,
    subName VARCHAR(30) NOT NULL,
    credit  INT DEFAULT 1 CHECK(credit >= 1),
    status  BIT           DEFAULT 1
);
CREATE TABLE Mark(
    markId    INT AUTO_INCREMENT PRIMARY KEY,
    subjectId INT,
    FOREIGN KEY (subjectId) REFERENCES Subject(subId),
    studentId INT,
    FOREIGN KEY (studentId) REFERENCES Student (studentId),
    mark DOUBLE DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
    examTimes INT DEFAULT 1  
);

insert into Class (className,startDate,status) values 
('12A1','2020-01-15',0),
('12A2','2020-01-15',1),
('12A3','2020-01-15',0),
('12A4','2020-01-15',1)
;

INSERT INTO Student (studentName, address, phone, status, classId) VALUES
('John Doe', '123 Main St', '555-1234', 1, 1),
('Jane Smith', '456 Elm St', '555-5678', 1, 2),
('Alice Johnson', '789 Oak St', '555-9101', 0, 3),
('Bob Brown', '101 Maple St', '555-1122', 1, 4);

INSERT INTO Subject (subName, credit, status) VALUES
('Algebra', 3, 1),
('Biology', 4, 1),
('World History', 2, 1),
('English Literature', 3, 1);

INSERT INTO Mark (subjectId, studentId, mark, examTimes) VALUES
(1, 1, 85.5, 1),
(2, 2, 90.0, 1),
(3, 3, 75.0, 2),
(4, 4, 88.0, 1),
(1, 2, 78.5, 1),
(2, 3, 82.0, 1),
(3, 4, 67.0, 1),
(4, 1, 92.0, 1);


select * from class;

select * from Mark;

-- find column student in student
SELECT studentName … FROM Student; 

-- find every student in student where status = 1;
select * from student where status = 1;
