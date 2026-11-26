
-- ============================================================
-- Faculty and Program Relationship Table
-- CS365 - Assignment 3
--
-- Connects faculty members to the special programs
-- they direct.
--
-- Faculty records are identified by their email usernames.
-- Programs are identified by their numeric IDs.
-- ============================================================

-- Remove the relationship table if it already exists
-- This allows the setup script to be run again
DROP TABLE IF EXISTS `faculty_program`;

-- Create the relationship between faculty and programs
CREATE TABLE IF NOT EXISTS `faculty_program` (

    -- Email username of the faculty member
    `faculty_email` VARCHAR(128) NOT NULL,

    -- ID of the special program
    `program_id` SMALLINT NOT NULL,

    -- Prevent duplicate faculty-program assignments
    PRIMARY KEY (`faculty_email`, `program_id`),

    -- Each program has one assigned director
    UNIQUE KEY `uq_faculty_program_id` (`program_id`),

    -- Link the assignment to an existing faculty member
    -- Automatically remove assignments if faculty is deleted
    CONSTRAINT `fk_faculty_program_faculty`
        FOREIGN KEY (`faculty_email`)
        REFERENCES `faculty` (`email`)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    -- Link the assignment to an existing program
    -- Prevent deleting programs that still have a director
    CONSTRAINT `fk_faculty_program_program`
        FOREIGN KEY (`program_id`)
        REFERENCES `program` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- ============================================================
-- Assign faculty directors to the 10 special programs
--
-- Program IDs match the existing program table.
-- Faculty variables are defined in _01--session_variables.sql.
-- Assignments follow Question 5 in the assignment README.
-- ============================================================

INSERT INTO `faculty_program`
    (`faculty_email`, `program_id`)
VALUES
    (@jasinski, 1),    -- Christopher Jasinski - Acoustical Engineering and Music
    (@slaboch, 2),     -- Paul Slaboch - Aerospace Engineering
    (@dealmeida, 3),   -- Michael deAlmeida - Audio Engineering
    (@tatoglu, 4),     -- Akin Tatoglu - Autonomous Mobile Robotics Group
    (@asaki, 5),       -- Takafumi Asaki - Biomedical Engineering
    (@shen, 6),        -- Xin Shen - Computer and Electronic Engineering Technology
    (@moslehpour, 7),  -- Saeid Moslehpour - Computer Engineering
    (@horowitz, 8),    -- Dan Horowitz - Master of Arts in Architecture
    (@tayeen, 9),      -- Abu Tayeen - Masters Program in Computing Sciences
    (@sohn, 10);       -- Kiwon Sohn - Robotics Engineering
