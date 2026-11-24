DROP TABLE IF EXISTS `faculty_room`;

CREATE TABLE IF NOT EXISTS `faculty_room` (
  `email`   VARCHAR(128) NOT NULL,
  `room_id` SMALLINT     NOT NULL,

  PRIMARY KEY (email, room_id),

  FOREIGN KEY (email) REFERENCES faculty (email)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

  FOREIGN KEY (room_id) REFERENCES room (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO `faculty_room`
(email, room_id)
VALUES
(@aisheh, 99),            -- UT 228
(@agboola, 30),           -- D 310A
(@ahmar, 113),            -- UT 302A
(@alnajjar, 84),          -- UT 205
(@asaki, 115),            -- UT 302C
(@assasi, 3),             -- ABR 108
(@bambury, 67),           -- HJG W205B
(@bensaoud, 127),         -- UT 304D
(@campana, 120),          -- UT 302H
(@canistraro, 118),       -- UT 302F
(@crosbie, 66),           -- HJG W205A
(@danesh, 69),            -- HJG W205D
(@davis, 70),             -- HJG W205E
(@cetaaudio, 110),        -- UT 239
(@dealmeida, 110),        -- UT 239
(@fang, 103),             -- UT 232
(@ghosh, 101),            -- UT 230
(@hadad, 116),            -- UT 302D
(@hill, 104),             -- UT 233
(@jerhil, 4),             -- ABR 110
(@horowitz, 68),          -- HJG W205C
(@jasinski, 126),         -- UT 304C
(@jung, 25),              -- D 217
(@keshawarz, 105),        -- UT 234
(@dongbin, 129),          -- UT 304F
(@mingjun, 119),          -- UT 302G
(@qisi, 94),              -- UT 222
(@mahanta, 93),           -- UT 221
(@mellodge, 124),         -- UT 304A
(@miar, 125),             -- UT 304B
(@milanovic, 98),         -- UT 226
(@moon, 130),             -- UT 304G
(@moslehpour, 123),       -- UT 302M
(@obst, 122),             -- UT 302J
(@park, 114),             -- UT 302B
(@pines, 102),            -- UT 231
(@raphael, 131),          -- UT 304J
(@rosiene, 42),           -- D 335
(@russell, 45),           -- D 343
(@sahay, 100),            -- UT 229
(@sawruk, 72),            -- HJG W205H
(@seddighikhavidak, 92),  -- UT 220
(@shen, 95),              -- UT 223
(@shertukde, 117),        -- UT 302E
(@shuman, 96),            -- UT 224
(@slaboch, 121),          -- UT 302I
(@smith, 108),            -- UT 237
(@sohn, 109),             -- UT 238
(@sussmann, 107),         -- UT 236
(@tatoglu, 106),          -- UT 235
(@tatoglu, 112),          -- UT 243
(@tayeen, 41),            -- D 333
(@vanegas, 31),           -- D 310B
(@wang, 128),             -- UT 304E
(@yang, 111),             -- UT 240
(@yyang, 133),            -- UT 304I
(@yavuzturk, 132),        -- UT 304H
(@yu, 97);                -- UT 225
