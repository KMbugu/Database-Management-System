-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    UnitPrice DECIMAL(10, 2) NOT NULL CHECK (UnitPrice >= 0),
    SKU VARCHAR(20) UNIQUE NOT NULL,
    SupplierID INT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Create Stock table
CREATE TABLE Stock (
    StockID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    QuantityInStock INT NOT NULL CHECK (QuantityInStock >= 0),
    LastUpdated DATE NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL CHECK (TotalAmount >= 0)
);

-- Create SalesItems table (junction table for M-M relationship between Sales and Products)
CREATE TABLE SalesItems (
    SaleID INT,
    ProductID INT,
    QuantitySold INT NOT NULL CHECK (QuantitySold > 0),
    PRIMARY KEY (SaleID, ProductID),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
