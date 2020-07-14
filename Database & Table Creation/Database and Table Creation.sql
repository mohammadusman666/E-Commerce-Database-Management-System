CREATE DATABASE OnlineShopping;

Use OnlineShopping;

CREATE TABLE Customer
(
	CustomerID int IDENTITY(1, 1) PRIMARY KEY,
	FirstName varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
	DOB date NOT NULL,
	Email varchar(255) NOT NULL,
	Password varchar(255) NOT NULL,
	Contact varchar(255) NOT NULL
);

CREATE TABLE Country
(
	CountryID int IDENTITY(1, 1) PRIMARY KEY,
	CountryName varchar(255) NOT NULL
);

CREATE TABLE Province
(
	ProvinceID int IDENTITY(1, 1) PRIMARY KEY,
	ProvinceName varchar(255) NOT NULL
);

CREATE TABLE City
(
	CityID int IDENTITY(1, 1) PRIMARY KEY,
	CityName varchar(255) NOT NULL
);

CREATE TABLE ZipCode
(
	ZipCodeID int IDENTITY(1, 1) PRIMARY KEY,
	CityID int FOREIGN KEY REFERENCES City(CityID) NOT NULL,
	ProvinceID int FOREIGN KEY REFERENCES Province(ProvinceID) NOT NULL,
	CountryID int FOREIGN KEY REFERENCES Country(CountryID) NOT NULL
);

CREATE TABLE Address
(
	AddressID int IDENTITY(1, 1) PRIMARY KEY,
	HouseNo varchar(255) NOT NULL,
	Street int NOT NULL,
	CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID) NOT NULL,
	ZipCodeID int FOREIGN KEY REFERENCES ZipCode(ZipCodeID) NOT NULL,
	Area varchar(255) NOT NULL
);
 

CREATE TABLE Category
(
	CategoryID int IDENTITY(1, 1) PRIMARY KEY,
	CategoryName varchar(255) NOT NULL
);

CREATE TABLE Vendor
(
	VendorID int IDENTITY(1, 1) PRIMARY KEY,
	Name varchar(255) NOT NULL,
	Address text NOT NULL,
	Email varchar(255) NOT NULL,
	Password varchar(255) NOT NULL,
	Contact varchar(255) NOT NULL
);

CREATE TABLE Product
(
	ProductID int IDENTITY(1, 1) PRIMARY KEY,
	ProductName varchar(255) NOT NULL,
	CategoryID int FOREIGN KEY REFERENCES Category(CategoryID) NOT NULL
);

CREATE TABLE VendorProduct
(
	VendorProductID int IDENTITY(1, 1) PRIMARY KEY,
	VendorID int FOREIGN KEY REFERENCES Vendor(VendorID) NOT NULL,
	ProductID int FOREIGN KEY REFERENCES Product(ProductID) NOT NULL,
	Price decimal(19, 2) NOT NULL,
	Quantity int NOT NULL,
	Description text NOT NULL
);

CREATE TABLE Courier
(
	CourierID int IDENTITY(1, 1) PRIMARY KEY,
	Name varchar(255) NOT NULL,
	Contact varchar(255) NOT NULL
);

CREATE TABLE VendorCourier
(
	VendorCourierID int IDENTITY(1, 1) PRIMARY KEY,
	VendorID int FOREIGN KEY REFERENCES Vendor(VendorID) NOT NULL,
	CourierID int FOREIGN KEY REFERENCES Courier(CourierID) NOT NULL
);

CREATE TABLE Orders
(
	OrderID int IDENTITY(1, 1) PRIMARY KEY,
	CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID) NOT NULL,
	OrderDate date NOT NULL,
	AddressID int FOREIGN KEY REFERENCES Address(AddressID) NOT NULL,
	VendorCourierID int FOREIGN KEY REFERENCES VendorCourier(VendorCourierID) NOT NULL,
	TrackingID varchar(255) NOT NULL
);

CREATE TABLE OrderedProduct
(
	OrderedProductID int IDENTITY(1, 1) PRIMARY KEY,
	VendorProductID int FOREIGN KEY REFERENCES VendorProduct(VendorProductID) NOT NULL,
	OrderID int FOREIGN KEY REFERENCES Orders(OrderID) NOT NULL,
	Quantity int NOT NULL
);

CREATE TABLE Review
(
	ReviewID int IDENTITY(1, 1) PRIMARY KEY,
	Rating tinyint NOT NULL,
	Comment text,
	CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID) NOT NULL,
	OrderedProductID int FOREIGN KEY REFERENCES OrderedProduct(OrderedProductID) NOT NULL,
);

CREATE TABLE Cart
(
	CartID int IDENTITY(1, 1) PRIMARY KEY,
	DateCreated date NOT NULL,
	CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID) NOT NULL,
);

CREATE TABLE CartProduct
(
	CartProductID int IDENTITY(1, 1) PRIMARY KEY,
	VendorProductID int FOREIGN KEY REFERENCES VendorProduct(VendorProductID) NOT NULL,
	Quantity int NOT NULL,
	CartID int FOREIGN KEY REFERENCES Cart(CartID) NOT NULL
);
