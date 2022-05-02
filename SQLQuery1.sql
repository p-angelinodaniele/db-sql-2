
-- QUERY CON GROUP BY



SELECT COUNT(*) AS "numero_iscritti", YEAR("enrolment_date") AS "anno"
FROM students
GROUP BY YEAR("enrolment_date");



SELECT COUNT (*) AS "Insegnanti", "office_address" AS "edificio"
FROM teachers
GROUP BY "office_address"



SELECT AVG (vote) AS "Media", "exam_id"
from exam_student
GROUP BY "exam_id"


SELECT COUNT(id) AS "numero" , "department_id"
FROM degrees
GROUP BY "department_id"



-- QUERY CON JOIN


SELECT *
FROM students
INNER JOIN degrees ON degree_id = degrees.id
WHERE degrees.name = 'Corso di Laurea in Economia'




SELECT *
FROM degrees
JOIN departments on department_id = departments.id
WHERE departments.name = 'Dipartimento di Neuroscienze'




SELECT *
FROM courses
JOIN course_teacher on course_id = courses.id
JOIN teachers on teacher_id = teachers.id
WHERE teachers.id = 44;


--Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
--relativo dipartimento, in ordine alfabetico per cognome e nome


SELECT students.surname, students.name,degrees.name, departments.name
FROM students
JOIN degrees ON degree_id = degrees.id
JOIN departments ON department_id = departments.id
ORDER BY students.surname, students.name


--Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT degrees.name, courses.name, teachers.name,teachers.surname
FROM degrees
JOIN courses on degree_id = degrees.id
JOIN course_teacher on course_id = courses.id
JOIN teachers on teacher_id = teachers.id



--Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


SELECT teachers.name, teachers.surname, degrees.name, courses.name, teachers.name, departments.name
FROM teachers
JOIN course_teacher on teacher_id = teachers.id
JOIN courses on courses.id = course_id
JOIN degrees on degree_id = degrees.id
JOIN departments on department_id = departments.id
WHERE departments.name = 'Dipartimento di Matematica'



SELECT student_id, students.name, students.surname, course_id, courses.name, COUNT(course_id) AS tentativi
FROM exam_student
JOIN exams ON exam_student.exam_id = exams.id
JOIN students ON exam_student.student_id = students.id
JOIN courses ON exams.course_id = courses.id
GROUP BY student_id, students.name, students.surname, course_id, courses.name
ORDER BY student_id ASC

























