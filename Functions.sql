use education;

SELECT knowledge.hour_lab AS Input, SIN(knowledge.hour_lab) AS Result FROM knowledge; -- 2
SELECT 545.5, FLOOR(545.5);
SELECT 545.5, CEILING(545.5);
SELECT EXP(100);
SELECT SQRT(400);
SELECT ROUND(5.50,100);
SELECT LOG(365.5);
SELECT LOG10(365.5);

SELECT family, LEFT(name, 1), LEFT(last_name, 1) -- 3 ������ LEFT
FROM student
WHERE SUBSTRING(family, 1, 1) = '�'; 

SELECT family + LEFT(name, 1) + LEFT(last_name, 1) -- LEFT � +
FROM student
WHERE SUBSTRING(family, 1, 1) = '�'; 

SELECT family + ' ' + LEFT(name, 1) + '. ' + LEFT(last_name, 1) + '.' -- LEFT + .
FROM student
WHERE SUBSTRING(family, 1, 1) = '�';

SELECT subj_name -- ��������� ������ ����� ������� � �������� ���������
FROM subject
WHERE CHARINDEX('�', subj_name) > 0;

SELECT REPLICATE('#', LEN('�����') * 6 / 2 - LEN("family")) + family + REPLICATE('#', LEN('�����') * 6 / 2 - LEN("family")) -- ������ ���� ###
FROM lecturer;

SELECT REPLACE(subj_name, '����', '�����') -- ������ ���������
FROM subject;

SELECT subj_name
FROM subject
WHERE CHARINDEX('�', subj_name) > 0;

SELECT SYSDATETIME(); -- 4 
SELECT GETDATE();

SELECT exam_date, DATEADD(year, 100, exam_date) FROM exam WHERE student_id = 1;
SELECT exam_date, DATEADD(day, 25, exam_date) FROM exam WHERE student_id = 1;
SELECT exam_date, DATEADD(month, 10, exam_date) FROM exam WHERE student_id = 1;

DECLARE @maxId int -- 5
SET @maxId = (SELECT max(student_id) FROM student)

DECLARE @firstValue date
SET @firstValue = (SELECT birthday FROM student WHERE student_id = 1)

DECLARE @secondValue date
SET @secondValue = (SELECT birthday FROM student WHERE student_id = @maxId)

SELECT DISTINCT DATEDIFF(month, @firstValue, @secondValue)
FROM student;

SELECT POWER(2,2); -- 6
SELECT POWER(5,10);
SELECT POWER(0,0);