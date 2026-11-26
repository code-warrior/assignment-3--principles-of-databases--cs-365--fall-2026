-- Enable the display of warnings after every statement
\W

DROP DATABASE IF EXISTS `ceta_faculty`;
CREATE DATABASE IF NOT EXISTS `ceta_faculty`
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

USE ceta_faculty;

-- Load the original database tables
SOURCE _01--session_variables.sql;
SOURCE _02--faculty.sql;

-- Correct Alan Hadad's department
UPDATE faculty
SET department = 'A & S - Math'
WHERE email = 'hadad';

SOURCE _03--phone.sql;
SOURCE _04--room.sql;
SOURCE _05--program.sql;

-- Create and populate the relationship tables
SOURCE _06--faculty_phone.sql;
SOURCE _07--faculty_room.sql;
SOURCE _08--faculty_program.sql;
