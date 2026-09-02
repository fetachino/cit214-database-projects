#query 1
CREATE DATABASE apartment_rental;
USE apartment_rental;
#query 2
DROP TABLE IF EXISTS Apartment_Building_TBL;
CREATE TABLE Apartment_Building_TBL (
    BuildingID INT NOT NULL,
    BuildingName VARCHAR(50) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Zip VARCHAR(10) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    CONSTRAINT Apartment_Building_BuildingID_PK PRIMARY KEY (BuildingID)
);
#query 3
DROP TABLE IF EXISTS Employer_TBL;
CREATE TABLE Employer_TBL (
    EmployerID INT NOT NULL,
    CompanyName VARCHAR(100) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Zip VARCHAR(10) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    ContractDiscount DECIMAL(4,3) NOT NULL,
    CONSTRAINT Employer_EmployerID_PK PRIMARY KEY (EmployerID)
);
#query 4
DROP TABLE IF EXISTS Apartment_Type_TBL;
CREATE TABLE Apartment_Type_TBL (
    ApartmentTypeID INT NOT NULL,
    ApartmentType VARCHAR(50) NOT NULL,
    PricePerNight DECIMAL(10,2) NOT NULL,
    CONSTRAINT Apartment_Type_ApartmentTypeID_PK PRIMARY KEY (ApartmentTypeID)
);
#query 5
DROP TABLE IF EXISTS Apartment_TBL;
CREATE TABLE Apartment_TBL (
    ApartmentID INT NOT NULL,
    AptNumber VARCHAR(10) NOT NULL,
    AptFloor INT NOT NULL,
    BuildingID INT NOT NULL,
    ApartmentTypeID INT NOT NULL,
    AptAvailable VARCHAR(3) NOT NULL,
    CONSTRAINT Apartment_ApartmentID_PK PRIMARY KEY (ApartmentID),
    CONSTRAINT Apartment_BuildingID_FK FOREIGN KEY (BuildingID) 
        REFERENCES Apartment_Building_TBL(BuildingID),
    CONSTRAINT Apartment_ApartmentTypeID_FK FOREIGN KEY (ApartmentTypeID) 
        REFERENCES Apartment_Type_TBL(ApartmentTypeID)
);
#query 6
DROP TABLE IF EXISTS Trainee_TBL;
CREATE TABLE Trainee_TBL (
    TraineeID INT NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    PermStreet VARCHAR(100) NOT NULL,
    PermCity VARCHAR(50) NOT NULL,
    PermState VARCHAR(50) NOT NULL,
    PermZip VARCHAR(10) NOT NULL,
    PermPhone VARCHAR(15),
    EmployerID INT NOT NULL,
    CONSTRAINT Trainee_TraineeID_PK PRIMARY KEY (TraineeID),
    CONSTRAINT Trainee_EmployerID_FK FOREIGN KEY (EmployerID) 
        REFERENCES Employer_TBL(EmployerID)
);
#query 7
DROP TABLE IF EXISTS Apartment_Rental_TBL;
CREATE TABLE Apartment_Rental_TBL (
    RentalID INT NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    ApartmentPhone VARCHAR(15) NOT NULL,
    ApartmentID INT NOT NULL,
    TraineeID INT NOT NULL,
    CONSTRAINT Apartment_Rental_RentalID_PK PRIMARY KEY (RentalID),
    CONSTRAINT Apartment_Rental_ApartmentID_FK FOREIGN KEY (ApartmentID) 
        REFERENCES Apartment_TBL(ApartmentID),
    CONSTRAINT Apartment_Rental_TraineeID_FK FOREIGN KEY (TraineeID) 
        REFERENCES Trainee_TBL(TraineeID)
);
#query 8
INSERT INTO Apartment_Building_TBL VALUES
(1, 'Alpha House 1', '123 Wood Street', 'Detroit', 'Michigan', '48763', '234-345-1234'),
(2, 'Alpha House 2', '234 Birch Avenue', 'Detroit', 'Michigan', '48788', '234-456-9876');
#query 9
INSERT INTO Employer_TBL VALUES
(1, 'Daimler-Chrysler', '1234 Chrysler Lane', 'Detroit', 'Michigan', '12345', '123-098-0987', 0.075),
(2, 'Ford Motor Company', '2345 Ford Road', 'Ann Arbor', 'Michigan', '23456', '234-876-8765', 0.055),
(3, 'General Motors', '3456 General''s Lane', 'Grand Rapids', 'Michigan', '34567', '345-654-6543', 0.065);
#query 10
INSERT INTO Apartment_Type_TBL VALUES
(1, '1 Bedroom', 250.00),
(2, '2 Bedroom', 200.00),
(3, '3 Bedroom', 150.00);
#query 11
INSERT INTO Apartment_TBL VALUES
(1, '102', 1, 1, 1, 'Yes'),
(2, '103', 1, 1, 1, 'Yes'),
(3, '104', 1, 1, 2, 'Yes'),
(4, '105', 1, 1, 2, 'No'),
(5, '106', 1, 1, 3, 'No'),
(6, '202', 2, 1, 1, 'Yes'),
(7, '203', 2, 1, 2, 'Yes'),
(8, '204', 2, 1, 3, 'No'),
(9, '205', 2, 1, 2, 'Yes'),
(10, '206', 2, 1, 1, 'Yes'),
(11, '302', 3, 1, 1, 'Yes'),
(12, '303', 3, 1, 2, 'Yes'),
(13, '304', 3, 1, 3, 'Yes'),
(14, '305', 3, 1, 3, 'No'),
(15, '306', 3, 1, 3, 'No'),
(16, '102', 1, 2, 1, 'Yes'),
(17, '103', 1, 2, 1, 'Yes'),
(18, '104', 1, 2, 2, 'Yes'),
(19, '105', 1, 2, 2, 'Yes'),
(20, '106', 1, 2, 3, 'Yes'),
(21, '202', 2, 2, 1, 'Yes'),
(22, '203', 2, 2, 2, 'Yes'),
(23, '204', 2, 2, 3, 'Yes'),
(24, '205', 2, 2, 2, 'Yes'),
(25, '206', 2, 2, 1, 'Yes'),
(26, '302', 3, 2, 1, 'Yes'),
(27, '303', 3, 2, 2, 'Yes'),
(28, '304', 3, 2, 3, 'Yes'),
(29, '305', 3, 2, 3, 'No'),
(30, '306', 3, 2, 3, 'Yes'),
(31, '402', 4, 2, 3, 'Yes'),
(32, '403', 4, 2, 2, 'Yes'),
(33, '404', 4, 2, 3, 'Yes'),
(34, '405', 4, 2, 3, 'Yes'),
(35, '406', 4, 2, 3, 'Yes');
#query 12
INSERT INTO Trainee_TBL VALUES
(1, 'Avery', 'Alvin', '123 First Street', 'Indianapolis', 'Indiana', '46203', '317-123-1234', 1),
(2, 'Berry', 'Bob', '234 Second Avenue', 'Baltimore', 'Maryland', '45854', '342-234-2345', 2),
(3, 'Callie', 'Cassandra', '345 Third Lane', 'Los Angeles', 'California', '87654', '235-345-3456', 3),
(4, 'Dorkman', 'Donnie', '456 Fourth Road', 'Cleveland', 'Ohio', '93038', '928-456-4567', 1),
(5, 'Eaton', 'Easy', '567 Fifth Street', 'Tallahassee', 'Florida', '87699', NULL, 2),
(6, 'Franks', 'Frankie', '678 Sixth Avenue', 'New York', 'New York', '67890', '678-678-6789', 3),
(7, 'Glutton', 'George', '789 Seventh Lane', 'Camden', 'Indiana', '46917', NULL, 1),
(8, 'Hilton', 'Hilly', '890 Eighth Road', 'Atlanta', 'Georgia', '89012', '890-890-8901', 2),
(9, 'Isaacs', 'Isaac', '901 Ninth Street', 'Houston', 'Texas', '90123', NULL, 3),
(10, 'Johnson', 'John', '2344 Glenwood Street', 'Indianapolis', 'Indiana', '46239', '317-223-1234', 1),
(11, 'Tanner', 'Tommy', '342 Hollow Ave', 'Houston', 'Texas', '90234', '901-901-93432', 2),
(12, 'Flannerson', 'Jane', '974 Jones Road', 'Houston', 'Texas', '90234', '901-903-93456', 2),
(13, 'Tubs', 'Toni', '290 Jackson''s Lane', 'Indianapolis', 'Indiana', '46239', '317-225-1984', 3);
#query 13
INSERT INTO Apartment_Rental_TBL VALUES
(1, '2010-01-12', '2010-01-15', '(111) 111-1111', 1, 1),
(2, '2010-01-12', '2010-01-15', '(333) 333-3333', 3, 4),
(3, '2010-01-12', '2010-01-15', '(333) 333-3333', 3, 7),
(4, '2010-01-15', '2010-01-17', '(222) 222-2222', 2, 2),
(5, '2009-06-12', '2009-06-20', '(444) 444-4444', 4, 2),
(6, '2009-06-12', '2009-06-20', '(444) 444-4444', 4, 5),
(7, '2010-04-01', '2010-04-03', '(555) 555-5555', 28, 8),
(8, '2010-04-01', '2010-04-03', '(555) 555-5555', 28, 3),
(9, '2010-04-01', '2010-04-03', '(555) 555-5555', 28, 6),
(10, '2011-03-22', '2011-03-25', '(666) 666-6666', 14, 1),
(11, '2011-03-22', '2011-03-25', '(666) 666-6666', 14, 4),
(12, '2011-03-22', '2011-03-25', '(666) 666-6666', 14, 7),
(13, '2011-03-15', '2011-03-25', '(777) 777-7777', 15, 2),
(14, '2011-03-15', '2011-03-25', '(777) 777-7777', 15, 5),
(15, '2011-03-15', '2011-03-25', '(777) 777-7777', 15, 8),
(16, '2011-03-10', '2011-03-27', '(888) 888-8888', 29, 3),
(17, '2011-03-10', '2011-03-27', '(888) 888-8888', 29, 6),
(18, '2011-03-10', '2011-03-27', '(888) 888-8888', 29, 9),
(19, '2011-03-27', '2011-03-29', '(444) 444-4444', 4, 3),
(20, '2011-03-27', '2011-04-02', '(999) 999-9999', 5, 2),
(21, '2011-04-05', '2011-04-10', '(999) 111-1111', 8, 1),
(22, '2011-04-05', '2011-04-10', '(999) 111-1111', 8, 4);
#query 14
SELECT * FROM Apartment_Building_TBL;
#query 15
SELECT * FROM Employer_TBL;
#query 16
SELECT * FROM Apartment_Type_TBL;
#query 17
SELECT * FROM Apartment_TBL;
#query 18
SELECT * FROM Trainee_TBL;
#query 19
SELECT * FROM Apartment_Rental_TBL;
#query 20
SELECT 
    TABLE_NAME,
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE 
    TABLE_SCHEMA = 'apartment_rental'
ORDER BY 
    TABLE_NAME;
#query 21
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'apartment_rental';
#query 22
SHOW CREATE TABLE Apartment_Building_TBL;
SHOW CREATE TABLE Employer_TBL;
SHOW CREATE TABLE Apartment_Type_TBL;
SHOW CREATE TABLE Apartment_TBL;
SHOW CREATE TABLE Trainee_TBL;
SHOW CREATE TABLE Apartment_Rental_TBL;
#query 23
CREATE TABLE Chrysler_Trainee_TBL LIKE Trainee_TBL;
CREATE TABLE Ford_Trainee_TBL LIKE Trainee_TBL;
CREATE TABLE GM_Trainee_TBL LIKE Trainee_TBL;
#query 24
INSERT INTO Chrysler_Trainee_TBL
SELECT * FROM Trainee_TBL WHERE EmployerID = 1;
#query 25
INSERT INTO GM_Trainee_TBL 
SELECT * FROM Trainee_TBL WHERE EmployerID = 3;
#query 26
ALTER TABLE Chrysler_Trainee_TBL ADD CompanyName VARCHAR(100);
ALTER TABLE Ford_Trainee_TBL ADD CompanyName VARCHAR(100);
ALTER TABLE GM_Trainee_TBL ADD CompanyName VARCHAR(100);
#query 27
UPDATE Chrysler_Trainee_TBL SET CompanyName = 'Daimler-Chrysler';
UPDATE GM_Trainee_TBL SET CompanyName = 'General Motors';
#query 28
INSERT INTO Ford_Trainee_TBL (TraineeID, LastName, FirstName, PermStreet, PermCity, PermState, PermZip, PermPhone, EmployerID)
SELECT TraineeID, LastName, FirstName, PermStreet, PermCity, PermState, PermZip, PermPhone, EmployerID 
FROM Trainee_TBL 
WHERE EmployerID = 2;
#query 29
UPDATE Ford_Trainee_TBL SET CompanyName = 'Ford Motor Company';
#query 30
ALTER TABLE Chrysler_Trainee_TBL MODIFY CompanyName VARCHAR(100) NOT NULL;
ALTER TABLE Ford_Trainee_TBL MODIFY CompanyName VARCHAR(100) NOT NULL;
ALTER TABLE GM_Trainee_TBL MODIFY CompanyName VARCHAR(100) NOT NULL;
#query 31
DELETE FROM Chrysler_Trainee_TBL WHERE PermPhone IS NULL;
DELETE FROM Ford_Trainee_TBL WHERE PermPhone IS NULL;
DELETE FROM GM_Trainee_TBL WHERE PermPhone IS NULL;
#query 32
SELECT * FROM Chrysler_Trainee_TBL;
SELECT * FROM Ford_Trainee_TBL;
SELECT * FROM GM_Trainee_TBL;
#query 33
DROP TABLE Chrysler_Trainee_TBL;
DROP TABLE Ford_Trainee_TBL;
DROP TABLE GM_Trainee_TBL;
#query 34
SELECT 
    b.BuildingName,
    COUNT(CASE WHEN a.AptAvailable = 'Yes' THEN 1 END) as AvailableApartments
FROM Apartment_Building_TBL b
LEFT JOIN Apartment_TBL a ON b.BuildingID = a.BuildingID
GROUP BY b.BuildingName;
#query 35
SELECT BuildingID as ID, BuildingName as Name, Street, City, State, Zip as Zipcode, Phone
FROM Apartment_Building_TBL
UNION
SELECT EmployerID, CompanyName, Street, City, State, Zip, Phone
FROM Employer_TBL
ORDER BY ID;
#query 36
SELECT 
    b.BuildingName,
    a.AptNumber,
    t.ApartmentType,
    a.AptFloor
FROM Apartment_TBL a
JOIN Apartment_Building_TBL b ON a.BuildingID = b.BuildingID
JOIN Apartment_Type_TBL t ON a.ApartmentTypeID = t.ApartmentTypeID
WHERE a.ApartmentID NOT IN (SELECT ApartmentID FROM Apartment_Rental_TBL)
ORDER BY b.BuildingName, a.AptNumber;
#query 37
SELECT DISTINCT 
    CONCAT(t1.FirstName, ' ', t1.LastName) as Trainee1,
    CONCAT(t2.FirstName, ' ', t2.LastName) as Trainee2,
    t1.PermCity as City,
    t1.PermState as State,
    e.CompanyName as Company
FROM Trainee_TBL t1
JOIN Trainee_TBL t2 ON t1.TraineeID < t2.TraineeID
    AND t1.PermCity = t2.PermCity
    AND t1.PermState = t2.PermState
    AND t1.EmployerID = t2.EmployerID
JOIN Employer_TBL e ON t1.EmployerID = e.EmployerID;
#query 38
SELECT 
    b.BuildingName as Building,
    a.AptNumber as Apartment,
    a.AptFloor as Floor,
    t.ApartmentType as "Apartment Style",
    t.PricePerNight as "Nightly Charge"
FROM Apartment_TBL a
JOIN Apartment_Building_TBL b ON a.BuildingID = b.BuildingID
JOIN Apartment_Type_TBL t ON a.ApartmentTypeID = t.ApartmentTypeID;
#query 39
SELECT 
    CONCAT(t.FirstName, ' ', t.LastName) as "Full Name",
    b.BuildingName,
    a.AptNumber,
    at.ApartmentType,
    at.PricePerNight,
    r.CheckInDate,
    r.CheckOutDate,
    DATEDIFF(r.CheckOutDate, r.CheckInDate) as "Number of Days Stayed",
    ROUND(
        at.PricePerNight * 
        DATEDIFF(r.CheckOutDate, r.CheckInDate) * 
        (1 - e.ContractDiscount) * 
        1.08, 2
    ) as "Total Charge"
FROM Apartment_Rental_TBL r
JOIN Apartment_TBL a ON r.ApartmentID = a.ApartmentID
JOIN Apartment_Building_TBL b ON a.BuildingID = b.BuildingID
JOIN Apartment_Type_TBL at ON a.ApartmentTypeID = at.ApartmentTypeID
JOIN Trainee_TBL t ON r.TraineeID = t.TraineeID
JOIN Employer_TBL e ON t.EmployerID = e.EmployerID
ORDER BY r.CheckInDate;
