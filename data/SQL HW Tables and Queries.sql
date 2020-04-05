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


--- solving the questions from the HW.

-- I. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- II. List employees who were hired in 1986.

SELECT 
	emp_no, 
	last_name, 
	first_name, 
	hire_date 
FROM employees 
WHERE date_part('year', hire_date) = 1986
ORDER BY hire_date DESC;

-- III. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, 
-- and start and end employment dates.

SELECT employees.emp_no, dept_manager.dept_no, employees.first_name, employees.last_name,
employees.hire_date, dept_manager.from_date, dept_manager.to_date
FROM employees 
INNER JOIN dept_manager 
ON employees.emp_no = dept_manager.emp_no;

SELECT employees.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, 
employees.first_name,employees.hire_date, dept_manager.from_date, dept_manager.to_date
FROM employees 
INNER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments 
ON dept_manager.dept_no = departments.dept_no;

-- IV List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees INNER JOIN dept_manager 
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments 
ON dept_manager.dept_no = departments.dept_no;

-- V. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name LIKE 'Hercules' 
AND last_name LIKE 'B%';

-- VI. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- VII List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

-- VIII. In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.

SELECT 
	last_name, 
	COUNT(emp_no) AS count_employee_lastname
FROM employees 
GROUP BY last_name
ORDER BY count_employee_lastname DESC 
;
