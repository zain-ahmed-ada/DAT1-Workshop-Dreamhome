.open dreamhome.sqlite
.mode column

-- 5.1

/*
SELECT COUNT(propertyNo) AS 'Total Properties'
FROM propertyforrent
WHERE staffno = (SELECT staffNo
                FROM staff
                WHERE staffNo = 'SSU15');
*/

-- 5.2

/*
SELECT propertyno, city, COUNT(city) AS 'Property Count'
FROM propertyforrent
GROUP BY city
HAVING COUNT(city) > 2;
*/

-- 5.3


SELECT s.staffno, s.fname, s.lname
FROM staff s
JOIN propertyforrent p ON s.staffno = p.staffno
WHERE p.rent > (SELECT AVG(rent) 
               FROM propertyforrent);
