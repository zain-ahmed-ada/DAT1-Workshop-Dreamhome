.open dreamhome.sqlite
.mode column

-- Example 6.13

/*
SELECT COUNT(*) AS myCount
FROM PropertyForRent
WHERE rent > 350;
*/

-- Example 6.14

/*
SELECT COUNT(DISTINCT propertyNo) AS myCount
FROM Viewing
WHERE viewDate BETWEEN '1-May-13' AND '31-May-13';
*/

-- Example 6.15

/*
SELECT COUNT(staffNo) AS myCount, SUM(salary) AS mySum
FROM Staff
WHERE position = 'Manager';
*/

-- Example 6.16

/*
SELECT MIN(salary) AS myMin, MAX(Salary) AS myMax, AVG(salary) AS myAvg
FROM Staff;
*/

-- Example 6.17

/*
SELECT branchNo, COUNT(staffNo) AS myCount, SUM(salary) AS mySum
FROM Staff
GROUP BY branchNo
ORDER BY branchNo;
*/

-- Example 6.18

/*
SELECT branchNo, COUNT(staffNo) AS myCount, SUM(salary) as mySum
FROM Staff
GROUP BY branchNo
HAVING COUNT(staffNo) > 1
ORDER BY branchNo;
*/

-- Example 6.19

/*
SELECT staffNo, fName, lName, position
FROM Staff
WHERE branchNo = (SELECT branchNo
                  FROM Branch
                  WHERE street = '163 Main St')
*/

-- Example 6.20

/*
SELECT staffNo, fName, lName, position,
       salary - (SELECT AVG(salary) FROM Staff) AS salDiff
FROM Staff
WHERE salary > (SELECT AVG(salary) FROM Staff);
*/

-- Example 6.21

/*
SELECT propertyNo, street, city, postcode, type, rooms, rent
FROM PropertyForRent
WHERE staffNo IN (SELECT staffNo
                  FROM Staff
                  WHERE branchNo = (SELECT branchNo
                                    FROM Branch
                                    WHERE street = '163 Main St'));
*/

-- Example 6.22

/*
SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary > SOME(SELECT salary
                    FROM Staff
                    WHERE branchNo = 'B003');
*/

-- Example 6.23

SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary > ALL(SELECT salary
                    FROM Staff
                    WHERE branchNo = 'B003');