-- Table: Product

CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50) NOT NULL,
    CategoryID INT,
    UnitPrice DECIMAL(10,2) DEFAULT NULL,
    InStockQuantity INT DEFAULT 0,
);


-- Table: Category
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL,
    Description TEXT DEFAULT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT NULL 
);

-- Table: Supplier
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName VARCHAR(50) NOT NULL,
    ContactPerson VARCHAR(50) DEFAULT NULL,
    Email VARCHAR(50) DEFAULT NULL,
    Phone VARCHAR(15) DEFAULT NULL
);

-- Table: PurchaseOrder
CREATE TABLE PurchaseOrder (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    SupplierID INT,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(12,2) DEFAULT NULL,
    Status VARCHAR(20) DEFAULT 'Pending'
);

-- Table: OrderDetail
CREATE TABLE OrderDetail (
    DetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT DEFAULT 0,
    UnitPrice DECIMAL(10,2) DEFAULT NULL,
    TotalPrice DECIMAL(12,2) DEFAULT NULL
);