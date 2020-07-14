use OnlineShopping;

Select CustomerName, VendorName, ProductName
From Product
	
	inner join (
		Select CustomerName, Name as VendorName, ProductID
		From Vendor

			inner join (
				Select CustomerName, VendorID, ProductID
				From VendorProduct

					inner join (
						Select CustomerName, VendorProductID
						From OrderedProduct

							inner join (
								Select FirstName as CustomerName, OrderID
								From Customer

									inner join (
										Select CustomerID, OrderID
										From Orders
										Where OrderDate = (Select min(OrderDate) From Orders)
									) cid on cid.CustomerID = Customer.CustomerID

							) opid on opid.OrderID = OrderedProduct.OrderedProductID
	
					) vpid on vpid.VendorProductID = VendorProduct.VendorProductID

			) vid on vid.VendorID = Vendor.VendorID

	) pid on pid.ProductID = Product.ProductID