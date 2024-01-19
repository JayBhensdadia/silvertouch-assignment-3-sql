-- Table: Product
INSERT INTO Product (ProductName, CategoryID, UnitPrice, InStockQuantity)
VALUES
    ('Laptop', 1, 899.99, 25),
    ('Smartphone', 1, 499.99, 100),
    ('Printer', 2, 199.99, 20),
    ('Desk Chair', 3, 79.99, 30),
    ('Desk Lamp', 3, 29.99, 50);


-- Table: Category
INSERT INTO Category (CategoryName, Description, UpdatedDate)
VALUES
    ('Electronics', 'Products related to electronic devices.', GETDATE()),
    ('Office Supplies', 'Products commonly used in offices.', NULL),
    ('Furniture', 'Various types of furniture items.', NULL),
    ('Clothing', 'Clothes and accessories.', NULL),
    ('Books', 'Books of different genres.', NULL);


-- Table: Supplier
INSERT INTO Supplier (SupplierName, ContactPerson, Email, Phone)
VALUES
    ('Gada Electronics', 'Jethalal Gada', 'jetha.gata@gmail.com', '123-456-7890'),
    ('Panasonic', 'Ajay sharma', 'ajay.sharma@panasonic.com', '987-654-3210'),
    ('Royaloak Furniture', 'Sanjay Verma', 'sanjay.verma@royaloak.com', '111-222-3333'),
    ('Ajio', 'Vijay Chauhan', 'vijay.chauhan@ajio.com', '444-555-6666'),
    ('Booker', 'Rahul Patel', 'rahul.patel@booker.com', '777-888-9999');

-- Table: PurchaseOrder
INSERT INTO PurchaseOrder (SupplierID, TotalAmount, Status)
VALUES
    (1, 1899.90, 'Shipped'),
    (2,  999.95, 'Pending'),
    (3, 159.98, 'Shipped'),
    (4,  89.97, 'Pending'),
    (5,  0.00, 'Pending'); 


-- Table: OrderDetail
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, UnitPrice, TotalPrice)
VALUES
    (1, 1, 10, 899.99, 8999.90),
    (1, 2, 10, 499.99, 4999.90),  
    (2, 3, 5, 199.99, 999.95),
    (3, 4, 2, 79.99, 159.98),
    (4, 5, 3, 29.99, 89.97);

