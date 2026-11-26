
-- Remove the existing relationship table if it exists
DROP TABLE IF EXISTS `faculty_room`;

-- Create a relationship between faculty members and office rooms
CREATE TABLE IF NOT EXISTS `faculty_room` (

  -- Email uniquely identifies a faculty member
  `faculty_email` VARCHAR(128) NOT NULL,

  -- Room ID identifies an office in the room table
  `room_id` SMALLINT NOT NULL,

  -- Prevent duplicate faculty and room assignments
  PRIMARY KEY (`faculty_email`, `room_id`),

  -- Each faculty member can have only one assigned office
  UNIQUE KEY `uq_faculty_room_faculty` (`faculty_email`),

  -- Index room IDs to support searches by office
  -- Multiple faculty members may share the same office
  KEY `idx_faculty_room_id` (`room_id`),

  -- Connect the relationship to the faculty table
  -- Remove office assignments when a faculty member is deleted
  -- Update assignments if the faculty email changes
  CONSTRAINT `fk_faculty_room_faculty`
    FOREIGN KEY (`faculty_email`)
    REFERENCES `faculty` (`email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

  -- Connect the relationship to the room table
  -- Prevent deleting a room while it is assigned
  -- Update assignments if the room ID changes
  CONSTRAINT `fk_faculty_room_room`
    FOREIGN KEY (`room_id`)
    REFERENCES `room` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE

-- Use InnoDB to support foreign keys and cascading
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


-- Assign faculty members to their offices
-- Room IDs are taken from the room table
-- Office locations are based on the CETA Faculty & Staff Phone List
-- Professor Agboola's office is D310A, as specified in the README
-- The two deAlmeida records share the office listed for Michael deAlmeida
-- Jing Yang is assigned UT240 based on the README example
-- Somaye Seddighikhavidak is assigned UT220 based on the README example

INSERT INTO `faculty_room`
(`faculty_email`, `room_id`)
VALUES
-- Computing Sciences
(@jung, 25),        -- Andrew Jung - D217
(@mingjun, 119),    -- Mingjun Li - UT302G
(@vanegas, 31),     -- Roy Vanegas - D310B
(@agboola, 30),     -- Olusola Agboola - D310A
(@bensaoud, 127),   -- Ahmed Bensaoud - UT304D
(@rosiene, 42),     -- Carolyn Pe Rosiene - D335
(@russell, 45),     -- Ingrid Russell - D343
(@tayeen, 41),      -- Abu Tayeen - D333

-- Architecture
(@assasi, 3),       -- Reza Assasi - ABR108
(@bambury, 67),     -- Jill Bambury - HJG W205B
(@crosbie, 66),     -- Michael Crosbie - HJG W205A
(@danesh, 69),      -- Mehdi Danesh - HJG W205D
(@davis, 70),       -- Daniel Davis - HJG W205E
(@jerhil, 4),       -- Jeremy Hill - ABR110
(@horowitz, 69),    -- Dan Horowitz - HJG W205D
(@sawruk, 67),      -- Theodore Sawruk - HJG W205B
(@seddighikhavidak, 92), -- Somaye Seddighikhavidak - UT220

-- Civil, Environmental, and Biomedical Engineering
(@asaki, 115),      -- Takafumi Asaki - UT302C
(@fang, 103),       -- Clara Fang - UT232
(@keshawarz, 105),  -- Saleh Keshawarz - UT234
(@miar, 125),       -- Solaleh Miar - UT304B
(@moon, 130),       -- Seong Hyun Moon - UT304G
(@pines, 102),      -- David Pines - UT231
(@sussmann, 107),   -- Ted Sussmann - UT236
(@wang, 128),       -- Song Wang - UT304E
(@yyang, 131),      -- Yang Yang - UT304J

-- Electrical and Computer Engineering
(@aisheh, 99),      -- Akram Abu-aisheh - UT228
(@alnajjar, 84),    -- Hisham Alnajjar - UT205
(@cetaaudio, 110),  -- Michael deAlmeida - UT239
(@dealmeida, 110),  -- Michael deAlmeida - UT239
(@hill, 104),       -- Krista Hill - UT233
(@dongbin, 129),    -- Dongbin Kim - UT304F
(@qisi, 94),        -- Qisi Liu - UT222
(@mahanta, 93),     -- Ashish Mahanta - UT221
(@mellodge, 124),   -- Patricia Mellodge - UT304A
(@moslehpour, 123), -- Saeid Moslehpour - UT302M
(@raphael, 131),    -- Johanna Raphael - UT304J
(@shen, 95),        -- Xin Shen - UT223
(@shertukde, 117),  -- Hemchandra Shertukde - UT302E
(@shuman, 96),      -- David Shuman - UT224
(@smith, 108),      -- Keshawn Smith - UT237
(@sohn, 109),       -- Kiwon Sohn - UT238
(@yu, 97),         -- Ying Yu - UT225

-- Mechanical, Aerospace, and Acoustical Engineering
(@ahmar, 113),      -- Rudy Al Ahmar - UT302A
(@campana, 120),    -- Claudio Campana - UT302H
(@canistraro, 118), -- Howard Canistraro - UT302F
(@ghosh, 101),      -- Suhash Ghosh - UT230
(@jasinski, 126),   -- Christopher Jasinski - UT304C
(@milanovic, 98),   -- Ivana Milanovic - UT226
(@obst, 122),       -- Enrico Obst - UT302J
(@park, 114),       -- Olivia Park - UT302B
(@sahay, 100),      -- Chittaranjan Sahay - UT229
(@slaboch, 121),    -- Paul Slaboch - UT302I
(@tatoglu, 106),    -- Akin Tatoglu - UT235
(@yang, 111),    -- Jing Yang - UT240
(@yavuzturk, 132),  -- Cy Yavuzturk - UT304H

-- A & S - Math
(@hadad, 116);      -- Alan Hadad - UT302D

