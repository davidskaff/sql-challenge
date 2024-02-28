-- Table 1: Departments
CREATE TABLE Departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Table 2: EmployeeDepartments
CREATE TABLE EmployeeDepartments (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Table 3: DepartmentManagers
CREATE TABLE DepartmentManagers (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no, emp_no) REFERENCES EmployeeDepartments(dept_no, emp_no)
);

-- Table 4: Employees
CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Table 5: Salaries
CREATE TABLE Salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Table 6: Titles
CREATE TABLE Titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    Employees.emp_no AS Employee_Number,
    Employees.last_name AS Last_Name,
    Employees.first_name AS First_Name,
    Employees.sex AS Sex,
    Salaries.salary AS Salary
FROM 
    Employees
JOIN 
    Salaries ON Employees.emp_no = Salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name AS First_Name,
    last_name AS Last_Name,
    hire_date AS Hire_Date
FROM 
    Employees
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    Departments.dept_no AS Department_Number,
    Departments.dept_name AS Department_Name,
    DepartmentManagers.emp_no AS Employee_Number,
    Employees.last_name AS Last_Name,
    Employees.first_name AS First_Name
FROM 
    Departments
JOIN 
    DepartmentManagers ON Departments.dept_no = DepartmentManagers.dept_no
JOIN 
    Employees ON DepartmentManagers.emp_no = Employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    EmployeeDepartments.dept_no AS Department_Number,
    EmployeeDepartments.emp_no AS Employee_Number,
    Employees.last_name AS Last_Name,
    Employees.first_name AS First_Name,
    Departments.dept_name AS Department_Name
FROM 
    EmployeeDepartments
JOIN 
    Employees ON EmployeeDepartments.emp_no = Employees.emp_no
JOIN 
    Departments ON EmployeeDepartments.dept_no = Departments.dept_no;
	
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
    first_name AS First_Name,
    last_name AS Last_Name,
    sex AS Sex
FROM 
    Employees
WHERE 
    first_name = 'Hercules' AND last_name LIKE 'B%';
	
-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
    Employees.emp_no AS Employee_Number,
    Employees.last_name AS Last_Name,
    Employees.first_name AS First_Name
FROM 
    Employees
JOIN 
    EmployeeDepartments ON Employees.emp_no = EmployeeDepartments.emp_no
JOIN 
    Departments ON EmployeeDepartments.dept_no = Departments.dept_no
WHERE 
    Departments.dept_name = 'Sales';
	
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    Employees.emp_no AS Employee_Number,
    Employees.last_name AS Last_Name,
    Employees.first_name AS First_Name,
    Departments.dept_name AS Department_Name
FROM 
    Employees
JOIN 
    EmployeeDepartments ON Employees.emp_no = EmployeeDepartments.emp_no
JOIN 
    Departments ON EmployeeDepartments.dept_no = Departments.dept_no
WHERE 
    Departments.dept_name IN ('Sales', 'Development');
	
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
    last_name AS Last_Name,
    COUNT(*) AS Frequency
FROM 
    Employees
GROUP BY 
    last_name
ORDER BY 
    Frequency DESC;