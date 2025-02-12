--Setup database
/*use master;
go
create database Language_App
on
( name=lang_data,
filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\langdat.mdf',
size=10,
maxsize=50,
filegrowth=5)
log on
(name=lang_log,
filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\langlog.mdf',
size=5MB,
maxsize=25MB,
filegrowth=5MB);*/

use Language_App;
/*-- Create Language Table
CREATE TABLE Language (
    Lang_ID INT PRIMARY KEY IDENTITY(1,1),
    Lang_name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255)
);

-- Create Student Table
CREATE TABLE Student (
    Stud_ID INT PRIMARY KEY IDENTITY(1,1),
    Stud_name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(15),
    Grade_level INT
);

-- Create Lesson Table
CREATE TABLE Lesson (
    Lesson_ID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Content NVARCHAR(MAX),
    Lang_ID INT NOT NULL,
    FOREIGN KEY (Lang_ID) REFERENCES Language(Lang_ID) ON DELETE CASCADE
);

-- Create Quiz Table
CREATE TABLE Quiz (
    Quiz_ID INT PRIMARY KEY IDENTITY(1,1),
    Question NVARCHAR(MAX) NOT NULL,
    Correct_answer NVARCHAR(255) NOT NULL
);

-- Junction Table: Student enrolls in Language
CREATE TABLE StudentLanguage (
    Stud_ID INT NOT NULL,
    Lang_ID INT NOT NULL,
    EnrollmentDate DATE DEFAULT GETDATE(),
    PRIMARY KEY (Stud_ID, Lang_ID),
    FOREIGN KEY (Stud_ID) REFERENCES Student(Stud_ID) ON DELETE CASCADE,
    FOREIGN KEY (Lang_ID) REFERENCES Language(Lang_ID) ON DELETE CASCADE
);

-- Junction Table: Lessons have Quizzes
CREATE TABLE LessonQuiz (
    Lesson_ID INT NOT NULL,
    Quiz_ID INT NOT NULL,
    PRIMARY KEY (Lesson_ID, Quiz_ID),
    FOREIGN KEY (Lesson_ID) REFERENCES Lesson(Lesson_ID) ON DELETE CASCADE,
    FOREIGN KEY (Quiz_ID) REFERENCES Quiz(Quiz_ID) ON DELETE CASCADE
);
*/
--DML
/*
INSERT INTO Language (Lang_name, Description)
VALUES
('English', 'Learn the basics and advanced English language skills.'),
('Spanish', 'Master the Spanish language, from greetings to grammar.'),
('French', 'Explore the beauty of the French language.');

INSERT INTO Student (Stud_name, Email, Password, Phone, Grade_level)
VALUES
('Alice Johnson', 'alice@example.com', 'password123', '1234567890', 10),
('Bob Smith', 'bob@example.com', 'securepass', '9876543210', 12),
('Charlie Brown', 'charlie@example.com', 'mypassword', '4561237890', 11);

INSERT INTO Lesson (Title, Content, Lang_ID)
VALUES
('Introduction to English', 'This lesson covers the basics of English.', 1),
('Advanced English Grammar', 'Learn complex grammar rules in English.', 1),
('Basic Spanish Vocabulary', 'Master essential words and phrases.', 2),
('French Pronunciation', 'Learn how to pronounce French words.', 3);

INSERT INTO Quiz (Question, Correct_answer)
VALUES
('What is the past tense of "run"?', 'ran'),
('Translate "hello" to Spanish.', 'hola'),
('How do you say "thank you" in French?', 'merci');

INSERT INTO StudentLanguage (Stud_ID, Lang_ID)
VALUES
(1, 1), -- Alice enrolled in English
(1, 2), -- Alice enrolled in Spanish
(2, 1), -- Bob enrolled in English
(3, 3); -- Charlie enrolled in French

INSERT INTO LessonQuiz (Lesson_ID, Quiz_ID)
VALUES
(1, 1), -- English Introduction lesson has a quiz
(3, 2), -- Spanish Vocabulary lesson has a quiz
(4, 3); -- French Pronunciation lesson has a quiz
*/
select*
from Language
where Lang_name = 'English';
/*
SELECT L.Lang_name, LS.Title
FROM Language L
JOIN Lesson LS ON L.Lang_ID = LS.Lang_ID;
/*
SELECT S.Stud_name, L.Lang_name
FROM Student S
JOIN StudentLanguage SL ON S.Stud_ID = SL.Stud_ID
JOIN Language L ON SL.Lang_ID = L.Lang_ID;

SELECT LS.Title, Q.Question
FROM Lesson LS
JOIN LessonQuiz LQ ON LS.Lesson_ID = LQ.Lesson_ID
JOIN Quiz Q ON LQ.Quiz_ID = Q.Quiz_ID;
*/