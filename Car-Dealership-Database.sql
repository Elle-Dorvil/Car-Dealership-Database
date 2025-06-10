DROP DATABASE IF exists dealership_database;

CREATE DATABASE dealership_database;

USE dealership_database;
DROP TABLE IF EXISTS inventory; 
DROP TABLE IF EXISTS sales_contracts; 
DROP TABLE IF EXISTS lease_contracts; 
DROP TABLE IF EXISTS dealerships; 
DROP TABLE IF EXISTS vehicles;

CREATE TABLE Vehicles( 
Vin VARCHAR(17) NOT NULL PRIMARY KEY, 
Make VARCHAR(50) NOT NULL, 
Model varchar(50) NOT NULL, 
year int(4) NOT NULL, 
Sold boolean NOT NULL, 
Color varchar(50), 
VehicleType varchar(50), 
Odometer int, 
Price double NOT NULL);

CREATE TABLE dealerships( 
dealership_id int auto_increment Primary key, 
Name varchar(50) NOT NULL, 
Address varchar(50) NOT NULL, 
Phone varchar(12)NOT NULL);

CREATE TABLE inventory( 
dealership_id int NOT NULL, 
vin varchar(17) NOT NULL, 
FOREIGN KEY (dealership_id) references dealerships(dealership_id), 
FOREIGN KEY (vin) references vehicles(vin));

CREATE TABLE sales_contract( 
Contract_id int auto_increment Primary key, 
vin varchar(17), 
Sale_date date, 
Price decimal(10,2), 
FOREIGN KEY (vin) references vehicles(vin));

CREATE TABLE lease_contract( 
Contract_id int auto_increment primary key, 
vin varchar(17), 
Lease_start date, 
Lease_end date, 
Monthly_payment decimal(10,2), 
Foreign key (vin) references vehicles(vin));

INSERT INTO vehicles(vin, make, model, year, sold, color, vehicleType, odometer, price) 
VALUES 
('1HGCM82633A123456', 'Honda', 'Accord', 2019, TRUE, 'Black', 'Sedan', 43200, 17500.00),
('2FTRX18W1XCA98765', 'Ford', 'F-150', 2021, FALSE, 'Blue', 'Truck', 15600, 32800.00),
('5NPE24AF0FH123987', 'Hyundai', 'Sonata', 2015, TRUE, 'Silver', 'Sedan', 89000, 9200.00),
('3VW2K7AJ5FM398234', 'Volkswagen', 'Jetta', 2018, TRUE, 'White', 'Sedan', 51300, 13450.00),
('1J4GA39157L104321', 'Jeep', 'Wrangler', 2020, FALSE, 'Green', 'SUV', 28900, 29750.00),
('4T1BF1FK3GU234567', 'Toyota', 'Camry', 2016, TRUE, 'Red', 'Sedan', 76400, 11300.00),
('1C4RJFBG7JC123321', 'Jeep', 'Grand Cherokee', 2019, TRUE, 'Charcoal', 'SUV', 60700, 24600.00),
('KM8J3CA48HU543890', 'Hyundai', 'Tucson', 2022, FALSE, 'Gray', 'SUV', 12100, 26900.00),
('2T3ZF4DV6BW657894', 'Toyota', 'RAV4', 2017, TRUE, 'Blue', 'SUV', 68200, 16750.00),
('WBA3A5C59FF123999', 'BMW', '328i', 2015, TRUE, 'Black', 'Sedan', 73900, 14800.00),
('1FAHP3F2XCL234567', 'Ford', 'Focus', 2014, TRUE, 'Yellow', 'Hatchback', 96100, 7100.00),
('1G1ZD5ST3LF028345', 'Chevrolet', 'Malibu', 2020, FALSE, 'Burgundy', 'Sedan', 33500, 18200.00);

INSERT INTO dealerships(dealership_id, name, address, phone) 
VALUES 
(1, 'Metro Auto Mall', '123 Main St, Newark, NJ 07102', '9735551212'),
(2, 'DriveTime Motors', '456 Elm Ave, Brooklyn, NY 11211', '7185559821'),
(3, 'Top Gear Autos', '789 Oak Dr, Miami, FL 33101', '3055553030'),
(4, 'Elite Auto Group', '101 Sunrise Blvd, Los Angeles, CA 90028', '2135551919'),
(5, 'Route 66 Cars', '202 Route 66, Albuquerque, NM 87101', '5055557777');

INSERT INTO inventory (dealership_id, vin) 
Values 
(1, '1HGCM82633A123456'),
(2, '2FTRX18W1XCA98765'),
(3, '5NPE24AF0FH123987'),
(4, '3VW2K7AJ5FM398234'),
(5, '1J4GA39157L104321');

INSERT INTO sales_contract(contract_id, vin, sale_date, price) 
VALUES 
(1001, '1HGCM82633A123456', '2023-05-10', 17500.00);

INSERT INTO lease_contract(contract_id, vin, lease_start, lease_end, monthly_payment) 
VALUES 
(2001, '2FTRX18W1XCA98765', '2024-01-15', '2027-01-14', 520.00);