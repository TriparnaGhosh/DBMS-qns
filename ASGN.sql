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

-- 21. Get only Year part of JoiningDate.
SELECT DATEPART(YEAR, JoiningDate) FROM EmployeeDetail;

-- 22. Get only Month part of JoiningDate.
SELECT DATEPART(MONTH, JoiningDate) FROM EmployeeDetail;

-- 23. Get system date.
SELECT GETDATE();

-- 24. Get UTC date.
SELECT GETUTCDATE();

-- 25. Get diff between current date and joining date in months.
SELECT FirstName, DATEDIFF(MM, JoiningDate, GETDATE()) AS [Total Months] FROM
EmployeeDetail;

-- 26. Get diff between current date and joining date in days.
SELECT FirstName, DATEDIFF(DD, JoiningDate, GETDATE()) AS [Total Days] FROM
EmployeeDetail;

-- 27. Get employee details whose joining year is 2013.
SELECT * FROM EmployeeDetail WHERE DATEPART(YYYY, JoiningDate) = 2013;

-- 28. Get employee details whose joining month is January.
SELECT * FROM EmployeeDetail WHERE DATEPART(MM, JoiningDate) = 1;

-- 29. Get employee details who joined between '2013-01-01' and '2013-12-01'.
SELECT * FROM EmployeeDetail WHERE JoiningDate BETWEEN '2013-01-01' AND
'2013-12-01';

-- 30. Get total number of employees.
SELECT COUNT(*) FROM EmployeeDetail;

-- 31. Select only top 1 record from EmployeeDetail table.
SELECT TOP 1 * FROM EmployeeDetail;

-- 32. Get employee details where FirstName IN ('Vikas', 'Ashish', 'Nikhil').
SELECT * FROM EmployeeDetail WHERE FirstName IN ('Vikas', 'Ashish', 'Nikhil');

-- 33. Get employee details where FirstName NOT IN ('Vikas', 'Ashish', 'Nikhil').
SELECT * FROM EmployeeDetail WHERE FirstName NOT IN ('Vikas', 'Ashish', 'Nikhil');

-- 34. Remove spaces from right side of FirstName.
SELECT RTRIM(FirstName) AS [FirstName] FROM EmployeeDetail;

-- 35. Remove spaces from left side of FirstName.
SELECT LTRIM(FirstName) AS [FirstName] FROM EmployeeDetail;

-- 36. Display FirstName and Gender as M/F.
SELECT FirstName, CASE WHEN Gender='Male' THEN 'M' WHEN Gender='Female' THEN 'F' END
AS Gender FROM EmployeeDetail;

-- 37. Prefix 'Hello' before FirstName.
SELECT 'Hello ' + FirstName AS Greeting FROM EmployeeDetail;

-- 38. Get employee details where Salary > 600000.
SELECT * FROM EmployeeDetail WHERE Salary > 600000;

-- 39. Get employee details where Salary < 700000.
SELECT * FROM EmployeeDetail WHERE Salary < 700000;

-- 40. Get employee details where Salary BETWEEN 500000 AND 600000.
SELECT * FROM EmployeeDetail WHERE Salary BETWEEN 500000 AND 600000;