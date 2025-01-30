.open dreamhome.sqlite
.mode column

-- 6.1

/*
SELECT DISTINCT b.branchno, b.city
FROM branch b
UNION
SELECT DISTINCT p.branchno, p.city
FROM propertyforrent p;
*/

-- 6.2

-- DROP TABLE IF EXISTS propertyreviews

CREATE TABLE propertyreviews(
    propertyNo TEXT,
    clientNo TEXT,
    reviewDate DATE,
    rating TEXT,
    customerFeedback TEXT
);

-- 6.3

INSERT INTO propertyreviews (propertyNo, clientNo, reviewDate, rating, customerFeedback)
VALUES ('PR1423', 'CL7623', '2023-05-15', 4, 'Spacious and well-maintained property. Great location.');

INSERT INTO propertyreviews (propertyNo, clientNo, reviewDate, rating, customerFeedback)
VALUES ('PR9478', 'CL5612', '2023-05-16', 5, 'Excellent modern amenities. Highly recommended!');

INSERT INTO propertyreviews (propertyNo, clientNo, reviewDate, rating, customerFeedback)
VALUES ('PR4567', 'CL7489', '2023-05-17', 3, 'Decent property, but needs some minor repairs.');

INSERT INTO propertyreviews (propertyNo, clientNo, reviewDate, rating, customerFeedback)
VALUES ('PR3689', 'CL6234', '2023-05-18', 4, 'Good value for money. Nice neighborhood.');

INSERT INTO propertyreviews (propertyNo, clientNo, reviewDate, rating, customerFeedback)
VALUES ('PR2145', 'CL7712', '2023-05-19', 2, 'Disappointing. Several issues with plumbing and heating.');

-- 6.4

DELETE 
FROM viewings
WHERE viewdate < '2013-06-01';
