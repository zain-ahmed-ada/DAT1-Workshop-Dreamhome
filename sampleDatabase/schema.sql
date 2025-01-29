.open sampleDatabase/sample.sqlite
.mode column

DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS voter;
DROP TABLE IF EXISTS books;

CREATE TABLE contacts (
    contact_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL DEFAULT 'No Surname',
    email TEXT,
    phone TEXT NOT NULL
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    list_price DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE voter(
    voter_id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    dob DATE
);

CREATE TABLE books(
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    price INTEGER,
    disc_Price INTEGER,
    description VARCHAR(1000)
);

INSERT INTO contacts (contact_id, first_name, last_name, email, phone)
VALUES (1, 'Zain', 'Ahmed', 'zain.ahmed@ada.ac.uk', '123');

INSERT INTO voter (voter_id, name, age, dob)
VALUES (1, 'Zain', 19, '2005-10-11');

SELECT *
FROM Contacts;