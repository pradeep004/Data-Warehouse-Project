create database dw
go

use dw
go

create table calendar_dim
( calenderKey int not null identity,
fullDate date,						--from employees table : hire_date and birth_date
monthOfDate char(10),
quarterOfDate char(2),
yearOfDate int,
PRIMARY KEY (calenderKey)
);
go
--(DATEPART("qq",date) == 1 ? "Q1" : DATEPART("qq",date) == 2 ? "Q2" : DATEPART("qq",date) == 3 ? "Q3" : DATEPART("qq",date) == 4 ? "Q4" : "")


create table employee_dim
( empNo int not null identity,		--from employees table
firstName nvarchar(14),				--from employees table
lastName nvarchar(16),				--from employees table
gender nvarchar(1),					--from employees table
birthDate date,						--from employees table
hiredDate date,						--from employees table
title nvarchar(50),					--from titles table WITH RECENT to_date
PRIMARY KEY (empNo)
);
go


create table FactSalaryClean
( empNo int,						--from DimEmp
deptNo nvarchar(50),				--from DimDept
calenderKey int,					--from DimCalender
salary int,							--from salaries table WITH RECENT to_date
PRIMARY KEY (empNo,deptNo,calendarKey),
foreign key (empNo) references employee_dim(empNo),
foreign key (deptNo) references department_dim(deptNo),
foreign key (CalenderKey) references calendar_dim(calendarKey),
);
go
