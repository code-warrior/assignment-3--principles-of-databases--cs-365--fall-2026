
-- Remove the existing relationship table if it exists
DROP TABLE IF EXISTS `faculty_phone`;

-- Create a relationship between faculty members and phone extensions
CREATE TABLE IF NOT EXISTS `faculty_phone` (
  -- Email uniquely identifies a faculty member
  `faculty_email` VARCHAR(128) NOT NULL,

  -- Extension identifies a phone number
  `phone_extension` SMALLINT NOT NULL,

  -- Prevent duplicate faculty and phone assignments
  PRIMARY KEY (`faculty_email`, `phone_extension`),

  -- Each faculty member can have only one phone extension
  UNIQUE KEY `uq_faculty_phone_faculty` (`faculty_email`),

  -- Each phone extension can be assigned to only one faculty member
  UNIQUE KEY `uq_faculty_phone_extension` (`phone_extension`),

  -- Connect the relationship to the faculty table
  CONSTRAINT `fk_faculty_phone_faculty`
    FOREIGN KEY (`faculty_email`)
    REFERENCES `faculty` (`email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

  -- Connect the relationship to the phone table
  CONSTRAINT `fk_faculty_phone_phone`
    FOREIGN KEY (`phone_extension`)
    REFERENCES `phone` (`extension`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE

-- Use InnoDB to enforce foreign key relationships
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- Populate the faculty_phone relationship table using the
-- CETA Faculty & Staff Phone List F2026 and assignment requirements.

-- The faculty table contains 57 records, including two records
-- for Michael deAlmeida with different email identifiers.

-- Assign extension 4758 to Michael deAlmeida's dealmeida record.
-- Each phone extension can be assigned to only one faculty record.

-- Assign extension 4044 to Jing Yang as shown in the
-- expected output for Question 4.

-- Fahimen Yavartanoo appears in the provided phone list,
-- but does not have a matching record in the faculty table.
-- Therefore, no phone relationship is created.

-- Assign extension 4502 to Professor Agboola as required
-- for the deletion and phone deactivation task.

-- Faculty email identifiers are defined in
-- _01--session_variables.sql.

-- Foreign keys ensure that faculty members and phone extensions
-- exist in their corresponding parent tables.

INSERT INTO `faculty_phone`
  (`faculty_email`, `phone_extension`)
VALUES
  (@aisheh, 5479),        -- Akram Abu-aisheh
  (@agboola, 4502),       -- Otusola Agboola
  (@ahmar, 4681),         -- Rudy Al Ahmar
  (@alnajjar, 5015),      -- Hisham Alnajjar
  (@asaki, 4185),         -- Takafumi Asaki
  (@assasi, 4931),        -- Reza Assasi
  (@bambury, 5953),       -- Jill Bambury
  (@bensaoud, 5481),      -- Ahmed Bensaoud
  (@campana, 4629),       -- Claudio Campana
  (@canistraro, 5358),    -- Howard Canistraro
  (@crosbie, 4755),       -- Michael Crosbie
  (@danesh, 5074),        -- Mehdi Danesh
  (@davis, 4094),         -- Daniel Davis
  (@dealmeida, 4758),     -- Michael deAlmeida
  (@fang, 4845),          -- Clara Fang
  (@ghosh, 5523),         -- Suhash Ghosh
  (@hadad, 4308),         -- Alan Hadad
  (@hill, 5086),          -- Krista Hill
  (@jerhil, 4947),        -- Jeremy Hill
  (@horowitz, 4764),      -- Dan Horowitz
  (@jasinski, 4323),      -- Christopher Jasinski
  (@jung, 4917),          -- Andrew Jung
  (@keshawarz, 4032),     -- Saleh Keshawarz
  (@dongbin, 5808),       -- Dongbin Kim
  (@mingjun, 5420),       -- Mingjun Li
  (@qisi, 4859),          -- Qisi Liu
  (@mahanta, 4866),       -- Ashish Mahanta
  (@mellodge, 5334),      -- Patricia Mellodge
  (@miar, 4224),          -- Solaleh Miar
  (@milanovic, 4325),     -- Ivana Milanovic
  (@moon, 4763),          -- Seong Hyun Moon
  (@moslehpour, 4211),    -- Saeid Moslehpour
  (@obst, 4112),          -- Enrico Obst
  (@park, 4366),          -- Olivia Park
  (@pines, 4560),         -- David Pines
  (@raphael, 4864),       -- Johanna Raphael
  (@rosiene, 4699),       -- Carolyn Rosiene
  (@russell, 4191),       -- Ingrid Russell
  (@sahay, 4852),         -- Chittaranjan Sahay
  (@sawruk, 5763),        -- Theodore Sawruk
  (@seddighikhavidak, 4614), -- Somaye Seddighikhavidak
  (@shen, 5563),          -- Xin Shen
  (@shertukde, 4847),     -- Hemchandra Shertukde
  (@shuman, 5483),        -- David Shuman
  (@slaboch, 4869),       -- Paul Slaboch
  (@smith, 4846),         -- Keshawn Smith
  (@sohn, 4894),          -- Kiwon Sohn
  (@sussmann, 4615),      -- Ted Sussmann
  (@tatoglu, 4591),       -- Akin Tatoglu
  (@tayeen, 4104),        -- Abu Tayeen
  (@vanegas, 5925),       -- Roy Vanegas
  (@wang, 4855),          -- Song Wang
  (@yyang, 4316),         -- Yang Yang
  (@yavuzturk, 5554),     -- Cy Yavuzturk
  (@yu, 4752),            -- Ying Yu
  (@yang, 4044);       -- Jing Yang
