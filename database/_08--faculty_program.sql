DROP TABLE IF EXISTS `faculty_program`;

CREATE TABLE IF NOT EXISTS `faculty_program` (
  `email`      VARCHAR(128) NOT NULL,
  `program_id` SMALLINT     NOT NULL,

  PRIMARY KEY (email, program_id),

  FOREIGN KEY (email) REFERENCES faculty (email)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

  FOREIGN KEY (program_id) REFERENCES program (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO `faculty_program`
(email, program_id)
VALUES
(@jasinski, 1),    -- Acoustical Engineering and Music Program
(@slaboch, 2),     -- Aerospace Engineering
(@cetaaudio, 3),   -- Audio Engineering
(@dealmeida, 3),   -- Audio Engineering
(@tatoglu, 4),     -- Autonomous Mobile Robotics Group
(@asaki, 5),       -- Biomedical Engineering
(@shen, 6),        -- Computer and Electronic Engineering Technology
(@moslehpour, 7),  -- Computer Engineering
(@horowitz, 8),    -- Master of Arts in Architecture
(@tayeen, 9),      -- Masters Program in Computing Sciences
(@sohn, 10);       -- Robotics Engineering
