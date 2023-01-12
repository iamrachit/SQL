# Creating database named as ineuron 
create database ineuron;
use ineuron;

# Creating course2 table for performing trigger related operation. 
create table course2(
course_id int , 
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date,
user_info varchar(50)  );

# Creating ref_course for performiing trigger related operation. 
create table ref_course (
record_insert_date date,
record_insert_user varchar(50)
);

# Trigger -  A Trigger in Structured Query Language is a set of procedural statements which are executed automatically when there is any response to certain events on the particular table in the database. Triggers are used to protect the data integrity in the database.
# Go to this link to learn more about trigger -> https://www.javatpoint.com/trigger-in-sql
# Its a before insert type of trigger which is perfromed on course2 table and ref_course table. 
# Before insert is performed on course2 table and then in the statements given between begin and end some of the values of course2 table will be modified and ref_course table values will also get inserted. 
# While performing trigger we can call other tables also for any modification of their value when a table is called link in the below given example course2 is called and values of ref_course table is being changed. 
delimiter // 
create trigger course_before_insert1123
before insert on course2 for each row
begin
	declare user_val varchar(50); 
	set new.create_date = sysdate();
    select user() into  user_val;
    set new.user_info = user_val;
    insert into ref_course values(sysdate() , user_val);
    
end; //

# Insert values in course2 so that trigger can update values as per the defined statement in the above trigger by the name of course_before_insert1123
insert into course2 (course_id,course_desc,course_mentor,course_price,course_discount)value(101,"FSDA","sudhanshu",4000,10);
# Calling ref_course to check values inserted by trigger 
select * from ref_course;

# Creating 3 tables for performing operation using trigger 
create table test1(
c1 varchar(50),
c2 date, 
c3 int);
create table test2(
c1 varchar(50), 
c2 date, 
c3 int);
create table test3(
c1 varchar(50), 
c2 date, 
c3 int);

# Defining a before insert trigger for the above test1, test2 and test3.  
# Before insert type of operation means that before we insert a value in test1 the operation defined in trigger should be performed first. 
# Before insert trigger will only come into play when only insert operation is taking place in test1 table. 
delimiter //
create trigger to_update_others
before insert on test1 for each row 
begin
	insert into  test2 values("xyz",sysdate(),23354);
	insert into  test3 values("xyz",sysdate(),23354);
end; //

# Insert values in test1 to check the value change in test2 and test3. 
insert into test1 values("rachit",sysdate(),23354);

# Check the updated values in test1, test2 and test3;
select * from test1;
select * from test2;
select * from test3;

# After insert trigger to be performed
# In the after insert kind of trigger first the insert operation will be performed in test1 table and then the operation defined will be performed
delimiter //
create trigger after_insert_others_table
after insert on test1 for each row 
begin
	update test2 set c1='abc' where c1='xyz';
	delete from test3 where c1 = 'xyz';
end; //

# Insert values in test1 table 
insert into test1 values('krish',sysdate(),9007878);

# Checking the updated values after exicuting trigger 
select * from test1;
select * from test2;
select * from test3;

# After delete trigger being performed 
delimiter //
create trigger to_delete_others_table
after delete on test1 for each row 
begin
	insert into test3 values("after delete", sysdate(), 435455);
end; //

# Checking out values in test1 before we delete value where c1 = 'krish'
select * from test1;

# Delete value in test1 where c1 = 'krish'
delete from test1 where c1 = 'krish'

# Checking out the values of test3 table when after delete trigger is performed on the test1 table.
select * from test3;

# Creating 3 tables for performing operation using trigger
create table test11(
c1 varchar(50),
c2 date,
c3 int);

create table test12(
c1 varchar(50),
c2 date,
c3 int );

create table test13(
c1 varchar(50),
c2 date,
c3 int );

# Before delete trigger being performed 
delimiter //
create trigger to_delete_others_before_observation3
before delete on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

# Insert value into test11 for performing above given trigger 
insert into test11 values("sudh" , sysdate(), 435456);
select * from test11;
# Deleting a value from test11 
delete from test11 where c1 = 'sudh';
# Check the result of trigger to_delete_others_before_observation3
select * from test12

# After update trigger being performed
delimiter //
create trigger to_upate_others
after update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //
# Insert value in the test11 table for performing trigger operation 
insert into test11 values("sudh",sysdate(),234354);
# Performing update of c1 value on test11 table 
update test11 set c1 = "after update" where c1 = "after delete";
# Checking the result of trigger 
select * from  test12;

# Before update trigger being performed 
delimiter //
create trigger to_upate_others_before
before update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(new.c1, new.c2,new.c3);
end; //
# Update test11 table to perform before update trigger operation 
update test11 set c1 = "insert new" where c1 = "sudh";
# Checking out the result of before update trigger 
select * from  test12;