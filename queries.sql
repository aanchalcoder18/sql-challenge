--List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   emp.sex,
	   sal.salary
FROM employees as emp
	LEFT JOIN salaries as sal
	ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp.first_name,
	   emp.last_name,
	   emp.hire_date
FROM employees as emp
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept.dept_no,
	   deps.dept_name,
	   dept.emp_no,
	   emp.last_name,
	   emp.first_name 
FROM dept_manager as dept
	RIGHT JOIN departments as deps
	ON dept.dept_no = deps.dept_no
	RIGHT JOIN employees as emp
	ON dept.emp_no = emp.emp_no
WHERE dept.dept_no IS NOT NULL;	

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dep.dept_no,
	   emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   deps.dept_name
FROM employees AS emp
	INNER JOIN dept_emp as dep
	ON emp.emp_no = dep.emp_no
	INNER JOIN departments as deps
	ON dep.dept_no = deps.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT emp.first_name,
	   emp.last_name,
	   emp.sex
FROM employees as emp
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT deps.dept_no,
	   deps.dept_name,
	   emp.emp_no,
	   emp.last_name,
	   emp.first_name
FROM employees as emp
	INNER JOIN dept_emp as dep
	ON emp.emp_no = dep.emp_no
	INNER JOIN departments as deps
	ON dep.dept_no = deps.dept_no
WHERE deps.dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   deps.dept_name
FROM employees as emp
	INNER JOIN dept_emp as dep
	ON emp.emp_no = dep.emp_no
	INNER JOIN departments as deps
	ON dep.dept_no = deps.dept_no
WHERE deps.dept_name = 'Sales' OR deps.dept_name = 'Development'

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;