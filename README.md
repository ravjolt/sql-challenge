# sql-challenge
SQL Database, Data Engineering,Data Analysis, Data Modeling

Background
It is a beautiful spring day, and it is two weeks since you have been hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

The following was performed:

Data Modeling using Postgresql
Data Engineering using Postgresql
Data Analysis using Jupyter Notebook

#Data Engineering
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;


create table departments (
	dept_no varchar(30) not null,
	dept_name varchar(30) not null,
	CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"));
		
create table titles(
    title_id varchar(30) primary key not null,
    title varchar(30) not null);

create table employees(
   emp_no integer not null,
   emp_title varchar(30) not null,
   birth_date varchar(30) not null,
   first_name varchar(30) not null,
   last_name varchar(30) not null,
   sex varchar(30) not null,
   hire_date varchar(30) not null,
   CONSTRAINT "pk_empolyees" PRIMARY KEY (
        "emp_no"));
		
create table salaries(
   emp_no integer  not null,
   salary integer not null);

create table dept_manager(
	dept_no varchar(20) not null,
	emp_no integer not null);

create table dept_emp (
	emp_no integer not null,
	dept_no varchar(30) not null);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no")

--Confirm data tables are correct
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

#Data Analysis
1.List the following details of each employee: employee number, last name, first name, sex, and salary.
List the following details of each employee: employee number, last name, first name, sex, and salary.
from employees
join salaries
on employees.emp_no = salaries.emp_no;

2.List first name, last name, and hire date for employees who were hired in 1986.
select employees.last_name, 
employees.first_name, 
employees.hire_date
from employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;


3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
 departments.dept_name, 
 dept_manager.emp_no, 
 employees.last_name, 
 employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

4.List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no;

5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name,
employees.last_name,
employees.sex
from employees
where employees.first_name = 'Hercules' 
and employees.last_name like 'B%'; 

6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.first_name, 
employees.last_name,
departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name='Sales';

7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
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

8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select employees.last_name,
count(employees.last_name) as "Frequency"
from employees
group by last_name
order by
count(last_name) desc;

**Bonus
As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:


![Average Salary Range](https://user-images.githubusercontent.com/89175197/142142107-4cdf2352-0fb1-49c6-a5f2-d05320998f40.png)
Within the 20 year period evaluated, it appears that most of the employees at the company make less than 60,000. This could be due to a high quantity of lower paying positions.

![Average Salary Range](https://user-images.githubusercontent.com/89175197/142142111-3c50e87e-541c-4f62-85c8-d6a607f5b83d.png)
Analysis of salary by title shows that the Engineers and Senior Engineers make the least in comparison to Staff and Senior Staff. 

![epilogue](https://user-images.githubusercontent.com/89175197/142142270-89128865-b5d8-4b34-be38-e54d3ae0aae2.PNG)
# #Epilogue
Sadly, even as a Techinque Leader, I my salary is around the low end of 40,000.
