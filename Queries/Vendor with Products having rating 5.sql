use OnlineShopping;

Select Name as VendorName, ProductName, Rating
From Vendor
	
	inner join (
		Select ProductName, VendorID, Rating
		From Product

			inner join (
				Select ProductID, VendorID, Rating
				From VendorProduct

					inner join (
						Select VendorProductID, Rating
						From OrderedProduct

							inner join (
								Select OrderedProductID, Rating
								From Review Where Rating = 5
							) opid on opid.OrderedProductID = OrderedProduct.OrderedProductID

					) vpid on vpid.VendorProductID = VendorProduct.VendorProductID

			) pid on pid.ProductID = Product.ProductID

	) vid on vid.VendorID = Vendor.VendorID

Order By VendorName, ProductName