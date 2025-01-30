.open dreamhome.sqlite
.mode column

-- 3.1

/*
SELECT ownerno, fname, lname
FROM privateowner
WHERE fname LIKE 'C%'
*/

-- 3.2

/*
SELECT 
    propertyno,
    rent,
    city,
    CASE 
        WHEN rent < 500 THEN 'Budget'
        WHEN rent > 1000 THEN 'Premium'
        ELSE 'Standard'
    END AS rental_category
FROM propertyforrent
ORDER BY rent;
*/


-- 3.3


SELECT ownerno AS 'position', fname, lname, 'Owner' AS type
FROM privateowner
UNION ALL
SELECT clientno AS 'position', fname, lname, 'Client' AS type
FROM client;

