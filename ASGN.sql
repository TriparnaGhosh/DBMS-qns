-- Create database
CREATE DATABASE EmployeeDB;
GO

-- Use database
USE EmployeeDB;
GO

-- Create table
CREATE TABLE EmployeeDetail (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Salary DECIMAL(18,2),
    JoiningDate DATETIME,
    Department NVARCHAR(50),
    Gender NVARCHAR(10)
);
GO

-- Insert sample data
INSERT INTO EmployeeDetail (EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender) VALUES
(1, 'Vikas', 'Ahlawat', 600000.00, '2013-02-15 11:16:28.290', 'IT', 'Male'),
(2, 'Nikita', 'Jain', 530000.00, '2014-01-09 17:31:07.793', 'HR', 'Female'),
(3, 'Ashish', 'Kumar', 1000000.00, '2014-01-10 09:10:05.793', 'IT', 'Male'),
(4, 'Nikhil', 'Sharma', 480000.00, '2014-01-09 09:00:07.793', 'HR', 'Male'),
(5, 'Anish', 'Kadian', 500000.00, '2014-01-09 09:31:07.793', 'Payroll', 'Male');
GO

-- 1. Get all employee details
SELECT * FROM EmployeeDetail;

-- 2. Get only "FirstName" column
SELECT FirstName FROM EmployeeDetail;

-- 3. Get FirstName in upper case as "First Name"
SELECT UPPER(FirstName) AS [First Name] FROM EmployeeDetail;

-- 4. Get FirstName in lower case as "First Name"
SELECT LOWER(FirstName) AS [First Name] FROM EmployeeDetail;

-- 5. Combine FirstName and LastName as "Name"
SELECT FirstName + ' ' + LastName AS [Name] FROM EmployeeDetail;

-- 6. Employee whose name is "Vikas"
SELECT * FROM EmployeeDetail WHERE FirstName = 'Vikas';

-- 7. Employees whose FirstName starts with 'a'
SELECT * FROM EmployeeDetail WHERE FirstName LIKE 'a%';

-- 8. Employees whose FirstName contains 'k'
SELECT * FROM EmployeeDetail WHERE FirstName LIKE '%k%';

-- 9. Employees whose FirstName ends with 'h'
SELECT * FROM EmployeeDetail WHERE FirstName LIKE '%h';

-- 10. Employees whose FirstName starts between 'a-p'
SELECT * FROM EmployeeDetail WHERE FirstName LIKE '[a-p]%';

-- 11. FirstName not starting between 'a-p'
SELECT * FROM EmployeeDetail WHERE FirstName LIKE '[^a-p]%';

-- 12. Gender ends with 'le' and has 4 letters
SELECT * FROM EmployeeDetail WHERE Gender LIKE '__le';

-- 13. FirstName starts with 'A' and has 5 letters
SELECT * FROM EmployeeDetail WHERE FirstName LIKE 'A____';

-- 14. FirstName containing '%'
SELECT * FROM EmployeeDetail WHERE FirstName LIKE '%[%]%';

-- 15. Get unique Department
SELECT DISTINCT(Department) FROM EmployeeDetail;

-- 16. Highest salary
SELECT MAX(Salary) AS [Highest Salary] FROM EmployeeDetail;

-- 17. Lowest salary
SELECT MIN(Salary) AS [Lowest Salary] FROM EmployeeDetail;

-- 18. JoiningDate in "dd mmm yyyy" format
SELECT CONVERT(VARCHAR(20), JoiningDate, 106) AS [Joining Date] FROM EmployeeDetail;

-- 19. JoiningDate in "yyyy/mm/dd" format
SELECT CONVERT(VARCHAR(20), JoiningDate, 111) AS [Joining Date] FROM EmployeeDetail;

-- 20. Show only time part of JoiningDate
SELECT CONVERT(VARCHAR(20), JoiningDate, 108) AS [Joining Time] FROM EmployeeDetail;