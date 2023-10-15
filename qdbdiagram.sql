Dept_emp
---
emp_no PK int FK >- Employees.emp_no
dept_no PK varchar FK >- departments.dept_no

Employees
---
emp_no PK int
emp_title_id varchar FK >- titles.title_id
birth_date date
first_name varchar
last_name varchar
sex varchar
hire_date date

Dept_mamanger
---
dept_no VARHCAR FK >- departments.dept_no
emp_no INT FK >- Employees.emp_no

titles
---
title_id PK varchar
title varchar

salaries 
---
emp_no PK int FK >- Employees.emp_no
salary int

departments
---
dept_no PK varchar
dept_name varchar 
