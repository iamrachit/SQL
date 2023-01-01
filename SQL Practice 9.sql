create database ineuron; 
use ineuron;

create table course1(
course_id int, 
course_desc varchar(50),
course_mentor varchar(60),
course_price int, 
course_discount int);

create table course_update(
course_metor_update varchar(50),
course_price_update int, 
course_discount_update int);

# Trigger - Whenever we call trigger it will insert into course1 value 
delimiter //
create trigger course_before_insert 
before insert
on course1 for each row 
begin 
	select new.create_date = sysdate();
end; 

select * from course1; 

insert into course1 (course_id, course_desc, course_mentor, course_price, course)
