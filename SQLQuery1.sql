use Education5;
--1
select * from subject;
--2
select * from institute;
--3
SELECT stipendia FROM student GROUP BY stipendia;
--4
SELECT course FROM student GROUP BY course;
--5
SELECT family, name, last_name, birthday FROM student ORDER BY family ASC, name ASC, last_name ASC, birthday ASC;
--6
SELECT family, course, birthday FROM student ORDER BY course ASC, birthday DESC;
--7
select lect_id,family, name, last_name from lecturer;
--8
SELECT family, name, last_name, stipendia FROM student WHERE stipendia > 0 ORDER BY family ASC;
--9
SELECT family, name, last_name, course FROM student WHERE course = 1 ORDER BY family ASC;
--10
SELECT family, name, last_name, course FROM student WHERE course IN (2, 3) ORDER BY family ASC;
--11
SELECT family, name, last_name, course FROM student WHERE course NOT IN (1, 3) ORDER BY family ASC;
SELECT family, name, last_name, course FROM student WHERE course IN (2, 4, 5) ORDER BY family ASC;
--12
SELECT DISTINCT "subject".subj_id, subj_name from exam, subject, knowledge, nagruzka where(subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id AND nagruzka.nagr_id = exam.nagr_id)AND exam.mark = 5;
--13
SELECT DISTINCT subj_name, hour, mark 
FROM subject, exam, knowledge, nagruzka 
WHERE (subject.subj_id = knowledge.subj_id 
AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id) AND mark = 2 ;
--14
SELECT DISTINCT family, name, last_name, subj_name, town_name, mark
FROM parents, town, exam, subject, student, nagruzka, knowledge 
WHERE (town.town_id = parents.town_id AND parents.student_id = student.student_id 
AND student.student_id = exam.student_id AND exam.nagr_id = nagruzka.nagr_id
AND nagruzka.kvant_id = knowledge.kvant_id AND subject.subj_id = knowledge.subj_id
AND mark >= 3 
AND town.town_name = 'Березовский'
AND subject.subj_id = 1);
--15
SELECT family, name, subj_name, mark
FROM exam, subject, student,nagruzka, knowledge
WHERE mark != 2 AND (subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id )
ORDER BY family ASC, mark DESC, subj_name ASC;

--16
SELECT family, name, last_name, subj_name, mark
FROM exam, subject, student, nagruzka, knowledge
WHERE mark = 2 AND (subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id)
AND subject.subj_name = 'Высшая математика'
GROUP BY family, subj_name, mark, name, last_name
ORDER BY family ASC;

--17
SELECT family, name, town_name, name_medal
FROM student, parents, medali, medalist, town
WHERE (student.student_id = parents.student_id 
AND parents.town_id  = town.town_id
AND student.student_id = medalist.student_id
ANd medalist.medal_id = medali.medal_id)
AND medali.medal_id = 2
ORDER BY family ASC;
--18
SELECT family, subj_name, exam_date
FROM exam, subject, student, nagruzka, knowledge
WHERE mark = 2 AND (subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id)
GROUP BY family, subj_name, exam_date
ORDER BY family ASC, subj_name ASC;

--19
SELECT family, subj_name, exam_date 
FROM student, exam, nagruzka, knowledge, subject 
WHERE mark = 2 AND (subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id 
AND nagruzka.nagr_id = exam.nagr_id AND student.student_id = exam.student_id) 
AND exam_date IN  ('13.06.2003','24.05.2003')
GROUP BY family, subj_name, exam_date
ORDER BY subj_name, family;
--20
SELECT student.family, student.name, subj_name, lecturer.family, lecturer.name, mark, exam_date
FROM exam, "subject", student, nagruzka, lecturer, knowledge
WHERE mark = 5 AND (student.student_id = exam.student_id 
AND exam.nagr_id = nagruzka.nagr_id AND nagruzka.lect_id = lecturer.lect_id 
AND nagruzka.kvant_id = knowledge.kvant_id
AND knowledge.subj_id = subject.subj_id );

--21
SELECT DISTINCT inst_name
FROM institute, lecturer, nagruzka, knowledge, exam
WHERE mark = 2 AND (institute.inst_id = lecturer.inst_id
AND lecturer.lect_id = nagruzka.lect_id
AND nagruzka.kvant_id = knowledge.kvant_id
AND nagruzka.nagr_id = exam.nagr_id)
AND hour >=80 
GROUP BY inst_name;




