create database ineuron;
use ineuron;

create table course2(
course_id int , 
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date,
user_info varchar(50)  );

delimiter //
create trigger course_before_insert1123
before insert 
on course2 for each row
begin
	declare user_val varchar(50);
	set new.create_date = sysdate();
    select user() into  user_val;
    set new.user_info = user_val;
    
end; //

insert into course2 (course_id,course_desc,course_mentor,course_price,course_discount)value(101,"FSDA","sudhanshu",4000,10);
select * from course2; 
