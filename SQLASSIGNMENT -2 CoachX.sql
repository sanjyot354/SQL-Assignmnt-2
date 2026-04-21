--SQL ASSIGNMENT--

USE Brands
--We have two table EmployeeDetails and Employee Salary Table .

/*EXECUTE  the CREATE Query and Insert the Given records in the particular table in 
your  SQL  Editor. */

--1. EmployeeDetails Table :-
CREATE TABLE EmployeeDetails (
EmpId INT PRIMARY KEY, 
FullName VARCHAR(100), 
ManagerId INT, 
DateOfJoining DATE, 
City VARCHAR(100) 
);

--2. EmployeeSalary Table 
CREATE TABLE EmployeeSalary ( 
EmpId INT, 
Project VARCHAR(50), 
Salary DECIMAL(10, 2), 
Variable DECIMAL(10, 2), 
FOREIGN KEY (EmpId) REFERENCES 
EmployeeDetails(EmpId) 
);

--Insert Record Table 1: EmployeeDetails
INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, 
DateOfJoining, City) VALUES 
(101, 'Alice Johnson', 321, '2022-05-15', 'New York'), 
(102, 'Bob Smith', 876, '2020-03-12', 'Los Angeles'), 
(103, 'Charlie Brown', 986, '2021-08-23', 'Chicago'), 
(104, 'David Williams', 876, '2019-11-05', 'Houston'), 
(105, 'Eve Davis', 321, '2023-01-07', 'Phoenix'), 
(106, 'Frank Miller', 986, '2018-12-19', 'Philadelphia'), 
(107, 'Grace Wilson', 876, '2022-03-28', 'San Antonio'), 
(108, 'Hank Moore', 321, '2021-09-14', 'San Diego'), 
(109, 'Ivy Taylor', 986, '2020-02-11', 'Dallas'), 
(110, 'Jack Anderson', 876, '2022-11-30', 'San Jose'), 
(111, 'Karen Thomas', 321, '2021-07-16', 'Austin'), 
(112, 'Liam Jackson', 986, '2023-04-21', 'Fort Worth'), 
(113, 'Mia White', 876, '2019-06-03', 'Columbus'), 
(114, 'Noah Harris', 321, '2020-12-10', 'Charlotte'), 
(115, 'Olivia Martin', 986, '2021-10-25', 'San Francisco'), 
(116, 'Paul Garcia', 876, '2023-07-18', 'Indianapolis'), 
(117, 'Quinn Martinez', 321, '2022-09-07', 'Seattle'), 
(118, 'Rachel Rodriguez', 986, '2020-01-15', 'Denver'), 
(119, 'Steve Clark', 876, '2021-03-19', 'Washington'), 
(120, 'Tina Lewis', 321, '2019-08-31', 'Boston');

--Insert Record Table 2 EmployeeSalary :-
INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable) 
VALUES 
(101, 'P1', 7500, 500), 
(102, 'P2', 9200, 700), 
(103, 'P1', 6700, 600), 
(104, 'P3', 8300, 900), 
(105, 'P2', 7800, 800), 
(106, 'P3', 9100, 1000), 
(107, 'P1', 6200, 400), 
(108, 'P2', 8800, 750), 
(109, 'P3', 9500, 1100), 
(110, 'P1', 7200, 650), 
(111, 'P2', 8700, 850), 
(112, 'P3', 9300, 1200), 
(113, 'P1', 7900, 550), 
(114, 'P2', 6800, 450), 
(115, 'P3', 8400, 900), 
(116, 'P1', 7600, 500), 
(117, 'P2', 8900, 1000), 
(118, 'P3', 9200, 1100), 
(119, 'P1', 8100, 600), 
(120, 'P2', 8300, 750);
SELECT * FROM EmployeeDetails;
SELECT * FROM EmployeeSalary;
--Solve the Below Questions :- 
--Basics and Intermediate Questions  
--PART-1 :-
--Q1)SQL Query to fetch records that are present in one table but not in another table. 
SELECT ED.FullName , ED.ManagerId , ES.Project, ES.Salary
FROM EmployeeDetails AS ED
LEFT JOIN 
EmployeeSalary AS ES
ON 
ED.EmpId=ES.EmpId
WHERE ES.EmpId IS NULL;

--2. SQL query to fetch all the employees who are not working on any project: 

SELECT Ed.FullName ,Ed.ManagerId, Es.Project ,Es.Salary
FROM EmployeeDetails AS Ed
LEFT JOIN EmployeeSalary AS Es
ON 
Ed.EmpId=Es.EmpId
WHERE Es.Project IS NULL;

--3. SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020:
SELECT EmpId, FullName ,DateOfJoining 
FROM EmployeeDetails
WHERE YEAR (DateOfJoining)=2020;

--4. Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary: 
SELECT Ed.FullName , Es.Salary
FROM EmployeeSalary AS Es
INNER JOIN EmployeeDetails AS Ed
ON 
Ed.EmpId=Es.EmpId;

--5. Write an SQL query to fetch a project-wise count of employees: 
SELECT Project , COUNT(Project ) AS CountsOProject
FROM EmployeeSalary
GROUP BY Project;

--6. Fetch employee names and salaries even if the salary value is not present for the employee: 
SELECT Ed.FullName ,Es.salary
FROM EmployeeDetails  AS Ed
LEFT JOIN  EmployeeSalary AS Es
ON 
Ed.EmpId= Es.EmpId;

--7. Write an SQL query to fetch all the Employees who are also managers:
SELECT DISTINCT ManagerId
FROM EmployeeDetails
WHERE ManagerId IS NOT NULL ;

--8. Write an SQL query to fetch duplicate records from EmployeeDetails:
SELECT * , COUNT (*) AS Duplicantcounts
FROM EmployeeDetails
GROUP BY EmpId,FullName ,ManagerId, DateOfJoining, City
HAVING COUNT (*)>1;

--9. Write an SQL query to fetch only odd rows from the table: 
SELECT * FROM 
(SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum
FROM EmployeeDetails) AS Temp
WHERE RowNum %2 =1;

--10. Write a query to find the 3rd highest salary from a table without using TOP or LIMIT: 
SELECT DISTINCT Salary 
FROM EmployeeSalary 
ORDER BY Salary DESC
OFFSET 2 ROWS
FETCH NEXT 1 ROW ONLY;

--PART 2 :-
--1. Fetch the EmpId and FullName of all employees working under Manager with id '986': 
SELECT * FROM EmployeeDetails
WHERE ManagerId=986;

--2. Fetch the different projects available from the EmployeeSalary table: 
SELECT DISTINCT Project
FROM EmployeeSalary
WHERE Project IS NOT NULL;

--3. Fetch the count of employees working in project 'P1':
SELECT COUNT (*) AS CountOfProjects
FROM EmployeeSalary
WHERE Project= 'P1';

--4. Find the maximum, minimum, and average salary of the employees: 
SELECT MAX(Salary) AS MaxSalary,
       MIN(Salary) AS MinSalary,
	   AVG(Salary) AS AvgSalary
	   FROM EmployeeSalary;

--5. Find the employee id whose salary lies in the range of 9000 and 15000: 
SELECT EmpId,Salary
FROM EmployeeSalary
WHERE Salary BETWEEN 9000 AND 15000;

--6. Fetch those employees who live in Toronto and work under the manager with ManagerId – 321:
SELECT EmpId, ManagerId , City
FROM EmployeeDetails 
WHERE City ='Toronto' AND ManagerId = 321;

--7.Fetch all the employees who either live in California or work under a manager with ManagerId – 321:
SELECT EmpId , ManagerId ,City 
FROM EmployeeDetails
WHERE City='California' OR ManagerId=321;

--8. Fetch all those employees who work on Projects other than P1:
SELECT * FROM EmployeeSalary
WHERE Project != 'P1';

--9. Display the total salary of each employee adding the Salary with Variable value: 
SELECT EmpId,Salary + Variable 
AS TotalSalary 
FROM EmployeeSalary;

/*10. Fetch the employees whose name begins with any two 
characters, followed by "hn", and ends with any sequence of 
characters: */
SELECT * FROM EmployeeDetails
WHERE FullName LIKE '__hn%';

--PART 3 :-
--1. Fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’:
SELECT EmpId FROM EmployeeDetails UNION 
SELECT EmpId FROM EmployeeSalary;

--2. Fetch common records between two tables:
SELECT Ed.FullName , Ed.ManagerId,Es.Salary
FROM EmployeeDetails AS Ed
INNER JOIN EmployeeSalary AS Es
ON 
Ed.EmpId=Es.EmpId;

--3. Fetch records that are present in one table but not in another table:
SELECT Ed.*
FROM EmployeeDetails AS Ed
LEFT JOIN EmployeeSalary AS Es
ON 
Ed.EmpId=Es.EmpId
WHERE Es.EmpId IS NULL;

--4. Fetch the EmpIds that are present in both the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’:
SELECT Ed.EmpId
FROM EmployeeDetails AS Ed
INNER JOIN EmployeeSalary AS Es
ON 
Ed.EmpId=Es.EmpId;

--5. Fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary:
SELECT Ed.EmpId
FROM EmployeeDetails AS Ed
LEFT JOIN EmployeeSalary AS Es
ON 
Ed.EmpId=Es.EmpId
WHERE Es.EmpId IS NULL;

--6. Fetch the employee’s full names and replace the space:
SELECT FullName,
      REPLACE (FullName,' ','_') AS ModifiedName
FROM EmployeeDetails;

--7. Fetch the position of a given character(s) in a field:
SELECT FullName ,
       CHARINDEX('a',FullName) AS Position
FROM EmployeeDetails;

--8. Display both the EmpId and ManagerId together:
SELECT CONCAT (EmpId,',',ManagerId) AS EmpMangerID
FROM EmployeeDetails;

--9. Fetch only the first name (string before space) from the FullName column: 
SELECT LEFT(FullName, CHARINDEX(' ', FullName) - 1) AS FirstName
FROM EmployeeDetails;

--10. Uppercase the name of the employee and lowercase the city values: 
SELECT UPPER(FullName) AS FULLNAME ,
       lower(City) AS cityname
FROM EmployeeDetails;

--PART 4 
--1. Find the count of the total occurrences of a particular character – ‘n’ in the FullName field:
SELECT FullName,
       LEN (FullName) -LEN  (REPLACE (Fullname,'n',' ')) AS n_Count
FROM EmployeeDetails;

--2. Update the employee names by removing leading and trailing spaces: 
UPDATE EmployeeDetails
SET FullName= LTRIM (RTRIM(FullName));

--3. Fetch all the employees who are not working on any project:
SELECT Ed.FullName,Es.Project
FROM EmployeeDetails AS Ed
LEFT JOIN EmployeeSalary AS Es
ON Ed.EmpId=Es.EmpId
WHERE Es.Project IS NULL;

--4. Fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000:
SELECT * FROM EmployeeSalary
WHERE Salary BETWEEN 5000 AND 10000;

--5. Find the current date-time:
SELECT CURRENT_TIMESTAMP;

--6. Fetch all Employee details from the EmployeeDetails table who joined in the Year 2020: 
SELECT * FROM EmployeeDetails
WHERE YEAR(DateOfJoining) =2020;

--7. Fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table: 
SELECT D.EmpId,D.ManagerId ,S.Salary
FROM EmployeeDetails AS D
INNER JOIN EmployeeSalary AS S
ON D.EmpId= S.EmpId;

--8. Fetch the project-wise count of employees sorted by project’s count in descending order:
SELECT Project ,COUNT(*) AS EmployeeCount 
FROM EmployeeSalary
GROUP BY Project
ORDER BY COUNT(*)DESC;

--9. Fetch employee names and salary records. Display the employee details even if the salary record is not present: 
SELECT D.FullName, S.Salary
FROM EmployeeDetails AS D
LEFT JOIN EmployeeSalary AS S
ON
D.EmpId=S.EmpId;

--10. Write an SQL query to join 3 tables: 
--SYNTAX:
/*SELECT Column_Name FROM Table1
 JOIN Table2
 ON
 Table1.CommonColumn=Table1.Common.Column
 JOIN Table2
 ON
 Table2.CommonColumn=Table3.CommonColumn*/