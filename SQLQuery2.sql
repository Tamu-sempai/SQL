use Education5;
--�������������� �������� ������ 
SELECT sin(90);

SELECT FLOOR(77.55);

SELECT CEILING(233.46);
SELECT CEILING(-46.43);

SELECT EXP(3);

SELECT SQRT(49);

SELECT ROUND(745.693893, 0);
SELECT ROUND(365.693893, 3);

SELECT LOG(45);

SELECT LOG10(100);

select SQRT(stipendia) from student where student_id=5;
SELECT LOG(course) from student where student_id = 3;
-------------------------------
--�������������� ��������� ������
SELECT LEFT(name, 5)   
FROM student 
ORDER BY name;  

SELECT REPLACE('�����������������','����','����');  

SELECT LTRIM('         � ��� ��� ���������, ���� �� ������ �� ����������.');

SELECT RTRIM('� ��� ��� ���������, ���� �� ������ �� ����������.         ');

SELECT RTRIM(family) + ',' + SPACE(2) +  LTRIM(name)  
FROM student  
ORDER BY family, name;  

SELECT name, SUBSTRING(name, 1, 1) AS Two ,
SUBSTRING(name, 3, 2) AS Three
FROM student  
WHERE student_id < 10; 
---------------------�������
select * from student;
SELECT student.name, LEFT(family, 1) as "Name", LEFT(last_name, 1) 
FROM student
WHERE LEFT(name,1) = '�'
ORDER BY student.name;  

SELECT student.name + '.' +  LEFT(name, 1) + '.' + LEFT(last_name, 1)
FROM student  
WHERE LEFT(name,1) = '�'
ORDER BY family, name;  

SELECT student.name + '.' + ' ' +  LEFT(name, 1) + '.' + ' ' + LEFT(last_name, 1)
FROM student  
WHERE LEFT(name,1) = '�'
ORDER BY family, name;  

select CHARINDEX('kiseleva', 'ecologyrkiselevahistory', 1)

select (REPLICATE('#', LEN('kiseleva') * 6 / 2 - LEN("family")) + family + REPLICATE('#', LEN('kiseleva') * 6 / 2 - LEN("family")) )
from lecturer

select REPLACE(subj_name, '������', 'kiseleva')
from "subject"

select CHARINDEX('��', subj_name)
from "subject"
select * From student;

SELECT SYSDATETIME(); 
select GETDATE();

select DATEADD(DAY, 30, CURRENT_TIMESTAMP);
select DATEADD(MONTH, 9, CURRENT_TIMESTAMP);
select DATEADD(YEAR, 4, CURRENT_TIMESTAMP);

DECLARE @max int
SET @max = (select max(student_id)
from student)
DECLARE @birthday date
SET @birthday = (select birthday
from student
where student_id = 1)
DECLARE @birthday2 date
SET @birthday2 = (select birthday
from student
where student_id = @max)
select distinct DATEDIFF(month, @birthday, @birthday2)
from student

DECLARE @input1 FLOAT;  
DECLARE @input2 FLOAT;  
SET @input1= 2;  
SET @input2 = 2.5;  
SELECT POWER(@input1, 3) AS Result1, POWER(@input2, 3) AS Result2; 

SELECT POWER(2.0, 3);  

SELECT DISTINCT(POWER(course,3)) 
FROM student;



