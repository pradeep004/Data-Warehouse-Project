USE dw
go 

INSERT into department_dim(deptNo,managerFName,managerLName)
SELECT dept_manager.dept_no,employees.first_name,employees.last_name
FROM DBEmp.employee.dept_manager
inner JOIN DBEmp.employee.employees
on dept_manager.emp_no = employees.emp_no
go



USE dw
go

INSERT into employee_dim(empNo,firstName,lastName,gender,birthDate,hiredDate,title)
SELECT employees.emp_no,employees.first_name,employees.last_name,employees.gender,
employees.birth_date,employees.hire_date,titles.title
from DBEmp.employee.employees
INNER JOIN DBEmp.employee.titles
on employees.emp_no = titles.emp_no
go

