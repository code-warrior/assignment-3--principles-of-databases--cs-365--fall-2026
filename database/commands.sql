-- 1. Unique names of all faculty members and their departments, ordered by department
SELECT DISTINCT CONCAT(first_name, ' ', last_name) AS `Name`, department AS `Department`
FROM faculty
ORDER BY department, `Name`;

-- 2. Names, department, and office locations of all Computing Sciences faculty, by name
SELECT CONCAT(f.first_name, ' ', f.last_name) AS `Name`,
       f.department AS `Department`,
       CONCAT(r.building, ' ', r.number) AS `Location`
FROM faculty AS f
  INNER JOIN faculty_room AS fr ON fr.email = f.email
  INNER JOIN room AS r ON r.id = fr.room_id
WHERE f.department = 'Computing Sciences'
ORDER BY `Name`;

-- 3. Names, department, office location, and extension of all Computing Sciences faculty, by name
SELECT CONCAT(f.first_name, ' ', f.last_name) AS `Name`,
       f.department AS `Department`,
       CONCAT(r.building, ' ', r.number) AS `Location`,
       fp.extension AS `Extension`
FROM faculty AS f
  INNER JOIN faculty_room AS fr ON fr.email = f.email
  INNER JOIN room AS r ON r.id = fr.room_id
  INNER JOIN faculty_phone AS fp ON fp.email = f.email
WHERE f.department = 'Computing Sciences'
ORDER BY `Name`;

-- 4. Faculty whose offices are on the second floor of the United Technologies building
SELECT DISTINCT CONCAT(f.first_name, ' ', f.last_name) AS `Name`,
       f.department AS `Department`,
       CONCAT(r.building, ' ', r.number) AS `Location`,
       fp.extension AS `Extension`
FROM room AS r
  INNER JOIN faculty_room AS fr ON fr.room_id = r.id
  INNER JOIN faculty AS f ON f.email = fr.email
  INNER JOIN faculty_phone AS fp ON fp.email = f.email
WHERE r.building = 'UT' AND r.number LIKE '2%'
ORDER BY `Department`, `Location`;

-- 5. Faculty members who direct programs, ordered by program
SELECT DISTINCT CONCAT(f.first_name, ' ', f.last_name) AS `Faculty`,
       '' AS `...directs...`,
       CONCAT(p.name, ' (', p.department, ')') AS `Program (Department)`
FROM program AS p
  INNER JOIN faculty_program AS fp ON fp.program_id = p.id
  INNER JOIN faculty AS f ON f.email = fp.email
ORDER BY `Program (Department)`;

-- 6. Faculty who are assistant, associate, or full professors, ordered by rank
SELECT CONCAT(first_name, ' ', last_name) AS `Faculty`,
       `rank` AS `Rank`
FROM faculty
WHERE `rank` IN ('Assistant Professor', 'Associate Professor', 'Professor')
ORDER BY `rank`;

-- 7. Agboola has left; Li moves from UT 302G into D 310A; deactivate extension 4502

-- Before
SELECT CONCAT(f.first_name, ' ', f.last_name) AS `Name`,
       f.department AS `Department`,
       CONCAT(r.building, ' ', r.number) AS `Location`,
       fp.extension AS `Extension`
FROM faculty AS f
  INNER JOIN faculty_room AS fr ON fr.email = f.email
  INNER JOIN room AS r ON r.id = fr.room_id
  INNER JOIN faculty_phone AS fp ON fp.email = f.email
WHERE f.department = 'Computing Sciences'
ORDER BY `Name`;

SELECT extension, IF(is_active, 'TRUE', 'FALSE') AS `is_active`
FROM phone
WHERE extension = 4502;

-- Deactivate Agboola's extension (must happen before deleting him)
UPDATE phone
SET is_active = FALSE
WHERE extension = (SELECT extension FROM faculty_phone WHERE email = 'agboola');

-- Remove Agboola (cascades to faculty_phone, faculty_room, faculty_program)
DELETE FROM faculty
WHERE email = 'agboola';

-- Move Li from UT 302G to D 310A
UPDATE faculty_room
SET room_id = (SELECT id FROM room WHERE building = 'D' AND number = '310A')
WHERE email = 'minli'
  AND room_id = (SELECT id FROM room WHERE building = 'UT' AND number = '302G');

-- After
SELECT CONCAT(f.first_name, ' ', f.last_name) AS `Name`,
       f.department AS `Department`,
       CONCAT(r.building, ' ', r.number) AS `Location`,
       fp.extension AS `Extension`
FROM faculty AS f
  INNER JOIN faculty_room AS fr ON fr.email = f.email
  INNER JOIN room AS r ON r.id = fr.room_id
  INNER JOIN faculty_phone AS fp ON fp.email = f.email
WHERE f.department = 'Computing Sciences'
ORDER BY `Name`;

SELECT extension, IF(is_active, 'TRUE', 'FALSE') AS `is_active`
FROM phone
WHERE extension = 4502;
