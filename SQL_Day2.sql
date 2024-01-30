-- Task 1 Select active student IDs from the 'student' table where study class is 10
SELECT student_id
FROM student
WHERE status = 'active' 
AND study_class = 10;

-- Task 2 Select students from the 'student' table where study class is 8 or 10
SELECT *
FROM student
WHERE study_class IN (8, 10);

-- Task 3 Select courses defined as 'basics' from the 'student_course' table
SELECT course_id
FROM teacher_1.student_course
WHERE course_id =1;

-- Task 4 Count students with final grade between 4 and 6 from the 'student_grade' table
SELECT COUNT(DISTINCT student_id) AS num_students_in_range
FROM teacher_1.student_grade
WHERE test_grade BETWEEN 4 AND 6;


-- Task 5 Check if there are any assessment test grades below 4 in the 'student_grade' table
SELECT COUNT(*)
FROM teacher_1.student_grade
WHERE test_grade < 4;


-- Task6 Display data about classrooms, grouped by floors and sorted by room count in ascending order
SELECT floor_number, COUNT(*) AS room_count
FROM teacher_1.classroom
GROUP BY floor_number
ORDER BY room_count ASC;


-- Task 7 Display list of all teachers, showing teachers without registered education on top of the list
SELECT *
FROM teacher_1.teacher
ORDER BY CASE 
            WHEN education IS NULL THEN 0 -- Teachers without education on top
            ELSE 1 -- Teachers with education below
         END;


-- Task 8 Display student id, name, and surname of all students in one field, separated by commas
SELECT 
    student_id || ', ' || COALESCE(first_name || ' ', '') || COALESCE(last_name, '') AS full_name
FROM teacher_1.student
ORDER BY full_name ASC;


-- Task 9 List students with excellent test grades above 8, showing unique student IDs only once
SELECT DISTINCT sg.student_id
FROM teacher_1.student_grade sg
JOIN teacher_1.student s ON sg.student_id = s.student_id
WHERE sg.test_grade > 8;


-- Task 10 Find the smallest classroom number on the highest floor
SELECT MIN(classroom_id) AS smallest_classroom_on_highest_floor
FROM teacher_1.classroom
WHERE floor_number = (
    SELECT MAX(floor_number) -- Subquery to find the highest floor number
    FROM teacher_1.classroom
);

-- Task 11 Display average final grade for each course
SELECT sg.course_id, AVG(sg.test_grade) AS average_final_grade
FROM teacher_1.student_grade sg
GROUP BY sg.course_id;
