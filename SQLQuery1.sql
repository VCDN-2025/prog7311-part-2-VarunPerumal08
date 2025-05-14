
CREATE DATABASE AgriEnergyConnect;
GO

USE AgriEnergyConnect;
GO

-- Create tables with proper relationships
CREATE TABLE Roles (
    RoleId INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    RoleId INT NOT NULL FOREIGN KEY REFERENCES Roles(RoleId)
);
GO

CREATE TABLE Farmers (
    FarmerId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Users(UserId),
    FarmName NVARCHAR(100) NOT NULL,
    FarmLocation NVARCHAR(100) NOT NULL,
    FarmSize DECIMAL(10,2) NULL,
    Specialization NVARCHAR(100) NULL
);
GO

CREATE TABLE ProductCategories (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(200) NULL
);
GO

CREATE TABLE Products (
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    FarmerId INT NOT NULL FOREIGN KEY REFERENCES Farmers(FarmerId),
    CategoryId INT NOT NULL FOREIGN KEY REFERENCES ProductCategories(CategoryId),
    ProductName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500) NULL,
    ProductionDate DATE NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NULL,
    IsOrganic BIT DEFAULT 0,
    IsAvailable BIT DEFAULT 1
);
GO

-- Insert initial data
INSERT INTO Roles (RoleName) VALUES ('Farmer'), ('Employee');
GO

-- Password for both is 'password123' (SHA256 hash)
INSERT INTO Users (Username, Password, Email, FirstName, LastName, RoleId)
VALUES 
('farmer1', 'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F', 'farmer@example.com', 'John', 'Doe', 1),
('employee1', 'EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F', 'employee@example.com', 'Jane', 'Smith', 2);
GO

INSERT INTO Farmers (UserId, FarmName, FarmLocation, FarmSize, Specialization)
VALUES 
(1, 'Green Valley Farm', 'Western Cape', 50.5, 'Organic Vegetables');
GO

INSERT INTO ProductCategories (CategoryName, Description) 
VALUES 
('Vegetables', 'Fresh farm vegetables'),
('Fruits', 'Seasonal fruits'),
('Grains', 'Cereals and grains'),
('Dairy', 'Milk and milk products'),
('Meat', 'Farm meat products');
GO

INSERT INTO Products (FarmerId, CategoryId, ProductName, Description, ProductionDate, Quantity, Price, IsOrganic, IsAvailable)
VALUES 
(1, 1, 'Tomatoes', 'Fresh organic tomatoes', GETDATE(), 100, 15.99, 1, 1),
(1, 1, 'Carrots', 'Sweet farm carrots', GETDATE(), 75, 12.50, 1, 1),
(1, 2, 'Apples', 'Crisp red apples', GETDATE(), 50, 20.00, 0, 1);
GO

