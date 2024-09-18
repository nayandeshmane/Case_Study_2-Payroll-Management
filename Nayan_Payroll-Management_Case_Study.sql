use nayan;
-- 1. Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    hire_date DATE,
    department VARCHAR(30),
    job_title VARCHAR(30),
    email VARCHAR(30) UNIQUE,
    phone_number VARCHAR(15),
    address VARCHAR(50)
);
INSERT INTO Employees (employee_id, first_name, last_name, gender, date_of_birth, hire_date, department, job_title, email, phone_number, address)
VALUES
(1, 'Pratik', 'Gaiyakwad', 'Male', '1990-01-15', '2020-06-01', 'IT', 'Software Engineer', 'pratik.g@example.com', '9234567890', '123 Street, Buldhna'),
(2, 'Tejas', 'Gangurde', 'Male', '1988-07-22', '2018-03-15', 'HR', 'HR Manager', 'tejas.g@example.com', '9345678901', '234 Street, Nashik'),
(3, 'Sohil', 'Shaikh', 'Male', '1992-11-30', '2019-08-20', 'Finance', 'Accountant', 'sohil.s@example.com', '9456789012', '345 Street, Malkapur'),
(4, 'Gajendra', 'Ingle', 'Male', '1985-04-10', '2015-12-05', 'Operations', 'Operations Manager', 'gajendra.i@example.com', '9567890123', '456 Street, Malkapur'),
(5, 'Priya', 'Chauvan', 'Female', '1993-09-14', '2021-02-28', 'IT', 'Software Developer', 'priya.c@example.com', '9678901234', '567 Street, Thane'),
(6, 'Shakib', 'Shaikh', 'Male', '1991-03-25', '2017-07-11', 'Marketing', 'Marketing Analyst', 'shakib.s@example.com', '9789012345', '678 Street, Pune'),
(7, 'Simran', 'Sharma', 'Female', '1994-12-05', '2022-11-21', 'Sales', 'Sales Executive', 'simran.s@example.com', '9890123456', '789 Street, Pune');
select * from Employees;
-- ******************************************************************************************************************************************
-- 2. Salary Table
CREATE TABLE Salary (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    basic_salary INT,
    hra INT,         -- (HOUSE RENT ALLOWANCE)
    allowances INT,  -- ( AMOUNT OF SOMETHING THAT YOU ALLOWED TO PAY
    deductions INT   -- ( SPECIFIC AMOUNT OF MONEY SUBSTRACTED FROM AN EMPLOYESS GROSS PAY EG.TAXES,INSURANCE RETIREMENT CONTRIBUTION)
);
INSERT INTO Salary (salary_id, employee_id, basic_salary, hra, allowances, deductions)
VALUES
(101, 1, 50000, 10000, 5000, 2000),
(102, 2, 60000, 12000, 6000, 2500),
(103, 3, 45000, 9000, 4000, 1500),
(104, 4, 70000, 15000, 7000, 3000),
(105, 5, 55000, 11000, 5500, 2200),
(106, 6, 48000, 9500, 4500, 1800),
(107, 7, 52000, 10500, 5200, 2100);
select * from Salary;
-- **************************************************************************************************************************************
-- 3. Payroll Table
CREATE TABLE Payroll (
    payroll_id INT  PRIMARY KEY,
    employee_id INT,
    pay_date DATE,
    gross_salary INT,
    net_salary INT
);
INSERT INTO Payroll (payroll_id, employee_id, pay_date, gross_salary, net_salary)
VALUES
(01, 1, '2024-08-01', 65000, 63000),
(02, 2, '2024-08-01', 78000, 75500),
(03, 3, '2024-08-01', 57000, 55500),
(04, 4, '2024-08-01', 92000, 89000),
(05, 5, '2024-08-01', 71500, 69300),
(06, 6, '2024-08-01', 62000, 60200),
(07, 7, '2024-08-01', 68000, 65900);
select * from Payroll;
-- *****************************************************************************************************************************************
-- 4. Deductions Table   -- ( SPECIFIC AMOUNT OF MONEY SUBSTRACTED FROM AN EMPLOYESS GROSS PAY EG.TAXES,INSURANCE RETIREMENT CONTRIBUTION) 
CREATE TABLE Deductions (
    deduction_id INT  PRIMARY KEY,
    employee_id INT,
    deduction_type VARCHAR(50),
    amount INT,
    deduction_date DATE
);
INSERT INTO Deductions (deduction_id, employee_id, deduction_type, amount, deduction_date)
VALUES
(111, 1, 'Tax', 2000, '2024-08-01'),
(112, 2, 'Insurance', 2500, '2024-08-01'),
(113, 3, 'Tax', 1500, '2024-08-01'),
(114, 4, 'Insurance', 3000, '2024-08-01'),
(115, 5, 'Loan Repayment', 2200, '2024-08-01'),
(116, 6, 'Tax', 1800, '2024-08-01'),
(117, 7, 'Insurance', 2100, '2024-08-01');
select * from Deductions;
-- *********************************************************************************************************************************************
-- *********************************************************QUERIES*****************************************************************************
-- 1) Get all details of employees
SELECT * FROM Employees;

-- 2) List all salaries for employees
SELECT * FROM Salary;

-- 3) Get all deductions recorded
SELECT * FROM Deductions;

-- 4) Show payroll information for a specific employee (e.g., employee_id = 4)
SELECT * FROM Payroll WHERE employee_id = 4;

-- 5) Find employees in the 'Finance' department
SELECT * FROM Employees WHERE department = 'Finance';

-- 6) Find the net salary of an employee with a specific ID (e.g., employee_id = 7)
SELECT p.net_salary FROM Payroll p WHERE p.employee_id = 7;

-- 7) Get all employees who were hired after January 1, 2020
SELECT * FROM Employees WHERE hire_date > '2020-01-01';

-- 8) Show all deductions for employee_id = 5
SELECT * FROM Deductions WHERE employee_id = 5;

-- 9) Get the total number of employees in the system
SELECT COUNT(*) AS total_employees FROM Employees;

-- 10) Find the highest basic salary among employees
SELECT MAX(basic_salary) AS highest_basic_salary FROM Salary;

-- 11) Question: Find employees whose first name starts with 'P'.
SELECT * FROM Employees WHERE first_name LIKE 'P%';

-- 12) Question: Get employees whose email contains 'example.com'.
SELECT * FROM Employees WHERE email LIKE '%example.com%';

-- 13) Question: Retrieve employees whose last name ends with 'shaikh'.
SELECT * FROM Employees WHERE last_name LIKE '%shaikh';

-- 14) Question: Find employees with a first name that has 'a' in it.
SELECT * FROM Employees WHERE first_name LIKE '%a%';

-- 15) Get employees whose address includes 'Street'.
SELECT * FROM Employees WHERE address LIKE '%Street%';

-- 16) Question: Show the first 5 employees.
SELECT * FROM Employees LIMIT 5;

-- 17) Question: Retrieve the top 3 highest salaries.
SELECT * FROM Salary ORDER BY basic_salary DESC LIMIT 3;

-- 18) Question: Get the first 2 payroll entries for a specific pay date (e.g., '2024-08-01').
SELECT * FROM Payroll WHERE pay_date = '2024-08-01' LIMIT 2;

-- 19) Question: Display 4 random employees.
SELECT * FROM Employees ORDER BY RAND() LIMIT 4;

-- 20) Question: Show the last 5 deductions.
SELECT * FROM Deductions ORDER BY deduction_id DESC LIMIT 5;

-- 21) Question: List employees sorted by their last name in ascending order.
SELECT * FROM Employees ORDER BY last_name ASC;

-- 22) Question: Retrieve salaries ordered by basic_salary in descending order.
SELECT * FROM Salary ORDER BY basic_salary DESC;

-- 23) Question: Show payroll entries ordered by pay_date and then by gross_salary in ascending order.
SELECT * FROM Payroll ORDER BY pay_date ASC, gross_salary ASC;

-- 24) Question: Get employees ordered by their department and hire date in descending order.
SELECT * FROM Employees ORDER BY department ASC, hire_date DESC;

-- 25) Question: Display deductions ordered by amount in ascending order.
SELECT * FROM Deductions ORDER BY amount ASC;

-- 26) Question: Find all unique departments from the Employees table.
SELECT DISTINCT department FROM Employees;

-- 27) Question: Get all distinct job titles.
SELECT DISTINCT job_title FROM Employees;

-- 28) Question: Retrieve distinct email domains from the Employees table.
SELECT DISTINCT SUBSTRING_INDEX(email, '@', -1) AS domain FROM Employees;

-- 29) Question: Show distinct deduction types.
SELECT DISTINCT deduction_type FROM Deductions;

-- 30) Question: Get unique basic salaries from the Salary table.
SELECT DISTINCT basic_salary FROM Salary;

-- 31) Question: Find the total amount of all deductions combined.
SELECT SUM(amount) AS total_deductions FROM Deductions;

-- 32) Question: Combine the first name and last name of employees into a full name.
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Employees;

-- 33) Question: List employees whose address starts with '123'.
SELECT first_name, last_name, address FROM Employees WHERE address LIKE '123%';

-- 34) Question: List departments that do not have any employees.
SELECT department FROM Employees WHERE department NOT IN (
SELECT DISTINCT department FROM Employees
);

-- 35) Question: Find employees who do not have any deductions.
SELECT first_name, last_name FROM Employees e WHERE e.employee_id 
NOT IN (SELECT employee_id FROM Deductions
);

-- 36) Question: Calculate the average gross salary of employees who have at least one deduction.
SELECT AVG(p.gross_salary) AS average_gross_salary FROM Payroll p WHERE p.employee_id 
IN ( SELECT DISTINCT employee_id FROM Deductions
);

-- 37) Question: Find the number of employees in each department.
SELECT department, COUNT(*) AS number_of_employees FROM Employees
GROUP BY department;

-- 38) Question: Calculate the average basic salary for each department.
SELECT department, AVG(basic_salary) AS average_salary FROM Employees e
JOIN Salary s ON e.employee_id = s.employee_id
GROUP BY department;

-- 39) Question: Get the total allowances for each job title.
SELECT job_title, SUM(allowances) AS total_allowances FROM Employees e
JOIN Salary s ON e.employee_id = s.employee_id
GROUP BY job_title;

-- 40) Question: Find departments that have more than 2 employees.
SELECT department, COUNT(*) AS number_of_employees FROM Employees
GROUP BY department
HAVING COUNT(*) > 2;

-- 41) Question: Calculate the total deductions for each deduction type.
SELECT deduction_type, SUM(amount) AS total_deductions FROM Deductions
GROUP BY deduction_type;

-- 42) Question: Find the highest basic salary in each department.
SELECT department, MAX(basic_salary) AS highest_salary FROM Employees e
JOIN Salary s ON e.employee_id = s.employee_id
GROUP BY department;

-- 43) Question: Find employees whose total allowances exceed 10,000.
SELECT e.employee_id, e.first_name, e.last_name, SUM(s.allowances) AS total_allowances FROM Employees e
JOIN Salary s ON e.employee_id = s.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
HAVING SUM(s.allowances) > 10000;

-- 44) Question: Retrieve the names and basic salaries of employees.
SELECT e.first_name, e.last_name, s.basic_salary
FROM Employees e
JOIN Salary s ON e.employee_id = s.employee_id;

-- 45) Question: Get all employees and their payroll details, including those without payroll records.
SELECT e.first_name, e.last_name, p.gross_salary
FROM Employees e
LEFT JOIN Payroll p ON e.employee_id = p.employee_id;

-- 46) Question: Find all payroll records and match them with employee names, including payroll records that do not have corresponding employees.
SELECT p.payroll_id, e.first_name, e.last_name
FROM Payroll p
RIGHT JOIN Employees e ON p.employee_id = e.employee_id;

-- 47) Question: Retrieve employees along with their basic salary and net salary.
SELECT e.first_name, e.last_name, s.basic_salary, p.net_salary
FROM Employees e
JOIN Salary s ON e.employee_id = s.employee_id
JOIN Payroll p ON e.employee_id = p.employee_id;


-- 48) Question: Find pairs of employees who work in the same department.
SELECT e1.first_name AS Employee1, e2.first_name AS Employee2, e1.department
FROM Employees e1
JOIN Employees e2 ON e1.department = e2.department AND e1.employee_id <> e2.employee_id;

-- 49) Question: Find employees whose net salary exceeds 60,000.
SELECT e.first_name, e.last_name, p.net_salary
FROM Employees e
JOIN Payroll p ON e.employee_id = p.employee_id
WHERE p.net_salary > 60000;

-- 50) Question: List employees with total deductions exceeding 2,000.
SELECT e.first_name, e.last_name, SUM(d.amount) AS total_deductions
FROM Employees e
JOIN Deductions d ON e.employee_id = d.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
HAVING SUM(d.amount) > 2000;













