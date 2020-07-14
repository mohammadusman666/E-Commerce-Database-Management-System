use OnlineShopping

select Top 1 FirstName, LastName, Contact, Name, ProductName, Qty, Total
from Customer
inner join(
			select Name, ProductName, CustomerID, Qty, Total
			from Orders
			inner join(
						select Name, ProductName, OrderID, Qty, Total
						from Product
						inner join(
									select Name, ProductID, OrderID, Qty, Total
									from Vendor
									inner join(
												select VendorID, ProductID, OrderID, Qty, Qty*Price as Total
												from VendorProduct
												inner join(
															select VendorProductID, OrderID, Quantity as Qty
															from OrderedProduct)
												vpoid on vpoid.VendorProductID=VendorProduct.VendorProductID)
									voi on voi.VendorID=Vendor.VendorID)
						tp on tp.ProductID=Product.ProductID)
			cip on cip.OrderID=Orders.OrderID)
cq on cq.CustomerID=Customer.CustomerID
Order by Total Desc