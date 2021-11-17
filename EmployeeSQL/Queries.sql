--Queries
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
List the following details of each employee: employee number, last name, first name, sex, and salary.
from employees
join salaries
on employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select employees.last_name, 
employees.first_name, 
employees.hire_date
from employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no,
 departments.dept_name, 
 dept_manager.emp_no, 
 employees.last_name, 
 employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name,
employees.last_name,
employees.sex
from employees
where employees.first_name = 'Hercules' 
and employees.last_name like 'B%'; 

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.first_name, 
employees.last_name,
departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. 
select employees.emp_no,
employees.first_name, 
employees.last_name,
departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name='Sales'
or departments.dept_name='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select employees.last_name,
count(employees.last_name) as "Frequency"
from employees
group by last_name
order by
count(last_name) desc;