DROP TABLE IF EXISTS `faculty`;

CREATE TABLE IF NOT EXISTS `faculty` (
  `first_name`  VARCHAR(32)  NOT NULL,
  `middle_name` VARCHAR(32)  DEFAULT NULL,
  `last_name`   VARCHAR(32)  NOT NULL,
  `department`  VARCHAR(128) NOT NULL,
  `rank`        VARCHAR(160) NOT NULL,
  `added_role`  VARCHAR(24)  DEFAULT NULL,
  `email`       VARCHAR(128) NOT NULL,

  PRIMARY KEY (email)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- Index department for faculty searches and filtering
CREATE INDEX idx_faculty_department
    ON faculty (department);

-- Index rank for professor rank filtering and grouping
CREATE INDEX idx_faculty_rank
    ON faculty (`rank`);

INSERT INTO `faculty`
(`first_name`, `last_name`, `department`, `rank`, `email`)
VALUES
('Akram', 'Abu-aisheh', @ece, @prof, @aisheh),
('Olusola', 'Agboola', @cs, @vis_asst_prof, @agboola),
('Rudy', 'Al Ahmar', @maae, @asst_prof, @ahmar),
('Reza', 'Assasi', @arch, @asst_prof, @assasi),
('Jill', 'Bambury', @arch, @ass_prof, @bambury),
('Ahmed', 'Bensaoud', @cs, @asst_prof, @bensaoud),
('Claudio', 'Campana', @maae, @app_ass_prof, @campana),
('Howard', 'Canistraro', @maae, @ass_prof, @canistraro),
('Michael', 'Crosbie', @arch, @prof, @crosbie),
('Daniel', 'Davis', @arch, @prof, @davis),
('Michael', 'deAlmeida', @ece, @app_asst_prof, @cetaaudio),
('Michael', 'deAlmeida', @ece, @app_asst_prof, @dealmeida),
('Suhash', 'Ghosh', @maae, @ass_prof, @ghosh),
('Alan', 'Hadad', 'A & S — Math', @prof, @hadad),
('Krista', 'Hill', @ece, @ass_prof, @hill),
('Jeremy', 'Hill', @arch, @ass_prof, @jerhil),
('Dan', 'Horowitz', @arch, @app_asst_prof, @horowitz),
('Christopher', 'Jasinski', @maae, @ass_prof, @jasinski),
('Dongbin', 'Kim', @ece, @asst_prof, @dongbin),
('Mingjun', 'Li', @cs, @asst_prof, @mingjun),
('Qisi', 'Liu', @ece, @asst_prof, @qisi),
('Ashish', 'Mahanta', @ece, @ass_prof, @mahanta),
('Patricia', 'Mellodge', @ece, @ass_prof, @mellodge),
('Solaleh', 'Miar', @ceb, @asst_prof, @miar),
('Ivana', 'Milanovic', @maae, @prof, @milanovic),
('Seong Hyun', 'Moon', @ceb, @prof, @moon),
('Enrico', 'Obst', @maae, @lect, @obst),
('David', 'Pines', @ceb, @prof, @pines),
('Johanna', 'Raphael', @ece, @asst_prof, @raphael),
('Carolyn', 'Pe Rosiene', @cs, @prof, @rosiene),
('Ingrid', 'Russell', @cs, @prof, @russell),
('Chittaranjan', 'Sahay', @maae, @prof, @sahay),
('Theodore', 'Sawruk', @arch, @ass_prof, @sawruk),
('Somaye', 'Seddighikhavidak', @arch, @asst_prof, @seddighikhavidak),
('Xin', 'Shen', @ece, @asst_prof, @shen),
('Hemchandra', 'Shertukde', @ece, @prof, @shertukde),
('David', 'Shuman', @ece, @app_asst_prof, @shuman),
('Kiwon', 'Sohn', @ece, @asst_prof, @sohn),
('Keshawn', 'Smith', @ece, @vis_ass_prof, @smith),
('Ted', 'Sussmann', @ceb, @ass_prof, @sussmann),
('Abu', 'Tayeen', @cs, @asst_prof, @tayeen),
('Roy', 'Vanegas', @cs, @asst_prof, @vanegas),
('Song', 'Wang', @ceb, @asst_prof, @wang),
('Jing', 'Yang', @maae, @vis_ass_prof, @yang),
('Yang', 'Yang', @ceb, @prof, @yyang),
('Cy', 'Yavuzturk', @maae, @prof, @yavuzturk),
('Yu', 'Ying', @ece, @ass_prof, @yu);

INSERT INTO `faculty`
(`first_name`, `middle_name`, `last_name`, `department`, `rank`, `email`)
VALUES
('Olivia', 'Heui Young', 'Park', @maae, @asst_prof, @park),
('Saleh', 'M', 'Keshawarz', @ceb, @prof, @keshawarz);

INSERT INTO `faculty`
(`first_name`, `last_name`, `department`, `rank`, `added_role`, `email`)
VALUES
('Andrew', 'Jung', @cs, @ass_prof, @chair, @jung),
('Mehdi', 'Danesh', @arch, @asst_prof, @ass_chair, @danesh),
('Hisham', 'Alnajjar',@ece, @prof, 'Dean', @alnajjar),
('Takafumi', 'Asaki', @ceb, @ass_prof, @ass_dean, @asaki),
('Clara', 'Fang', @ceb, @prof, @chair, @fang),
('Saeid', 'Moslehpour', @ece, @prof, @chair, @moslehpour),
('Paul', 'Slaboch', @maae, @ass_prof, @chair, @slaboch),
('Akin', 'Tatoglu', @maae, @prof, @ass_dean, @tatoglu);
