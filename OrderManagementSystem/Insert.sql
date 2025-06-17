-- Region
INSERT INTO Region (RegionDescription) VALUES
('North America'), ('Europe'), ('Asia'), ('Europe'), ('Asia'),
('Africa'), ('South America'), ('Australia'), ('Middle East'), ('Antarctica'),
('Arctic'), ('Central America'), ('Caribbean'), ('Northern Europe'), ('Eastern Europe'),
('Western Europe'), ('Southeast Asia'), ('Central Asia'), ('Pacific Islands'), ('Southern Africa'),
('Scandinavia'), ('Baltic States');

-- Suppliers
INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, City, PostalCode, Country, Phone, Fax) VALUES
('FreshFarms', 'John Doe', 'Manager', 'New York', 10001, 'USA', 1234567890, 1234567891),
('FreshFarms', 'Jane Smith', 'Manager', 'New York', 10001, 'USA', 1234567890, 1234567891),
('SpiceWorld', 'Anita Roy', 'Executive', 'Mumbai', 400001, 'India', 9876543210, 9876543211),
('HerbalCare', 'David Lee', 'Manager', 'Seoul', 54321, 'South Korea', 8765432109, 8765432110),
('AgriSource', 'Sara Kim', 'Director', 'Tokyo', 123456, 'Japan', 7654321098, 7654321099),
('BioGrow', 'Linda May', 'Executive', 'Berlin', 10115, 'Germany', 9988776655, 9988776656),
('EcoGoods', 'Carlos Vega', 'Manager', 'Madrid', 28001, 'Spain', 8844556677, 8844556678),
('GreenEarth', 'Emma Watson', 'Coordinator', 'London', 1001, 'UK', 9988445566, 9988445567),
('NatureSupplies', 'Raj Patel', 'Executive', 'Delhi', 110001, 'India', 9090909090, 9191919191),
('OrganicHub', 'Chen Wei', 'Manager', 'Beijing', 100000, 'China', 8181818181, 8282828282),
('FarmFresh', 'Ali Hassan', 'Sales Head', 'Dubai', 12345, 'UAE', 7070707070, 7171717171),
('VitaFoods', 'Lina Zhang', 'Director', 'Shanghai', 200000, 'China', 6161616161, 6262626262),
('AgroLife', 'Ivan Petrov', 'CEO', 'Moscow', 101000, 'Russia', 5050505050, 5151515151),
('HimalayanHerbs', 'Namgyal', 'Herbalist', 'Kathmandu', 44600, 'Nepal', 4949494949, 4848484848),
('TropicHarvest', 'Angela Cruz', 'Lead', 'Manila', 1100, 'Philippines', 4747474747, 4646464646),
('AlpineFarms', 'Markus Schmidt', 'Farmer', 'Zurich', 8000, 'Switzerland', 4545454545, 4444444444),
('ValleyRoots', 'Priya Das', 'Manager', 'Kolkata', 700001, 'India', 4343434343, 4242424242),
('DesertBloom', 'Omar Farouk', 'Owner', 'Cairo', 11511, 'Egypt', 4141414141, 4040404040),
('RainforestFoods', 'Luiz Costa', 'Exporter', 'Sao Paulo', 11000, 'Brazil', 3939393939, 3838383838),
('SunriseOrganics', 'Sophia Lee', 'COO', 'Seoul', 54321, 'South Korea', 3737373737, 3636363636),
('OceanHarvest', 'Tom Hanks', 'Logistics', 'Sydney', 2000, 'Australia', 3535353535, 3434343434);

-- Shippers
INSERT INTO Shippers (CompanyName, PhoneNo) VALUES
('BlueDart', 1231231234), ('FedEx', 4564564567), ('DHL', 7897897890), ('Aramex', 9998887776),
('IndiaPost', 1112223334), ('USPS', 5556667778), ('RoyalMail', 4445556667), ('SpeedPost', 2223334445),
('JapanPost', 3334445556), ('ChinaLogistics', 6667778889), ('CargoKing', 1239876543),
('OceanExpress', 1987654321), ('EuroCourier', 9080706050), ('AfricaShip', 8070605040),
('SkyDeliver', 7060504030), ('FastWheels', 6050403020), ('ExpressLogi', 5040302010),
('NordicPost', 9990001112), ('AndesCourier', 8889990001), ('TransDesert', 7778889990);

INSERT INTO Employees (FirstName, LastName, Title, TitleOfCourtecy, BirthDate, HireDate, Address, City, PostalCode, Country, HomePhone, ReportsTo) VALUES
('Alice', 'Brown', 'Sales Manager', 'Ms.', '1985-03-12', '2010-06-01', '123 Street A', 'London', 1001, 'UK', 9876543211, NULL),
('Bob', 'Smith', 'Sales Rep', 'Mr.', '1990-07-25', '2015-04-12', '456 Street B', 'London', 1001, 'UK', 9876543212, 3001),
('Charlie', 'Brown', 'Sales Rep', 'Mr.', '1988-09-10', '2012-03-21', '789 Street C', 'London', 1001, 'UK', 9876543213, 3001),
('David', 'Clark', 'Sales Rep', 'Mr.', '1986-08-14', '2011-02-25', 'Street D', 'Berlin', 10115, 'Germany', 9876543214, 3001),
('Ella', 'Johnson', 'Marketing Exec', 'Ms.', '1992-01-15', '2016-07-01', 'Street E', 'Paris', 75000, 'France', 9876543215, 3001),
('Frank', 'White', 'Accountant', 'Mr.', '1979-11-19', '2005-03-12', 'Street F', 'Rome', 00100, 'Italy', 9876543216, NULL),
('Grace', 'Hall', 'Support Lead', 'Ms.', '1983-12-23', '2009-09-09', 'Street G', 'Madrid', 28001, 'Spain', 9876543217, 3006),
('Harry', 'Mason', 'Logistics Manager', 'Mr.', '1987-10-30', '2013-06-18', 'Street H', 'Lisbon', 1000, 'Portugal', 9876543218, 3006),
('Ivy', 'Lee', 'Quality Analyst', 'Ms.', '1991-06-01', '2017-10-01', 'Street I', 'Amsterdam', 1011, 'Netherlands', 9876543219, 3006),
('Jack', 'Wong', 'Sales Rep', 'Mr.', '1984-02-12', '2011-05-01', 'Street J', 'Seoul', 54321, 'South Korea', 9876543220, 3001),
('Kiran', 'Kumar', 'Sales Rep', 'Mr.', '1990-07-25', '2015-04-12', 'Street K', 'Delhi', 110001, 'India', 9876543221, 3001),
('Lara', 'Croft', 'Field Exec', 'Ms.', '1988-05-20', '2013-08-15', 'Street L', 'New York', 10001, 'USA', 9876543222, 3001),
('Max', 'Payne', 'HR Manager', 'Mr.', '1980-03-10', '2008-01-01', 'Street M', 'Chicago', 60601, 'USA', 9876543223, NULL),
('Nina', 'Ross', 'Trainer', 'Ms.', '1989-09-09', '2014-02-20', 'Street N', 'Toronto', 1010, 'Canada', 9876543224, 3013),
('Oscar', 'King', 'Tech Lead', 'Mr.', '1982-04-17', '2007-05-12', 'Street O', 'Sydney', 2000, 'Australia', 9876543225, 3013),
('Paul', 'Green', 'Developer', 'Mr.', '1993-11-22', '2018-11-01', 'Street P', 'Melbourne', 3000, 'Australia', 9876543226, 3014),
('Queen', 'Vera', 'Developer', 'Ms.', '1994-07-30', '2019-01-15', 'Street Q', 'Brisbane', 4000, 'Australia', 9876543227, 3014),
('Ron', 'Williams', 'Support', 'Mr.', '1985-10-18', '2010-10-18', 'Street R', 'Perth', 6000, 'Australia', 9876543228, 3014),
('Sia', 'Moore', 'Tech Exec', 'Ms.', '1986-12-11', '2012-12-11', 'Street S', 'Tokyo', 100000, 'Japan', 9876543229, 3014),
('Tom', 'Holland', 'Engineer', 'Mr.', '1990-06-21', '2015-06-21', 'Street T', 'Osaka', 540000, 'Japan', 9876543230, 3014),
('Uma', 'Thurman', 'Product Head', 'Ms.', '1981-01-01', '2006-07-10', 'Street U', 'Bangkok', 10110, 'Thailand', 9876543231, 3014);

INSERT INTO Territories (TerritoryDescription, RegionId) VALUES
('North Zone', 6001), ('South Zone', 6003), ('East Zone', 6002),
('West Zone', 6004), ('Central Zone', 6005), ('Highlands', 6006),
('Island Region', 6008), ('Lowlands', 6007), ('Delta Area', 6009),
('River Belt', 6010), ('Great Plains', 6011), ('Tundra', 6012),
('Savannah', 6013), ('Steppe', 6014), ('Rainforest', 6015),
('Desert', 6016), ('Urban Zone', 6017), ('Rural Zone', 6018),
('Suburban Zone', 6019), ('Metro Region', 6020), ('Mountain Region', 6021);

INSERT INTO EmployeeTerritory (EmployeeId, TerritoryId) VALUES
(3001, 7001), (3002, 7002), (3003, 7003), (3004, 7004), (3005, 7005),
(3006, 7006), (3007, 7007), (3008, 7008), (3009, 7009), (3010, 7010),
(3011, 7011), (3012, 7012), (3013, 7013), (3014, 7014), (3015, 7015),
(3016, 7016), (3017, 7017), (3018, 7018), (3019, 7019), (3020, 7020),
(3021, 7021);


INSERT INTO Customers (CompanyName, ContactName, ContactTitle, Address, City, PostalCode, Country, Phone, Fax) VALUES
('GlobalMart', 'Eva Green', 'Manager', '1 Elm Street', 'Berlin', 11001, 'Germany', 1234567890, 1234567891),
('QuickBuy', 'Liam Adams', 'Executive', '2 Oak Street', 'Paris', 22001, 'France', 2345678901, 2345678902),
('FastTrack', 'Noah Lee', 'Director', '3 Pine Street', 'Madrid', 33001, 'Spain', 3456789012, 3456789013),
('SuperMart', 'Olivia Zhang', 'CEO', '4 Maple Street', 'Rome', 44001, 'Italy', 4567890123, 4567890124),
('BudgetMart', 'Elijah Khan', 'Buyer', '5 Cedar Street', 'Lisbon', 55001, 'Portugal', 5678901234, 5678901235),
('MegaDeals', 'Ava Patel', 'Supervisor', '6 Birch Street', 'London', 66001, 'UK', 6789012345, 6789012346),
('SmartStore', 'James Kim', 'Director', '7 Walnut Street', 'Seoul', 54321, 'South Korea', 7890123456, 7890123457),
('EcoMart', 'Sophia Singh', 'Coordinator', '8 Chestnut Street', 'Delhi', 77001, 'India', 8901234567, 8901234568),
('EcoMart', 'Sophia Singh', 'Coordinator', '8 Chestnut Street', 'Delhi', 77001, 'India', 8901234567, 8901234568),
('UrbanBazaar', 'William Liu', 'Manager', '9 Spruce Street', 'Tokyo', 88001, 'Japan', 9012345678, 9012345679),
('TradeHub', 'Isabella Brown', 'Sales Head', '10 Palm Street', 'Bangkok', 99001, 'Thailand', 1122334455, 1122334456),
('ValueCity', 'Mason White', 'Manager', '11 Magnolia Street', 'Chicago', 10001, 'USA', 1231231234, 1231231235),
('BargainCenter', 'Mia Roy', 'Clerk', '12 Ash Street', 'Toronto', 10101, 'Canada', 2342342345, 2342342346),
('MegaStore', 'Lucas Walker', 'Executive', '13 Oak Avenue', 'Amsterdam', 1012, 'Netherlands', 3453453456, 3453453457),
('ExpressMart', 'Charlotte Hall', 'Director', '14 Fir Street', 'Sydney', 2000, 'Australia', 4564564567, 4564564568),
('ExpressMart', 'Charlotte Hall', 'Director', '14 Fir Street', 'Sydney', 2000, 'Australia', 4564564567, 4564564568),
('DiscountDepot', 'Aiden Scott', 'Owner', '15 Poplar Lane', 'Melbourne', 3000, 'Australia', 5675675678, 5675675679),
('SmartChoice', 'Aria Young', 'Admin', '16 Hazel Road', 'Brisbane', 4000, 'Australia', 6786786789, 6786786790),
('QuickPick', 'Ethan Hughes', 'Purchaser', '17 Pine Circle', 'Perth', 6000, 'Australia', 7897897890, 7897897891),
('LocalCart', 'Ella James', 'Sales Lead', '18 Ivy Blvd', 'Tokyo', 100100, 'Japan', 8908908901, 8908908902),
('TownShop', 'Jacob Martinez', 'Seller', '19 Oak Ridge', 'Osaka', 540000, 'Japan', 9019019012, 9019019013);

INSERT INTO Category (CategoryName, Description) VALUES
('Beverages', 'Drinks and Juices'),
('Condiments', 'Spices and Seasonings'),
('Dairy Products', 'Milk, Cheese, Yogurt'),
('Confections', 'Desserts and Sweets'),
('Grains/Cereals', 'Bread, Pasta, Rice'),
('Meat/Poultry', 'Chicken, Beef, Pork'),
('Seafood', 'Fish and Shellfish'),
('Produce', 'Fresh Fruits and Vegetables'),
('Baked Goods', 'Pastries and Breads'),
('Snacks', 'Chips, Nuts, etc.'),
('Frozen Foods', 'Ice Cream, Frozen Meals'),
('Canned Goods', 'Preserved Products'),
('Personal Care', 'Toiletries and Hygiene'),
('Household Items', 'Cleaning and Supplies'),
('Pet Food', 'Food for Pets'),
('Baby Products', 'Infant Essentials'),
('Beverages', 'Drinks and Juices'),
('Dairy Products', 'Milk, Cheese, Yogurt'),
('Seafood', 'Fish and Shellfish'),
('Canned Goods', 'Preserved Products'),
('Household Items', 'Cleaning and Supplies');

INSERT INTO Products (ProductName, SupplierId, CategoryId, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder) VALUES
('Orange Juice', 4001, 6001, 12, 150, 100, 20),
('Garam Masala', 4003, 6002, 10, 200, 50, 10),
('Milk Pack', 4002, 6003, 6, 50, 70, 5),
('Chocolate Cake', 4004, 6004, 1, 300, 30, 0),
('Pasta', 4002, 6005, 4, 100, 40, 10),
('Chicken Breast', 4003, 6006, 2, 250, 25, 5),
('Salmon Fillet', 4004, 6007, 1, 350, 20, 5),
('Fresh Apple', 4001, 6008, 6, 120, 100, 15),
('Baguette', 4002, 6009, 3, 80, 60, 5),
('Potato Chips', 4003, 6010, 5, 60, 70, 10),
('Vanilla Ice Cream', 4004, 6011, 1, 90, 40, 5),
('Tomato Sauce', 4002, 6012, 3, 75, 30, 5),
('Shampoo', 4001, 6013, 1, 120, 50, 10),
('Detergent', 4003, 6014, 2, 180, 40, 5),
('Dog Food', 4004, 6015, 3, 220, 20, 0),
('Baby Diapers', 4001, 6016, 10, 500, 60, 5),
('Sparkling Water', 4003, 6017, 12, 100, 30, 10),
('Cheddar Cheese', 4002, 6018, 5, 150, 25, 5),
('Frozen Pizza', 4004, 6019, 1, 300, 15, 2),
('Canned Corn', 4002, 6020, 3, 70, 50, 8),
('Toilet Cleaner', 4003, 6021, 2, 140, 35, 6);

INSERT INTO Orders (CustomerId, EmployeeId, OrderDate, RequiredDate, ShippedDate, Freight, ShipperId, ShipVia, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPosaltCode, ShipCountry) VALUES
(2001, 3001, '2025-01-01', '2025-01-05', '2025-01-03', '25.50', 8001, 1, 'GlobalMart', '1 Elm Street', 'Berlin', 'Europe', 11001, 'Germany'),
(2002, 3002, '2025-01-10', '2025-01-15', '2025-01-12', '30.00', 8002, 2, 'QuickBuy', '2 Oak Street', 'Paris', 'Europe', 22001, 'France'),
(2003, 3003, '2025-02-01', '2025-02-05', '2025-02-03', '15.00', 8001, 1, 'FastTrack', '3 Pine Street', 'Madrid', 'Europe', 33001, 'Spain'),
(2004, 3004, '2025-02-10', '2025-02-15', '2025-02-13', '20.00', 8002, 2, 'SuperMart', '4 Maple Street', 'Rome', 'Europe', 44001, 'Italy'),
(2005, 3005, '2025-03-01', '2025-03-05', '2025-03-04', '18.50', 8003, 1, 'BudgetMart', '5 Cedar Street', 'Lisbon', 'Europe', 55001, 'Portugal'),
(2006, 3006, '2025-03-10', '2025-03-15', '2025-03-14', '40.00', 8001, 2, 'MegaDeals', '6 Birch Street', 'London', 'Europe', 66001, 'UK'),
(2007, 3007, '2025-04-01', '2025-04-05', '2025-04-03', '35.00', 8002, 1, 'SmartStore', '7 Walnut Street', 'Seoul', 'Asia', 54321, 'South Korea'),
(2008, 3008, '2025-04-10', '2025-04-15', '2025-04-12', '22.50', 8003, 2, 'EcoMart', '8 Chestnut Street', 'Delhi', 'Asia', 77001, 'India'),
(2009, 3009, '2025-05-01', '2025-05-05', '2025-05-03', '12.00', 8001, 1, 'UrbanBazaar', '9 Spruce Street', 'Tokyo', 'Asia', 88001, 'Japan'),
(2010, 3010, '2025-05-10', '2025-05-15', '2025-05-14', '45.00', 8002, 2, 'TradeHub', '10 Palm Street', 'Bangkok', 'Asia', 99001, 'Thailand');

-- Combined INSERT statements for OrderDetails (Total: 31 rows)
INSERT INTO OrderDetails (OrderId, ProductId, UnitPrice, Quantity, Discount) VALUES
(1001, 5001, 150, 2, 0),
(1001, 5002, 200, 1, 5),
(1002, 5003, 50, 3, 0),
(1003, 5004, 300, 1, 10),
(1004, 5005, 100, 4, 0),
(1005, 5006, 250, 2, 0),
(1006, 5007, 350, 1, 15),
(1007, 5008, 120, 6, 5),
(1008, 5009, 80, 3, 0),
(1009, 5010, 60, 5, 5),
(1010, 5011, 90, 2, 0),
(1002, 5020, 70, 2, 0),
(1003, 5006, 250, 1, 0),
(1004, 5011, 90, 2, 5),
(1005, 5012, 75, 4, 0),
(1006, 5015, 220, 1, 0),
(1007, 5016, 500, 1, 15),
(1008, 5017, 100, 2, 0),
(1009, 5021, 140, 3, 5),
(1010, 5008, 120, 4, 0),
(1001, 5010, 60, 2, 0),
(1002, 5019, 300, 2, 10),
(1003, 5021, 140, 2, 0),
(1004, 5009, 80, 3, 5),
(1005, 5001, 150, 1, 0),
(1006, 5002, 200, 2, 0),
(1007, 5003, 50, 1, 5),
(1008, 5004, 300, 1, 10),
(1009, 5005, 100, 2, 0),
(1010, 5006, 250, 1, 0),
(1001, 5007, 350, 1, 5);



Select * from Employees;
Select * From Customers;
Select * From Orders;
Select * From Products;
Select * From Category;
Select * From Region;
Select * From Shippers;
Select * From Suppliers;
Select * From Territories;
Select * From OrderDetails;
Select * From EmployeeTerritory;


