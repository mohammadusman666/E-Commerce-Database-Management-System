use OnlineShopping
select "Vendor Name","Vendor Contact", "Vendor Email","Courier Name", "Courier Contact", TrackingID, CityName, OrderDate, ProductName, Price, Rating, Comment
from Product
inner join (
			select Rating, Comment, CityName, OrderDate, TrackingID, "Vendor Name", "Vendor Contact", "Vendor Email", "Courier Name", "Courier Contact", ProductID, Price
			from City
			inner join(
						select Rating, Comment, CityID, OrderDate, TrackingID, "Vendor Name", "Vendor Contact", "Vendor Email", "Courier Name", "Courier Contact", ProductID, Price
						from ZipCode
						inner join(
									select Rating, Comment, ZipCodeID, OrderDate, TrackingID, "Vendor Name", "Vendor Contact", "Vendor Email", "Courier Name", "Courier Contact", ProductID, Price
									from Address
									inner join(
												select Rating, Comment, AddressID, OrderDate, TrackingID, "Vendor Name", "Vendor Contact", "Vendor Email", Courier.Name as "Courier Name", Courier.Contact as "Courier Contact", ProductID, Price
												from Courier
												inner join (
															select Rating, Comment, AddressID, OrderDate, TrackingID, Name as "Vendor Name", Contact as "Vendor Contact", Email as "Vendor Email", CourierID, ProductID, Price
															from Vendor
															inner join(
																		select Rating, Comment, AddressID, OrderDate, TrackingID, VendorID, CourierID, ProductID, Price
																		from VendorProduct
																		inner join(
																					select Rating, Comment, AddressID, OrderDate, TrackingID, CourierID, VendorProductID
																					from VendorCourier
																					inner join(
																								select Rating, Comment, AddressID, OrderDate, TrackingID, VendorCourierID, VendorProductID
																								from Orders
																								inner join(
																											select Rating, Comment, OrderID, VendorProductID
																											from OrderedProduct
																											inner join(
																														select Rating, Comment, OrderedProductID
																														from Review
																														where Comment like '%late%deliver%' OR 
																														Comment like '%slow%deliver%' OR 
																														Comment like '%deliver%late%' OR 
																														Comment like'%deliver%slow%'
																														) 
																											rc on rc.OrderedProductID = OrderedProduct.OrderedProductID
																											)
																								od on od.OrderID = Orders.OrderID
																								)
																					vcid on vcid.VendorCourierID = VendorCourier.VendorCourierID
																					)
																		vpn on vpn.VendorProductID = VendorProduct.VendorProductID
																		)
															vcn on vcn.VendorID = Vendor.VendorID
															)
												cd on cd.CourierID = Courier.CourierID
												)
									aid on aid.AddressID = Address.AddressID
									)
						lid on lid.ZipCodeID = ZipCode.ZipCodeID
						)
			ccid on ccid.CityID = City.CityID
			)
Pna on pna.ProductID = Product.ProductID