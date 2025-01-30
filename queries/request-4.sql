.open dreamhome.sqlite
.mode column

-- 4.1

/*
SELECT propertyno, ownerno, street, city, postcode, type, rooms, rent
FROM propertyforrent;
*/

-- 4.2

/*
SELECT propertyno, ownerno, street, city, postcode, type, rooms, rent
FROM propertyforrent
WHERE rent > (SELECT AVG(rent) 
              FROM propertyforrent)
ORDER BY rent DESC;
*/

-- 4.3


SELECT propertyno, ownerno, city, rent AS old_rent_price, rent * 1.1 as new_rent_price
FROM propertyforrent
WHERE city = 'Manchester';


