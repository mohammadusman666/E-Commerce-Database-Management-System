use OnlineShopping;

Select VendorName, ProductName, OrderedQuantity, Category.CategoryName
From Category

	inner join (
	Select VendorName, Product.ProductName, OrderedQuantity, CategoryID
	From Product

		inner join (
		Select Vendor.Name as VendorName, ProductID, OrderedQuantity
		From Vendor

			inner join (
			Select vendorID, ProductID, OrderedQuantity
			From VendorProduct

				inner join (
					Select TOP 1 OrderedProduct.VendorProductID, sum(Quantity) as OrderedQuantity
					From OrderedProduct Group By VendorProductID Order By OrderedQuantity Desc
				) vpfk on vpfk.VendorProductID = VendorProduct.VendorProductID

			) vpid on vpid.VendorID = vendor.VendorID
	
		) vpvp on vpvp.ProductID = Product.ProductID

	) pc on pc.CategoryID = Category.CategoryID