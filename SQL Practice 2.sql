create database dress_data;
use dress_data;

# Create table 
create table if not exists dress(
`Dress_ID` varchar(30),	
`Style`	varchar(30),	
`Price`	varchar(30),	
`Rating`	varchar(30),	
`Size`	varchar(30),	
`Season`	varchar(30),	
`NeckLine`	varchar(30),	
`SleeveLength` varchar(30),		
`waiseline`	varchar(30),	
`Material`	varchar(30),	
`FabricType`	varchar(30),	
`Decoration`	varchar(30),	
`Pattern Type` varchar(30),		
`Recommendation` varchar(30));

# Loading the data in the sql file
LOAD DATA INFILE 'D:/AttributeDataSet.csv'
into table dress
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

select * from dress;

# Auto increment of data in a table 
create table if not exists test2(
test_id int not null auto_increment,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30),
primary key(test_id))

insert into test2 (test_name, test_mailid, test_adress) values ('sudanshu','sudh@gmail.com','banglore'),
('krish','kris@gmail.com','bangalore')

select * from test2

# Add data in the table with the check option 
create table if not exists test3(
test_id int,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
test_salary int check(test_salary > 10000))

# Alter to add constraint or condition on column value 
alter table test3 add check (test_id>0)

insert into test3 values (1,'rachitttsdfsdfsadf','rachit@gmail.com','punjab', 20000),
(2,'garg','garg@gamil.com','punjab', 30000);

select * from test3;

# create table with default values
create table if not exists test6(
test_id int NOT NULL default 0,
test_name varchar(30),
test_mailid varchar(30),
teast_adress varchar(30) check (teast_adress = 'bengalore'),
test_salary int check(test_salary>10000));

insert into test6 (test_name, test_mailid, teast_adress, test_salary) values ('reachit', 'rachit@gmail', 'bengalore', 230000);

select * from test6;

insert into test6 (test_id, test_name, test_mailid, teast_adress, test_salary) values (23, 'reachit', 'rachit@gmail', 'bengalore', 230000);

select * from test6;

# create table with default values and unique value 
create table if not exists test7(
test_id int NOT NULL default 0,
test_name varchar(30),
test_mailid varchar(30) unique,
teast_adress varchar(30) check (teast_adress = 'bengalore'),
test_salary int check(test_salary>10000));

insert into test7 (test_id, test_name, test_mailid, teast_adress, test_salary) values (23, 'reachit', 'rachit@gmail', 'bengalore', 230000), (232, 'reachit', 'rachit@gmail.com', 'bengalore', 230000);

select * from test7;

