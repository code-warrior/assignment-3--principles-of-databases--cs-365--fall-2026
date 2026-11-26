USE ceta_faculty;
-- ==========================================================
-- Question 1
-- Display unique faculty names and their departments
-- Order the results by department
-- ==========================================================

SELECT DISTINCT
    CONCAT_WS(' ', first_name, middle_name, last_name) AS Name,
    department AS Department
FROM faculty
ORDER BY Department, Name;

-- ==========================================================
-- Question 2
-- Display Computing Sciences faculty and office locations
-- Sort faculty members alphabetically by name
-- ==========================================================

SELECT
    CONCAT_WS(' ', f.first_name, f.middle_name, f.last_name) AS Name,
    f.department AS Department,
    CONCAT(r.building, ' ', r.number) AS Location
FROM faculty AS f
JOIN faculty_room AS fr
    ON f.email = fr.faculty_email
JOIN room AS r
    ON fr.room_id = r.id
WHERE f.department = 'Computing Sciences'
ORDER BY Name;

-- ==========================================================
-- Question 3
-- Display the names, departments, office locations,
-- and phone extensions of Computing Sciences faculty.
-- Sort the results alphabetically by faculty name.
-- ==========================================================

SELECT
    CONCAT_WS(' ', f.first_name, f.middle_name, f.last_name) AS Name,
    f.department AS Department,
    CONCAT(r.building, ' ', r.number) AS Location,
    p.extension AS Extension
FROM faculty AS f

-- Connect each faculty member to their assigned office
JOIN faculty_room AS fr
    ON f.email = fr.faculty_email

-- Get the office building and room number
JOIN room AS r
    ON fr.room_id = r.id

-- Connect each faculty member to their phone extension
JOIN faculty_phone AS fp
    ON f.email = fp.faculty_email

-- Get the extension from the phone table
JOIN phone AS p
    ON fp.phone_extension = p.extension

-- Include only Computing Sciences faculty
WHERE f.department = 'Computing Sciences'

-- Sort alphabetically by full name
ORDER BY Name;

-- ==========================================================
-- Question 4
-- Get faculty members whose offices are on the second floor
-- of the United Technologies (UT) building.
-- Include faculty without an assigned phone extension.
-- ==========================================================

SELECT DISTINCT
    CONCAT_WS(' ', f.first_name, f.middle_name, f.last_name) AS Name,
    f.department AS Department,
    CONCAT(r.building, ' ', r.number) AS Location,
    fp.phone_extension AS Extension
FROM faculty AS f
JOIN faculty_room AS fr
    ON f.email = fr.faculty_email
JOIN room AS r
    ON fr.room_id = r.id
LEFT JOIN faculty_phone AS fp
    ON f.email = fp.faculty_email
WHERE r.building = 'UT'
  AND r.number LIKE '2%'
ORDER BY Department, Location, Name;

-- ==========================================================
-- Question 5
-- Display the full names of faculty members who direct
-- special programs, along with the program departments.
-- Order by program ID to match the professor's expected output.
-- ==========================================================

SELECT
    CONCAT_WS(' ', f.first_name, f.middle_name, f.last_name)
        AS Faculty,
    '' AS `...directs...`,
    CONCAT(p.name, ' (', p.department, ')')
        AS `Program (Department)`
FROM faculty AS f
JOIN faculty_program AS fp
    ON f.email = fp.faculty_email
JOIN program AS p
    ON fp.program_id = p.id
ORDER BY p.id;

-- ==========================================================
-- Question 6
-- Display the full names of faculty members who are
-- assistant professors, associate professors, or professors.
-- Group the results by rank.
-- Sort faculty alphabetically within each rank.
-- Exclude other ranks such as lecturer and applied professor.
-- ==========================================================

SELECT
    CONCAT_WS(' ', first_name, middle_name, last_name) AS Faculty,
    `rank` AS `Rank`
FROM faculty
WHERE `rank` IN (
    'Assistant Professor',
    'Associate Professor',
    'Professor'
)
ORDER BY
    FIELD(
        `rank`,
        'Assistant Professor',
        'Associate Professor',
        'Professor'
    ),
    Faculty ASC;


-- ==========================================================
-- Question 7
-- Remove Professor Agboola from the university.
-- Move Mingjun Li from UT 302G to D 310A.
-- Keep Li's extension (5420).
-- Deactivate Agboola's extension (4502).
-- ==========================================================

-- BEFORE: Display Computing Sciences faculty information
SELECT
    CONCAT_WS(' ', f.first_name, f.middle_name, f.last_name) AS Name,
    f.department AS Department,
    CONCAT(r.building, ' ', r.number) AS Location,
    fp.phone_extension AS Extension
FROM faculty AS f
JOIN faculty_room AS fr
    ON f.email = fr.faculty_email
JOIN room AS r
    ON fr.room_id = r.id
JOIN faculty_phone AS fp
    ON f.email = fp.faculty_email
WHERE f.department = 'Computing Sciences'
ORDER BY Name;

-- BEFORE: Display Agboola's phone status
SELECT
    extension,
    IF(is_active, 'TRUE', 'FALSE') AS is_active
FROM phone
WHERE extension = 4502;

-- Move Mingjun Li to Agboola's former office
UPDATE faculty_room
SET room_id = (
    SELECT id
    FROM room
    WHERE building = 'D'
      AND number = '310A'
)
WHERE faculty_email = 'minli';

-- Remove Professor Agboola
-- Related records are removed by ON DELETE CASCADE
DELETE FROM faculty
WHERE email = 'agboola';

-- Deactivate Agboola's former extension
UPDATE phone
SET is_active = FALSE
WHERE extension = 4502;

-- AFTER: Display updated Computing Sciences faculty
SELECT
    CONCAT_WS(' ', f.first_name, f.middle_name, f.last_name) AS Name,
    f.department AS Department,
    CONCAT(r.building, ' ', r.number) AS Location,
    fp.phone_extension AS Extension
FROM faculty AS f
JOIN faculty_room AS fr
    ON f.email = fr.faculty_email
JOIN room AS r
    ON fr.room_id = r.id
JOIN faculty_phone AS fp
    ON f.email = fp.faculty_email
WHERE f.department = 'Computing Sciences'
ORDER BY Name;

-- AFTER: Display Agboola's inactive phone extension
SELECT
    extension,
    IF(is_active, 'TRUE', 'FALSE') AS is_active
FROM phone
WHERE extension = 4502;
