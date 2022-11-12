# Creating a database key_prim 
create database key_prim;
use key_prim;

# Creating a table ineuron
create table ineuron(
course_id int NOT NULL, 
course_name varchar(60),
course_status varchar(40),
number_of_enro int, 
primary key(course_id));

/*
Attribute of Primary Key:
1. There can be one or more Primary Key in the table 
2. Primary key should not be null
3. Primary key values should not be duplicate
4. We can redefine and alter the Primary Key
*/

# Insert values in ineuron table 
insert into ineuron values(01,'FSDA','active',100);
insert into ineuron values(02,'FSDA','active',100);
select * from ineuron;

# Whenever we have to estabish relation between two tables or more then the primary and forign key comes into play
create table students_ineuron(
student_id int,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(60),
course_id int, 
foreign key(course_id) references ineuron(course_id));

# ineuron table is parent to students_ineuron table because it is dependent on ineuron table 
insert into students_ineuron values(101,'fsda','test@gmail.com','activity',01);
insert into students_ineuron values(101,'fsda','test@gmail.com','activity',01);
insert into students_ineuron values(101,'fsda','test@gmail.com','activity',01);
insert into students_ineuron values(101,'fsda','test@gmail.com','activity',01);
# We can insert values in students_ineuron table which is a child table to ineuron table only if we having the same value in the parent table column 
select * from students_ineuron;
# Parent table and child table can have one to many relation 

create table payment(
course_name varchar(60),
course_id int,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references ineuron(course_id));

insert into payment values('fsda',01,'not-active','7th aug');
insert into payment values('fsda',01,'not-active','7th aug');
insert into payment values('fsda',01,'not-active','7th aug');

create table class(
course_id int,
class_name varchar(60),
class_topic varchar(60),
class_duration int, 
primary key(course_id),
foreign key(course_id) references ineuron(course_id));

# We can not have multiple primary key in a table 
# We can not even create a alternate primary for a table 
# We can not even drop the primary key even if it is linked with a foreign key like in class table 
# We can only drop a parent table by deleting the child table 

drop table class;

create table test(
id int not null,
name varchar(60),
mobile_no varchar(9),
address varchar(60));

alter table test add primary key(id);
alter table test drop primary key;
alter table test add column email_id varchar(60);
alter table test add constraint test_prim primary key(id,email_id);

create table parent(
id int not null,
primary key(id));

insert into parent values(2);
select * from parent;

create table child(
id int,
parent_id int, 
foreign key (parent_id) references parent(id));

insert into parent values(2);
select * from parent;
insert into child values(1,1);
select * from child;
drop table child;

# Creating table with on delete cascade option 
create table child(
id int,
parent_id int,
foreign key (parent_id) references parent(id) on delete cascade);

insert into child values(1,1),(1,2),(3,2),(2,2);
select * from child;
# By using cascade we will be able to update the content in the parent table and then child table will also change 
delete from parent where id =1;
select * from child;
drop table child;

# Performing on update cascade 
create table child (
id int, 
parent_id int, 
foreign key (parent_id) references parent(id) on update cascade);

insert into child values (1,1),(1,2),(3,2),(2,2);
update parent set id = 3 where id = 2;

# We can use on delete cascade and on update cascade together also by just entering - on delete cascade on update cascade 


