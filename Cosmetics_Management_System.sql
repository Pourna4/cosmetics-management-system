create database CMS;
CREATE TABLE CUSTOMER (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Address TEXT
);

CREATE TABLE ORDER_TABLE (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);

CREATE TABLE PAYMENT (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentStatus VARCHAR(50),
    PaymentMethod VARCHAR(50),
    TransactionID VARCHAR(255),
    FOREIGN KEY (OrderID) REFERENCES ORDER_TABLE(OrderID)
);

CREATE TABLE REVIEW (
    ReviewID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);

CREATE TABLE DISCOUNT (
    DiscountID INT PRIMARY KEY,
    DiscountName VARCHAR(255),
    DiscountPercentage DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE CATEGORY (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    Description TEXT
);

CREATE TABLE BRAND (
    BrandID INT PRIMARY KEY,
    BrandName VARCHAR(255),
    Country VARCHAR(100),
    Description TEXT
);

CREATE TABLE PRODUCT (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(255),
    BrandID INT,
    CategoryID INT,
    Price DECIMAL(10,2),
    StockQuantity INT,
    ExpiryDate DATE,
    FOREIGN KEY (BrandID) REFERENCES BRAND(BrandID),
    FOREIGN KEY (CategoryID) REFERENCES CATEGORY(CategoryID)
);

CREATE TABLE ORDERDETAILS (
    OrderDetailsID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES ORDER_TABLE(OrderID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

CREATE TABLE SUPPLIER (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255),
    ContactName VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255),
    Address TEXT
);

CREATE TABLE PURCHASE (
    PurchaseID INT PRIMARY KEY,
    SupplierID INT,
    PurchaseDate DATE,
    TotalCost DECIMAL(10,2),
    FOREIGN KEY (SupplierID) REFERENCES SUPPLIER(SupplierID)
);

CREATE TABLE PURCHASEDETAILS (
    PurchaseDetailsID INT PRIMARY KEY,
    PurchaseID INT,
    ProductID INT,
    Quantity INT,
    CostPrice DECIMAL(10,2),
    FOREIGN KEY (PurchaseID) REFERENCES PURCHASE(PurchaseID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

CREATE TABLE SALES (
    SalesID INT PRIMARY KEY,
    OrderID INT,
    SalesDate DATE,
    TotalRevenue DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES ORDER_TABLE(OrderID)
);

CREATE TABLE EMPLOYEE (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Role VARCHAR(100),
    Salary DECIMAL(10,2)
);

CREATE TABLE INVENTORY (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    StockLevel INT,
    ReorderLevel INT,
    LastUpdated DATE,
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

INSERT INTO CUSTOMER (CustomerID, Name, Email, Phone, Address) VALUES
(1, 'Ravi', 'ravi313@gmail.com', '1234567890', 'Tirupati'),
(2, 'Rani', 'rani2766@gmail.com', '2345678901', 'Tirupati'),
(3, 'banu', 'banu@gmail.com', '3456789012', 'Bangalore'),
(4, 'Charan', 'charan@gmail.com', '4567890123', 'chittoor'),
(5, 'surya', 'surya427.com', '5678901234', 'kurnool'),
(6, 'janu', 'janu527@gmail.com', '6789012345', 'Hyderabad'),
(7, 'veena', 'veena24@gmail.com', '7890123456', 'Kadapa'),
(8, 'Devi', 'devi2786@gmail.com', '8901234567', 'chennai'),
(9, 'Balu', 'balu2867@gmail.com', '9012345678', 'nellore'),
(10, 'krishna', 'krishna17897@gmail.com', '0123456789', 'vizag'),
(11, 'teja', 'teja34@gmail.com', '1111111111', 'hyderabad'),
(12, 'pavani', 'pavani267@gmail.com', '2222222222', 'chittoor'),
(13, 'thanuja', 'thanuja135@gmail.com', '3333333333', 'kadiri'),
(14, 'vinitha', 'vinitha4363@gmail.com', '4444444444', 'nellore'),
(15, 'raji', 'raji245@gmail.com', '5555555555', 'kurnool'),
(16, 'santhosh', 'santhosh234@gmail.com', '6666666666', 'bangalore'),
(17, 'prakash', 'prakash296@gmail.com', '7777777777', 'mysore'),
(18, 'Roshini', 'roshini34@gmail.com', '8888888888', 'chennai'),
(19, 'meghana', 'meghana4868@gmail.com', '9999999999', 'amaravathi'),
(20, 'nandini', 'nandini245@gmail.com', '0000000000', 'tirupati');

INSERT INTO ORDER_TABLE (OrderID, CustomerID, OrderDate, TotalAmount, Status) VALUES
(21, 1, '2025-03-01', 150.50, 'Completed'),
(22, 2, '2025-03-02', 200.00, 'Pending'),
(23, 3, '2025-03-03', 99.99, 'Shipped'),
(24, 4, '2025-03-04', 49.95, 'Cancelled'),
(25, 5, '2025-03-05', 300.75, 'Completed'),
(26, 6, '2025-03-06', 175.20, 'Shipped'),
(27, 7, '2025-03-07', 250.00, 'Pending'),
(28, 8, '2025-03-08', 120.50, 'Completed'),
(29, 9, '2025-03-09', 75.30, 'Shipped'),
(30, 10, '2025-03-10', 190.00, 'Completed'),
(31, 11, '2025-03-11', 89.99, 'Pending'),
(32, 12, '2025-03-12', 210.75, 'Completed'),
(33, 13, '2025-03-13', 330.40, 'Shipped'),
(34, 14, '2025-03-14', 99.90, 'Pending'),
(35, 15, '2025-03-15', 410.60, 'Completed'),
(36, 16, '2025-03-16', 115.50, 'Shipped'),
(37, 17, '2025-03-17', 60.75, 'Cancelled'),
(38, 18, '2025-03-18', 299.99, 'Completed'),
(39, 19, '2025-03-19', 240.80, 'Shipped'),
(40, 20, '2025-03-20', 175.00, 'Completed');

INSERT INTO PAYMENT (PaymentID, OrderID, PaymentStatus, PaymentMethod, TransactionID) VALUES
(41, 21, 'Success', 'Credit Card', 'TXN1001'),
(42, 22, 'Pending', 'PayPal', 'TXN1002'),
(43, 23, 'Success', 'Debit Card', 'TXN1003'),
(44, 24, 'Failed', 'Credit Card', 'TXN1004'),
(45, 25, 'Success', 'PayPal', 'TXN1005'),
(46, 26, 'Success', 'Credit Card', 'TXN1006'),
(47, 27, 'Pending', 'Debit Card', 'TXN1007'),
(48, 28, 'Success', 'PayPal', 'TXN1008'),
(49, 29, 'Success', 'Credit Card', 'TXN1009'),
(50, 30, 'Success', 'Debit Card', 'TXN1010'),
(51, 31, 'Pending', 'PayPal', 'TXN1011'),
(52, 32, 'Success', 'Credit Card', 'TXN1012'),
(53, 33, 'Success', 'Debit Card', 'TXN1013'),
(54, 34, 'Pending', 'PayPal', 'TXN1014'),
(55, 35, 'Success', 'Credit Card', 'TXN1015'),
(56, 36, 'Success', 'Debit Card', 'TXN1016'),
(57, 37, 'Failed', 'Credit Card', 'TXN1017'),
(58, 38, 'Success', 'PayPal', 'TXN1018'),
(59, 39, 'Success', 'Debit Card', 'TXN1019'),
(60, 40, 'Success', 'Credit Card', 'TXN1020');  
      
INSERT INTO REVIEW (ReviewID, CustomerID, ProductID, Rating, Comment) VALUES
(61, 1, 81, 5, 'Amazing lipstick, long-lasting!'),
(62, 2, 82, 4, 'Great foundation, but a little dry for my skin'),
(63, 3, 83, 3, 'Average mascara, expected more volume'),
(64, 4, 84, 5, 'Loved the eyeshadow palette!'),
(56, 5, 85, 2, 'Not happy with the concealer, too cakey'),
(66, 6, 86, 5, 'Best highlighter I’ve ever used!'),
(67, 7, 87, 4, 'Good quality nail polish'),
(68, 8, 88, 3, 'Lip balm is okay, but not very hydrating'),
(69, 9, 89, 5, 'Great BB cream!'),
(70, 10, 90, 1, 'Would not buy this primer again'),
(71, 11, 91, 5, 'Perfect setting spray!'),
(72, 12, 92, 3, 'Foundation oxidizes too much'),
(73, 13, 93, 4, 'Blush blends beautifully'),
(74, 14, 94, 5, 'My go-to bronzer!'),
(75, 15, 95, 2, 'Disappointed with the liquid eyeliner'),
(76, 16, 96, 4, 'Nice eyebrow pencil'),
(77, 17, 97, 3, 'Setting powder is just okay'),
(78, 18, 98, 5, 'Lip gloss is stunning!'),
(79, 19, 99, 4, 'Good buy for the price'),
(80, 20, 100, 5, 'Loved this eyeshadow stick!');

INSERT INTO DISCOUNT (DiscountID, DiscountName, DiscountPercentage, StartDate, EndDate) VALUES
(101, 'Spring Beauty Sale', 10.00, '2025-03-01', '2025-03-10'),
(102, 'Summer Glow Deal', 15.00, '2025-06-01', '2025-06-15'),
(103, 'Winter Skin Special', 20.00, '2025-12-01', '2025-12-10'),
(104, 'Black Friday Beauty', 30.00, '2025-11-25', '2025-11-30'),
(105, 'New Year Makeup Offer', 25.00, '2026-01-01', '2026-01-05'),
(106, 'Clearance Cosmetics', 40.00, '2025-09-15', '2025-09-20'),
(107, 'Cyber Monday Skincare', 35.00, '2025-11-28', '2025-11-29'),
(108, 'Holiday Glam Discount', 15.00, '2025-12-20', '2025-12-25'),
(109, 'Back to Beauty', 10.00, '2025-08-01', '2025-08-10'),
(110, 'Anniversary Makeup Sale', 20.00, '2025-07-01', '2025-07-07'),
(111, 'Easter Glam Deal', 12.00, '2025-04-10', '2025-04-15'),
(112, 'Thanksgiving Beauty Special', 18.00, '2025-11-20', '2025-11-25'),
(113, 'Valentine’s Lipstick Discount', 14.00, '2025-02-10', '2025-02-14'),
(114, 'Independence Day Makeup Sale', 22.00, '2025-07-04', '2025-07-05'),
(115, 'Weekend Beauty Deals', 5.00, '2025-05-01', '2025-05-02'),
(116, 'Mega Beauty Sale', 50.00, '2025-10-01', '2025-10-07'),
(117, 'Flash Skincare Sale', 33.00, '2025-06-15', '2025-06-16'),
(118, 'Diwali Makeup Offer', 27.00, '2025-10-20', '2025-10-25'),
(119, 'Halloween Special Effects Makeup', 13.00, '2025-10-31', '2025-11-01'),
(120, 'Loyalty Beauty Reward', 8.00, '2025-09-01', '2025-09-30');

INSERT INTO CATEGORY (CategoryID, CategoryName, Description) VALUES
(121, 'Lipsticks', 'Matte, glossy, and liquid lipsticks'),
(122, 'Foundations', 'Full coverage, lightweight, and skin tints'),
(123, 'Mascara', 'Waterproof and volumizing mascaras'),
(124, 'Eyeshadow', 'Palettes and singles in various finishes'),
(125, 'Concealers', 'Cover imperfections and brighten skin'),
(126, 'Highlighters', 'Glow-enhancing face products'),
(127, 'Nail Polish', 'Long-lasting nail colors'),
(128, 'Lip Balms', 'Hydrating and tinted lip balms'),
(129, 'BB Cream', 'Lightweight all-in-one skin tints'),
(130, 'Primers', 'Smooth skin and extend makeup wear'),
(131, 'Setting Sprays', 'Lock in makeup for long wear'),
(132, 'Blush', 'Powder, cream, and liquid blushes'),
(133, 'Bronzers', 'Warm up and sculpt the face'),
(134, 'Eyeliners', 'Pencil, gel, and liquid liners'),
(135, 'Eyebrow Products', 'Brow pencils, gels, and pomades'),
(136, 'Setting Powders', 'Loose and pressed powders for makeup'),
(137, 'Lip Gloss', 'Shiny and hydrating lip glosses'),
(138, 'Makeup Brushes', 'Essential brushes for application'),
(139, 'Makeup Sponges', 'Blending and setting sponges'),
(140, 'Skincare', 'Cleansers, moisturizers, and serums');

INSERT INTO BRAND (BrandID, BrandName, Country, Description) VALUES
(141, 'Maybelline', 'USA', 'Affordable and trendy cosmetics'),
(142, 'MAC', 'Canada', 'High-end professional makeup brand'),
(143, 'LOreal', 'France', 'Innovative beauty products'),
(144, 'Estee Lauder', 'USA', 'Luxury skincare and makeup'),
(145, 'Dior', 'France', 'Prestige cosmetics and fragrances'),
(146, 'NYX', 'USA', 'Trendy and affordable makeup'),
(147, 'Revlon', 'USA', 'Classic beauty and hair products'),
(148, 'Fenty Beauty', 'USA', 'Inclusive beauty brand by Rihanna'),
(149, 'Huda Beauty', 'UAE', 'High-quality beauty and makeup'),
(150, 'Charlotte Tilbury', 'UK', 'Luxury makeup brand'),
(151, 'Sephora Collection', 'France', 'Affordable beauty range by Sephora'),
(152, 'Clinique', 'USA', 'Dermatologist-developed skincare and makeup'),
(153, 'Urban Decay', 'USA', 'Bold and edgy cosmetics'),
(154, 'Bobbi Brown', 'USA', 'Natural and elegant makeup'),
(155, 'Too Faced', 'USA', 'Fun and playful makeup brand'),
(156, 'CoverGirl', 'USA', 'Affordable drugstore cosmetics'),
(157, 'Anastasia Beverly Hills', 'USA', 'Best known for brow products'),
(158, 'Tarte', 'USA', 'Vegan and cruelty-free cosmetics'),
(159, 'Morphe', 'USA', 'Makeup artist favorite brand'),
(160, 'Pat McGrath Labs', 'USA', 'Luxury high-end cosmetics');

INSERT INTO PRODUCT (ProductID, Name, BrandID, CategoryID, Price, StockQuantity, ExpiryDate) VALUES
(81, 'SuperStay Matte Ink Lipstick', 141, 121, 9.99, 150, '2026-06-01'),
(82, 'Studio Fix Fluid Foundation', 142, 122, 34.99, 100, '2026-08-15'),
(83, 'Voluminous Lash Paradise Mascara', 143, 123, 10.99, 200, '2026-05-10'),
(84, 'Naked Eyeshadow Palette', 144, 124, 49.99, 80, '2027-01-01'),
(85, 'Radiant Creamy Concealer', 145, 125, 29.99, 120, '2026-09-20'),
(86, 'Killawatt Freestyle Highlighter', 146, 126, 36.99, 75, '2027-04-05'),
(87, 'Gel Envy Nail Polish',147, 127, 7.99, 250, '2026-07-12'),
(88, 'Hydrating Lip Balm', 148, 128, 5.99, 300, '2026-10-30'),
(89, 'Dream BB Fresh Cream', 149, 129, 8.99, 180, '2026-11-15'),
(90, 'Pore Minimizing Primer', 150, 130, 21.99, 110, '2026-12-01'),
(91, 'All Nighter Setting Spray', 151, 131, 32.99, 95, '2026-08-05'),
(92, 'Amazonian Clay 12-Hour Blush', 152, 132, 27.99, 140, '2027-03-18'),
(93, 'Matte Bronzer', 153, 133, 19.99, 130, '2026-06-25'),
(94, 'Tattoo Liner', 154, 134, 22.99, 160, '2026-05-22'),
(95, 'Brow Wiz Eyebrow Pencil', 155, 135, 23.99, 90, '2026-09-30'),
(96, 'Loose Setting Powder', 156, 136, 38.99, 85, '2026-07-08'),
(97, 'Gloss Bomb Universal Lip Luminizer', 157, 137, 24.99, 120, '2026-12-12'),
(98, 'Essential Makeup Brush Set', 158, 138, 49.99, 60, '2027-02-10'),
(99, 'Beauty Blender Sponge', 159, 139, 16.99, 200, '2026-04-15'),
(100, 'Hydrating Face Serum', 160, 140, 59.99, 70, '2027-05-30');

INSERT INTO ORDERDETAILS (OrderDetailsID, OrderID, ProductID, Quantity, SubTotal) VALUES
(161, 21, 81, 2, 19.98),
(162, 22, 82, 1, 34.99),
(163, 23, 83, 3, 32.97),
(164, 24, 84, 1, 49.99),
(165, 25, 85, 2, 59.98),
(166, 26, 86, 1, 36.99),
(167, 27, 87, 4, 31.96),
(168, 28, 88, 2, 11.98),
(169, 29, 89, 1, 8.99),
(170, 30, 90, 2, 43.98),
(171, 31, 91, 1, 32.99),
(172, 32, 92, 1, 27.99),
(173, 33, 93, 2, 39.98),
(174, 34, 94, 1, 22.99),
(175, 35, 95, 3, 71.97),
(176, 36, 96, 1, 38.99),
(177, 37, 97, 2, 49.98),
(178, 38, 98, 1, 49.99),
(179, 39, 99, 2, 33.98),
(180, 40, 100, 1, 59.99);

INSERT INTO SUPPLIER (SupplierID, SupplierName, ContactName, Phone, Email, Address) VALUES
(181, 'Cosmetic Suppliers Inc.', 'mahesh', '1234567890', 'mahesh23@cosmeticsuppliers.com', 'andhra pradesh'),
(182, 'Glamour Distributors', 'indu', '9876543210', 'indu@glamourdist.com', 'chennai'),
(183, 'Luxury Beauty Supplies', 'sandy', '5551234567', 'sandy24@luxurybeauty.com', 'hyderabad'),
(184, 'Organic Glow', 'dhanush', '4445556666', 'danush26@organicglow.com', 'hyderabaad'),
(185, 'Elite Makeup', 'sony', '6667778888', 'sony67@elitemakeup.com', 'tirupati'),
(186, 'Radiant Skincare', 'lahari', '7778889999', 'lahari79@radiantskincare.com', 'chennai'),
(187, 'Pure Beauty', 'nikhila', '3334445555', 'nikhila35@purebeauty.com', 'bengaluru'),
(188, 'Vibrant Cosmetics', 'mohan', '1112223333', 'mohan204@vibrantcosmetics.com', 'mysore'),
(189, 'Nature Essence', 'tharun', '9990001111', 'tharun24@natureessence.com', 'kolkata'),
(190, 'Lush Looks', 'asif', '5556667777', 'asif25@lushlooks.com', 'bihar'),
(191, 'Everglow Cosmetics', 'khadar', '7771234567', 'khadar756@everglow.com', 'jaipur'),
(192, 'Trendsetters Makeup', 'vishnu', '8882345678', 'vishnu278@trendsetters.com', 'west bengal'),
(193, 'Chic Beauty Hub', 'neha', '9993456789', 'neha96@chicbeautyhub.com', 'bihar'),
(194, 'Glow Essence', 'chaitu', '2224567890', 'chaitu25@glowessence.com', 'delhi'),
(195, 'Luxe Skin Care', 'sai', '3335678901', 'sai398@luxeskincare.com', 'gujarat'),
(196, 'Timeless Beauty', 'saif', '4446789012', 'saif251@timelessbeauty.com', 'maharastra'),
(197, 'Royal Glow', 'hari prasad', '5557890123', 'hariprasad24@royalglow.com', 'kerala'),
(198, 'Elysian Cosmetics', 'pushpa', '6668901234', 'pushpa356@elysiancosmetics.com', 'rajasthan'),
(199, 'Natural Radiance', 'suresh', '7779012345', 'suresh27@naturalradiance.com', 'gujarat'),
(200, 'Beauty Haven', 'rakesh', '8880123456', 'rakesh64@beautyhaven.com', 'tirupati');

INSERT INTO PURCHASE (PurchaseID, SupplierID, PurchaseDate, TotalCost) VALUES
(201, 181, '2025-01-15', 1200.50),
(202, 182, '2025-02-10', 850.75),
(203, 183, '2025-03-05', 1450.00),
(204, 184, '2025-04-01', 980.25),
(205, 185, '2025-05-12', 1100.60),
(206, 186, '2025-06-20', 1350.80),
(207, 187, '2025-07-18', 920.40),
(208, 188, '2025-08-15', 1195.30),
(209, 189, '2025-09-10', 1300.25),
(210, 190, '2025-10-05', 1120.90),
(211, 191, '2025-11-10', 1250.60),
(212, 192, '2025-11-15', 1400.75),
(213, 193, '2025-11-20', 1550.40),
(214, 194, '2025-11-25', 1350.30),
(215, 195, '2025-12-01', 1125.80),
(216, 196, '2025-12-05', 1480.95),
(217, 197, '2025-12-10', 1290.50),
(218, 198, '2025-12-15', 1510.65),
(219, 199, '2025-12-20', 1175.90),
(220, 200, '2025-12-25', 1600.45);

INSERT INTO PURCHASEDETAILS (PurchaseDetailsID, PurchaseID, ProductID, Quantity, CostPrice) VALUES
(221, 201, 81, 50, 8.50),
(222, 202, 82, 30, 28.00),
(223, 203, 83, 60, 9.50),
(224, 204, 84, 20, 42.00),
(225, 205, 85, 40, 25.00),
(226, 206, 86, 25, 32.00),
(227, 207, 87, 80, 6.50),
(228, 208, 88, 100, 4.50),
(229, 209, 89, 50, 7.00),
(230, 210, 90, 30, 19.00),
(231, 211, 91, 45, 15.00),
(232, 212, 92, 55, 12.50),
(233, 213, 93, 70, 10.00),
(234, 214, 94, 65, 14.50),
(235, 215, 95, 90, 9.00),
(236, 216, 96, 85, 20.00),
(237, 217, 97,100, 8.00),
(238, 218, 98,110, 16.00),
(239, 219, 99, 95, 13.00),
(240, 220, 100, 120, 11.50);

INSERT INTO SALES (SalesID, OrderID, SalesDate, TotalRevenue) VALUES
(241, 21, '2024-03-01', 250.00),
(242, 22, '2024-03-02', 150.50),
(243, 23, '2024-03-03', 320.75),
(244, 24, '2024-03-04', 290.00),
(245, 25, '2024-03-05', 185.25),
(246, 26, '2024-03-06', 410.60),
(247, 27, '2024-03-07', 135.80),
(248, 28, '2024-03-08', 505.90),
(249, 29, '2024-03-09', 250.45),
(250, 30, '2024-03-10', 399.99),
(251, 31, '2024-03-11', 225.30),
(252, 32, '2024-03-12', 140.00),
(253, 33, '2024-03-13', 370.80),
(254, 34, '2024-03-14', 280.50),
(255, 35, '2024-03-15', 120.00),
(256, 36, '2024-03-16', 430.25),
(257, 37, '2024-03-17', 330.40),
(258, 38, '2024-03-18', 510.75),
(259, 39, '2024-03-19', 199.99),
(260, 40, '2024-03-20', 275.60);

INSERT INTO EMPLOYEE (EmployeeID, Name, Email, Phone, Role, Salary) VALUES
(261, 'rajesh', 'rajesh974@cosmetics.com', '1112223333', 'Store Manager', 55000.00),
(262, 'leena', 'leena37@cosmetics.com', '2223334444', 'Sales Associate', 32000.00),
(263, 'deva', 'deva93@cosmetics.com', '3334445555', 'Beauty Consultant', 35000.00),
(264, 'niharika', 'niharika246@cosmetics.com', '4445556666', 'Cashier', 28000.00),
(265, 'pavan', 'pavan34@cosmetics.com', '5556667777', 'Inventory Manager', 48000.00),
(266, 'vasu', 'vasu876@cosmetics.com', '6667778888', 'Sales Associate', 31000.00),
(267, 'ramya', 'ramya86@cosmetics.com', '7778839999', 'Marketing Specialist', 45000.00),
(268, 'priya', 'priya987@cosmetics.com', '8889990000', 'Product Manager', 60000.00),
(269, 'ishu', 'ishu@cosmetics.com', '9990001111', 'Customer Service Rep', 30000.00),
(270, 'mani', 'mani@cosmetics.com', '0001112222', 'Warehouse Staff', 27000.00),
(271, 'sunitha', 'sunitha25@cosmetics.com', '1112223334', 'Cashier', 28500.00),
(272, 'rohan', 'rohan976@cosmetics.com', '2223334445', 'Sales Associate', 31500.00),
(273, 'yashmi', 'yashni7654@cosmetics.com', '3334445556', 'Beauty Consultant', 35500.00),
(274, 'rohit', 'rohit252@cosmetics.com', '4445556667', 'Marketing Assistant', 40000.00),
(275, 'preeti', 'preeti08@cosmetics.com', '5556667778', 'Inventory Clerk', 29000.00),
(276, 'prabhu', 'prabhu87@cosmetics.com', '6667778889', 'Assistant Store Manager', 50000.00),
(277, 'harini', 'harini0976@cosmetics.com', '7778889990', 'Sales Lead', 42000.00),
(278, 'swetha', 'swetha256@cosmetics.com', '8889990001', 'Warehouse Staff', 27500.00),
(279, 'sandeep', 'sandeep097@cosmetics.com', '9990001112', 'Customer Support', 32000.00),
(280, 'ganesh', 'ganesh974@cosmetics.com', '0001112223', 'Retail Supervisor', 47000.00);

INSERT INTO INVENTORY (InventoryID, ProductID, StockLevel, ReorderLevel, LastUpdated) VALUES
(281, 81, 150, 50, '2024-03-01'),
(282, 82, 120, 30, '2024-03-02'),
(283, 83, 200, 40, '2024-03-03'),
(284, 84, 80, 25, '2024-03-04'),
(285, 85, 300, 60, '2024-03-05'),
(286, 86, 175, 45, '2024-03-06'),
(287, 87, 90, 30, '2024-03-07'),
(288, 88, 250, 50, '2024-03-08'),
(289, 89, 110, 35, '2024-03-09'),
(290, 90, 95, 25, '2024-03-10'),
(291, 91, 170, 50, '2024-03-11'),
(292, 92, 130, 30, '2024-03-12'),
(293, 93, 220, 40, '2024-03-13'),
(294, 94, 60, 20, '2024-03-14'),
(295, 95, 280, 70, '2024-03-15'),
(296, 96, 190, 45, '2024-03-16'),
(297, 97, 100, 25, '2024-03-17'),
(298, 98, 230, 50, '2024-03-18'),
(299, 99, 140, 40, '2024-03-19'),
(300, 100, 85, 30, '2024-03-20');


select * from customer;
/*1	Ravi	ravi313@gmail.com	1234567890	Tirupati
2	Rani	rani2766@gmail.com	2345678901	Tirupati
3	banu	banu@gmail.com	3456789012	Bangalore
4	Charan	charan@gmail.com	4567890123	chittoor
5	surya	surya427.com	5678901234	kurnool
6	janu	janu527@gmail.com	6789012345	Hyderabad
7	veena	veena24@gmail.com	7890123456	Kadapa
8	Devi	devi2786@gmail.com	8901234567	chennai
9	Balu	balu2867@gmail.com	9012345678	nellore
10	krishna	krishna17897@gmail.com	0123456789	vizag
11	teja	teja34@gmail.com	1111111111	hyderabad
12	pavani	pavani267@gmail.com	2222222222	chittoor
13	thanuja	thanuja135@gmail.com	3333333333	kadiri
14	vinitha	vinitha4363@gmail.com	4444444444	nellore
15	raji	raji245@gmail.com	5555555555	kurnool
16	santhosh	santhosh234@gmail.com	6666666666	bangalore
17	prakash	prakash296@gmail.com	7777777777	mysore
18	Roshini	roshini34@gmail.com	8888888888	chennai
19	meghana	meghana4868@gmail.com	9999999999	amaravathi
20	nandini	nandini245@gmail.com	0000000000	tirupati*/

select * from order_table;
/*21	1	2025-03-01	150.50	Completed
22	2	2025-03-02	200.00	Pending
23	3	2025-03-03	99.99	Shipped
24	4	2025-03-04	49.95	Cancelled
25	5	2025-03-05	300.75	Completed
26	6	2025-03-06	175.20	Shipped
27	7	2025-03-07	250.00	Pending
28	8	2025-03-08	120.50	Completed
29	9	2025-03-09	75.30	Shipped
30	10	2025-03-10	190.00	Completed
31	11	2025-03-11	89.99	Pending
32	12	2025-03-12	210.75	Completed
33	13	2025-03-13	330.40	Shipped
34	14	2025-03-14	99.90	Pending
35	15	2025-03-15	410.60	Completed
36	16	2025-03-16	115.50	Shipped
37	17	2025-03-17	60.75	Cancelled
38	18	2025-03-18	299.99	Completed
39	19	2025-03-19	240.80	Shipped
40	20	2025-03-20	175.00	Completed*/

select * from payment;
.*41	21	Success	Credit Card	TXN1001
42	22	Pending	PayPal	TXN1002
43	23	Success	Debit Card	TXN1003
44	24	Failed	Credit Card	TXN1004
45	25	Success	PayPal	TXN1005
46	26	Success	Credit Card	TXN1006
47	27	Pending	Debit Card	TXN1007
48	28	Success	PayPal	TXN1008
49	29	Success	Credit Card	TXN1009
50	30	Success	Debit Card	TXN1010
51	31	Pending	PayPal	TXN1011
52	32	Success	Credit Card	TXN1012
53	33	Success	Debit Card	TXN1013
54	34	Pending	PayPal	TXN1014
55	35	Success	Credit Card	TXN1015
56	36	Success	Debit Card	TXN1016
57	37	Failed	Credit Card	TXN1017
58	38	Success	PayPal	TXN1018
59	39	Success	Debit Card	TXN1019
60	40	Success	Credit Card	TXN1020*/

select * from review;
/*56	5	85	2	Not happy with the concealer, too cakey
61	1	81	5	Amazing lipstick, long-lasting!
62	2	82	4	Great foundation, but a little dry for my skin
63	3	83	3	Average mascara, expected more volume
64	4	84	5	Loved the eyeshadow palette!
66	6	86	5	Best highlighter I’ve ever used!
67	7	87	4	Good quality nail polish
68	8	88	3	Lip balm is okay, but not very hydrating
69	9	89	5	Great BB cream!
70	10	90	1	Would not buy this primer again
71	11	91	5	Perfect setting spray!
72	12	92	3	Foundation oxidizes too much
73	13	93	4	Blush blends beautifully
74	14	94	5	My go-to bronzer!
75	15	95	2	Disappointed with the liquid eyeliner
76	16	96	4	Nice eyebrow pencil
77	17	97	3	Setting powder is just okay
78	18	98	5	Lip gloss is stunning!
79	19	99	4	Good buy for the price
80	20	100	5	Loved this eyeshadow stick!*/

select * from discount;
/*101	Spring Beauty Sale	10.00	2025-03-01	2025-03-10
102	Summer Glow Deal	15.00	2025-06-01	2025-06-15
103	Winter Skin Special	20.00	2025-12-01	2025-12-10
104	Black Friday Beauty	30.00	2025-11-25	2025-11-30
105	New Year Makeup Offer	25.00	2026-01-01	2026-01-05
106	Clearance Cosmetics	40.00	2025-09-15	2025-09-20
107	Cyber Monday Skincare	35.00	2025-11-28	2025-11-29
108	Holiday Glam Discount	15.00	2025-12-20	2025-12-25
109	Back to Beauty	10.00	2025-08-01	2025-08-10
110	Anniversary Makeup Sale	20.00	2025-07-01	2025-07-07
111	Easter Glam Deal	12.00	2025-04-10	2025-04-15
112	Thanksgiving Beauty Special	18.00	2025-11-20	2025-11-25
113	Valentine’s Lipstick Discount	14.00	2025-02-10	2025-02-14
114	Independence Day Makeup Sale	22.00	2025-07-04	2025-07-05
115	Weekend Beauty Deals	5.00	2025-05-01	2025-05-02
116	Mega Beauty Sale	50.00	2025-10-01	2025-10-07
117	Flash Skincare Sale	33.00	2025-06-15	2025-06-16
118	Diwali Makeup Offer	27.00	2025-10-20	2025-10-25
119	Halloween Special Effects Makeup	13.00	2025-10-31	2025-11-01
120	Loyalty Beauty Reward	8.00	2025-09-01	2025-09-30*/

select * from category;
/*121	Lipsticks	Matte, glossy, and liquid lipsticks
122	Foundations	Full coverage, lightweight, and skin tints
123	Mascara	Waterproof and volumizing mascaras
124	Eyeshadow	Palettes and singles in various finishes
125	Concealers	Cover imperfections and brighten skin
126	Highlighters	Glow-enhancing face products
127	Nail Polish	Long-lasting nail colors
128	Lip Balms	Hydrating and tinted lip balms
129	BB Cream	Lightweight all-in-one skin tints
130	Primers	Smooth skin and extend makeup wear
131	Setting Sprays	Lock in makeup for long wear
132	Blush	Powder, cream, and liquid blushes
133	Bronzers	Warm up and sculpt the face
134	Eyeliners	Pencil, gel, and liquid liners
135	Eyebrow Products	Brow pencils, gels, and pomades
136	Setting Powders	Loose and pressed powders for makeup
137	Lip Gloss	Shiny and hydrating lip glosses
138	Makeup Brushes	Essential brushes for application
139	Makeup Sponges	Blending and setting sponges
140	Skincare	Cleansers, moisturizers, and serums*/

select * from brand;
/*141	Maybelline	USA	Affordable and trendy cosmetics
142	MAC	Canada	High-end professional makeup brand
143	LOreal	France	Innovative beauty products
144	Estee Lauder	USA	Luxury skincare and makeup
145	Dior	France	Prestige cosmetics and fragrances
146	NYX	USA	Trendy and affordable makeup
147	Revlon	USA	Classic beauty and hair products
148	Fenty Beauty	USA	Inclusive beauty brand by Rihanna
149	Huda Beauty	UAE	High-quality beauty and makeup
150	Charlotte Tilbury	UK	Luxury makeup brand
151	Sephora Collection	France	Affordable beauty range by Sephora
152	Clinique	USA	Dermatologist-developed skincare and makeup
153	Urban Decay	USA	Bold and edgy cosmetics
154	Bobbi Brown	USA	Natural and elegant makeup
155	Too Faced	USA	Fun and playful makeup brand
156	CoverGirl	USA	Affordable drugstore cosmetics
157	Anastasia Beverly Hills	USA	Best known for brow products
158	Tarte	USA	Vegan and cruelty-free cosmetics
159	Morphe	USA	Makeup artist favorite brand
160	Pat McGrath Labs	USA	Luxury high-end cosmetics*/

select * from product;
/*81	SuperStay Matte Ink Lipstick	141	121	9.99	150	2026-06-01
82	Studio Fix Fluid Foundation	142	122	34.99	100	2026-08-15
83	Voluminous Lash Paradise Mascara	143	123	10.99	200	2026-05-10
84	Naked Eyeshadow Palette	144	124	49.99	80	2027-01-01
85	Radiant Creamy Concealer	145	125	29.99	120	2026-09-20
86	Killawatt Freestyle Highlighter	146	126	36.99	75	2027-04-05
87	Gel Envy Nail Polish	147	127	7.99	250	2026-07-12
88	Hydrating Lip Balm	148	128	5.99	300	2026-10-30
89	Dream BB Fresh Cream	149	129	8.99	180	2026-11-15
90	Pore Minimizing Primer	150	130	21.99	110	2026-12-01
91	All Nighter Setting Spray	151	131	32.99	95	2026-08-05
92	Amazonian Clay 12-Hour Blush	152	132	27.99	140	2027-03-18
93	Matte Bronzer	153	133	19.99	130	2026-06-25
94	Tattoo Liner	154	134	22.99	160	2026-05-22
95	Brow Wiz Eyebrow Pencil	155	135	23.99	90	2026-09-30
96	Loose Setting Powder	156	136	38.99	85	2026-07-08
97	Gloss Bomb Universal Lip Luminizer	157	137	24.99	120	2026-12-12
98	Essential Makeup Brush Set	158	138	49.99	60	2027-02-10
99	Beauty Blender Sponge	159	139	16.99	200	2026-04-15
100	Hydrating Face Serum	160	140	59.99	70	2027-05-30*/

select * from orderdetails;
/*161	21	81	2	19.98
162	22	82	1	34.99
163	23	83	3	32.97
164	24	84	1	49.99
165	25	85	2	59.98
166	26	86	1	36.99
167	27	87	4	31.96
168	28	88	2	11.98
169	29	89	1	8.99
170	30	90	2	43.98
171	31	91	1	32.99
172	32	92	1	27.99
173	33	93	2	39.98
174	34	94	1	22.99
175	35	95	3	71.97
176	36	96	1	38.99
177	37	97	2	49.98
178	38	98	1	49.99
179	39	99	2	33.98
180	40	100	1	59.99*/

select * from supplier;
/*181	Cosmetic Suppliers Inc.	mahesh	1234567890	mahesh23@cosmeticsuppliers.com	andhra pradesh
182	Glamour Distributors	indu	9876543210	indu@glamourdist.com	chennai
183	Luxury Beauty Supplies	sandy	5551234567	sandy24@luxurybeauty.com	hyderabad
184	Organic Glow	dhanush	4445556666	danush26@organicglow.com	hyderabaad
185	Elite Makeup	sony	6667778888	sony67@elitemakeup.com	tirupati
186	Radiant Skincare	lahari	7778889999	lahari79@radiantskincare.com	chennai
187	Pure Beauty	nikhila	3334445555	nikhila35@purebeauty.com	bengaluru
188	Vibrant Cosmetics	mohan	1112223333	mohan204@vibrantcosmetics.com	mysore
189	Nature Essence	tharun	9990001111	tharun24@natureessence.com	kolkata
190	Lush Looks	asif	5556667777	asif25@lushlooks.com	bihar
191	Everglow Cosmetics	khadar	7771234567	khadar756@everglow.com	jaipur
192	Trendsetters Makeup	vishnu	8882345678	vishnu278@trendsetters.com	west bengal
193	Chic Beauty Hub	neha	9993456789	neha96@chicbeautyhub.com	bihar
194	Glow Essence	chaitu	2224567890	chaitu25@glowessence.com	delhi
195	Luxe Skin Care	sai	3335678901	sai398@luxeskincare.com	gujarat
196	Timeless Beauty	saif	4446789012	saif251@timelessbeauty.com	maharastra
197	Royal Glow	hari prasad	5557890123	hariprasad24@royalglow.com	kerala
198	Elysian Cosmetics	pushpa	6668901234	pushpa356@elysiancosmetics.com	rajasthan
199	Natural Radiance	suresh	7779012345	suresh27@naturalradiance.com	gujarat
200	Beauty Haven	rakesh	8880123456	rakesh64@beautyhaven.com	tirupati*/

select * from purchase;
/*201	181	2025-01-15	1200.50
202	182	2025-02-10	850.75
203	183	2025-03-05	1450.00
204	184	2025-04-01	980.25
205	185	2025-05-12	1100.60
206	186	2025-06-20	1350.80
207	187	2025-07-18	920.40
208	188	2025-08-15	1195.30
209	189	2025-09-10	1300.25
210	190	2025-10-05	1120.90
211	191	2025-11-10	1250.60
212	192	2025-11-15	1400.75
213	193	2025-11-20	1550.40
214	194	2025-11-25	1350.30
215	195	2025-12-01	1125.80
216	196	2025-12-05	1480.95
217	197	2025-12-10	1290.50
218	198	2025-12-15	1510.65
219	199	2025-12-20	1175.90
220	200	2025-12-25	1600.45*/

select * from purchasedetails;
/*221	201	81	50	8.50
222	202	82	30	28.00
223	203	83	60	9.50
224	204	84	20	42.00
225	205	85	40	25.00
226	206	86	25	32.00
227	207	87	80	6.50
228	208	88	100	4.50
229	209	89	50	7.00
230	210	90	30	19.00
231	211	91	45	15.00
232	212	92	55	12.50
233	213	93	70	10.00
234	214	94	65	14.50
235	215	95	90	9.00
236	216	96	85	20.00
237	217	97	100	8.00
238	218	98	110	16.00
239	219	99	95	13.00
240	220	100	120	11.50*/

select * from sales;
/*241	21	2024-03-01	250.00
242	22	2024-03-02	150.50
243	23	2024-03-03	320.75
244	24	2024-03-04	290.00
245	25	2024-03-05	185.25
246	26	2024-03-06	410.60
247	27	2024-03-07	135.80
248	28	2024-03-08	505.90
249	29	2024-03-09	250.45
250	30	2024-03-10	399.99
251	31	2024-03-11	225.30
252	32	2024-03-12	140.00
253	33	2024-03-13	370.80
254	34	2024-03-14	280.50
255	35	2024-03-15	120.00
256	36	2024-03-16	430.25
257	37	2024-03-17	330.40
258	38	2024-03-18	510.75
259	39	2024-03-19	199.99
260	40	2024-03-20	275.60*/

select * from employee;
/*261	rajesh	rajesh974@cosmetics.com	1112223333	Store Manager	55000.00
262	leena	leena37@cosmetics.com	2223334444	Sales Associate	32000.00
263	deva	deva93@cosmetics.com	3334445555	Beauty Consultant	35000.00
264	niharika	niharika246@cosmetics.com	4445556666	Cashier	28000.00
265	pavan	pavan34@cosmetics.com	5556667777	Inventory Manager	48000.00
266	vasu	vasu876@cosmetics.com	6667778888	Sales Associate	31000.00
267	ramya	ramya86@cosmetics.com	7778839999	Marketing Specialist	45000.00
268	priya	priya987@cosmetics.com	8889990000	Product Manager	60000.00
269	ishu	ishu@cosmetics.com	9990001111	Customer Service Rep	30000.00
270	mani	mani@cosmetics.com	0001112222	Warehouse Staff	27000.00
271	sunitha	sunitha25@cosmetics.com	1112223334	Cashier	28500.00
272	rohan	rohan976@cosmetics.com	2223334445	Sales Associate	31500.00
273	yashmi	yashni7654@cosmetics.com	3334445556	Beauty Consultant	35500.00
274	rohit	rohit252@cosmetics.com	4445556667	Marketing Assistant	40000.00
275	preeti	preeti08@cosmetics.com	5556667778	Inventory Clerk	29000.00
276	prabhu	prabhu87@cosmetics.com	6667778889	Assistant Store Manager	50000.00
277	harini	harini0976@cosmetics.com	7778889990	Sales Lead	42000.00
278	swetha	swetha256@cosmetics.com	8889990001	Warehouse Staff	27500.00
279	sandeep	sandeep097@cosmetics.com	9990001112	Customer Support	32000.00
280	ganesh	ganesh974@cosmetics.com	0001112223	Retail Supervisor	47000.00*/

select * from inventory;
/*281	81	150	50	2024-03-01
282	82	120	30	2024-03-02
283	83	200	40	2024-03-03
284	84	80	25	2024-03-04
285	85	300	60	2024-03-05
286	86	175	45	2024-03-06
287	87	90	30	2024-03-07
288	88	250	50	2024-03-08
289	89	110	35	2024-03-09
290	90	95	25	2024-03-10
291	91	170	50	2024-03-11
292	92	130	30	2024-03-12
293	93	220	40	2024-03-13
294	94	60	20	2024-03-14
295	95	280	70	2024-03-15
296	96	190	45	2024-03-16
297	97	100	25	2024-03-17
298	98	230	50	2024-03-18
299	99	140	40	2024-03-19
300	100	85	30	2024-03-20*/





-- 1. Select customers with IDs greater than 10
SELECT * FROM CUSTOMER 
WHERE CustomerID > 10;
/*11	teja	teja34@gmail.com	1111111111	hyderabad
12	pavani	pavani267@gmail.com	2222222222	chittoor
13	thanuja	thanuja135@gmail.com	3333333333	kadiri
14	vinitha	vinitha4363@gmail.com	4444444444	nellore
15	raji	raji245@gmail.com	5555555555	kurnool
16	santhosh	santhosh234@gmail.com	6666666666	bangalore
17	prakash	prakash296@gmail.com	7777777777	mysore
18	Roshini	roshini34@gmail.com	8888888888	chennai
19	meghana	meghana4868@gmail.com	9999999999	amaravathi
20	nandini	nandini245@gmail.com	0000000000	tirupati*/

-- 2. Select payments with status 'Success'
SELECT * FROM PAYMENT 
WHERE PaymentStatus = 'Success';
/*41	21	Success	Credit Card	TXN1001
43	23	Success	Debit Card	TXN1003
45	25	Success	PayPal	TXN1005
46	26	Success	Credit Card	TXN1006
48	28	Success	PayPal	TXN1008
49	29	Success	Credit Card	TXN1009
50	30	Success	Debit Card	TXN1010
52	32	Success	Credit Card	TXN1012
53	33	Success	Debit Card	TXN1013
55	35	Success	Credit Card	TXN1015
56	36	Success	Debit Card	TXN1016
58	38	Success	PayPal	TXN1018
59	39	Success	Debit Card	TXN1019
60	40	Success	Credit Card	TXN1020*/

-- 3. Select discounts with percentage greater than 20
SELECT * FROM DISCOUNT 
WHERE DiscountPercentage > 20;
/*104	Black Friday Beauty	30.00	2025-11-25	2025-11-30
105	New Year Makeup Offer	25.00	2026-01-01	2026-01-05
106	Clearance Cosmetics	40.00	2025-09-15	2025-09-20
107	Cyber Monday Skincare	35.00	2025-11-28	2025-11-29
114	Independence Day Makeup Sale	22.00	2025-07-04	2025-07-05
116	Mega Beauty Sale	50.00	2025-10-01	2025-10-07
117	Flash Skincare Sale	33.00	2025-06-15	2025-06-16
118	Diwali Makeup Offer	27.00	2025-10-20	2025-10-25*/

-- 4. Select order details with quantity greater than 2
SELECT * FROM ORDERDETAILS 
WHERE Quantity > 2;
/*163	23	83	3	32.97
167	27	87	4	31.96
175	35	95	3	71.97*/

--5. Select purchases with total cost greater than 1500
SELECT * FROM PURCHASE 
WHERE TotalCost > 1500;/*213	193	2025-11-20	1550.40
218	198	2025-12-15	1510.65
220	200	2025-12-25	1600.45*/

-- 6. Select payments made by 'Credit Card'
SELECT * FROM PAYMENT 
WHERE PaymentMethod = 'Credit Card';
/*41	21	Success	Credit Card	TXN1001
44	24	Failed	Credit Card	TXN1004
46	26	Success	Credit Card	TXN1006
49	29	Success	Credit Card	TXN1009
52	32	Success	Credit Card	TXN1012
55	35	Success	Credit Card	TXN1015
57	37	Failed	Credit Card	TXN1017
60	40	Success	Credit Card	TXN1020*/

-- 7. Select discounts that start in '2025-03'
SELECT * FROM DISCOUNT 
WHERE StartDate LIKE '2025-03%';
/*101	Spring Beauty Sale	10.00	2025-03-01	2025-03-10*/

-- 8. Select employees with role 'Sales Associate'
SELECT * FROM EMPLOYEE 
WHERE Role = 'Sales Associate';
/*262	leena	leena37@cosmetics.com	2223334444	Sales Associate	32000.00
266	vasu	vasu876@cosmetics.com	6667778888	Sales Associate	31000.00
272	rohan	rohan976@cosmetics.com	2223334445	Sales Associate	31500.00*/


-- 9. Select inventory with stock level less than 100
SELECT * FROM INVENTORY 
WHERE StockLevel < 100;
/*284	84	80	25	2024-03-04
287	87	90	30	2024-03-07
290	90	95	25	2024-03-10
294	94	60	20	2024-03-14
300	100	85	30	2024-03-20*/

-- 10. Count the number of products
SELECT COUNT(*) 
FROM PRODUCT;
/*20*/

-- 11. Calculate the average product price
SELECT AVG(Price) 
FROM PRODUCT;
/*26.840000*/

-- 12. Calculate the total cost of purchases
SELECT SUM(TotalCost) 
FROM PURCHASE;
/*25206.05*/

-- 13. Find the minimum product price
SELECT MIN(Price) 
FROM PRODUCT;
/*5.99*/

-- 14. Find the maximum salary of employees
SELECT MAX(Salary) 
FROM EMPLOYEE;
/*60000.00*/

-- 15. Group products by brand and count them
SELECT BrandID, COUNT(*) 
FROM PRODUCT 
GROUP BY BrandID;
/*141	1
142	1
143	1
144	1
145	1
146	1
147	1
148	1
149	1
150	1
151	1
152	1
153	1
154	1
155	1
156	1
157	1
158	1
159	1
160	1*/

-- 16. Join CUSTOMER and ORDER_TABLE tables
SELECT * FROM CUSTOMER 
JOIN ORDER_TABLE ON CUSTOMER.CustomerID = ORDER_TABLE.CustomerID;
/*1	Ravi	ravi313@gmail.com	1234567890	Tirupati	21	1	2025-03-01	150.50	Completed
2	Rani	rani2766@gmail.com	2345678901	Tirupati	22	2	2025-03-02	200.00	Pending
3	banu	banu@gmail.com	3456789012	Bangalore	23	3	2025-03-03	99.99	Shipped
4	Charan	charan@gmail.com	4567890123	chittoor	24	4	2025-03-04	49.95	Cancelled
5	surya	surya427.com	5678901234	kurnool	25	5	2025-03-05	300.75	Completed
6	janu	janu527@gmail.com	6789012345	Hyderabad	26	6	2025-03-06	175.20	Shipped
7	veena	veena24@gmail.com	7890123456	Kadapa	27	7	2025-03-07	250.00	Pending
8	Devi	devi2786@gmail.com	8901234567	chennai	28	8	2025-03-08	120.50	Completed
9	Balu	balu2867@gmail.com	9012345678	nellore	29	9	2025-03-09	75.30	Shipped
10	krishna	krishna17897@gmail.com	0123456789	vizag	30	10	2025-03-10	190.00	Completed
11	teja	teja34@gmail.com	1111111111	hyderabad	31	11	2025-03-11	89.99	Pending
12	pavani	pavani267@gmail.com	2222222222	chittoor	32	12	2025-03-12	210.75	Completed
13	thanuja	thanuja135@gmail.com	3333333333	kadiri	33	13	2025-03-13	330.40	Shipped
14	vinitha	vinitha4363@gmail.com	4444444444	nellore	34	14	2025-03-14	99.90	Pending
15	raji	raji245@gmail.com	5555555555	kurnool	35	15	2025-03-15	410.60	Completed
16	santhosh	santhosh234@gmail.com	6666666666	bangalore	36	16	2025-03-16	115.50	Shipped
17	prakash	prakash296@gmail.com	7777777777	mysore	37	17	2025-03-17	60.75	Cancelled
18	Roshini	roshini34@gmail.com	8888888888	chennai	38	18	2025-03-18	299.99	Completed
19	meghana	meghana4868@gmail.com	9999999999	amaravathi	39	19	2025-03-19	240.80	Shipped
20	nandini	nandini245@gmail.com	0000000000	tirupati	40	20	2025-03-20	175.00	Completed*/

-- 17. Select customers whose names start with 'R'
SELECT * FROM CUSTOMER 
WHERE Name LIKE 'R%';
/*1	Ravi	ravi313@gmail.com	1234567890	Tirupati
2	Rani	rani2766@gmail.com	2345678901	Tirupati
15	raji	raji245@gmail.com	5555555555	kurnool
18	Roshini	roshini34@gmail.com	8888888888	chennai*/

-- 18. Select products whose names contain 'Lip'
SELECT * FROM PRODUCT 
WHERE Name LIKE '%Lip%';
/*81	SuperStay Matte Ink Lipstick	141	121	9.99	150	2026-06-01
88	Hydrating Lip Balm	148	128	5.99	300	2026-10-30
97	Gloss Bomb Universal Lip Luminizer	157	137	24.99	120	2026-12-12*/

-- 19. Select discounts that end in the last day of a month
SELECT * FROM DISCOUNT 
WHERE EndDate LIKE '%-31';
/*NO OUTPUT*/

-- 20. Order orders by order date in ascending order
SELECT * FROM ORDER_TABLE 
ORDER BY OrderDate ASC;
/*21	1	2025-03-01	150.50	Completed
22	2	2025-03-02	200.00	Pending
23	3	2025-03-03	99.99	Shipped
24	4	2025-03-04	49.95	Cancelled
25	5	2025-03-05	300.75	Completed
26	6	2025-03-06	175.20	Shipped
27	7	2025-03-07	250.00	Pending
28	8	2025-03-08	120.50	Completed
29	9	2025-03-09	75.30	Shipped
30	10	2025-03-10	190.00	Completed
31	11	2025-03-11	89.99	Pending
32	12	2025-03-12	210.75	Completed
33	13	2025-03-13	330.40	Shipped
34	14	2025-03-14	99.90	Pending
35	15	2025-03-15	410.60	Completed
36	16	2025-03-16	115.50	Shipped
37	17	2025-03-17	60.75	Cancelled
38	18	2025-03-18	299.99	Completed
39	19	2025-03-19	240.80	Shipped
40	20	2025-03-20	175.00	Completed*/

-- 21. Join ORDER_TABLE and ORDERDETAILS tables
SELECT * FROM ORDER_TABLE 
JOIN ORDERDETAILS ON ORDER_TABLE.OrderID = ORDERDETAILS.OrderID;
/*21	1	2025-03-01	150.50	Completed	161	21	81	2	19.98
22	2	2025-03-02	200.00	Pending	162	22	82	1	34.99
23	3	2025-03-03	99.99	Shipped	163	23	83	3	32.97
24	4	2025-03-04	49.95	Cancelled	164	24	84	1	49.99
25	5	2025-03-05	300.75	Completed	165	25	85	2	59.98
26	6	2025-03-06	175.20	Shipped	166	26	86	1	36.99
27	7	2025-03-07	250.00	Pending	167	27	87	4	31.96
28	8	2025-03-08	120.50	Completed	168	28	88	2	11.98
29	9	2025-03-09	75.30	Shipped	169	29	89	1	8.99
30	10	2025-03-10	190.00	Completed	170	30	90	2	43.98
31	11	2025-03-11	89.99	Pending	171	31	91	1	32.99
32	12	2025-03-12	210.75	Completed	172	32	92	1	27.99
33	13	2025-03-13	330.40	Shipped	173	33	93	2	39.98
34	14	2025-03-14	99.90	Pending	174	34	94	1	22.99
35	15	2025-03-15	410.60	Completed	175	35	95	3	71.97
36	16	2025-03-16	115.50	Shipped	176	36	96	1	38.99
37	17	2025-03-17	60.75	Cancelled	177	37	97	2	49.98
38	18	2025-03-18	299.99	Completed	178	38	98	1	49.99
39	19	2025-03-19	240.80	Shipped	179	39	99	2	33.98
40	20	2025-03-20	175.00	Completed	180	40	100	1	59.99*/

-- 22. Order customers by name alphabetically
SELECT CustomerID, Name, Email, Phone, Address 
FROM CUSTOMER 
ORDER BY Name ASC;
/*9	Balu	balu2867@gmail.com	9012345678	nellore
3	banu	banu@gmail.com	3456789012	Bangalore
4	Charan	charan@gmail.com	4567890123	chittoor
8	Devi	devi2786@gmail.com	8901234567	chennai
6	janu	janu527@gmail.com	6789012345	Hyderabad
10	krishna	krishna17897@gmail.com	0123456789	vizag
19	meghana	meghana4868@gmail.com	9999999999	amaravathi
20	nandini	nandini245@gmail.com	0000000000	tirupati
12	pavani	pavani267@gmail.com	2222222222	chittoor
17	prakash	prakash296@gmail.com	7777777777	mysore
15	raji	raji245@gmail.com	5555555555	kurnool
2	Rani	rani2766@gmail.com	2345678901	Tirupati
1	Ravi	ravi313@gmail.com	1234567890	Tirupati
18	Roshini	roshini34@gmail.com	8888888888	chennai
16	santhosh	santhosh234@gmail.com	6666666666	bangalore
5	surya	surya427.com	5678901234	kurnool
11	teja	teja34@gmail.com	1111111111	hyderabad
13	thanuja	thanuja135@gmail.com	3333333333	kadiri
7	veena	veena24@gmail.com	7890123456	Kadapa
14	vinitha	vinitha4363@gmail.com	4444444444	nellore*/

-- 23. Order payments by payment date in descending order
SELECT PaymentID, OrderID, PaymentStatus, PaymentMethod, TransactionID 
FROM PAYMENT 
ORDER BY PaymentID DESC;
/*60	40	Success	Credit Card	TXN1020
59	39	Success	Debit Card	TXN1019
58	38	Success	PayPal	TXN1018
57	37	Failed	Credit Card	TXN1017
56	36	Success	Debit Card	TXN1016
55	35	Success	Credit Card	TXN1015
54	34	Pending	PayPal	TXN1014
53	33	Success	Debit Card	TXN1013
52	32	Success	Credit Card	TXN1012
51	31	Pending	PayPal	TXN1011
50	30	Success	Debit Card	TXN1010
49	29	Success	Credit Card	TXN1009
48	28	Success	PayPal	TXN1008
47	27	Pending	Debit Card	TXN1007
46	26	Success	Credit Card	TXN1006
45	25	Success	PayPal	TXN1005
44	24	Failed	Credit Card	TXN1004
43	23	Success	Debit Card	TXN1003
42	22	Pending	PayPal	TXN1002
41	21	Success	Credit Card	TXN1001*/

-- 24. Get the average order total
SELECT AVG(TotalAmount)
FROM ORDER_TABLE;
/*182.293500*/

-- 25. Get the total revenue from sales
SELECT SUM(TotalRevenue) 
FROM SALES;
/*5782.83*/

-- 26. Get the total amount spent by each customer
SELECT CustomerID, SUM(TotalAmount) 
FROM ORDER_TABLE 
GROUP BY CustomerID;
/*1	150.50
2	200.00
3	99.99
4	49.95
5	300.75
6	175.20
7	250.00
8	120.50
9	75.30
10	190.00
11	89.99
12	210.75
13	330.40
14	99.90
15	410.60
16	115.50
17	60.75
18	299.99
19	240.80
20	175.00*/

-- 27. Get the number of orders with each status
SELECT Status, COUNT(*) 
FROM ORDER_TABLE 
GROUP BY Status;
/*Cancelled	2
Completed	8
Pending	4
Shipped	6*/

-- 28. Get products that will expire in 2026
SELECT ProductID, Name, ExpiryDate 
FROM PRODUCT 
WHERE ExpiryDate LIKE '2026%';
/*81	SuperStay Matte Ink Lipstick	2026-06-01
82	Studio Fix Fluid Foundation	2026-08-15
83	Voluminous Lash Paradise Mascara	2026-05-10
85	Radiant Creamy Concealer	2026-09-20
87	Gel Envy Nail Polish	2026-07-12
88	Hydrating Lip Balm	2026-10-30
89	Dream BB Fresh Cream	2026-11-15
90	Pore Minimizing Primer	2026-12-01
91	All Nighter Setting Spray	2026-08-05
93	Matte Bronzer	2026-06-25
94	Tattoo Liner	2026-05-22
95	Brow Wiz Eyebrow Pencil	2026-09-30
96	Loose Setting Powder	2026-07-08
97	Gloss Bomb Universal Lip Luminizer	2026-12-12
99	Beauty Blender Sponge	2026-04-15*/

-- 29. Get the names of customers who have placed orders
SELECT DISTINCT c.Name 
FROM CUSTOMER c 
JOIN ORDER_TABLE o ON c.CustomerID = o.CustomerID;
/*Balu
banu
Charan
Devi
janu
krishna
meghana
nandini
pavani
prakash
raji
Rani
Ravi
Roshini
santhosh
surya
teja
thanuja
veena
vinitha*/

-- 30. Get the order IDs and payment methods for successful payments
SELECT o.OrderID, p.PaymentMethod FROM ORDER_TABLE o 
JOIN PAYMENT p ON o.OrderID = p.OrderID 
WHERE p.PaymentStatus = 'Success';
/*21	Credit Card
23	Debit Card
25	PayPal
26	Credit Card
28	PayPal
29	Credit Card
30	Debit Card
32	Credit Card
33	Debit Card
35	Credit Card
36	Debit Card
38	PayPal
39	Debit Card
40	Credit Card*/

-- 31. Get the names of products reviewed with a rating of 5
SELECT p.Name FROM PRODUCT p 
JOIN REVIEW r ON p.ProductID = r.ProductID 
WHERE r.Rating = 5;
/*SuperStay Matte Ink Lipstick
Naked Eyeshadow Palette
Killawatt Freestyle Highlighter
Dream BB Fresh Cream
All Nighter Setting Spray
Tattoo Liner
Essential Makeup Brush Set
Hydrating Face Serum*/

-- 32. Get the names of suppliers who have supplied products
SELECT DISTINCT s.SupplierName 
FROM SUPPLIER s 
JOIN PURCHASE p ON s.SupplierID = p.SupplierID;
/*Beauty Haven
Chic Beauty Hub
Cosmetic Suppliers Inc.
Elite Makeup
Elysian Cosmetics
Everglow Cosmetics
Glamour Distributors
Glow Essence
Lush Looks
Luxe Skin Care
Luxury Beauty Supplies
Natural Radiance
Nature Essence
Organic Glow
Pure Beauty
Radiant Skincare
Royal Glow
Timeless Beauty
Trendsetters Makeup
Vibrant Cosmetics*/

-- 33. Get the order details for orders placed in March 2025
SELECT od.OrderDetailsID, od.OrderID, od.ProductID, od.Quantity, od.SubTotal 
FROM ORDERDETAILS od 
JOIN ORDER_TABLE o ON od.OrderID = o.OrderID 
WHERE o.OrderDate LIKE '2025-03%';
/*161	21	81	2	19.98
162	22	82	1	34.99
163	23	83	3	32.97
164	24	84	1	49.99
165	25	85	2	59.98
166	26	86	1	36.99
167	27	87	4	31.96
168	28	88	2	11.98
169	29	89	1	8.99
170	30	90	2	43.98
171	31	91	1	32.99
172	32	92	1	27.99
173	33	93	2	39.98
174	34	94	1	22.99
175	35	95	3	71.97
176	36	96	1	38.99
177	37	97	2	49.98
178	38	98	1	49.99
179	39	99	2	33.98
180	40	100	1	59.99*/

-- 34. Get the names of employees who are managers
SELECT Name FROM EMPLOYEE 
WHERE Role LIKE '%Manager%';
/*rajesh
pavan
priya
prabhu*/

-- 35. Get the names of products from the brand 'Maybelline'
SELECT p.Name FROM PRODUCT p 
JOIN BRAND b ON p.BrandID = b.BrandID 
WHERE b.BrandName = 'Maybelline';
/*SuperStay Matte Ink Lipstick*/

-- 36. Get the order IDs and total amounts for orders with a total amount greater than 200
SELECT OrderID, TotalAmount FROM ORDER_TABLE 
WHERE TotalAmount > 200;
/*25	300.75
27	250.00
32	210.75
33	330.40
35	410.60
38	299.99
39	240.80*/

-- 37. Get the product names and prices for products in the 'Lipsticks' category
SELECT p.Name, p.Price FROM PRODUCT p 
JOIN CATEGORY c ON p.CategoryID = c.CategoryID 
WHERE c.CategoryName = 'Lipsticks';
/*SuperStay Matte Ink Lipstick	9.99*/

-- 38. Get the purchase IDs and total costs for purchases made after '2025-06-01'
SELECT PurchaseID, TotalCost FROM PURCHASE 
WHERE PurchaseDate > '2025-06-01';
/*206	1350.80
207	920.40
208	1195.30
209	1300.25
210	1120.90
211	1250.60
212	1400.75
213	1550.40
214	1350.30
215	1125.80
216	1480.95
217	1290.50
218	1510.65
219	1175.90
220	1600.45*/

-- 39. Get the average rating for each product
SELECT ProductID, AVG(Rating) FROM REVIEW 
GROUP BY ProductID;
/*81	5
82	4
83	3
84	5
85	2
86	5
87	4
88	3
89	5
90	1
91	5
92	3
93	4
94	5
95	2
96	4
97	3
98	5
99	4
100	5*/

-- 40. Get the number of reviews for each customer
SELECT CustomerID, COUNT(*) FROM REVIEW 
GROUP BY CustomerID;
/*1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1*/

-- 41. Get the total quantity of each product sold
SELECT ProductID, SUM(Quantity) FROM ORDERDETAILS 
GROUP BY ProductID;
/*81	2
82	1
83	3
84	1
85	2
86	1
87	4
88	2
89	1
90	2
91	1
92	1
93	2
94	1
95	3
96	1
97	2
98	1
99	2
100	1*/

-- 42. Get the number of purchases from each supplier
SELECT SupplierID, COUNT(*) FROM PURCHASE 
GROUP BY SupplierID;
/*181	1
182	1
183	1
184	1
185	1
186	1
187	1
188	1
189	1
190	1
191	1
192	1
193	1
194	1
195	1
196	1
197	1
198	1
199	1
200	1*/

-- 43. Get the names of customers who have not placed any orders
SELECT Name FROM CUSTOMER 
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM ORDER_TABLE);
/*NO OUTPUT*/

-- 44. Get the names of suppliers who have made any purchases
SELECT SupplierName FROM SUPPLIER 
WHERE SupplierID IN (SELECT DISTINCT SupplierID FROM PURCHASE);
/*Cosmetic Suppliers Inc.
Glamour Distributors
Luxury Beauty Supplies
Organic Glow
Elite Makeup
Radiant Skincare
Pure Beauty
Vibrant Cosmetics
Nature Essence
Lush Looks
Everglow Cosmetics
Trendsetters Makeup
Chic Beauty Hub
Glow Essence
Luxe Skin Care
Timeless Beauty
Royal Glow
Elysian Cosmetics
Natural Radiance
Beauty Haven*/

-- 45. Get the order IDs and customer names for orders with status 'Completed'
SELECT o.OrderID, c.Name FROM ORDER_TABLE o 
JOIN CUSTOMER c ON o.CustomerID = c.CustomerID WHERE o.Status = 'Completed';
/*21	Ravi
25	surya
28	Devi
30	krishna
32	pavani
35	raji
38	Roshini
40	nandini*/

-- 46. Get the payment IDs and order IDs for payments made by 'PayPal'
SELECT PaymentID, OrderID FROM PAYMENT 
WHERE PaymentMethod = 'PayPal';
/*42	22
45	25
48	28
51	31
54	34
58	38*/

-- 47. Get the review IDs and customer names for reviews with rating 4 or 5
SELECT r.ReviewID, c.Name FROM REVIEW r 
JOIN CUSTOMER c ON r.CustomerID = c.CustomerID WHERE r.Rating >= 4;
/*61	Ravi
62	Rani
64	Charan
66	janu
67	veena
69	Balu
71	teja
73	thanuja
74	vinitha
76	santhosh
78	Roshini
79	meghana
80	nandini*/

-- 48. Get the discount names and discount percentages for discounts that start in '2025-03'
SELECT DiscountName, DiscountPercentage FROM DISCOUNT 
WHERE StartDate LIKE '2025-03%';
/*Spring Beauty Sale	10.00*/

-- 49. Get the product names and category names for products with price above 30
SELECT p.Name, c.CategoryName FROM PRODUCT p 
JOIN CATEGORY c ON p.CategoryID = c.CategoryID WHERE p.Price > 30;
/*Studio Fix Fluid Foundation	Foundations
Naked Eyeshadow Palette	Eyeshadow
Killawatt Freestyle Highlighter	Highlighters
All Nighter Setting Spray	Setting Sprays
Loose Setting Powder	Setting Powders
Essential Makeup Brush Set	Makeup Brushes
Hydrating Face Serum	Skincare*/

-- 50. Get the order details IDs and product names for order ID 25
SELECT od.OrderDetailsID, p.Name FROM ORDERDETAILS od 
JOIN PRODUCT p ON od.ProductID = p.ProductID WHERE od.OrderID = 25;
/*165	Radiant Creamy Concealer*/

-- 51. Get the purchase IDs and supplier names for purchases with total cost above 1000
SELECT p.PurchaseID, s.SupplierName FROM PURCHASE p 
JOIN SUPPLIER s ON p.SupplierID = s.SupplierID WHERE p.TotalCost > 1000;
/*201	Cosmetic Suppliers Inc.
203	Luxury Beauty Supplies
205	Elite Makeup
206	Radiant Skincare
208	Vibrant Cosmetics
209	Nature Essence
210	Lush Looks
211	Everglow Cosmetics
212	Trendsetters Makeup
213	Chic Beauty Hub
214	Glow Essence
215	Luxe Skin Care
216	Timeless Beauty
217	Royal Glow
218	Elysian Cosmetics
219	Natural Radiance
220	Beauty Haven*/

-- 52. Get the sales IDs and employee names for sales made on '2024-03-05'
SELECT s.SalesID, e.Name FROM SALES s 
JOIN ORDER_TABLE o ON s.OrderID = o.OrderID JOIN CUSTOMER c ON o.CustomerID = c.CustomerID JOIN EMPLOYEE e ON c.CustomerID = e.EmployeeID WHERE s.SalesDate = '2024-03-05';
/*NO OUTPUT*/

-- 53. Get the inventory IDs and product names for products with reorder level above 40
SELECT i.InventoryID, p.Name FROM INVENTORY i 
JOIN PRODUCT p ON i.ProductID = p.ProductID 
WHERE i.ReorderLevel > 40;
/*281	SuperStay Matte Ink Lipstick
285	Radiant Creamy Concealer
286	Killawatt Freestyle Highlighter
288	Hydrating Lip Balm
291	All Nighter Setting Spray
295	Brow Wiz Eyebrow Pencil
296	Loose Setting Powder
298	Essential Makeup Brush Set*/

-- 54. Get the average price of products in each category
SELECT c.CategoryName, AVG(p.Price) FROM PRODUCT p 
JOIN CATEGORY c ON p.CategoryID = c.CategoryID 
GROUP BY c.CategoryName;
/*BB Cream	8.990000
Blush	27.990000
Bronzers	19.990000
Concealers	29.990000
Eyebrow Products	23.990000
Eyeliners	22.990000
Eyeshadow	49.990000
Foundations	34.990000
Highlighters	36.990000
Lip Balms	5.990000
Lip Gloss	24.990000
Lipsticks	9.990000
Makeup Brushes	49.990000
Makeup Sponges	16.990000
Mascara	10.990000
Nail Polish	7.990000
Primers	21.990000
Setting Powders	38.990000
Setting Sprays	32.990000
Skincare	59.990000*/

-- 55. Get the average discount percentage.
SELECT AVG(DiscountPercentage) FROM DISCOUNT;
/*21.100000*/

-- 56. Get the average total amount of orders placed by customer ID 1.
SELECT AVG(TotalAmount) FROM ORDER_TABLE 
WHERE CustomerID = 1;
/*150.500000*/

-- 57. Get the average rating of reviews for product ID 81.
SELECT AVG(Rating) FROM REVIEW
WHERE ProductID = 81;
/*5*/

-- 58. Get the average cost price of products purchased from supplier ID 181.
SELECT AVG(CostPrice) FROM PURCHASEDETAILS 
WHERE PurchaseID IN (SELECT PurchaseID FROM PURCHASE WHERE SupplierID = 181);
/*150.500000*/

-- 59. Get the average price of products from each brand.
SELECT b.BrandName, AVG(p.Price) FROM PRODUCT p 
JOIN BRAND b ON p.BrandID = b.BrandID 
GROUP BY b.BrandName;
/*Anastasia Beverly Hills	24.990000
Bobbi Brown	22.990000
Charlotte Tilbury	21.990000
Clinique	27.990000
CoverGirl	38.990000
Dior	29.990000
Estee Lauder	49.990000
Fenty Beauty	5.990000
Huda Beauty	8.990000
LOreal	10.990000
MAC	34.990000
Maybelline	9.990000
Morphe	16.990000
NYX	36.990000
Pat McGrath Labs	59.990000
Revlon	7.990000
Sephora Collection	32.990000
Tarte	49.990000
Too Faced	23.990000
Urban Decay	19.990000*/

-- 60. Get the average cost price of products purchased from each supplier.
SELECT s.SupplierName, AVG(pd.CostPrice) FROM PURCHASEDETAILS pd 
JOIN PURCHASE p ON pd.PurchaseID = p.PurchaseID JOIN SUPPLIER s ON p.SupplierID = s.SupplierID 
GROUP BY s.SupplierName;
/*Beauty Haven	11.500000
Chic Beauty Hub	10.000000
Cosmetic Suppliers Inc.	8.500000
Elite Makeup	25.000000
Elysian Cosmetics	16.000000
Everglow Cosmetics	15.000000
Glamour Distributors	28.000000
Glow Essence	14.500000
Lush Looks	19.000000
Luxe Skin Care	9.000000
Luxury Beauty Supplies	9.500000
Natural Radiance	13.000000
Nature Essence	7.000000
Organic Glow	42.000000
Pure Beauty	6.500000
Radiant Skincare	32.000000
Royal Glow	8.000000
Timeless Beauty	20.000000
Trendsetters Makeup	12.500000
Vibrant Cosmetics	4.500000*/

-- 61. Get the average rating of reviews with comments containing 'Amazing'.
SELECT AVG(Rating) FROM REVIEW 
WHERE Comment LIKE '%Amazing%';
/*5*/

-- 62. Get the average total revenue of sales made by employees with salary below 35000.
SELECT AVG(TotalRevenue) FROM SALES 
WHERE OrderID IN (SELECT OrderID FROM ORDER_TABLE WHERE CustomerID IN (SELECT CustomerID FROM EMPLOYEE WHERE Salary < 35000));
/*289.141500*/

-- 63. Get the average price of products that are not in the inventory.
SELECT AVG(Price) FROM PRODUCT 
WHERE ProductID NOT IN (SELECT ProductID FROM INVENTORY);
/*NULL*/

-- 64. Get the average total amount of orders that have not been paid.
SELECT AVG(TotalAmount) FROM ORDER_TABLE 
WHERE OrderID NOT IN (SELECT OrderID FROM PAYMENT);
/*NULL*/

-- 65. Get the average rating of reviews that have no comments.
SELECT AVG(Rating) FROM REVIEW 
WHERE Comment IS NULL;
/*NULL*/

-- 66. Get the average total revenue of sales made by employees who have not sold any products.
SELECT AVG(TotalRevenue) FROM SALES 
WHERE OrderID IN (SELECT OrderID FROM ORDER_TABLE 
WHERE CustomerID IN (SELECT CustomerID FROM EMPLOYEE 
WHERE EmployeeID NOT IN (SELECT c.CustomerID FROM ORDER_TABLE o JOIN CUSTOMER c ON o.CustomerID = c.CustomerID)));
/*289.141500*/

-- 67. Find the customer who placed the order with the highest total amount.
SELECT c.Name
FROM CUSTOMER c
JOIN ORDER_TABLE o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount = (SELECT MAX(TotalAmount) FROM ORDER_TABLE);
/*raji*/

-- 68. List all customers who have placed orders but have not made any payments.
SELECT c.Name
FROM CUSTOMER c
JOIN ORDER_TABLE o ON c.CustomerID = o.CustomerID
WHERE o.OrderID NOT IN (SELECT OrderID FROM PAYMENT);
/*NO OUTPUT*/

-- 69. List all brands that have products with stock quantity below 50.
SELECT b.BrandName
FROM BRAND b
JOIN PRODUCT p ON b.BrandID = p.BrandID
JOIN INVENTORY i ON p.ProductID = i.ProductID
WHERE i.StockLevel < 50;
/*NO OUTPUT*/

-- 70. List all orders that have associated payments but have not been marked as 'Completed'.
SELECT o.OrderID
FROM ORDER_TABLE o
JOIN PAYMENT p ON o.OrderID = p.OrderID
WHERE o.Status != 'Completed';
/*22
23
24
26
27
29
31
33
34
36
37
39*/

-- 71. Find products that have a price higher than the average price of their category.
SELECT p.Name, p.Price, cat.CategoryName
FROM PRODUCT p
JOIN CATEGORY cat ON p.CategoryID = cat.CategoryID
WHERE p.Price > (SELECT AVG(Price) FROM PRODUCT WHERE CategoryID = p.CategoryID);
/* NO OUTPUT*/

--73. Find max price in category
SELECT CategoryID, MAX(Price) AS MaxPrice 
FROM PRODUCT 
GROUP BY CategoryID;
/*121	9.99
122	34.99
123	10.99
124	49.99
125	29.99
126	36.99
127	7.99
128	5.99
129	8.99
130	21.99
131	32.99
132	27.99
133	19.99
134	22.99
135	23.99
136	38.99
137	24.99
138	49.99
139	16.99
140	59.99*/

--74
SELECT MONTH(OrderDate) AS Month, COUNT(OrderID) AS OrderCount 
FROM ORDER_TABLE 
GROUP BY MONTH(OrderDate);
/*3	20*/

--75
SELECT * FROM EMPLOYEE 
WHERE Salary > (SELECT AVG(Salary) FROM EMPLOYEE);
/*261	rajesh	rajesh974@cosmetics.com	1112223333	Store Manager	55000.00
265	pavan	pavan34@cosmetics.com	5556667777	Inventory Manager	48000.00
267	ramya	ramya86@cosmetics.com	7778839999	Marketing Specialist	45000.00
268	priya	priya987@cosmetics.com	8889990000	Product Manager	60000.00
274	rohit	rohit252@cosmetics.com	4445556667	Marketing Assistant	40000.00
276	prabhu	prabhu87@cosmetics.com	6667778889	Assistant Store Manager	50000.00
277	harini	harini0976@cosmetics.com	7778889990	Sales Lead	42000.00
280	ganesh	ganesh974@cosmetics.com	0001112223	Retail Supervisor	47000.00*/

--76
SELECT OrderDate, SUM(TotalAmount) OVER (ORDER BY OrderDate) AS RunningTotal 
FROM ORDER_TABLE;
/*2025-03-01	150.50
2025-03-02	350.50
2025-03-03	450.49
2025-03-04	500.44
2025-03-05	801.19
2025-03-06	976.39
2025-03-07	1226.39
2025-03-08	1346.89
2025-03-09	1422.19
2025-03-10	1612.19
2025-03-11	1702.18
2025-03-12	1912.93
2025-03-13	2243.33
2025-03-14	2343.23
2025-03-15	2753.83
2025-03-16	2869.33
2025-03-17	2930.08
2025-03-18	3230.07
2025-03-19	3470.87
2025-03-20	3645.87*/

--77
SELECT COUNT(DISTINCT ProductID) AS UniqueProductsSold FROM ORDERDETAILS;
/*20*/

--78
SELECT CustomerID, TotalAmount, 
       CASE WHEN TotalAmount > 1000 THEN TotalAmount * 0.9 ELSE TotalAmount END AS DiscountedAmount
FROM ORDER_TABLE;
/*1	150.50	150.500
2	200.00	200.000
3	99.99	99.990
4	49.95	49.950
5	300.75	300.750
6	175.20	175.200
7	250.00	250.000
8	120.50	120.500
9	75.30	75.300
10	190.00	190.000
11	89.99	89.990
12	210.75	210.750
13	330.40	330.400
14	99.90	99.900
15	410.60	410.600
16	115.50	115.500
17	60.75	60.750
18	299.99	299.990
19	240.80	240.800
20	175.00	175.000*/

--79
SELECT DISTINCT CustomerID 
FROM ORDER_TABLE 
WHERE Status = 'Pending';
/*2
7
11
14*/

--80
SELECT P.Name, I.StockLevel, I.ReorderLevel  
FROM INVENTORY I  
JOIN PRODUCT P ON I.ProductID = P.ProductID;
/*SuperStay Matte Ink Lipstick	150	50
Studio Fix Fluid Foundation	120	30
Voluminous Lash Paradise Mascara	200	40
Naked Eyeshadow Palette	80	25
Radiant Creamy Concealer	300	60
Killawatt Freestyle Highlighter	175	45
Gel Envy Nail Polish	90	30
Hydrating Lip Balm	250	50
Dream BB Fresh Cream	110	35
Pore Minimizing Primer	95	25
All Nighter Setting Spray	170	50
Amazonian Clay 12-Hour Blush	130	30
Matte Bronzer	220	40
Tattoo Liner	60	20
Brow Wiz Eyebrow Pencil	280	70
Loose Setting Powder	190	45
Gloss Bomb Universal Lip Luminizer	100	25
Essential Makeup Brush Set	230	50
Beauty Blender Sponge	140	40
Hydrating Face Serum	85	30*/

-- 81. Update the price of product with ID 101 to $25.
UPDATE PRODUCT SET Price = 25 WHERE ProductID = 101;

-- 82. Change the address of customer with ID 1 to 'New Address'.
UPDATE CUSTOMER SET Address = 'New Address' WHERE CustomerID = 1;

-- 83. Change the status of order with ID 21 to 'Shipped'.
UPDATE ORDER_TABLE SET Status = 'Shipped' WHERE OrderID = 21;

-- 84. Delete the product with ID 101.
DELETE FROM PRODUCT WHERE ProductID = 101;

-- 85. Count the number of products in the PRODUCT table.
SELECT COUNT(*) FROM PRODUCT;
/*20*/

-- 86. Sum the total amount of all orders in the ORDER_TABLE.
SELECT SUM(TotalAmount) FROM ORDER_TABLE;
/*3645.87*/

-- 87. Delete all reviews with a rating of 1.
DELETE FROM REVIEW WHERE Rating = 1;

-- 89. Sum the quantities of products purchased from suppliers with names containing 'Cosmetic'.
SELECT SUM(Quantity) FROM PURCHASEDETAILS 
WHERE PurchaseID IN (SELECT PurchaseID FROM PURCHASE 
WHERE SupplierID IN (SELECT SupplierID FROM SUPPLIER WHERE SupplierName LIKE '%Cosmetic%'));
/*305*/

-- 90. List customer names and the order IDs they placed.
SELECT c.Name, o.OrderID
FROM CUSTOMER c
JOIN ORDER_TABLE o ON c.CustomerID = o.CustomerID;
/*Ravi	21
Rani	22
banu	23
Charan	24
surya	25
janu	26
veena	27
Devi	28
Balu	29
krishna	30
teja	31
pavani	32
thanuja	33
vinitha	34
raji	35
santhosh	36
prakash	37
Roshini	38
meghana	39
nandini	40*/

-- 91. List order IDs and the payment methods used.
SELECT o.OrderID, p.PaymentMethod
FROM ORDER_TABLE o
JOIN PAYMENT p ON o.OrderID = p.OrderID;
/*21	Credit Card
22	PayPal
23	Debit Card
24	Credit Card
25	PayPal
26	Credit Card
27	Debit Card
28	PayPal
29	Credit Card
30	Debit Card
31	PayPal
32	Credit Card
33	Debit Card
34	PayPal
35	Credit Card
36	Debit Card
37	Credit Card
38	PayPal
39	Debit Card
40	Credit Card*/


-- 92. List review IDs and the names of the products reviewed.
SELECT r.ReviewID, p.Name
FROM REVIEW r
JOIN PRODUCT p ON r.ProductID = p.ProductID;
/*56	Radiant Creamy Concealer
61	SuperStay Matte Ink Lipstick
62	Studio Fix Fluid Foundation
63	Voluminous Lash Paradise Mascara
64	Naked Eyeshadow Palette
66	Killawatt Freestyle Highlighter
67	Gel Envy Nail Polish
68	Hydrating Lip Balm
69	Dream BB Fresh Cream
71	All Nighter Setting Spray
72	Amazonian Clay 12-Hour Blush
73	Matte Bronzer
74	Tattoo Liner
75	Wiz Eyebrow Pencil
76	Loose Setting Powder
77	Gloss Bomb Universal Lip Luminizer
78	Essential Makeup Brush Set
79	Beauty Blender Sponge
80	Hydrating Face Serum*/

-- 93. List product names and their stock levels.
SELECT p.Name, i.StockLevel
FROM PRODUCT p
JOIN INVENTORY i ON p.ProductID = i.ProductID;
/*SuperStay Matte Ink Lipstick	150
Studio Fix Fluid Foundation	120
Voluminous Lash Paradise Mascara	200
Naked Eyeshadow Palette	80
Radiant Creamy Concealer	300
Killawatt Freestyle Highlighter	175
Gel Envy Nail Polish	90
Hydrating Lip Balm	250
Dream BB Fresh Cream	110
Pore Minimizing Primer	95
All Nighter Setting Spray	170
Amazonian Clay 12-Hour Blush	130
Matte Bronzer	220
Tattoo Liner	60
Brow Wiz Eyebrow Pencil	280
Loose Setting Powder	190
Gloss Bomb Universal Lip Luminizer	100
Essential Makeup Brush Set	230
Beauty Blender Sponge	140
Hydrating Face Serum	85*/

-- 94. List discount IDs and the end dates.
SELECT d.DiscountID, d.EndDate
FROM DISCOUNT d;
/*101	2025-03-10
102	2025-06-15
103	2025-12-10
104	2025-11-30
105	2026-01-05
106	2025-09-20
107	2025-11-29
108	2025-12-25
109	2025-08-10
110	2025-07-07
111	2025-04-15
112	2025-11-25
113	2025-02-14
114	2025-07-05
115	2025-05-02
116	2025-10-07
117	2025-06-16
118	2025-10-25
119	2025-11-01
120	2025-09-30*/

-- 95. List order IDs and the order dates.
SELECT o.OrderID, o.OrderDate
FROM ORDER_TABLE o;
/*21	2025-03-01
22	2025-03-02
23	2025-03-03
24	2025-03-04
25	2025-03-05
26	2025-03-06
27	2025-03-07
28	2025-03-08
29	2025-03-09
30	2025-03-10
31	2025-03-11
32	2025-03-12
33	2025-03-13
34	2025-03-14
35	2025-03-15
36	2025-03-16
37	2025-03-17
38	2025-03-18
39	2025-03-19
40	2025-03-20*/

-- 96. List all products that have never been ordered.
SELECT p.Name
FROM PRODUCT p
LEFT JOIN ORDERDETAILS od ON p.ProductID = od.ProductID
WHERE od.ProductID IS NULL;
/*NO OUTPUT*/

-- 97. Update the price of products in the 'Lipsticks' category to be 10% higher.
UPDATE PRODUCT
SET Price = Price * 1.10
WHERE CategoryID = (SELECT CategoryID FROM CATEGORY WHERE CategoryName = 'Lipsticks');

-- 98. Delete all customers who have not placed any orders.
DELETE FROM CUSTOMER
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM ORDER_TABLE);

-- 99. Show the total number of payments made by each payment method.
SELECT PaymentMethod, COUNT(*) AS PaymentCount
FROM PAYMENT
GROUP BY PaymentMethod;
/*Credit Card	8
Debit Card	6
PayPal	6*/

-- 100. List discount names and percentages, only for discounts greater than 10%.
SELECT DiscountName, DiscountPercentage FROM DISCOUNT 
WHERE DiscountPercentage > 10;
/*Summer Glow Deal	15.00
Winter Skin Special	20.00
Black Friday Beauty	30.00
New Year Makeup Offer	25.00
Clearance Cosmetics	40.00
Cyber Monday Skincare	35.00
Holiday Glam Discount	15.00
Anniversary Makeup Sale	20.00
Easter Glam Deal	12.00
Thanksgiving Beauty Special	18.00
Valentine’s Lipstick Discount	14.00
Independence Day Makeup Sale	22.00
Mega Beauty Sale	50.00
Flash Skincare Sale	33.00
Diwali Makeup Offer	27.00
Halloween Special Effects Makeup	13.00*/

-- 101. List brand names and countries, only for brands from 'USA'.
SELECT BrandName, Country FROM BRAND WHERE Country = 'USA';
/*Maybelline	USA
Estee Lauder	USA
NYX	USA
Revlon	USA
Fenty Beauty	USA
Clinique	USA
Urban Decay	USA
Bobbi Brown	USA
Too Faced	USA
CoverGirl	USA
Anastasia Beverly Hills	USA
Tarte	USA
Morphe	USA
Pat McGrath Labs	USA*/

-- 102. List supplier names and contact names, only for suppliers with contact names starting with 'A'.
SELECT SupplierName, ContactName FROM SUPPLIER 
WHERE ContactName LIKE 'A%';
/*Lush Looks	asif*/

-- 103. List payment IDs and transaction IDs, only for payments with transaction IDs starting with 'T'.
SELECT PaymentID, TransactionID FROM PAYMENT 
WHERE TransactionID LIKE 'T%';
/*41	TXN1001
42	TXN1002
43	TXN1003
44	TXN1004
45	TXN1005
46	TXN1006
47	TXN1007
48	TXN1008
49	TXN1009
50	TXN1010
51	TXN1011
52	TXN1012
53	TXN1013
54	TXN1014
55	TXN1015
56	TXN1016
57	TXN1017
58	TXN1018
59	TXN1019
60	TXN1020*/

-- 104. List order detail IDs and product IDs, only for order detail IDs greater than 60.
SELECT OrderDetailsID, ProductID FROM ORDERDETAILS 
WHERE OrderDetailsID > 60;
/*161	81
162	82
163	83
164	84
165	85
166	86
167	87
168	88
169	89
170	90
171	91
172	92
173	93
174	94
175	95
176	96
177	97
178	98
179	99
180	100*/

-- 105. List purchase IDs and supplier IDs, only for purchases from supplier ID 181.
SELECT PurchaseID, SupplierID FROM PURCHASE 
WHERE SupplierID = 181;
/*201	181*/

-- 106. List discount IDs and discount percentages, only for discounts with percentages greater than 15.
SELECT DiscountID, DiscountPercentage FROM DISCOUNT 
WHERE DiscountPercentage > 15;
/*103	20.00
104	30.00
105	25.00
106	40.00
107	35.00
110	20.00
112	18.00
114	22.00
116	50.00
117	33.00
118	27.00*/

-- 107. List order detail IDs and quantities, only for order details with quantities greater than 2.
SELECT OrderDetailsID, Quantity FROM ORDERDETAILS WHERE Quantity > 2;
/*163	3
167	4
175	3*/

-- 108. Select the names of all products that have a stock level below 50.
SELECT Name
FROM PRODUCT
WHERE ProductID IN (SELECT ProductID FROM INVENTORY WHERE StockLevel < 50);
/*NO OUTPUT*/

-- 109. Select the names and phone numbers of all customers whose phone numbers start with '9'.
SELECT Name, Phone
FROM CUSTOMER
WHERE Phone LIKE '9%';
/*Balu	9012345678
meghana	9999999999*/

-- 110. Select the payment IDs and transaction IDs of all payments with transaction IDs starting with 'T'.
SELECT PaymentID, TransactionID
FROM PAYMENT
WHERE TransactionID LIKE 'T%';
/*41	TXN1001
42	TXN1002
43	TXN1003
44	TXN1004
45	TXN1005
46	TXN1006
47	TXN1007
48	TXN1008
49	TXN1009
50	TXN1010
51	TXN1011
52	TXN1012
53	TXN1013
54	TXN1014
55	TXN1015
56	TXN1016
57	TXN1017
58	TXN1018
59	TXN1019
60	TXN1020*/


-- 111. Select the review IDs and customer IDs of all reviews written by customer ID 2.
SELECT ReviewID, CustomerID
FROM REVIEW
WHERE CustomerID = 2;
/*862	2*/

-- 112. Select the inventory IDs and product IDs of all inventory items with IDs greater than 280.
SELECT InventoryID, ProductID
FROM INVENTORY
WHERE InventoryID > 280;
/*281	81
282	82
283	83
284	84
285	85
286	86
287	87
288	88
289	89
290	90
291	91
292	92
293	93
294	94
295	95
296	96
297	97
298	98
299	99
300	100*/

-- 113. Select the names and addresses of all customers with addresses containing 'Tirupati'.
SELECT Name, Address
FROM CUSTOMER
WHERE Address LIKE '%Tirupati%';
/*Rani	Tirupati
nandini	tirupati*/

-- 114. Select the payment IDs and order IDs of all payments with order IDs greater than 20.
SELECT PaymentID, OrderID
FROM PAYMENT
WHERE OrderID > 20;
/*41	21
42	22
43	23
44	24
45	25
46	26
47	27
48	28
49	29
50	30
51	31
52	32
53	33
54	34
55	35
56	36
57	37
58	38
59	39
60	40*/

-- 115. Select the names of customers who have placed orders.
SELECT Name FROM CUSTOMER 
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM ORDER_TABLE);
/*Ravi
Rani
banu
Charan
surya
janu
veena
Devi
Balu
krishna
teja
pavani
thanuja
vinitha
raji
santhosh
prakash
Roshini
meghana
nandini*/

-- 116. Select the order IDs of orders that have payments with 'Credit Card'.
SELECT OrderID FROM ORDER_TABLE 
WHERE OrderID IN (SELECT OrderID FROM PAYMENT WHERE PaymentMethod = 'Credit Card');
/*21
24
26
29
32
35
37
40*/

-- 117. Select the review IDs of reviews for products with a rating of 5.
SELECT ReviewID FROM REVIEW 
WHERE ProductID IN (SELECT ProductID FROM REVIEW WHERE Rating = 5);
/*61
64
66
69
71
74
78
80*/

-- 118. Select the names of customers who have placed orders for products supplied by 'Supplier A'.
SELECT Name
FROM CUSTOMER
WHERE CustomerID IN (SELECT CustomerID FROM ORDER_TABLE 
WHERE OrderID IN (SELECT OrderID FROM ORDERDETAILS WHERE ProductID IN (SELECT ProductID FROM PURCHASEDETAILS WHERE PurchaseID IN (SELECT PurchaseID FROM PURCHASE WHERE SupplierID = (SELECT SupplierID FROM SUPPLIER WHERE SupplierName = 'Supplier A')))));
/*NO OUTPUT*/

-- 119. Select the order IDs of orders that include products with stock levels below 50.
SELECT OrderID
FROM ORDER_TABLE
WHERE OrderID IN (SELECT OrderID FROM ORDERDETAILS 
WHERE ProductID IN (SELECT ProductID FROM INVENTORY WHERE StockLevel < 50));
/*NO OUTPUT*/

-- 120. Select all distinct brand names from the BRAND table.
SELECT DISTINCT BrandName FROM BRAND;
/*Anastasia Beverly Hills
Bobbi Brown
Charlotte Tilbury
Clinique
CoverGirl
Dior
Estee Lauder
Fenty Beauty
Huda Beauty
LOreal
MAC
Maybelline
Morphe
NYX
Pat McGrath Labs
Revlon
Sephora Collection
Tarte
Too Faced
Urban Decay*/

-- 121. Select the maximum price of any product.
SELECT MAX(Price) FROM PRODUCT;
/*59.99*/

-- 122. Select product names and the expiry dates.
SELECT p.Name, p.ExpiryDate
FROM PRODUCT p;
/*SuperStay Matte Ink Lipstick	2026-06-01
Studio Fix Fluid Foundation	2026-08-15
Voluminous Lash Paradise Mascara	2026-05-10
Naked Eyeshadow Palette	2027-01-01
Radiant Creamy Concealer	2026-09-20
Killawatt Freestyle Highlighter	2027-04-05
Gel Envy Nail Polish	2026-07-12
Hydrating Lip Balm	2026-10-30
Dream BB Fresh Cream	2026-11-15
Pore Minimizing Primer	2026-12-01
All Nighter Setting Spray	2026-08-05
Amazonian Clay 12-Hour Blush	2027-03-18
Matte Bronzer	2026-06-25
Tattoo Liner	2026-05-22
Brow Wiz Eyebrow Pencil	2026-09-30
Loose Setting Powder	2026-07-08
Gloss Bomb Universal Lip Luminizer	2026-12-12
Essential Makeup Brush Set	2027-02-10
Beauty Blender Sponge	2026-04-15
Hydrating Face Serum	2027-05-30*/

-- 123. Select category names and descriptions, only for categories with descriptions containing 'Makeup'.
SELECT CategoryName, Description FROM CATEGORY
WHERE Description LIKE '%Makeup%';
/*Primers	Smooth skin and extend makeup wear
Setting Sprays	Lock in makeup for long wear
Setting Powders	Loose and pressed powders for makeup*/

-- 124. Select discount names and start dates, only for discounts starting in 2024.
SELECT DiscountName, StartDate FROM DISCOUNT 
WHERE StartDate LIKE '2024%';
/* NO OUTPUT*/

-- 125. Select discount IDs and discount percentages, only for discounts with percentages greater than 15.
SELECT DiscountID, DiscountPercentage 
FROM DISCOUNT WHERE DiscountPercentage > 15;
/*103	20.00
104	30.00
105	25.00
106	40.00
107	35.00
110	20.00
112	18.00
114	22.00
116	50.00
117	33.00
118	27.00*/

-- 126. Sum the stock levels of all products in the INVENTORY table.
SELECT SUM(StockLevel) 
FROM INVENTORY;
/*3175*/

-- 127. Count the distinct supplier IDs in the PURCHASE table.
SELECT COUNT(DISTINCT SupplierID) 
FROM PURCHASE;
/*20*/

-- 128. Count the distinct category IDs that have products with prices above $30.
SELECT COUNT(DISTINCT CategoryID) 
FROM PRODUCT 
WHERE Price > 30;
/*7*/

-- 129. Count the distinct order IDs that have been reviewed.
SELECT COUNT(DISTINCT OrderID) FROM ORDERDETAILS 
WHERE ProductID IN (SELECT ProductID FROM REVIEW);
/*19*/

SQL

-- 130. Sum the quantities of products purchased from supplier ID 181.
SELECT SUM(Quantity) FROM PURCHASEDETAILS 
WHERE PurchaseID IN (SELECT PurchaseID FROM PURCHASE WHERE SupplierID = 181);
/*50*/

-- 131. Count the distinct customer IDs that have placed orders for products from the 'Maybelline' brand.
SELECT COUNT(DISTINCT CustomerID) FROM ORDER_TABLE 
WHERE OrderID IN (SELECT OrderID FROM ORDERDETAILS 
WHERE ProductID IN (SELECT ProductID FROM PRODUCT 
WHERE BrandID = (SELECT BrandID FROM BRAND WHERE BrandName = 'Maybelline')));
/*1*/

-- 132. Sum the quantities of products purchased from suppliers with names containing 'Cosmetic'.
SELECT SUM(Quantity) 
FROM PURCHASEDETAILS 
WHERE PurchaseID IN (SELECT PurchaseID FROM PURCHASE WHERE SupplierID IN (SELECT SupplierID FROM SUPPLIER WHERE SupplierName LIKE '%Cosmetic%'));
/*305*/

-- 133. Count the distinct category IDs that have products that have been reviewed with comments containing 'Amazing'.
SELECT COUNT(DISTINCT CategoryID) 
FROM PRODUCT 
WHERE ProductID IN (SELECT ProductID FROM REVIEW WHERE Comment LIKE '%Amazing%');
/*1*/

-- 134. Count the distinct order IDs that have been placed by customers who have made payments with 'Credit Card' and have also left reviews with comments containing 'Good'.
SELECT COUNT(DISTINCT OrderID) FROM ORDER_TABLE 
WHERE OrderID IN (SELECT OrderID FROM PAYMENT 
WHERE PaymentMethod = 'Credit Card') AND OrderID IN (SELECT OrderID FROM ORDERDETAILS
WHERE ProductID IN (SELECT ProductID FROM REVIEW WHERE Comment LIKE '%Good%'));
/*0*/

-- 135. Sum the salaries of employees who have made sales to customers who have made payments with 'Credit Card'.
SELECT SUM(Salary) FROM EMPLOYEE 
WHERE EmployeeID IN (SELECT EmployeeID FROM CUSTOMER WHERE CustomerID IN 
(SELECT CustomerID FROM ORDER_TABLE WHERE OrderID IN (SELECT OrderID FROM PAYMENT WHERE PaymentMethod = 'Credit Card')));
/*754000.00*/

-- 136. INNER JOIN: Select product names and category names.
SELECT p.Name, c.CategoryName
FROM PRODUCT p
INNER JOIN CATEGORY c ON p.CategoryID = c.CategoryID;
/*SuperStay Matte Ink Lipstick	Lipsticks
Studio Fix Fluid Foundation	Foundations
Voluminous Lash Paradise Mascara	Mascara
Naked Eyeshadow Palette	Eyeshadow
Radiant Creamy Concealer	Concealers
Killawatt Freestyle Highlighter	Highlighters
Gel Envy Nail Polish	Nail Polish
Hydrating Lip Balm	Lip Balms
Dream BB Fresh Cream	BB Cream
Pore Minimizing Primer	Primers
All Nighter Setting Spray	Setting Sprays
Amazonian Clay 12-Hour Blush	Blush
Matte Bronzer	Bronzers
Tattoo Liner	Eyeliners
Brow Wiz Eyebrow Pencil	Eyebrow Products
Loose Setting Powder	Setting Powders
Gloss Bomb Universal Lip Luminizer	Lip Gloss
Essential Makeup Brush Set	Makeup Brushes
Beauty Blender Sponge	Makeup Sponges
Hydrating Face Serum	Skincare*/

-- 137. LEFT JOIN: Select customer names and order IDs, including customers who haven't placed orders.
SELECT c.Name, o.OrderID
FROM CUSTOMER c
LEFT JOIN ORDER_TABLE o ON c.CustomerID = o.CustomerID;
/*Ravi	21
Rani	22
banu	23
Charan	24
surya	25
janu	26
veena	27
Devi	28
Balu	29
krishna	30
teja	31
pavani	32
thanuja	33
vinitha	34
raji	35
santhosh	36
prakash	37
Roshini	38
meghana	39
nandini	40*/


-- 138. RIGHT JOIN: Select order IDs and payment methods, including payments without corresponding orders.
SELECT o.OrderID, p.PaymentMethod
FROM ORDER_TABLE o
RIGHT JOIN PAYMENT p ON o.OrderID = p.OrderID;
/*21	Credit Card
22	PayPal
23	Debit Card
24	Credit Card
25	PayPal
26	Credit Card
27	Debit Card
28	PayPal
29	Credit Card
30	Debit Card
31	PayPal
32	Credit Card
33	Debit Card
34	PayPal
35	Credit Card
36	Debit Card
37	Credit Card
38	PayPal
39	Debit Card
40	Credit Card*/

-- 139. LEFT JOIN: Select customer names and review IDs, including customers who haven't written reviews.
SELECT c.Name, r.ReviewID
FROM CUSTOMER c
LEFT JOIN REVIEW r ON c.CustomerID = r.CustomerID;
/*Ravi	61
Rani	62
banu	63
Charan	64
surya	56
janu	66
veena	67
Devi	68
Balu	69
krishna	NULL
teja	71
pavani	72
thanuja	73
vinitha	74
raji	75
santhosh	76
prakash	77
Roshini	78
meghana	79
nandini	80*/

-- 140. RIGHT JOIN: Select supplier names and purchase IDs, including suppliers who haven't made purchases.
SELECT s.SupplierName, pu.PurchaseID
FROM SUPPLIER s
RIGHT JOIN PURCHASE pu ON s.SupplierID = pu.SupplierID;
/*Cosmetic Suppliers Inc.	201
Glamour Distributors	202
Luxury Beauty Supplies	203
Organic Glow	204
Elite Makeup	205
Radiant Skincare	206
Pure Beauty	207
Vibrant Cosmetics	208
Nature Essence	209
Lush Looks	210
Everglow Cosmetics	211
Trendsetters Makeup	212
Chic Beauty Hub	213
Glow Essence	214
Luxe Skin Care	215
Timeless Beauty	216
Royal Glow	217
Elysian Cosmetics	218
Natural Radiance	219
Beauty Haven	220*/

-- 141. LEFT JOIN: Select category names and product names, including categories without products.
SELECT c.CategoryName, p.Name
FROM CATEGORY c
LEFT JOIN PRODUCT p ON c.CategoryID = p.CategoryID;
/*Lipsticks	SuperStay Matte Ink Lipstick
Foundations	Studio Fix Fluid Foundation
Mascara	Voluminous Lash Paradise Mascara
Eyeshadow	Naked Eyeshadow Palette
Concealers	Radiant Creamy Concealer
Highlighters	Killawatt Freestyle Highlighter
Nail Polish	Gel Envy Nail Polish
Lip Balms	Hydrating Lip Balm
BB Cream	Dream BB Fresh Cream
Primers	Pore Minimizing Primer
Setting Sprays	All Nighter Setting Spray
Blush	Amazonian Clay 12-Hour Blush
Bronzers	Matte Bronzer
Eyeliners	Tattoo Liner
Eyebrow Products	Brow Wiz Eyebrow Pencil
Setting Powders	Loose Setting Powder
Lip Gloss	Gloss Bomb Universal Lip Luminizer
Makeup Brushes	Essential Makeup Brush Set
Makeup Sponges	Beauty Blender Sponge
Skincare	Hydrating Face Serum*/

-- 142. LEFT JOIN: Select product names and inventory IDs, including products not in inventory.
SELECT p.Name, i.InventoryID
FROM PRODUCT p
LEFT JOIN INVENTORY i ON p.ProductID = i.ProductID;
/*SuperStay Matte Ink Lipstick	281
Studio Fix Fluid Foundation	282
Voluminous Lash Paradise Mascara	283
Naked Eyeshadow Palette	284
Radiant Creamy Concealer	285
Killawatt Freestyle Highlighter	286
Gel Envy Nail Polish	287
Hydrating Lip Balm	288
Dream BB Fresh Cream	289
Pore Minimizing Primer	290
All Nighter Setting Spray	291
Amazonian Clay 12-Hour Blush	292
Matte Bronzer	293
Tattoo Liner	294
Brow Wiz Eyebrow Pencil	295
Loose Setting Powder	296
Gloss Bomb Universal Lip Luminizer	297
Essential Makeup Brush Set	298
Beauty Blender Sponge	299
Hydrating Face Serum	300*/

-- 143. RIGHT JOIN: Select supplier names and product names, including suppliers who haven't supplied any products.
SELECT s.SupplierName, p.Name
FROM SUPPLIER s
RIGHT JOIN PURCHASE pu ON s.SupplierID = pu.SupplierID
RIGHT JOIN PURCHASEDETAILS pd ON pu.PurchaseID = pd.PurchaseID
RIGHT JOIN PRODUCT p ON pd.ProductID = p.ProductID;
/*Cosmetic Suppliers Inc.	SuperStay Matte Ink Lipstick
Glamour Distributors	Studio Fix Fluid Foundation
Luxury Beauty Supplies	Voluminous Lash Paradise Mascara
Organic Glow	Naked Eyeshadow Palette
Elite Makeup	Radiant Creamy Concealer
Radiant Skincare	Killawatt Freestyle Highlighter
Pure Beauty	Gel Envy Nail Polish
Vibrant Cosmetics	Hydrating Lip Balm
Nature Essence	Dream BB Fresh Cream
Lush Looks	Pore Minimizing Primer
Everglow Cosmetics	All Nighter Setting Spray
Trendsetters Makeup	Amazonian Clay 12-Hour Blush
Chic Beauty Hub	Matte Bronzer
Glow Essence	Tattoo Liner
Luxe Skin Care	Brow Wiz Eyebrow Pencil
Timeless Beauty	Loose Setting Powder
Royal Glow	Gloss Bomb Universal Lip Luminizer
Elysian Cosmetics	Essential Makeup Brush Set
Natural Radiance	Beauty Blender Sponge
Beauty Haven	Hydrating Face Serum*/

-- 144. LEFT JOIN: Select category names and average product prices, including categories without products.
SELECT c.CategoryName, AVG(p.Price)
FROM CATEGORY c
LEFT JOIN PRODUCT p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;
/*BB Cream	8.990000
Blush	27.990000
Bronzers	19.990000
Concealers	29.990000
Eyebrow Products	23.990000
Eyeliners	22.990000
Eyeshadow	49.990000
Foundations	34.990000
Highlighters	36.990000
Lip Balms	5.990000
Lip Gloss	24.990000
Lipsticks	10.990000
Makeup Brushes	49.990000
Makeup Sponges	16.990000
Mascara	10.990000
Nail Polish	7.990000
Primers	21.990000
Setting Powders	38.990000
Setting Sprays	32.990000
Skincare	59.990000*/

-- 145. RIGHT JOIN: Select brand names and average product ratings, including brands without reviewed products.
SELECT b.BrandName, AVG(r.Rating)
FROM BRAND b
RIGHT JOIN PRODUCT p ON b.BrandID = p.BrandID
RIGHT JOIN REVIEW r ON p.ProductID = r.ProductID
GROUP BY b.BrandName;
/*Anastasia Beverly Hills	3
Bobbi Brown	5
Clinique	3
CoverGirl	4
Dior	2
Estee Lauder	5
Fenty Beauty	3
Huda Beauty	5
LOreal	3
MAC	4
Maybelline	5
Morphe	4
NYX	5
Pat McGrath Labs	5
Revlon	4
Sephora Collection	5
Tarte	5
Too Faced	2
Urban Decay	4*/

-- 146. Select brand names that have products with stock below 50.
SELECT BrandName FROM BRAND 
WHERE BrandID IN (SELECT BrandID FROM PRODUCT 
WHERE ProductID IN (SELECT ProductID FROM INVENTORY WHERE StockLevel < 50));
/*NO OUTPUT*/

-- 147. Select employee names who have made sales to customers who left reviews above rating 4.
SELECT Name FROM EMPLOYEE 
WHERE EmployeeID IN (SELECT EmployeeID FROM CUSTOMER 
WHERE CustomerID IN (SELECT CustomerID FROM ORDER_TABLE 
WHERE OrderID IN (SELECT OrderID FROM ORDERDETAILS 
WHERE ProductID IN (SELECT ProductID FROM REVIEW WHERE Rating > 4))));
/*rajesh
leena
deva
niharika
pavan
vasu
ramya
priya
ishu
mani
sunitha
rohan
yashmi
rohit
preeti
prabhu
harini
swetha
sandeep
ganesh*/

-- 148. Select category names that have products reviewed by customers who paid with 'Credit Card'.
SELECT CategoryName FROM CATEGORY 
WHERE CategoryID IN (SELECT CategoryID FROM PRODUCT 
WHERE ProductID IN (SELECT ProductID FROM REVIEW 
WHERE CustomerID IN (SELECT CustomerID FROM ORDER_TABLE 
WHERE OrderID IN (SELECT OrderID FROM PAYMENT WHERE PaymentMethod = 'Credit Card'))));
/*Lipsticks
Eyeshadow
Highlighters
BB Cream
Blush
Eyebrow Products
Lip Gloss
Skincare*/

-- 149. Group by CategoryID and order by average price in descending order.
SELECT CategoryID, AVG(Price) AS AveragePrice
FROM PRODUCT
GROUP BY CategoryID
ORDER BY AveragePrice DESC;
/*140	59.990000
124	49.990000
138	49.990000
136	38.990000
126	36.990000
122	34.990000
131	32.990000
125	29.990000
132	27.990000
137	24.990000
135	23.990000
134	22.990000
130	21.990000
133	19.990000
139	16.990000
123	10.990000
121	10.990000
129	8.990000
127	7.990000
128	5.990000*/

-- 150. Group by CategoryID and order by maximum price in descending order.
SELECT CategoryID, MAX(Price) AS MaxPrice
FROM PRODUCT
GROUP BY CategoryID
ORDER BY MaxPrice DESC;
/*140	59.99
124	49.99
138	49.99
136	38.99
126	36.99
122	34.99
131	32.99
125	29.99
132	27.99
137	24.99
135	23.99
134	22.99
130	21.99
133	19.99
139	16.99
123	10.99
121	10.99
129	8.99
127	7.99
128	5.99*/





