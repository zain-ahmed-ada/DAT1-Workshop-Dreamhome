.open dreamhome.sqlite
.mode column

-- Example 6.1

/*
SELECT *
FROM Staff;
*/

-- Example 6.2

/*
SELECT staffNo, fName, lName, salary
FROM Staff;
*/

-- Example 6.3

/*
SELECT DISTINCT propertyNo
FROM Viewing;
*/

-- Example 6.4

/*
SELECT staffNo, fName, lName, salary/12 AS monthlySalary
FROM Staff;
*/

-- Example 6.5

/*
SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary > 10000;
*/

-- Example 6.6

/*
SELECT *
FROM Branch
Where city = 'London' OR city = 'Glasgow';
*/

-- Example 6.7

/*
SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary >= 20000 AND salary <= 30000;
*/

-- Example 6.8

/*
SELECT staffNo, fName, lName, position
FROM Staff
WHERE position = 'Manager' OR position = 'Supervisor';
*/

-- Example 6.9

/*
SELECT ownerno, fName, lName, address, telNo
FROM PrivateOwner
WHERE address LIKE '%Glasgow%';
*/

-- Example 6.10

/*
SELECT clientNo, viewDate
FROM Viewing
WHERE propertyNo = 'PG4' AND comment IS NULL;
*/

-- Example 6.11

/*
SELECT staffNo, fName, lName, salary
FROM Staff
ORDER BY salary DESC;
*/

-- Example 6.12

SELECT propertyNo, type, rooms, rent
FROM PropertyForRent
ORDER BY type, rent DESC;
