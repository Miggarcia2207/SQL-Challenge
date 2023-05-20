-- Create the "departments" table
CREATE TABLE departments (
  dept_no VARCHAR(4) PRIMARY KEY,
  dept_name VARCHAR(50)
);

-- Create the "dept_emp" table
CREATE TABLE dept_emp (
  emp_no INT,
  dept_no VARCHAR(4),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create the "dept_manager" table
CREATE TABLE dept_manager (
  dept_no VARCHAR(4),
  emp_no INT,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create the "employees" table
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title VARCHAR(20),
  birth_date DATE,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  sex CHAR(1),
  hire_date DATE
);

-- Create the "salaries" table
CREATE TABLE salaries (
  emp_no INT,
  salary INT,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create the "titles" table
CREATE TABLE titles (
  title_id VARCHAR(10) PRIMARY KEY,
  title VARCHAR(50)
);

SELECT emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;





