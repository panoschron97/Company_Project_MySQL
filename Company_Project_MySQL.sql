-- Admin User
CREATE DATABASE IF NOT EXISTS Company_Project_MySQL;
-- --
USE Company_Project_MySQL;
-- --
CREATE USER IF NOT EXISTS 'Panos_Chron'@'localhost' IDENTIFIED BY 'Panos_Chron';
-- --
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

CREATE TRIGGER CompaniesInsertStatementBefore BEFORE INSERT
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
SELECT * FROM  Company_Project_MySQL.MaskedCompanies;
-- --
GRANT SELECT ON  Company_Project_MySQL.MaskedCompanies TO 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM  Company_Project_MySQL.MaskedCompanies;
-- --
-- --------
-- --------
-- --------
-- --------
-- --------
-- Panos_Chron User
REVOKE SELECT ON Company_Project_MySQL.MaskedCompanies FROM 'Panos_Chron1'@'localhost';
-- Panos_Chron1 User
SELECT * FROM  Company_Project_MySQL.MaskedCompanies;
-- Admin User
REVOKE SELECT ON Company_Project_MySQL.MaskedCompanies FROM 'Panos_Chron'@'localhost';
-- --
DROP VIEW IF EXISTS MaskedCompanies;
-- --
DROP TRIGGER IF EXISTS CompaniesDeleteStatementsBefore;
DROP TRIGGER IF EXISTS CompaniesUpdateStatementsBefore;
DROP TRIGGER IF EXISTS CompaniesInsertStatementBefore;
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
DROP USER IF EXISTS 'Panos_Chron'@'localhost';
DROP USER IF EXISTS 'Panos_Chron1'@'localhost';
-- --
DROP DATABASE IF EXISTS Company_Project_MySQL;