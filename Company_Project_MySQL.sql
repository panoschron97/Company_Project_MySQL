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
-- Admin User
CREATE TABLE IF NOT EXISTS Projects
(
ProjectID INTEGER NOT NULL, 
ProjectName VARCHAR(50) NOT NULL,
ProjectBudget DECIMAL(7,2) NOT NULL,
ProjectStartDate DATE NOT NULL,
ProjectEndDate DATE NOT NULL,
PRIMARY KEY (ProjectID),
CONSTRAINT ProjectName_UNQ UNIQUE (ProjectName),
CONSTRAINT ProjectBudget_CHK CHECK (ProjectBudget BETWEEN 5000.00 AND 15000.00),
CONSTRAINT ProjectStartDate_ProjectEndDate_CHK CHECK (ProjectStartDate >= '2015-01-01' AND ProjectEndDate <= '2030-12-31')
);
-- --
CREATE TABLE IF NOT EXISTS ProjectsLog
(
ProjectID INTEGER NOT NULL,
ProjectName VARCHAR(50) NOT NULL,
ProjectOldBudget DECIMAL(7,2) NULL,
ProjectNewBudget DECIMAL(7,2) NULL,
DataManipulationLanguageStatement VARCHAR(50) NOT NULL,
TrackOfTransactions TIMESTAMP DEFAULT NOW(),
CONSTRAINT DataManipulationLanguageStatement_CHK_Project CHECK (DataManipulationLanguageStatement IN ('Insert Statement', 'Update Statement', 'Delete Statement'))
);
-- --
DELIMITER //

CREATE TRIGGER ProjectsInsertStatementsBefore BEFORE INSERT
ON Projects
FOR EACH ROW
BEGIN
INSERT INTO ProjectsLog (ProjectID, ProjectName, ProjectNewBudget, DataManipulationLanguageStatement) VALUES (NEW.ProjectID, NEW.ProjectName, NEW.ProjectBudget, 'Insert Statement');
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE TRIGGER ProjectsUpdateStatementsBefore BEFORE UPDATE
ON Projects
FOR EACH ROW
BEGIN
INSERT INTO ProjectsLog (ProjectID, ProjectName, ProjectOldBudget, ProjectNewBudget, DataManipulationLanguageStatement) VALUES (NEW.ProjectID, NEW.ProjectName, OLD.ProjectBudget, NEW.ProjectBudget, 'Update Statement');
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE TRIGGER ProjectsDeleteStatementsBefore BEFORE DELETE
ON Projects
FOR EACH ROW
BEGIN
INSERT INTO ProjectsLog (ProjectID, ProjectName, DataManipulationLanguageStatement) VALUES (OLD.ProjectID, OLD.ProjectName, 'Delete Statement');
END;

// DELIMITER ;
-- --
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (1, 'Project Alpha', 10000.00, '2023-01-01', '2023-12-31');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (2, 'Project Beta', 15000.00, '2023-02-01', '2023-11-30');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (3, 'Project Gamma', 13000.00, '2023-01-15', '2023-11-15');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (4, 'Project Delta', 12000.00, '2023-03-01', '2023-10-01');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (5, 'Project Epsilon', 14000.00, '2023-04-01', '2023-09-01');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (6, 'Project Zeta', 11000.00, '2023-05-01', '2023-10-15');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (7, 'Project Eta', 15000.00, '2023-06-01', '2023-08-15');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (8, 'Project Theta', 8000.00, '2023-07-01', '2023-12-01');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (9, 'Project Iota', 9000.00, '2023-08-01', '2023-10-30');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (10, 'Project Kappa', 7500.00, '2023-09-01', '2023-12-31');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (11, 'Project Lambda', 7000.00, '2023-10-01', '2023-11-15');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (12, 'Project Mu', 6800.00, '2023-01-10', '2023-05-05');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (13, 'Project Nu', 13000.00, '2023-11-01', '2023-12-31');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (14, 'Project Xi', 5000.00, '2023-03-15', '2023-06-30');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (15, 'Project Omicron', 8500.00, '2023-06-15', '2023-12-15');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (16, 'Project Pi', 12500.00, '2023-07-10', '2023-11-01');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (17, 'Project Rho', 6000.00, '2023-08-01', '2023-09-01');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (18, 'Project Sigma', 15000.00, '2023-09-10', '2023-12-20');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (19, 'Project Tau', 9200.00, '2023-01-20', '2023-06-20');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (20, 'Project Upsilon', 11900.00, '2023-02-15', '2023-10-15');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (21, 'Project Phi', 14000.00, '2023-03-30', '2023-10-30');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (22, 'Project Chi', 12000.00, '2023-04-22', '2023-09-15');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (23, 'Project Psi', 7500.00, '2023-05-17', '2023-11-05');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (24, 'Project Omega', 11000.00, '2023-06-10', '2023-12-31');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (25, 'Project A1', 13500.00, '2023-07-15', '2023-12-01');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (26, 'Project B1', 9500.00, '2023-08-08', '2023-10-20');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (27, 'Project C1', 8300.00, '2023-09-12', '2023-12-10');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (28, 'Project D1', 10200.00, '2023-10-02', '2023-11-30');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (29, 'Project E1', 8900.00, '2023-11-25', '2023-12-31');
INSERT INTO Projects (ProjectID, ProjectName, ProjectBudget, ProjectStartDate, ProjectEndDate) VALUES (30, 'Project F1', 12000.00, '2023-12-01', '2023-12-31');
COMMIT;
-- --
SELECT * FROM Projects;
SELECT * FROM ProjectsLog;
-- --
UPDATE Projects SET ProjectID = 31, ProjectBudget = ProjectBudget - 5000.00 WHERE ProjectID = 1;
COMMIT;
-- --
SELECT * FROM Projects;
SELECT * FROM ProjectsLog;
-- --
DELETE FROM Projects WHERE ProjectID = 31;
COMMIT;
-- --
SELECT * FROM Projects;
SELECT * FROM ProjectsLog;
-- --
CREATE VIEW MaskedProjects AS SELECT ProjectName FROM Projects;
-- --
GRANT SELECT ON MaskedProjects TO 'Panos_Chron'@'localhost' WITH GRANT OPTION;
-- Panos_Chron User
SELECT * FROM Company_Project_MySQL.MaskedProjects;
-- --
GRANT SELECT ON Company_Project_MySQL.MaskedProjects TO 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM Company_Project_MySQL.MaskedProjects;
-- Admin User
CREATE TABLE IF NOT EXISTS Employees
(
EmployeeID INTEGER NOT NULL, 
EmployeeFirstName VARCHAR(50) NOT NULL,
EmployeeMiddleName VARCHAR(50) DEFAULT '',
EmployeeLastName VARCHAR(50) NOT NULL,
EmployeeSex VARCHAR(50) NOT NULL,
EmployeeSalary DECIMAL(7,2) NOT NULL,
EmployeeYearOfRecruitment DATE NOT NULL,
EmployeeLevelOfEducation VARCHAR(50) NOT NULL,
EmployeeSpeciality VARCHAR(50) NOT NULL,
EmployeeExperience VARCHAR(50) NOT NULL,
EmployeeCountry VARCHAR(50) NOT NULL,
EmployeeTown VARCHAR(50) NOT NULL,
EmployeeAddress VARCHAR(50) NOT NULL,
EmployeePhoneNumber VARCHAR(50) NOT NULL,
EmployeeFamilySituation VARCHAR(50) NOT NULL,
EmployeeNumberOfChildren INTEGER DEFAULT 0,
DepartmentID INTEGER NOT NULL,
ProjectID INTEGER NOT NULL,
PRIMARY KEY (EmployeeID),
CONSTRAINT EmployeeFirstName_EmployeeLastName_UNQ UNIQUE (EmployeeFirstName, EmployeeLastName),
CONSTRAINT EmployeeSex_CHK CHECK (EmployeeSex IN ('Male', 'Female')),
CONSTRAINT EmployeeSalary_CHK CHECK (EmployeeSalary BETWEEN 1000.00 AND 10000.00),
CONSTRAINT EmployeeYearOfRecruitment_CHK CHECK (EmployeeYearOfRecruitment >= '2015-01-01' AND EmployeeYearOfRecruitment <= '2030-12-31'),
CONSTRAINT EmployeeLevelOfEducation_CHK CHECK (EmployeeLevelOfEducation IN ('Bachelor''s Degree', 'Master''s Degree', 'PhD')),
CONSTRAINT EmployeeSpeciality_CHK CHECK (EmployeeSpeciality IN ('Full Stack Developer', 'Front End Developer', 'Back End Developer', 'Data Analyst', 'Business Analyst', 'QA Engineer', 'HR Manager', 'DevOps Engineer', 'Data Engineer', 'Database Administrator', 'DevSecOps Engineer', 'Data Scientist', 'SQL Developer', 'PL/SQL Developer', 'Technical Support Engineer', 'Project Manager')),
CONSTRAINT EmployeeExperience_CHK CHECK (EmployeeExperience IN ('Intership', 'Entry Level', 'Associate', 'Mid-Senior Level','Director', 'Executive')),
CONSTRAINT EmployeePhoneNumber_CHK CHECK (LENGTH (EmployeePhoneNumber) = 10),
CONSTRAINT EmployeeNumberOfChildren_CHK CHECK (EmployeeNumberOfChildren >= 0),
CONSTRAINT EmployeeFamilySituation_CHK CHECK (EmployeeFamilySituation IN ('UnMarried', 'Married')),
CONSTRAINT DepartmentID_FK FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT ProjectID_FK FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID) ON DELETE CASCADE ON UPDATE CASCADE
);
-- --
CREATE TABLE IF NOT EXISTS EmployeesLog
(
EmployeeID INTEGER NOT NULL,
EmployeeFirstName VARCHAR(50) NOT NULL,
EmployeeMiddleName VARCHAR(50) DEFAULT '',
EmployeeLastName VARCHAR(50) NOT NULL,
EmployeeOldSalary DECIMAL(7,2) NULL,
EmployeeNewSalary DECIMAL(7,2) NULL,
DepartmentID INTEGER NOT NULL,
ProjectID INTEGER NOT NULL,
DataManipulationLanguageStatement VARCHAR(50) NOT NULL,
TrackOfTransactions TIMESTAMP DEFAULT NOW(),
CONSTRAINT DataManipulationLanguageStatement_CHK_Employee CHECK (DataManipulationLanguageStatement IN ('Insert Statement', 'Update Statement', 'Delete Statement'))
);
-- --
DELIMITER //

CREATE TRIGGER EmployeesInsertStatementsBefore BEFORE INSERT
ON Employees
FOR EACH ROW
BEGIN
INSERT INTO EmployeesLog (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeNewSalary, DepartmentID, ProjectID, DataManipulationLanguageStatement) VALUES (NEW.EmployeeID, NEW.EmployeeFirstName, NEW.EmployeeMiddleName, NEW.EmployeeLastName, NEW.EmployeeSalary, NEW.DepartmentID, NEW.ProjectID, 'Insert Statement');
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE TRIGGER EmployeesUpdateStatementsBefore BEFORE UPDATE
ON Employees
FOR EACH ROW
BEGIN
INSERT INTO EmployeesLog (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeOldSalary, EmployeeNewSalary, DepartmentID, ProjectID, DataManipulationLanguageStatement) VALUES (NEW.EmployeeID, NEW.EmployeeFirstName, NEW.EmployeeMiddleName, NEW.EmployeeLastName, OLD.EmployeeSalary, NEW.EmployeeSalary, NEW.DepartmentID, NEW.ProjectID, 'Update Statement');
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE TRIGGER EmployeesDeleteStatementsBefore BEFORE DELETE
ON Employees
FOR EACH ROW
BEGIN
INSERT INTO EmployeesLog (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, DepartmentID, ProjectID, DataManipulationLanguageStatement) VALUES (OLD.EmployeeID, OLD.EmployeeFirstName, OLD.EmployeeMiddleName, OLD.EmployeeLastName, OLD.DepartmentID, OLD.ProjectID, 'Delete Statement');
END;

// DELIMITER ;
-- --
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (1, 'John', 'A.', 'Doe', 'Male', 5000.00, '2020-01-15', 'Bachelor''s Degree', 'Full Stack Developer', 'Entry Level', 'USA', 'Seattle', '123 Elm St', '1234567890', 'Married', 0, 1, 1);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (2, 'Jane', 'B.', 'Smith', 'Female', 6000.00, '2019-02-16', 'Master''s Degree', 'Data Analyst', 'Associate', 'USA', 'San Francisco', '456 Oak St', '2345678901', 'Married', 0, 2, 2);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (3, 'Chris', 'C.', 'Johnson', 'Male', 4000.00, '2021-03-14', 'Bachelor''s Degree', 'Business Analyst', 'Mid-Senior Level', 'USA', 'Los Angeles', '789 Pine St', '3456789012', 'UnMarried', 0, 3, 3);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (4, 'Emily', 'D.', 'Williams', 'Female', 7000.00, '2018-04-18', 'PhD', 'Data Scientist', 'Director', 'USA', 'Cupertino', '321 Birch St', '4567890123', 'Married', 1, 2, 4);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (5, 'Michael', 'E.', 'Brown', 'Male', 8500.00, '2020-07-01', 'Master''s Degree', 'Project Manager', 'Mid-Senior Level', 'USA', 'New York', '654 Cedar St', '5678901234', 'Married', 2, 3, 5);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (6, 'Jessica', 'F.', 'Jones', 'Female', 7500.00, '2017-10-11', 'Master''s Degree', 'QA Engineer', 'Associate', 'USA', 'London', '987 Spruce St', '6789012345', 'UnMarried', 0, 6, 6);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (7, 'Matthew', 'G.', 'Miller', 'Male', 9000.00, '2016-09-25', 'PhD', 'DevOps Engineer', 'Executive', 'USA', 'Tokyo', '135 Maple St', '7890123456', 'Married', 3, 4, 7);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (8, 'Sarah', 'H.', 'Davis', 'Female', 5600.00, '2019-01-04', 'Bachelor''s Degree', 'Front End Developer', 'Entry Level', 'USA', 'Paris', '246 Fir St', '8901234567', 'UnMarried', 0, 8, 8);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (9, 'David', 'I.', 'Garcia', 'Male', 4200.00, '2020-02-17', 'Bachelor''s Degree', 'Back End Developer', 'Mid-Senior Level', 'USA', 'Berlin', '357 Elm St', '9012345678', 'Married', 4, 1, 9);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (10, 'Emily', 'J.', 'Martinez', 'Female', 7500.00, '2020-08-05', 'Bachelor''s Degree', 'Full Stack Developer', 'Mid-Senior Level', 'USA', 'Rome', '147 Walnut St', '0123456789', 'UnMarried', 0, 10, 10);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (11, 'Kevin', 'K.', 'Hernandez', 'Male', 6800.00, '2021-10-09', 'PhD', 'Data Engineer', 'Associate', 'USA', 'Beijing', '258 Chestnut St', '2345678905', 'Married', 1, 1, 11);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (12, 'Nancy', 'L.', 'Lee', 'Female', 5200.00, '2019-02-14', 'Master''s Degree', 'Database Administrator', 'Mid-Senior Level', 'Canada', 'Toronto', '369 Ash St', '3456789010', 'Married', 5, 3, 12);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (13, 'George', 'M.', 'Wilson', 'Male', 9300.00, '2020-06-12', 'PhD', 'Technical Support Engineer', 'Director', 'UK', 'London', '987 Cypress St', '4321098765', 'Married', 1, 2, 13);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (14, 'Betty', 'N.', 'Anderson', 'Female', 4600.00, '2021-07-30', 'Bachelor''s Degree', 'HR Manager', 'Entry Level', 'Canada', 'Montreal', '123 Spruce St', '5432109876', 'Married', 0, 1, 14);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (15, 'Angela', 'O.', 'Thomas', 'Female', 4700.00, '2022-01-15', 'Master''s Degree', 'Data Scientist', 'Associate', 'USA', 'Chicago', '654 River St', '8642097531', 'Married', 0, 15, 15);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (16, 'Austin', 'P.', 'Martin', 'Male', 5800.00, '2023-01-05', 'Bachelor''s Degree', 'DevSecOps Engineer', 'Entry Level', 'USA', 'San Diego', '456 Sunset Blvd', '6812465790', 'UnMarried', 0, 16, 16);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (17, 'Laura', 'Q.', 'Young', 'Female', 4000.00, '2021-03-12', 'Master''s Degree', 'Database Administrator', 'Mid-Senior Level', 'Canada', 'Victoria', '129 Pacific St', '7984561230', 'Married', 2, 2, 17);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (18, 'David', 'B.', 'Wright', 'Male', 8800.00, '2022-05-19', 'PhD', 'QA Engineer', 'Director', 'UK', 'Birmingham', '318 Queen St', '5672348910', 'UnMarried', 0, 18, 18);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (19, 'Clara', 'C.', 'Scott', 'Female', 9600.00, '2021-10-30', 'Master''s Degree', 'HR Manager', 'Executive', 'Canada', 'Montreal', '113 Thames St', '8901234567', 'UnMarried', 0, 19, 19);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (20, 'Robert', 'R.', 'Johnson', 'Male', 6300.00, '2021-11-22', 'Bachelor''s Degree', 'Front End Developer', 'Mid-Senior Level', 'USA', 'Seattle', '222 Sunset Rd', '2345678902', 'Married', 3, 2, 20);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (21, 'Thomas', 'T.', 'Harris', 'Male', 7200.00, '2022-03-15', 'Master''s Degree', 'Data Analyst', 'Associate', 'UK', 'Manchester', '444 Oak St', '3456789019', 'UnMarried', 0, 21, 21);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (22, 'Danielle', 'S.', 'Clark', 'Female', 7900.00, '2021-04-09', 'PhD', 'Technical Support Engineer', 'Mid-Senior Level', 'Canada', 'Toronto', '555 Maple St', '7896780654', 'Married', 1, 1, 22);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (23, 'Steven', 'V.', 'Lee', 'Male', 6700.00, '2023-01-22', 'Master''s Degree', 'Database Administrator', 'Entry Level', 'USA', 'Philadelphia', '888 Pine St', '0123456788', 'UnMarried', 0, 23, 23);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (24, 'Laura', 'T.', 'Miller', 'Female', 9000.00, '2021-12-14', 'Master''s Degree', 'Full Stack Developer', 'Mid-Senior Level', 'Canada', 'Vancouver', '555 Cedar St', '7895432106', 'Married', 2, 1, 24);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (25, 'Adrian', 'U.', 'Walker', 'Male', 5100.00, '2022-02-10', 'Bachelor''s Degree', 'Front End Developer', 'Entry Level', 'USA', 'Austin', '666 Star St', '4567890123', 'UnMarried', 0, 25, 25);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (26, 'Zoe', 'W.', 'Martin', 'Female', 6200.00, '2018-01-07', 'Bachelor''s Degree', 'Back End Developer', 'Mid-Senior Level', 'USA', 'Houston', '333 River Rd', '6780123456', 'Married', 6, 1, 26);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (27, 'Henry', 'N.', 'Hall', 'Male', 6900.00, '2019-10-14', 'Master''s Degree', 'HR Manager', 'Executive', 'UK', 'Birmingham', '789 Mountain St', '6781234560', 'UnMarried', 0, 27, 27);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (28, 'Ella', 'O.', 'Stewart', 'Female', 7500.00, '2020-03-11', 'PhD', 'Data Scientist', 'Mid-Senior Level', 'Canada', 'Ottawa', '147 Lagoon Ave', '1456781346', 'Married', 3, 1, 28);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (29, 'Benjamin', 'Y.', 'James', 'Male', 9600.00, '2021-12-29', 'PhD', 'Project Manager', 'Director', 'USA', 'Phoenix', '222 Cascade Blvd', '7770912345', 'UnMarried', 0, 29, 29);
INSERT INTO Employees (EmployeeID, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeSex, EmployeeSalary, EmployeeYearOfRecruitment, EmployeeLevelOfEducation, EmployeeSpeciality, EmployeeExperience, EmployeeCountry, EmployeeTown, EmployeeAddress, EmployeePhoneNumber, EmployeeFamilySituation, EmployeeNumberOfChildren, DepartmentID, ProjectID) VALUES (30, 'Cheryl', 'Y.', 'Bennett', 'Female', 5300.00, '2023-01-01', 'Bachelor''s Degree', 'Project Manager', 'Associate', 'USA', 'Dallas', '543 Oak Hill Ave', '2340912228', 'Married', 0, 3, 30);
COMMIT;
-- --
SELECT * FROM Employees;
SELECT * FROM EmployeesLog;
-- --
UPDATE Employees SET EmployeeSalary = EmployeeSalary * 2 WHERE EmployeeID = 1;
COMMIT;
-- --
SELECT * FROM Employees;
SELECT * FROM EmployeesLog;
-- --
DELETE FROM Employees WHERE EmployeeID = 1;
COMMIT;
-- --
SELECT * FROM Employees;
SELECT * FROM EmployeesLog;
-- --
CREATE VIEW MaskedEmployees AS SELECT EmployeeFirstName, EmployeeLastName FROM Employees;
-- --
GRANT SELECT ON MaskedEmployees TO 'Panos_Chron'@'localhost' WITH GRANT OPTION;
-- Panos_Chron User
SELECT * FROM Company_Project_MySQL.MaskedEmployees;
-- --
GRANT SELECT ON Company_Project_MySQL.MaskedEmployees TO 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM Company_Project_MySQL.MaskedEmployees;
-- Admin User
CREATE INDEX EmployeeLevelOfEducation_Employee_Speciality_INDX ON Employees(EmployeeLevelOfEducation, EmployeeSpeciality);
CREATE SPATIAL INDEX GeograpghicalLocation_INDX ON Locations(GeographicalLocation);
-- --
DELIMITER //

CREATE PROCEDURE Q1(IN GivenValue VARCHAR(50), IN GivenValue1 VARCHAR(50))
BEGIN
SELECT EmployeeFirstName, EmployeeLastName FROM Employees WHERE EmployeeLevelOfEducation = GivenValue AND EmployeeSpeciality = GivenValue1;
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE PROCEDURE Q2(IN GivenValue INTEGER, IN GivenValue1 INTEGER, OUT Result DECIMAL(7,2))
BEGIN
SELECT SUM(EmployeeSalary) INTO Result FROM Employees WHERE EmployeeID BETWEEN GivenValue AND GivenValue1;
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE FUNCTION Q3(GivenValue INTEGER, GivenValue1 INTEGER)
RETURNS DECIMAL(7, 2)
DETERMINISTIC
BEGIN
DECLARE EmployeesAverageSalary DECIMAL(7,2);
SELECT AVG(EmployeeSalary) INTO EmployeesAverageSalary FROM Employees WHERE EmployeeID BETWEEN GivenValue AND GivenValue1;
RETURN EmployeesAverageSalary;
END;

// DELIMITER ;
-- --
DELIMITER //

CREATE FUNCTION Q4(GivenValue INTEGER)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
DECLARE EmployeeFullName VARCHAR(50);
SELECT CONCAT(EmployeeFirstName, ' ', EmployeeLastName) INTO EmployeeFullName FROM Employees WHERE EmployeeID = GivenValue;
RETURN EmployeeFullName;
END;

// DELIMITER ;
-- --
CALL Q1('Master''s Degree', 'Data Analyst');
-- --
CALL Q2(10, 20, @Result);
SELECT @Result AS TotalSalary;
-- --
SELECT Q3(10, 20) AS EmployeesAverageSalary;
-- --
SELECT Q4(1) AS EmployeeFullName;
-- --
SELECT Q4(EmployeeID) AS EmployeeFullName FROM Employees;
-- --
-- --------
-- --------
-- --------
-- --------
-- --------
-- Admin User
USE Company_Project_MySQL;
-- --
DROP FUNCTION IF EXISTS Q4;
-- --
DROP FUNCTION IF EXISTS Q3;
-- --
DROP PROCEDURE IF EXISTS Q2;
-- --
DROP PROCEDURE IF EXISTS Q1;
-- --
DROP INDEX EmployeeLevelOfEducation_Employee_Speciality_INDX ON Employees;
DROP INDEX GeograpghicalLocation_INDX ON Locations;
-- Panos_Chron User
REVOKE SELECT ON Company_Project_MySQL.MaskedEmployees FROM 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM Company_Project_MySQL.MaskedEmployees;
-- Admin User
REVOKE SELECT ON Company_Project_MySQL.MaskedEmployees FROM 'Panos_Chron'@'localhost';
-- Panos_Chron User
SELECT * FROM Company_Project_MySQL.MaskedEmployees;
-- Admin User
USE Company_Project_MySQL;
-- --
DROP VIEW IF EXISTS MaskedEmployees;
-- --
DROP TRIGGER IF EXISTS EmployeesDeleteStatementsBefore;
DROP TRIGGER IF EXISTS EmployeesUpdateStatementsBefore;
DROP TRIGGER IF EXISTS EmployeesInsertStatementsBefore;
-- --
DELETE FROM EmployeesLog;
COMMIT;
TRUNCATE TABLE EmployeesLog;
-- --
ALTER TABLE EmployeesLog DROP CONSTRAINT DataManipulationLanguageStatement_CHK_Employee;
-- --
DROP TABLE IF EXISTS EmployeesLog;
-- --
DELETE FROM Employees;
COMMIT;
TRUNCATE TABLE Employees;
-- --
ALTER TABLE Employees DROP CONSTRAINT ProjectID_FK;
-- --
ALTER TABLE Employees DROP CONSTRAINT DepartmentID_FK;
-- --
ALTER TABLE Employees DROP CONSTRAINT EmployeeFamilySituation_CHK;
-- --
ALTER TABLE Employees DROP CONSTRAINT EmployeeNumberOfChildren_CHK;
-- --
ALTER TABLE Employees DROP CONSTRAINT EmployeePhoneNumber_CHK;
-- --
ALTER TABLE Employees DROP CONSTRAINT EmployeeExperience_CHK;
-- --
ALTER TABLE Employees DROP CONSTRAINT EmployeeSpeciality_CHK;
-- --
ALTER TABLE Employees DROP CONSTRAINT EmployeeLevelOfEducation_CHK; 
-- --
ALTER TABLE Employees DROP CONSTRAINT EmployeeYearOfRecruitment_CHK;
-- --
ALTER TABLE Employees DROP CONSTRAINT EmployeeSalary_CHK;
-- --
ALTER TABLE Employees DROP CONSTRAINT EmployeeSex_CHK;
-- --
ALTER TABLE Employees DROP CONSTRAINT EmployeeFirstName_EmployeeLastName_UNQ;
-- --
ALTER TABLE Employees DROP PRIMARY KEY;
-- --
DROP TABLE IF EXISTS Employees;
-- Panos_Chron User
REVOKE SELECT ON Company_Project_MySQL.MaskedProjects FROM 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM Company_Project_MySQL.MaskedProjects;
-- Admin User
REVOKE SELECT ON Company_Project_MySQL.MaskedProjects FROM 'Panos_Chron'@'localhost';
-- Panos_Chron User
SELECT * FROM Company_Project_MySQL.MaskedProjects;
-- Admin User
USE Company_Project_MySQL;
-- --
DROP VIEW IF EXISTS MaskedProjects;
-- --
DROP TRIGGER IF EXISTS ProjectsDeleteStatementsBefore;
DROP TRIGGER IF EXISTS ProjectsUpdateStatementsBefore;
DROP TRIGGER IF EXISTS ProjectsInsertStatementsBefore;
-- --
DELETE FROM ProjectsLog;
COMMIT;
TRUNCATE TABLE ProjectsLog;
-- --
ALTER TABLE ProjectsLog DROP CONSTRAINT DataManipulationLanguageStatement_CHK_Project;
-- --
DROP TABLE IF EXISTS ProjectsLog;
-- --
DELETE FROM Projects;
COMMIT;
TRUNCATE TABLE Projects;
-- --
ALTER TABLE Projects DROP CONSTRAINT ProjectStartDate_ProjectEndDate_CHK;
-- --
ALTER TABLE Projects DROP CONSTRAINT ProjectBudget_CHK;
-- --
ALTER TABLE Projects DROP CONSTRAINT  ProjectName_UNQ;
-- --
ALTER TABLE Projects DROP PRIMARY KEY;
-- --
DROP TABLE IF EXISTS Projects;
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