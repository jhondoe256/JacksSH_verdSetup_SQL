USE JacksSteakHouse;

--Create a database
--CREATE DATABASE JacksSteakHouse

-- CREATE TABLE StoreLocations(
--     LocationId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
--     [Address] NVARCHAR(150),
--     City NVARCHAR(100),
--     [State] NVARCHAR(5),
--     Zipcode NVARCHAR(10)
-- );

--INSERT INTO StoreLocations ([Address],City,[State],Zipcode) VALUES(@Address,@City,@State,@Zipcode)
--INSERT INTO StoreLocations ([Address],City) VALUES(@Address,@City)

-- INSERT INTO StoreLocations VALUES 
--     ('1234 Foodie Ln','Noblesville','IN',48006)
--     ,('12375 BurgerVille Court','Indianapolis','IN',48024);

-- CREATE TABLE PositionType(
--     Id INT PRIMARY KEY,
--     Position VARCHAR(100) NOT NULL UNIQUE
-- );

-- INSERT INTO PositionType (Id,[Position]) VALUES
-- (0,'Chief Executive Officer'),
-- (1,'Head Chef'),
-- (2,'Cook'),
-- (3,'Waitress'),
-- (4,'Dishwasher');

-- CREATE TABLE Employee(
--     EmployeeId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
--     FirstName NVARCHAR(100) NOT NULL,
--     LastName NVARCHAR(100) NOT NULL,
--     EmployeeAddress NVARCHAR(150) NOT NULL,
--     PhoneNumber NVARCHAR(14) NOT NULL,
--     LocationId INT FOREIGN KEY REFERENCES StoreLocations(LocationId)
-- );

-- ALTER TABLE Employee ADD PositionType int

-- CREATE TABLE EmployeePosition(
--     EmployeePositionId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
--     Position INT NOT NULL DEFAULT 0,
--     CONSTRAINT fk_Position FOREIGN KEY (Position) REFERENCES PositionType(Id),
--     IsSupervisor BIT NOT NULL
-- );

-- CREATE TABLE MenuItems(
--     MenuItemId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
--     Name NVARCHAR(100) NOT NULL,
--     Ingredients  NVARCHAR(250) NOT NULL,
--     Allergens  NVARCHAR(250) NOT NULL,
--     Price  DECIMAL NOT NULL
-- );

-- INSERT INTO MenuItems([Name],Ingredients,Allergens,Price) VALUES (
-- 'T-BONE STEAK',
-- 'Sear, and steak seasoning',
-- 'none',
-- 150.00),
-- (
-- 'Chicken Salad',
-- 'Vinegrette and stuff...',
-- 'none',
-- 50.00);

--CREATE TABLE Customers(
--	CustomerId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
--	FirstName NVARCHAR(50) NOT NULL,
--	LastName NVARCHAR(50) NOT NULL,
--);

--INSERT INTO Customers VALUES 
--  ('Creg','Witherspoon'),	
--  ('Dee Dee','Witherspoon'),
--  ('Jhon','Witherspoon');

--CREATE TABLE CustomerOrders(
--	OrderId INT PRIMARY KEY NOT NULL IDENTITY(1,1),
--	OrderDate DATETIME2 NOT NULL,
--	CustomerId INT FOREIGN KEY REFERENCES [dbo].[Customers]([CustomerId]) NOT NULL,
--	MenuItemId INT FOREIGN KEY REFERENCES MenuItems([MenuItemId]) NOT NULL
--);

--INSERT INTO CustomerOrders VALUES 
--('2023/5/25',1,3),
--('2023/5/25',3,1),
--('2023/5/25',2,1),
--('2023/5/25',3,3);

--ALTER TABLE [dbo].[EmployeePosition]
--DROP COLUMN [EmployeeId]

--------------------------------------------------------
-- lets query Employee Data
--gets all employee data!
-- SELECT * FROM Employee

--but, what if I want to know what position(s) all employees have?
--but, I only want the employees first and last names, and their position
-- SELECT
--     e.FirstName,
--     e.LastName,
--     pt.[Position]
-- FROM Employee e 
-- Left Join PositionType pt on pt.Id = e.PositionType

-- SELECT 
--    e.*,
--    pt.* 
-- FROM Employee e Left JOIN PositionType pt on pt.Id = e.PositionType

-- SELECT 
--    e.*,
--    pt.* 
-- FROM Employee e RIGHT JOIN PositionType pt on pt.Id = e.PositionType

-- SELECT 
--    e.*,
--    pt.* 
-- FROM Employee e Inner JOIN PositionType pt on pt.Id = e.PositionType

-- get store data
-- SELECT * FROM StoreLocations

--GET EMPLOYEES FROM A SPECIFIC STORE
-- SELECT 
--     sl.City,
--     e.FirstName,
--     e.LastName,
--     pt.[Position]
-- FROM StoreLocations AS sl
-- Left JOIN Employee AS e on e.LocationId = sl.LocationId
-- Left Join PositionType pt on pt.Id = e.PositionType
-- WHERE sl.LocationId = 2

--VIEW ALL CUSTOMERS
-- SELECT * FROM Customers

--all of the orders made by a specific customer
-- SELECT * FROM Customers c
-- LEFT JOIN CustomerOrders co ON co.CustomerId = c.CustomerId
-- LEFT JOIN MenuItems m ON m.MenuItemId = co.MenuItemId
-- WHERE c.CustomerId = 4