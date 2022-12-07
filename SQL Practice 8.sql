create database operation;
use operation;

create table if not exists course(
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50));

create table if not exists student(
student_id int,
student_name varchar(30),
student_mobile int,
student_course_enroll varchar(30),
student_course_id int);

insert into course values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

insert into student values(301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103);

# Who have enrolled in a specific course 
# For that we can perform join operation 

# Inner Join
select c.course_id, c.course_name, c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
inner join student s on c.course_id = s.student_course_id;

# Left Join 
select c.course_id, c.course_name, c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
left join student s on c.course_id = s.student_course_id;

# Name of course which are not purchased w.r.t student_id
select c.course_id, c.course_name, c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
left join student s on c.course_id = s.student_course_id where s.student_id is null;

# Right Join
select c.course_id, c.course_name, c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
right join student s on c.course_id = s.student_course_id;

# Cross Join - All possible join from both the table 
select c.course_id, c.course_name, c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
cross join student s on c.course_id = s.student_course_id;
# Cross and Inner Join - With condition like c.course_id = s.student_course_id; the cross join will work similarly as inner join but without a condition it will give all the possible outcomes as shown below 
select c.course_id, c.course_name, c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
cross join student s;

# Indexing 
create table if not exists course1 (
course_id int,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id));

show index from course1;

insert into course1 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

create table if not exists course4 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_desc,course_name,course_tag)
);

insert into course4 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

show index from course4; 

# In the Unique Index option, only the distinct values of selected column will only be considered
create table if not exists course6 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
unique index(course_desc,course_name)
);

insert into course6 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

show index from course6; 

# Union  - it is used to join the dataset vertically 
# Join - it is used to join the dataset horizontally alter
# Condition for union operation is that the number of colunn should be same for the tables where union is being performed 
select course_id, course_name from course 
union 
select student_id, student_name from student;

# CTE - Common table expression 
# CTE is a run time custome table 
# CTE is better with respect to clearity when comapred with subquery 
with sample_students as (
select * from course where course_id in (101,102,106))
select * from sample_students where course_tag = 'java';

with outcome_course as 
(select c.course_id, c.course_name, c.course_desc, s.student_id, s.student_name, s.student_course_id from course c
cross join student s) 
select course_id , course_name, student_id from outcome_course where student_id = 301;