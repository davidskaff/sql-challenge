# SQL Project

The main goal of this project was to design and implement a database system for a company's employee management.

## Database Design

The database consists of six tables:

1. **Departments**: This table holds information about the various departments in the company. Each department has a unique department number (`dept_no`) and a department name (`dept_name`).

2. **EmployeeDepartments**: This table is a junction table that links employees to their respective departments. It includes the employee number (`emp_no`) and the department number (`dept_no`).

3. **DepartmentManagers**: This table keeps track of the managers for each department. It includes the department number (`dept_no`) and the employee number (`emp_no`) of the manager.

4. **Employees**: This table stores information about each employee, including their employee number (`emp_no`), title ID (`emp_title_id`), birth date (`birth_date`), first name (`first_name`), last name (`last_name`), sex (`sex`), and hire date (`hire_date`).

5. **Salaries**: This table holds salary information for each employee. It includes the employee number (`emp_no`) and the salary (`salary`).

6. **Titles**: This table contains information about the various job titles in the company. Each title has a unique title ID (`title_id`) and a title name (`title`).

## Queries

I've also written several SQL queries to extract useful information from this database:

- List the employee number, last name, first name, sex, and salary of each employee.
- List the first name, last name, and hire date for the employees who were hired in 1986.
- List the manager of each department along with their department number, department name, employee number, last name, and first name.
- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
- List each employee in the Sales department, including their employee number, last name, and first name.
- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

I enjoyed working on it and learned a lot about SQL and database design in the process.
