use Education;

SELECT subj_name -- 1
FROM subject;

SELECT inst_name -- 2
FROM institute;

SELECT stipendia -- 3
FROM student
GROUP BY stipendia;

SELECT course -- 4
FROM student
GROUP BY course;

SELECT family, name, last_name -- 5
FROM student
ORDER BY family, name, last_name, birthday; 

SELECT family, course, birthday -- 6
FROM student
ORDER BY course, birthday DESC; 

SELECT lect_id, family, name, last_name -- 7
FROM lecturer; 

SELECT family, name, last_name, stipendia -- 8
FROM student
WHERE stipendia > 0
ORDER BY stipendia DESC, family;

SELECT family, name, last_name -- 9
FROM student
WHERE course = 1
ORDER BY family;

SELECT family, name, last_name, course -- 10
FROM student
WHERE course = 2 OR course = 3;

SELECT family, name, last_name, course -- 11
FROM student
WHERE course != 1 AND course != 3;

SELECT family, name, last_name, course -- 11
FROM student
WHERE course NOT IN(1, 3);

SELECT "subject".subj_id, subj_name -- 12
FROM subject, nagruzka, knowledge, exam
WHERE subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id AND exam.nagr_id = nagruzka.nagr_id AND exam.mark = 5
GROUP BY  subj_name, subject.subj_id; 

SELECT subject.subj_name, knowledge.hour -- 13
FROM subject, nagruzka, knowledge,exam
WHERE subject.subj_id = knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id AND exam.nagr_id = nagruzka.nagr_id AND exam.mark = 2
GROUP BY subject.subj_name, knowledge."hour", mark;

SELECT family, town_name, subj_name, mark -- 14
FROM student, subject, exam, knowledge, parents, town, uch_plan
WHERE town.town_id = parents.town_id AND student.student_id = parents.student_id AND student.student_id = exam.student_id AND knowledge.subj_id = subject.subj_id
AND knowledge.kvant_id = uch_plan.kvant_id AND uch_plan.Spec_id = student.Spec_id AND town.town_name = 'Березовский' AND subj_name = 'бжд' AND mark > 2 
GROUP BY family, town_name, subj_name, mark;

SELECT family, name, last_name, subj_name, mark -- 15
FROM student, exam, subject, knowledge, nagruzka
WHERE student.student_id = exam.student_id AND exam.nagr_id = nagruzka.nagr_id AND nagruzka.kvant_id = knowledge.kvant_id AND knowledge.subj_id = subject.subj_id
ORDER BY subj_name, mark DESC, family

SELECT family, name, last_name, subj_name, mark -- 16
FROM student, exam, subject, knowledge, nagruzka
WHERE student.student_id = exam.student_id AND exam.nagr_id = nagruzka.nagr_id AND nagruzka.kvant_id = knowledge.kvant_id AND knowledge.subj_id = subject.subj_id
AND mark = 2 AND subj_name = 'Высшая математика';

SELECT family, name, last_name, town_name -- 17
FROM student, medalist, medali, parents, town
WHERE student.student_id = medalist.student_id AND Student.student_id = parents.student_id
AND town.town_id = parents.town_id AND medalist.medal_id = medali.medal_id AND medali.name_medal = 'золотая';

SELECT family, name, last_name, subj_name,exam_date -- 18
FROM student, exam, subject, knowledge, nagruzka
WHERE subject.subj_id = knowledge.subj_id AND exam.nagr_id = nagruzka.nagr_id AND knowledge.kvant_id = nagruzka.kvant_id AND student.student_id = exam.student_id AND mark = 2
GROUP BY family, name, last_name, subj_name, exam_date;

SELECT family, name, last_name, subj_name -- 19
FROM student, subject, exam, knowledge, nagruzka
WHERE student.student_id = exam.student_id AND exam.nagr_id = nagruzka.nagr_id AND nagruzka.kvant_id = knowledge.kvant_id
AND knowledge.subj_id = subject.subj_id AND (exam.exam_date = '2003-05-24' OR exam_date = '2003-06-13') AND mark = 2;

SELECT student.family, lecturer.family, exam_date, subj_name, mark -- 20
FROM student, exam, lecturer, knowledge, subject, nagruzka
WHERE exam.nagr_id = nagruzka.nagr_id AND nagruzka.kvant_id = knowledge.kvant_id AND knowledge.subj_id = subject.subj_id AND student.student_id = exam.student_id AND nagruzka.lect_id = lecturer.lect_id
AND mark = 5;

SELECT inst_name -- 21
FROM lecturer, knowledge, nagruzka, exam, student, institute
WHERE exam.student_id = student.student_id AND lecturer.inst_id = institute.inst_id AND lecturer.lect_id = nagruzka.lect_id AND nagruzka.kvant_id = knowledge.kvant_id
AND knowledge.hour > 80 AND mark = 2
GROUP BY inst_name;