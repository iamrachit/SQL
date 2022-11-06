# 1048576 Byte or 1 Mb of data can be enter in the table by default 
# So for example to insert 200 Mb of data we can simply multiply 1048576*200 and then enter the value below in our case its 209715200
set global max_allowed_packet = 209715200;

use sales;
select * from sales1;

# Creating a function
DELIMITER $$ 
create function add_to_col(a INT) 
returns int
deterministic
BEGIN 
DECLARE b INT ;
set b = a + 10 ;
return b ;
end $$

select add_to_col(15);

# Using function for changing column value 
select quantity+10 from sales1;
# All ways use a UDF(User Define Function) for changing the column value like done in above code
select add_to_col(quantity) from sales1;

# Profit Column - Discount Column Function
DELIMITER $$
create function final_profit(profit int, discount int)
returns int
deterministic
BEGIN
Declare final_profit int;
set final_profit = profit-discount;
return final_profit;
end $$

select profit,discount,final_profit(profit,discount) from sales1;

# Creating a function with decimal values 
DELIMITER $$
create function final_profits_real(profit decimal(20,6) , discount decimal(20,6) , sales decimal(20,6))
returns int 
deterministic
begin
declare final_profit int;
set final_profit = profit - sales*discount;
return final_profit;
end$$

select profit, discount, sales, final_profits_real(profit,discount,sales) from sales1;

# Creating a function which will return integer to string 
DELIMITER $$
create function conv_int_str(a int)
returns varchar(30)
deterministic
begin
declare b varchar(30);
set b = a;
return b;
end $$

select conv_int_str(45)

DELIMITER &&
create function mark_sales(sales int)
returns varchar(30)
DETERMINISTIC
begin
declare flag_sales varchar(30) ;
if sales < 100 then 
	set flag_sales = 'super affordable product';
elseif sales > 100 and sales < 300 then
	set flag_sales = 'affordable';
elseif sales > 300 and sales < 600 then 
	set flag_sales = 'moderate price';
else 
	set flag_sales = 'expensive';
end if;
return flag_sales;
end &&

select mark_sales(20);

# Create a table which will add loop value in it
create table loop_table(val int);

# Creating a Loop
Delimiter &&
create procedure insert_data()
begin
set @var = 10;
generate_data : loop 
insert into loop_table values (@var);
set @var = @var + 1;
if @var = 100 then
	leave generate_data;
end if;
end loop genetate_data;
end &&

create table loop_square1(val int);

create procedure insert_data8()
Begin
set @entry = 1;
gen_data : loop
insert into loop_square1 (entry)  values (@entry);
if @entry = @entry * @entry then
insert into loop_square1 (square) values (@entry);
end if;
set @enrty = @entry+1 ;
if @entry = 100 then
    leave gen_data ;
end if ;
end loop gen_data ;
end &&

call insert_data();

select * from loop_table;