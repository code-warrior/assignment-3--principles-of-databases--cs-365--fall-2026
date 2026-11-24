-- Enable the display of warnings after every statement
\W

DROP DATABASE IF EXISTS `ceta_faculty`;
CREATE DATABASE IF NOT EXISTS `ceta_faculty` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;

USE ceta_faculty;

SOURCE _01--session_variables.sql
SOURCE _02--faculty.sql;
SOURCE _03--phone.sql;
SOURCE _04--room.sql;
SOURCE _05--program.sql;
SOURCE _06--faculty_phone.sql;
SOURCE _07--faculty_room.sql;
SOURCE _08--faculty_program.sql;
SOURCE _09--indexes.sql;
