.open dreamhome.sqlite
.mode column

-- 2.1

/*
SELECT propertyno
FROM propertyforrent
WHERE ownerno = 'PO4756';
*/

-- 2.2

/*
SELECT clientno
FROM registration
WHERE branchno = 'B052' AND datejoined > '2013-09-28'
*/

-- 2.3


SELECT propertyno, viewdate
FROM viewing
ORDER BY viewdate ASC;