DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREATE TABLE departments(
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL	
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(30),
	from_date DATE,
	to_date DATE
);

CREATE TABLE Dept_manager(
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE Employees(
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender CHAR(1),
	hire_date DATE 
);

CREATE TABLE Salaries(
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE Titles(
	emp_no INT,
	title VARCHAR(30),
	from_date DATE,
	to_date DATE
);

SELECT * FROM departments;

SELECT * FROM Dept_emp;  

SELECT * FROM Dept_manager;

SELECT * FROM Employees;

SELECT * FROM Salaries; 

SELECT * FROM Titles;