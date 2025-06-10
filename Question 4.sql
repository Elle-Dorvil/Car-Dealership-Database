USE DEALERSHIP_DATABASE;
SELECT *
FROM inventory
-- JOIN inventory ON dealerships.dealership_id = inventory.dealership_id
WHERE vin = "1HGCM82633A123456" AND dealership_id = 1;