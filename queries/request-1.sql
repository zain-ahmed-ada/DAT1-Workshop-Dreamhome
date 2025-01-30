.open dreamhome.sqlite
.mode column

-- 1.1
/*
SELECT postcode
FROM propertyforrent;
*/

-- 1.2
/*
SELECT propertyno, viewdate
FROM viewing;
*/
-- 1.3


SELECT propertyno, postcode
FROM propertyforrent
WHERE postcode LIKE '%BS1%';
