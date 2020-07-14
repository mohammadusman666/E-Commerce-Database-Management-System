use OnlineShopping;

Select Count(OrderID) as TotalOrders
From Orders

inner join (Select AddressID
			From Address
			Where ZipCodeID = (Select ZipCodeID
							   From ZipCode
							   Where CityID = (Select CityID
											   From City Where CityName = 'Lahore'))

			) adid on adid.AddressID = Orders.AddressID