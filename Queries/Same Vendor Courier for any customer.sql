use OnlineShopping;

Select FirstName, LastName, VendorName, Name as CourierName
From Courier

	inner join (
		Select FirstName, LastName, Name as VendorName, CourierID
		From Vendor

			inner join (
				Select FirstName, LastName, VendorID, CourierID
				From VendorCourier

					inner join (
						Select FirstName, LastName, VendorCourierID
						From Customer

							inner join (
								Select CustomerID, VendorCourierID
								From Orders
								Where VendorCourierID = (Select max(VendorCourierID) From Orders)
							) cid on cid.CustomerID = Customer.CustomerID

					) vcid on vcid.VendorCourierID = VendorCourier.VendorCourierID

			) vid on vid.VendorID = Vendor.VendorID

	) crid on crid.CourierID = Courier.CourierID