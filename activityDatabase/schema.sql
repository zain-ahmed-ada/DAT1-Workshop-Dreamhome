.open activityDatabase/activity.sqlite
.mode column

DROP TABLE IF EXISTS branch;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS propertyForRent;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS privateOwner;
DROP TABLE IF EXISTS viewing;
DROP TABLE IF EXISTS registration;

PRAGMA foreign_keys = ON;

CREATE TABLE branch (
    branchNo TEXT PRIMARY KEY,
    street TEXT NOT NULL,
    city TEXT NOT NULL,
    postcode TEXT NOT NULL
);

CREATE TABLE staff (
    staffNo TEXT PRIMARY KEY,
    fName TEXT NOT NULL,
    lName TEXT NOT NULL,
    position TEXT NOT NULL,
    sex TEXT CHECK(sex IN ('M', 'F', 'Other')),
    DOB DATE NOT NULL,
    salary REAL NOT NULL,
    branchNo TEXT NOT NULL,
    FOREIGN KEY(branchNo) REFERENCES branch(branchNo) ON DELETE CASCADE
);

CREATE TABLE privateOwner (
    ownerNo TEXT PRIMARY KEY,
    fName TEXT NOT NULL,
    lName TEXT NOT NULL,
    address TEXT NOT NULL,
    telNo TEXT NOT NULL UNIQUE,
    eMail TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE propertyForRent (
    propertyNo TEXT PRIMARY KEY,
    street TEXT NOT NULL,
    city TEXT NOT NULL,
    postcode TEXT NOT NULL,
    type TEXT NOT NULL,
    rooms INTEGER NOT NULL CHECK (rooms > 0),
    rent REAL NOT NULL CHECK (rent > 0),
    ownerNo TEXT NOT NULL,
    staffNo TEXT,
    branchNo TEXT NOT NULL,
    FOREIGN KEY(ownerNo) REFERENCES privateOwner(ownerNo) ON DELETE CASCADE,
    FOREIGN KEY(staffNo) REFERENCES staff(staffNo) ON DELETE SET NULL,
    FOREIGN KEY(branchNo) REFERENCES branch(branchNo) ON DELETE CASCADE
);

CREATE TABLE client (
    clientNo TEXT PRIMARY KEY,
    fName TEXT NOT NULL,
    lName TEXT NOT NULL,
    telNo TEXT NOT NULL UNIQUE,
    prefType TEXT NOT NULL,
    maxRent REAL NOT NULL CHECK(maxRent > 0),
    eMail TEXT NOT NULL UNIQUE
);

CREATE TABLE viewing (
    clientNo TEXT NOT NULL,
    propertyNo TEXT NOT NULL,
    viewDate DATE NOT NULL,
    comment TEXT,
    PRIMARY KEY(clientNo, propertyNo, viewDate),
    FOREIGN KEY(clientNo) REFERENCES client(clientNo) ON DELETE CASCADE,
    FOREIGN KEY(propertyNo) REFERENCES propertyForRent(propertyNo) ON DELETE CASCADE
);

CREATE TABLE registration (
    clientNo TEXT NOT NULL,
    branchNo TEXT NOT NULL,
    staffNo TEXT,
    dateJoined DATE NOT NULL,
    PRIMARY KEY(clientNo, branchNo),
    FOREIGN KEY(clientNo) REFERENCES client(clientNo) ON DELETE CASCADE,
    FOREIGN KEY(branchNo) REFERENCES branch(branchNo) ON DELETE CASCADE,
    FOREIGN KEY(staffNo) REFERENCES staff(staffNo) ON DELETE SET NULL
);

INSERT INTO branch (branchNo, street, city, postcode) VALUES 
('B005', '22 Deer Rd', 'London', 'SW1 4EH'),
('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU'),
('B003', '163 Main St', 'Glasgow', 'G11 9QX'),
('B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ'),
('B002', '56 Clover Dr', 'London', 'NW10 6EU');

INSERT INTO staff (staffNo, fName, lName, position, sex, DOB, salary, branchNo) VALUES
('SL21', 'John', 'White', 'Manager', 'M', '1945-10-01', 30000, 'B005'),
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '1960-11-10', 12000, 'B003'),
('SG14', 'David', 'Ford', 'Supervisor', 'M', '1958-03-24', 18000, 'B003'),
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '1970-02-19', 9000, 'B007'),
('SG5', 'Susan', 'Brand', 'Manager', 'F', '1940-06-03', 24000, 'B003'),
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '1965-06-13', 9000, 'B005');

INSERT INTO privateOwner (ownerNo, fName, lName, address, telNo, eMail, password) VALUES 
('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB2 7SX', '01224-861212', 'jkeogh@lhh.com', '***********'),
('CO87', 'Carol', 'Farrel', '6 Archray St, Glasgow G32 9DX', '0141-357-7419', 'cfarrel@gmail.com', '***********'),
('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728', 'tinam@hotmail.com', '***********'),
('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0QR', '0141-225-7025', 'tony.shaw@ark.com', '***********'),
('CO86', 'New', 'Owner', 'Unknown Address', '01234-567890', 'new.owner@email.com', '***********');

INSERT INTO propertyForRent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo) VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46', 'SA9', 'B007'),
('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400, 'CO86', 'SL41', 'B005'),
('PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40', NULL, 'B003'),
('PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93', 'SG37', 'B003'),
('P21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600, 'CO87', 'SG37', 'B003'),
('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93', 'SG14', 'B003');

INSERT INTO client (clientNo, fName, lName, telNo, prefType, maxRent, eMail) VALUES
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425, 'john.kay@gmail.com'),
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350, 'astewart@hotmail.com'),
('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750, 'mritchie01@yahoo.co.uk'),
('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600, 'maryt@hotmail.com');

INSERT INTO viewing (clientNo, propertyNo, viewDate, comment) VALUES
('CR56', 'PA14', '2013-05-24', 'too small'),
('CR76', 'PG4', '2013-04-20', 'too remote'),
('CR56', 'PG4', '2013-05-26', NULL),
('CR62', 'PA14', '2013-05-14', 'no dining room'),
('CR56', 'PG36', '2013-04-28', NULL);

INSERT INTO registration (clientNo, branchNo, staffNo, dateJoined) VALUES
('CR76', 'B005', 'SL41', '2013-01-02'),
('CR56', 'B003', 'SG37', '2012-04-11'),
('CR76', 'B003', 'SG37', '2011-11-16'),
('CR76', 'B007', 'SA9', '2012-03-07');