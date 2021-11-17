--Data Engineering
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