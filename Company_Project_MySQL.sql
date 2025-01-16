-- Admin User
CREATE DATABASE IF NOT EXISTS Company_Project_MySQL;
-- --
USE Company_Project_MySQL;
-- --
CREATE USER IF NOT EXISTS 'Panos_Chron'@'localhost' IDENTIFIED BY 'Panos_Chron';
CREATE USER IF NOT EXISTS 'Panos_Chron1'@'localhost' IDENTIFIED BY 'Panos_Chron1';
-- --
CREATE TABLE IF NOT EXISTS Companies 
(
CompanyID INT NOT NULL,
CompanyName VARCHAR(50) NOT NULL,
CompanyNameXML BLOB NOT NULL,
CompanyNameJSON JSON NOT NULL,
PRIMARY KEY (CompanyID),
CONSTRAINT CompanyName_UNQ UNIQUE (CompanyName),
CONSTRAINT CompanyNameXML_CHK CHECK (CompanyNameXML IS NOT NULL),
CONSTRAINT CompanyNameJSON_CHK CHECK (JSON_VALID(CompanyNameJSON))
);
-- --
CREATE TABLE IF NOT EXISTS CompaniesLog
(
CompanyID INTEGER NOT NULL,
CompanyName VARCHAR(50) NOT NULL,
DataManipulationLangugageStatement VARCHAR(50) NOT NULL,
TrackOfTransactions TIMESTAMP DEFAULT NOW(),
CONSTRAINT DataManipulationLangugageStatement_CHK_Company CHECK (DataManipulationLangugageStatement IN ('Insert Statement', 'Update Statement', 'Delete Statement'))
);
-- --
DELIMITER //

CREATE TRIGGER CompaniesInsertStatementsBefore BEFORE INSERT
ON Companies
FOR EACH ROW
BEGIN
INSERT INTO CompaniesLog (CompanyID, CompanyName, DataManipulationLangugageStatement) VALUES (NEW.CompanyID, NEW.CompanyName, 'Insert Statement');
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE TRIGGER CompaniesUpdateStatementsBefore BEFORE UPDATE
ON Companies
FOR EACH ROW
BEGIN
INSERT INTO CompaniesLog (CompanyID, CompanyName, DataManipulationLangugageStatement) VALUES (OLD.CompanyID, OLD.CompanyName, 'Update Statement');
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE TRIGGER CompaniesDeleteStatementsBefore BEFORE DELETE 
ON Companies
FOR EACH ROW
BEGIN
INSERT INTO CompaniesLog (CompanyID, CompanyName, DataManipulationLangugageStatement) VALUES (OLD.CompanyID, OLD.CompanyName, 'Delete Statement');
END;

// DELIMITER ;
-- --
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (1, 'Amazon', '<CompanyName>Amazon</CompanyName>', '{"CompanyName": "Amazon"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (2, 'Google', '<CompanyName>Google</CompanyName>', '{"CompanyName": "Google"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (3, 'Microsoft', '<CompanyName>Microsoft</CompanyName>', '{"CompanyName": "Microsoft"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (4, 'Apple', '<CompanyName>Apple</CompanyName>', '{"CompanyName": "Apple"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (5, 'Facebook', '<CompanyName>Facebook</CompanyName>', '{"CompanyName": "Facebook"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (6, 'Twitter', '<CompanyName>Twitter</CompanyName>', '{"CompanyName": "Twitter"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (7, 'IBM', '<CompanyName>IBM</CompanyName>', '{"CompanyName": "IBM"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (8, 'Intel', '<CompanyName>Intel</CompanyName>', '{"CompanyName": "Intel"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (9, 'Oracle', '<CompanyName>Oracle</CompanyName>', '{"CompanyName": "Oracle"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (10, 'Tesla', '<CompanyName>Tesla</CompanyName>', '{"CompanyName": "Tesla"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (11, 'Samsung', '<CompanyName>Samsung</CompanyName>', '{"CompanyName": "Samsung"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (12, 'Sony', '<CompanyName>Sony</CompanyName>', '{"CompanyName": "Sony"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (13, 'Nvidia', '<CompanyName>Nvidia</CompanyName>', '{"CompanyName": "Nvidia"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (14, 'Adobe', '<CompanyName>Adope</CompanyName>', '{"CompanyName": "Adope"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (15, 'Salesforce', '<CompanyName>Salesforce</CompanyName>', '{"CompanyName": "Salesforce"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (16, 'Alibaba', '<CompanyName>Alibaba</CompanyName>', '{"CompanyName": "Alibaba"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (17, 'Zoom', '<CompanyName>Zoom</CompanyName>', '{"CompanyName": "Zoom"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (18, 'Slack', '<CompanyName>Slack</CompanyName>', '{"CompanyName": "Slack"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (19, 'Spotify', '<CompanyName>Spotify</CompanyName>', '{"CompanyName": "Spotify"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (20, 'PayPal', '<CompanyName>Paypal</CompanyName>', '{"CompanyName": "Paypal"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (21, 'Netflix', '<CompanyName>Netflix</CompanyName>', '{"CompanyName": "Netflix"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (22, 'eBay', '<CompanyName>eBay</CompanyName>', '{"CompanyName": "eBay"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (23, 'LinkedIn', '<CompanyName>LinkedIn</CompanyName>', '{"CompanyName": "LinkedIn"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (24, 'Uber', '<CompanyName>Uber</CompanyName>', '{"CompanyName": "Uber"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (25, 'Lyft', '<CompanyName>Lyft</CompanyName>', '{"CompanyName": "Lyft"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (26, 'Shopify', '<CompanyName>Shopify</CompanyName>', '{"CompanyName": "Shopify"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (27, 'Square', '<CompanyName>Square</CompanyName>', '{"CompanyName": "Square"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (28, 'Dropbox', '<CompanyName>Dropbox</CompanyName>', '{"CompanyName": "Dropbox"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (29, 'Pinterest', '<CompanyName>Pinterest</CompanyName>', '{"CompanyName": "Pinterest"}');
INSERT INTO Companies (CompanyID, CompanyName, CompanyNameXML, CompanyNameJSON) VALUES (30, 'Reddit', '<CompanyName>Reddit</CompanyName>', '{"CompanyName": "Reddit"}');
COMMIT;
-- --
SELECT * FROM Companies;
SELECT * FROM CompaniesLog;
-- --
UPDATE Companies SET CompanyID = 31 WHERE CompanyID = 1;
COMMIT;
-- --
SELECT * FROM Companies;
SELECT * FROM CompaniesLog;
-- --
DELETE FROM Companies WHERE CompanyID = 31;
COMMIT;
-- --
SELECT * FROM Companies;
SELECT * FROM CompaniesLog;
-- --
CREATE VIEW MaskedCompanies AS SELECT CompanyID FROM Companies;
-- --
GRANT SELECT ON Company_Project_MySQL.MaskedCompanies TO 'Panos_Chron'@'localhost' WITH GRANT OPTION;
-- Panos_Chron User
SELECT * FROM Company_Project_MySQL.MaskedCompanies;
-- --
GRANT SELECT ON Company_Project_MySQL.MaskedCompanies TO 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM Company_Project_MySQL.MaskedCompanies;
-- Admin User
CREATE TABLE IF NOT EXISTS Locations
(
LocationID INTEGER NOT NULL,
GeographicalLocation POINT NOT NULL,
CompanyID INTEGER NOT NULL,
PRIMARY KEY (LocationID),
CONSTRAINT CompanyID_FK FOREIGN KEY (CompanyID) REFERENCES Companies (CompanyID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- --
CREATE TABLE IF NOT EXISTS LocationsLog
(
LocationID INTEGER NOT NULL,
GeographicalLocation POINT NOT NULL,
CompanyID INTEGER NOT NULL,
DataManipulationLanguageStatement VARCHAR(50) NOT NULL,
TrackOfTransactions TIMESTAMP DEFAULT NOW(),
CONSTRAINT DataManipulationLanguageStatement_CHK_Location CHECK (DataManipulationLanguageStatement IN ('Insert Statement', 'Update Statement', 'Delete Statement'))
);
-- -- 
DELIMITER //
CREATE TRIGGER LocationsInsertStatementsBefore BEFORE INSERT
ON Locations
FOR EACH ROW
BEGIN
INSERT INTO LocationsLog (LocationID, GeographicalLocation, CompanyID, DataManipulationLanguageStatement) VALUES (NEW.LocationID, NEW.GeographicalLocation, NEW.CompanyID, 'Insert Statement');
END;

// DELIMITER ;
-- --
DELIMITER //
CREATE TRIGGER LocationsUpdateStatementsBefore BEFORE UPDATE
ON Locations
FOR EACH ROW
BEGIN
INSERT INTO LocationsLog (LocationID, GeographicalLocation, CompanyID, DataManipulationLanguageStatement) VALUES (OLD.LocationID, OLD.GeographicalLocation, OLD.CompanyID, 'Update Statement');
END;

// DELIMITER ;
-- --
DELIMITER //
CREATE TRIGGER LocationsDeleteStatementsBefore BEFORE DELETE
ON Locations
FOR EACH ROW
BEGIN
INSERT INTO LocationsLog (LocationID, GeographicalLocation, CompanyID, DataManipulationLanguageStatement) VALUES (OLD.LocationID, OLD.GeographicalLocation, OLD.CompanyID, 'Delete Statement');
END;

// DELIMITER ;
-- --
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (1, POINT(-122.3321, 47.6062), 1);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (2, POINT(-122.4194, 37.7749), 2);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (3, POINT(23.7275, 37.9838), 3);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (4, POINT(-122.0312, 37.3318), 4);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (5, POINT(-74.0060, 40.7128), 5);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (6, POINT(-0.1278, 51.5074), 6);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (7, POINT(139.6917, 35.6895), 7);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (8, POINT(2.3522, 48.8566), 8);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (9, POINT(-118.2437, 34.0522), 9);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (10, POINT(12.4964, 41.9028), 10);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (11, POINT(116.4074, 39.9042), 11);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (12, POINT(151.2093, -33.8688), 12);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (13, POINT(37.6173, 55.7558), 13);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (14, POINT(-104.9903, 39.7392), 14);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (15, POINT(-46.6333, -23.5505), 15);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (16, POINT(-73.9352, 40.7306), 16);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (17, POINT(-97.7431, 30.2672), 17);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (18, POINT(-86.7816, 36.1627), 18);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (19, POINT(-79.3470, 43.6510), 19);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (20, POINT(13.4050, 52.5200), 20);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (21, POINT(-3.1883, 55.9533), 21);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (22, POINT(24.9354, 60.1695), 22);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (23, POINT(10.4515, 51.1657), 23);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (24, POINT(139.6503, 35.6762), 24);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (25, POINT(-58.3816, -34.6037), 25);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (26, POINT(90.4125, 23.8103), 26);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (27, POINT(100.9925, 15.8700), 27);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (28, POINT(11.5820, 48.1351), 28);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (29, POINT(103.8198, 1.3521), 29);
INSERT INTO Locations (LocationID, GeographicalLocation, CompanyID) VALUES (30, POINT(116.4040, 39.9138), 30);
COMMIT;
-- --
SELECT * FROM Locations;
SELECT * FROM LocationsLog;
-- --
UPDATE Locations SET LocationID = 31 WHERE LocationID = 1;
COMMIT;
-- --
SELECT * FROM Locations;
SELECT * FROM LocationsLog;
-- --
DELETE FROM Locations WHERE LocationID = 31;
COMMIT;
-- --
SELECT * FROM Locations;
SELECT * FROM LocationsLog;
-- --
CREATE VIEW MaskedLocations AS SELECT LocationID, CompanyID FROM Locations;
-- --
GRANT SELECT ON MaskedLocations TO 'Panos_Chron'@'localhost' WITH GRANT OPTION;
-- Panos_Chron User
SELECT * FROM Company_Project_MySQL.MaskedLocations;
-- --
GRANT SELECT ON Company_Project_MySQL.MaskedLocations TO 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM Company_Project_MySQL.MaskedLocations;
-- Admin User
CREATE TABLE IF NOT EXISTS Departments
(
DepartmentID INTEGER NOT NULL,
DepartmentName VARCHAR(50) NOT NULL,
DepartmentLocation VARCHAR(50) NOT NULL,
LocationID INTEGER NOT NULL,
DepartmentBudget DECIMAL(7,2) NULL,
PRIMARY KEY (DepartmentID),
CONSTRAINT DepartmentName_DepartmentLocation_UNQ UNIQUE (DepartmentName, DepartmentLocation),
CONSTRAINT LocationID_FK FOREIGN KEY (LocationID) REFERENCES Locations (LocationID) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT DepartmentBudget_CHK CHECK (DepartmentBudget >= 10000.00 AND DepartmentBudget <= 50000.00)
);
-- --
CREATE TABLE IF NOT EXISTS DepartmentsLog
(
DepartmentID INTEGER NOT NULL,
DepartmentName VARCHAR(50) NOT NULL,
DepartmentLocation VARCHAR(50) NOT NULL,
LocationID INTEGER NOT NULL,
DataManipulationLanguageStatement VARCHAR(50) NOT NULL,
TrackOfTransactions TIMESTAMP DEFAULT NOW(),
CONSTRAINT DataManipulationLanguageStatement_CHK_Department CHECK (DataManipulationLanguageStatement IN ('Insert Statement', 'Update Statement', 'Delete Statement')),
DepartmentOldBudget DECIMAL(7,2) NULL,
DepartmentNewBudget DECIMAL(7,2) NULL
);
-- --
DELIMITER //

CREATE TRIGGER DepartmentsInsertStatementsBefore BEFORE INSERT
ON Departments
FOR EACH ROW
BEGIN
INSERT INTO DepartmentsLog (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DataManipulationLanguageStatement, DepartmentNewBudget) VALUES (NEW.DepartmentID, NEW.DepartmentName, NEW.DepartmentLocation, NEW.LocationID, 'Insert Statement', NEW.DepartmentBudget);
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE TRIGGER DepartmentsUpdateStatementsBefore BEFORE UPDATE
ON Departments
FOR EACH ROW
BEGIN
INSERT INTO DepartmentsLog (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DataManipulationLanguageStatement, DepartmentOldBudget, DepartmentNewBudget) VALUES (NEW.DepartmentID, NEW.DepartmentName, NEW.DepartmentLocation, NEW.LocationID, 'Update Statement', OLD.DepartmentBudget, NEW.DepartmentBudget);
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE TRIGGER DepartmentsDeleteStatementsBefore BEFORE DELETE
ON Departments
FOR EACH ROW
BEGIN
INSERT INTO DepartmentsLog (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DataManipulationLanguageStatement) VALUES (OLD.DepartmentID, OLD.DepartmentName, OLD.DepartmentLocation, OLD.LocationID, 'Delete Statement');
END;

// DELIMITER ;
-- --
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (1, 'Engineering', 'Seattle', 1, 30000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (2, 'Marketing', 'San Francisco', 2, 25000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (3, 'Product', 'Los Angeles', 3, 20000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (4, 'Design', 'Cupertino', 4, 15000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (5, 'HR', 'New York', 5, 18000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (6, 'Sales', 'London', 6, 20000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (7, 'Support', 'Tokyo', 7, 22000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (8, 'Research', 'Paris', 8, 18000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (9, 'Analytics', 'Berlin', 9, 17000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (10, 'Finance', 'Rome', 10, 20000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (11, 'Legal', 'Beijing', 11, 21000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (12, 'Customer Service', 'Sydney', 12, 17000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (13, 'Content', 'Moscow', 13, 18000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (14, 'Public Relations', 'Denver', 14, 15000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (15, 'Operations', 'São Paulo', 15, 25000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (16, 'Procurement', 'Austin', 16, 22000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (17, 'Quality Assurance', 'Nashville', 17, 20000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (18, 'Logistics', 'Toronto', 18, 23000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (19, 'Training', 'Montreal', 19, 18000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (20, 'Strategy', 'Hamburg', 20, 25000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (21, 'Compliance', 'Edinburgh', 21, 21000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (22, 'Business Development', 'Helsinki', 22, 22000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (23, 'Innovation', 'Berlin', 23, 23000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (24, 'IT', 'Tokyo', 24, 24000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (25, 'Facilities', 'Buenos Aires', 25, 22000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (26, 'Business Intelligence', 'Dhaka', 26, 26000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (27, 'User Experience', 'Bangkok', 27, 20000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (28, 'Cybersecurity', 'Munich', 28, 28000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (29, 'Data Science', 'Singapore', 29, 29000.00);
INSERT INTO Departments (DepartmentID, DepartmentName, DepartmentLocation, LocationID, DepartmentBudget) VALUES (30, 'System Administration', 'Beijing', 30, 30000.00);
COMMIT;
-- --
SELECT * FROM Departments;
SELECT * FROM DepartmentsLog;
-- --
UPDATE Departments SET DepartmentID = 31, DepartmentBudget = DepartmentBudget * 1.5 WHERE DepartmentID = 1;
COMMIT;
-- --
SELECT * FROM Departments;
SELECT * FROM DepartmentsLog;
-- --
DELETE FROM Departments WHERE DepartmentID = 31;
COMMIT;
-- --
SELECT * FROM Departments;
SELECT * FROM DepartmentsLog;
-- --
CREATE VIEW MaskedDepartments AS SELECT DepartmentName, DepartmentLocation FROM Departments;
-- --
GRANT SELECT ON MaskedDepartments TO 'Panos_Chron'@'localhost' WITH GRANT OPTION;
-- Panos_Chron User
SELECT * FROM Company_Project_MySQL.MaskedDepartments;
-- --
GRANT SELECT ON Company_Project_MySQL.MaskedDepartments TO 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM Company_Project_MySQL.MaskedDepartments;
-- --
-- --------
-- --------
-- --------
-- --------
-- --------
-- --
-- Panos_Chron User
REVOKE SELECT ON Company_Project_MySQL.MaskedDepartments FROM 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM Company_Project_MySQL.MaskedDepartments;
-- Admin User
REVOKE SELECT ON Company_Project_MySQL.MaskedDepartments FROM 'Panos_Chron'@'localhost';
-- Panos_Chron User
SELECT * FROM Company_Project_MySQL.MaskedDepartments;
-- Admin User
USE Company_Project_MySQL;
-- --
DROP VIEW IF EXISTS MaskedDepartments;
-- --
DROP TRIGGER IF EXISTS DepartmentsDeleteStatementsBefore;
DROP TRIGGER IF EXISTS DepartmentsUpdateStatementsBefore;
DROP TRIGGER IF EXISTS DepartmentsInsertStatementsBefore;
-- --
DELETE FROM DepartmentsLog;
COMMIT;
TRUNCATE TABLE DepartmentsLog;
-- --
ALTER TABLE DepartmentsLog DROP CONSTRAINT DataManipulationLanguageStatement_CHK_Department;
-- --
DROP TABLE IF EXISTS DepartmentsLog;
-- --
DELETE FROM Departments;
COMMIT;
TRUNCATE TABLE Departments;
-- --
ALTER TABLE Departments DROP CONSTRAINT DepartmentBudget_CHK;
-- --
ALTER TABLE Departments DROP CONSTRAINT LocationID_FK;
-- --
ALTER TABLE Departments DROP CONSTRAINT DepartmentName_DepartmentLocation_UNQ;
-- --
ALTER TABLE Departments DROP PRIMARY KEY;
-- --
DROP TABLE IF EXISTS Departments;
-- Panos_Chron User
REVOKE SELECT ON Company_Project_MySQL.MaskedLocations FROM 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM Company_Project_MySQL.MaskedLocations;
-- Admin User
REVOKE SELECT ON Company_Project_MySQL.MaskedLocations FROM 'Panos_Chron'@'localhost';
-- Panos_Chron User
SELECT * FROM Company_Project_MySQL.MaskedLocations;
-- Admin User
USE Company_Project_MySQL;
-- --
DROP VIEW IF EXISTS MaskedLocations;
-- --
DROP TRIGGER IF EXISTS LocationsDeleteStatementsBefore;
DROP TRIGGER IF EXISTS LocationsUpdateStatementsBefore;
DROP TRIGGER IF EXISTS LocationsInsertStatementsBefore;
-- --
DELETE FROM LocationsLog;
COMMIT;
TRUNCATE TABLE LocationsLog;
-- --
ALTER TABLE LocationsLog DROP CONSTRAINT DataManipulationLanguageStatement_CHK_Location;
-- --
DROP TABLE IF EXISTS LocationsLog;
-- --
DELETE FROM Locations;
COMMIT;
TRUNCATE TABLE Locations;
-- --
ALTER TABLE Locations DROP CONSTRAINT CompanyID_FK;
-- --
ALTER TABLE Locations DROP PRIMARY KEY;
-- --
DROP TABLE IF EXISTS Locations;
-- Panos_Chron User
REVOKE SELECT ON Company_Project_MySQL.MaskedCompanies FROM 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM Company_Project_MySQL.MaskedCompanies;
-- Admin User
REVOKE SELECT ON Company_Project_MySQL.MaskedCompanies FROM 'Panos_Chron'@'localhost';
-- Panos_Chron User
SELECT * FROM Company_Project_MySQL.MaskedCompanies;
-- Admin User
USE Company_Project_MySQL;
-- --
DROP VIEW IF EXISTS MaskedCompanies;
-- --
DROP TRIGGER IF EXISTS CompaniesDeleteStatementsBefore;
DROP TRIGGER IF EXISTS CompaniesUpdateStatementsBefore;
DROP TRIGGER IF EXISTS CompaniesInsertStatementsBefore;
-- --
DELETE FROM CompaniesLog;
COMMIT;
TRUNCATE TABLE CompaniesLog;
-- --
ALTER TABLE CompaniesLog DROP CONSTRAINT DataManipulationLangugageStatement_CHK_Company;
-- --
DROP TABLE IF EXISTS CompaniesLog;
-- --
DELETE FROM Companies;
COMMIT;
TRUNCATE TABLE Companies;
-- --
ALTER TABLE Companies DROP CONSTRAINT CompanyNameJSON_CHK;
-- --
ALTER TABLE Companies DROP CONSTRAINT CompanyNameXML_CHK;
-- --
ALTER TABLE Companies DROP CONSTRAINT CompanyName_UNQ;
-- --
ALTER TABLE Companies DROP PRIMARY KEY;
-- --
DROP TABLE IF EXISTS Companies;
-- --
DROP USER IF EXISTS 'Panos_Chron1'@'localhost';
DROP USER IF EXISTS 'Panos_Chron'@'localhost';
-- --
DROP DATABASE IF EXISTS Company_Project_MySQL;