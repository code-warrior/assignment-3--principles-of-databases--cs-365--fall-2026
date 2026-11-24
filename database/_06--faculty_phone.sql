DROP TABLE IF EXISTS `faculty_phone`;

CREATE TABLE IF NOT EXISTS `faculty_phone` (
  `email`     VARCHAR(128) NOT NULL,
  `extension` SMALLINT     NOT NULL,

  PRIMARY KEY (email),

  FOREIGN KEY (email) REFERENCES faculty (email)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

  FOREIGN KEY (extension) REFERENCES phone (extension)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO `faculty_phone`
(email, extension)
VALUES
(@aisheh, 5479),
(@agboola, 4502),
(@ahmar, 4681),
(@alnajjar, 5005),
(@asaki, 4185),
(@assasi, 4931),
(@bambury, 5953),
(@bensaoud, 5481),
(@campana, 4629),
(@canistraro, 5358),
(@crosbie, 4755),
(@danesh, 5074),
(@davis, 4094),
(@cetaaudio, 4758),
(@dealmeida, 4758),
(@fang, 4845),
(@ghosh, 5523),
(@hadad, 4308),
(@hill, 5086),
(@jerhil, 4947),
(@horowitz, 5085),
(@jasinski, 4323),
(@jung, 4917),
(@keshawarz, 4032),
(@dongbin, 5808),
(@mingjun, 5420),
(@qisi, 4859),
(@mahanta, 4866),
(@mellodge, 5334),
(@miar, 4224),
(@milanovic, 4325),
(@moon, 4763),
(@moslehpour, 4211),
(@obst, 4112),
(@park, 4366),
(@pines, 4560),
(@raphael, 4864),
(@rosiene, 4699),
(@russell, 4191),
(@sahay, 4852),
(@sawruk, 5763),
(@seddighikhavidak, 4614),
(@shen, 5563),
(@shertukde, 4847),
(@shuman, 5483),
(@slaboch, 4869),
(@smith, 4846),
(@sohn, 4894),
(@sussmann, 4615),
(@tatoglu, 4591),
(@tayeen, 4104),
(@vanegas, 5925),
(@wang, 4855),
(@yang, 4044),
(@yyang, 4316),
(@yavuzturk, 5554),
(@yu, 4752);
